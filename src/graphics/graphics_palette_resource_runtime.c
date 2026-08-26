#include "tingle/graphics_sprite_renderer.h"
#include "tingle/heap.h"

/*
 * Mutable palette copies and state-scoped upload scheduling. Palette resources
 * retain their decoded NCLR allocation at +0x14, its descriptor at +0x20, the
 * primary colors at +0x24, and an optional caller-owned mutable copy at +0x28.
 */

typedef struct GraphicsPaletteDescriptor {
    u8 padding_00[4];
    u16 mode;
    u16 recordCount;
} GraphicsPaletteDescriptor;

typedef struct GraphicsPaletteResource {
    u8 padding_00[0x14];
    void *allocation;
    u8 padding_18[8];
    GraphicsPaletteDescriptor *descriptor;
    u16 *colors;
    u16 *alternateColors;
} GraphicsPaletteResource;

typedef struct GraphicsSpriteStatePoolPrefix {
    u32 count;
    u32 interruptState;
    void *freeHead;
} GraphicsSpriteStatePoolPrefix;

#ifdef __cplusplus
extern "C" {
#endif

extern const char data_020e68e0[];
extern GraphicsSpriteStatePoolPrefix gGraphicsSpriteStatePool;
extern void *GraphicsBgResourceData_GetDecoded(void *resource);
extern void GraphicsSpriteResource_Prepare(void *resource);
extern u32 GraphicsPaletteResource_GetUploadSize(const void *resource);
extern void MIi_CpuCopy16(const void *source, void *destination, u32 size);
extern void func_020b4554(void *address, u32 size);
extern u64 func_020bf1f8(u32 dividend, u32 divisor);
extern u32 GX_VBlankIntr(u32 state);

#ifdef __cplusplus
}
#endif

static u32 GraphicsPaletteResource_GetColorCount(
    const GraphicsPaletteResource *resource)
{
    if (resource->allocation == 0 || resource->descriptor->mode == 0)
        return 0;
    if (resource->descriptor->mode == 0x10)
        return (u32)resource->descriptor->recordCount << 4;
    return (u32)resource->descriptor->recordCount << 8;
}

/*
 * Lazily allocate the mutable palette buffer, copy the full primary payload,
 * and make it coherent for later graphics transfers. The resource retains
 * ownership until GraphicsArchiveResource_ReleaseAlternateBuffer; repeated
 * calls and unloaded resources are no-ops. Allocation failure follows retail
 * and is outside the valid-input contract.
 */
void func_020708c4(void *resourcePointer)
{
    GraphicsPaletteResource *resource =
        (GraphicsPaletteResource *)resourcePointer;
    u32 size;

    if (resource->alternateColors != 0 || resource->allocation == 0)
        return;
    size = GraphicsPaletteResource_GetUploadSize(resource);
    resource->alternateColors =
        (u16 *)Heap_AllocCore(size, data_020e68e0, 4, &gHeapContext);
    MIi_CpuCopy16(resource->colors, resource->alternateColors, size);
    func_020b4554(resource->alternateColors, size);
}

/* Retail's signed divide-by-256 sequence truncates toward zero. */
static s32 GraphicsPalette_ScaleComponent(s32 component, s32 factor)
{
    if (factor < 0x100)
        return (component * factor) / 0x100;
    if (factor > 0x100)
        return component + ((0x1f - component) * (factor - 0x100)) / 0x100;
    return component;
}

/*
 * Rebuild every RGB555 color in the mutable buffer from the immutable primary
 * palette. Factors use 8.8 units: 0 darkens fully, 0x100 is identity, and
 * values above 0x100 blend each channel toward 31. No allocation, cache flush,
 * or hardware upload occurs here.
 */
void func_02070958(void *resourcePointer, s32 redFactor, s32 greenFactor,
                   s32 blueFactor)
{
    GraphicsPaletteResource *resource =
        (GraphicsPaletteResource *)resourcePointer;
    u32 colorCount;
    u32 index;

    if (resource->alternateColors == 0)
        return;
    colorCount = GraphicsPaletteResource_GetColorCount(resource);
    for (index = 0; index < colorCount; ++index) {
        u16 packed = resource->colors[index];
        s32 red = GraphicsPalette_ScaleComponent(packed & 0x1f, redFactor);
        s32 green = GraphicsPalette_ScaleComponent((packed >> 5) & 0x1f,
                                                   greenFactor);
        s32 blue = GraphicsPalette_ScaleComponent((packed >> 10) & 0x1f,
                                                  blueFactor);

        resource->alternateColors[index] =
            (u16)(red | (green << 5) | (blue << 10));
    }
}

/*
 * Restore the mutable palette from its primary colors, clamp an inclusive
 * color range, then rotate that range left by offset modulo its length. The
 * resource owns both buffers; this function performs no allocation or upload.
 */
void func_02070a78(void *resourcePointer, s32 offset, s32 first, s32 last)
{
    GraphicsPaletteResource *resource =
        (GraphicsPaletteResource *)resourcePointer;
    u32 colorCount;
    s32 sourceIndex;
    s32 destinationIndex;
    s32 wrappedOffset;
    s32 rangeLength;

    if (resource->alternateColors == 0)
        return;
    colorCount = GraphicsPaletteResource_GetColorCount(resource);
    if (colorCount == 0)
        return;
    MIi_CpuCopy16(resource->colors, resource->alternateColors,
                  GraphicsPaletteResource_GetUploadSize(resource));
    if (first < 0)
        first = 0;
    else if ((u32)first >= colorCount)
        first = (s32)colorCount - 1;
    if (last < 0)
        last = 0;
    else if ((u32)last >= colorCount)
        last = (s32)colorCount - 1;

    rangeLength = last - first + 1;
    wrappedOffset =
        (s32)(func_020bf1f8((u32)offset, (u32)rangeLength) >> 32);
    sourceIndex = first + wrappedOffset;
    for (destinationIndex = first; destinationIndex <= last &&
                                   (u32)destinationIndex < colorCount;
         ++destinationIndex) {
        resource->alternateColors[destinationIndex] =
            resource->colors[sourceIndex];
        if (++sourceIndex > last)
            sourceIndex = first;
    }
}

/*
 * Queue all palette records used by one sprite state. The renderer's transfer
 * queue borrows the selected primary/alternate palette until VBlank. Duplicate
 * source submissions are suppressed, destinations come from the state's
 * indexed chain, and the prior VBlank interrupt state is restored.
 */
void GraphicsSpriteRenderer_QueueStatePaletteUploads(
    GraphicsSpriteRenderer *renderer, GraphicsSpriteState *state)
{
    GraphicsIndexedChainEntry *entry;
    GraphicsPaletteResource *resource;
    const u8 *source;
    u32 transferKind;
    u32 recordSize;
    u32 index;

    if (state == 0 || state->indexedPaletteBinding == 0)
        return;
    entry = (GraphicsIndexedChainEntry *)state->indexedPaletteBinding;
    resource = (GraphicsPaletteResource *)state->paletteResource;
    if (resource->allocation == 0)
        GraphicsSpriteResource_Prepare(resource);
    source = (const u8 *)GraphicsBgResourceData_GetDecoded(resource);
    if (GraphicsTransferQueue_FindBySource(&renderer->transferQueue, source) !=
        0)
        return;

    if (resource->descriptor->mode == 0x10) {
        transferKind = GRAPHICS_TRANSFER_KIND_OBJECT_PALETTE;
        recordSize = 0x20;
    } else {
        transferKind = GRAPHICS_TRANSFER_KIND_OBJECT_EXTENDED_PALETTE;
        recordSize = 0x200;
    }
    gGraphicsSpriteStatePool.interruptState = GX_VBlankIntr(0);
    for (index = 0; index < resource->descriptor->recordCount; ++index) {
        GraphicsTransferQueue_Enqueue(
            &renderer->transferQueue, transferKind, source + index * recordSize,
            (u32)entry->descriptorIndex * recordSize, recordSize);
        entry = entry->chainNext;
    }
    GX_VBlankIntr(gGraphicsSpriteStatePool.interruptState);
}
