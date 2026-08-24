
/*
 * Portable reconstructions of the assembly-selected sprite-font bindings at
 * 0x02074B9C, 0x02075358, and 0x02075398. All allocations, resource ownership,
 * VRAM-bank transitions, and queued transfers remain in recovered systems.
 */
#include "tingle/graphics_indexed_chain_pool.h"
#include "tingle/graphics_render_entry_pool.h"
#include "tingle/graphics_sprite_renderer.h"
#include "tingle/graphics_transfer_queue.h"
#include "tingle/graphics_vram_allocator.h"
#include "tingle/heap.h"
#include "tingle/types.h"


extern const char data_020e69ec[];
extern const char data_020e69f4[];
extern HeapContext gHeapContext;

extern void *GraphicsBgResourceData_GetDecoded(void *resource);
extern void GraphicsSpriteResource_Prepare(void *resource);
extern u16 func_020ae754(void);
extern u16 func_020ae678(void);
extern u32 GX_VBlankIntr(u32 state);

typedef struct GraphicsSpriteStatePoolPrefix {
    u32 count;
    u32 interrupt_state;
} GraphicsSpriteStatePoolPrefix;

extern GraphicsSpriteStatePoolPrefix gGraphicsSpriteStatePool;

/* Constructs a cookie-prefixed array in caller-provided storage, records the
 * retail count/stride cookie, invokes each element constructor, and returns
 * the first element. Confirmed callers pass no throwing destructor path. */
void *func_020c09cc(void *allocation, u32 count, u32 element_size,
                    u32 cookie_size, void (*constructor)(void *),
                    void *destructor)
{
    u8 *elements = (u8 *)allocation + cookie_size;
    u32 index;

    (void)destructor;
    if (cookie_size != 0) {
        *(u32 *)(elements - 4) = count;
        if (cookie_size >= 8) {
            *(u32 *)(elements - 8) = element_size;
        }
    }
    if (constructor != 0) {
        for (index = 0; index < count; ++index) {
            constructor(elements + index * element_size);
        }
    }
    return elements;
}

/* Bind or retain a palette resource exactly as retail 0x02074B9C. */
void *GraphicsSpriteRenderer_AcquirePaletteBinding(
    GraphicsSpriteRenderer *renderer_pointer, void *resource)
{
    GraphicsSpriteRenderer *renderer =
        (GraphicsSpriteRenderer *)renderer_pointer;
    GraphicsIndexedChainEntry *entry = 0;
    u8 *resource_bytes = (u8 *)resource;
    u8 *header;
    u16 mode;
    u16 count;
    u32 index;

    if (resource == 0)
        return 0;
    header = *(u8 **)(resource_bytes + 0x20);
    mode = *(u16 *)(header + 4);
    count = *(u16 *)(header + 6);
    entry = mode == 0x10 ? renderer->indexedPool0.head
                         : renderer->indexedPool1.head;
    while (entry != 0 && entry->resource != resource)
        entry = entry->nextOrFreeNext;

    if (entry == 0) {
        if (*(void **)(resource_bytes + 0x14) == 0)
            GraphicsSpriteResource_Prepare(resource);
        header = *(u8 **)(resource_bytes + 0x20);
        mode = *(u16 *)(header + 4);
        count = *(u16 *)(header + 6);
        if (mode == 0x10)
            entry = GraphicsIndexedChainPool_AllocateChain(
                &renderer->indexedPool0, count,
                GRAPHICS_INDEXED_CHAIN_MODE_SHARED_OBJECT_PALETTE);
        else
            entry = GraphicsIndexedChainPool_AllocateChain(
                &renderer->indexedPool1, count,
                GRAPHICS_INDEXED_CHAIN_MODE_SHARED_OBJECT_EXTENDED_PALETTE);
        if (entry == 0)
            return 0;

        gGraphicsSpriteStatePool.interrupt_state = GX_VBlankIntr(0);
        {
            GraphicsIndexedChainEntry *current = entry;
            u32 record_size = mode == 0x10 ? 0x20 : 0x200;
            u32 transferKind =
                mode == 0x10
                    ? GRAPHICS_TRANSFER_KIND_OBJECT_PALETTE
                    : GRAPHICS_TRANSFER_KIND_OBJECT_EXTENDED_PALETTE;
            u8 *source = (u8 *)GraphicsBgResourceData_GetDecoded(resource);

            for (index = 0; index < count; ++index) {
                GraphicsTransferQueue_Enqueue(
                    &renderer->transferQueue, transferKind,
                    source + index * record_size,
                    (u32)current->descriptorIndex * record_size, record_size);
                current = current->chainNext;
            }
        }
        GX_VBlankIntr(gGraphicsSpriteStatePool.interrupt_state);
        entry->resource = resource;
    }
    ++entry->referenceCount;
    return entry;
}

/* Release the object extended-palette VRAM bank retained by a renderer whose
 * +0x30 and +0x34 state words are both active. Engine zero selects the main
 * bank and every other engine selects the sub bank. Clear +0x34 after the SDK
 * bank transition; inactive renderers are unchanged. The second retail
 * argument is unused and the function returns no value. */
void GraphicsSpriteRenderer_ReleaseExtendedPalette(GraphicsSpriteRenderer *renderer, s32 unused)
{
    (void)unused;
    if (renderer->field_30 == 0 || renderer->field_34 == 0)
        return;
    if (renderer->engine == 0)
        func_020ae754();
    else
        func_020ae678();
    renderer->field_34 = 0;
}

/* Bind the two font resources and initialize the retail twelve-entry text
 * object chain exactly as 0x02075398. */
void GraphicsSpriteRenderer_InitTextResources(
    GraphicsSpriteRenderer *renderer_pointer, void *character_resource,
    void *palette_resource)
{
    GraphicsSpriteRenderer *renderer =
        (GraphicsSpriteRenderer *)renderer_pointer;
    GraphicsRenderEntry *entries;
    u32 row;
    u32 column;

    if (renderer->field_0c != 0)
        return;
    renderer->field_10 = character_resource;
    renderer->field_14 = palette_resource;
    renderer->field_00 = Heap_Alloc(0x6000, data_020e69ec, 4,
                                    &gHeapContext);
    renderer->field_04 = GraphicsVramAllocator_Allocate(
        &renderer->vramAllocator, 0xc0, character_resource, 4);
    renderer->field_08 = GraphicsSpriteRenderer_AcquirePaletteBinding(renderer, palette_resource);
    entries = (GraphicsRenderEntry *)func_020c09cc(
        Heap_Alloc(0x128, data_020e69f4, 4, &gHeapContext),
        12, 0x18, 8, (void (*)(void *))GraphicsRenderEntry_Init, 0);
    renderer->field_0c = entries;
    GraphicsSpriteRenderer_ClearTextBuffer(renderer);

    *(u32 *)((u8 *)entries + 0x0c) =
        renderer->field_20 | (renderer->field_1c << 16);
    for (row = 0; row < 11; ++row)
        *(GraphicsRenderEntry **)((u8 *)entries + row * 0x18 + 8) =
            (GraphicsRenderEntry *)((u8 *)entries + (row + 1) * 0x18);

    for (row = 0; row < 3; ++row) {
        for (column = 0; column < 4; ++column) {
            u8 *entry = (u8 *)entries + (column + row * 4) * 0x18;
            u16 attribute0 = *(u16 *)(entry + 0x10);
            u16 attribute1 = *(u16 *)(entry + 0x12);
            u16 attribute2 = *(u16 *)(entry + 0x14);
            u16 tile = (u16)(*(u16 *)((u8 *)renderer->field_04 + 0x0e) +
                             (column + row * 4) * 0x10);
            u16 palette =
                (u16)(*(u8 *)((u8 *)renderer->field_08 + 0x12) << 12);

            attribute0 &= (u16)~0x00ff;
            attribute0 |= (u16)((row * 0x40) & 0xff);
            attribute0 &= (u16)~0xc000;

            attribute1 &= (u16)~0xc000;
            attribute1 |= 0xc000;
            attribute1 &= (u16)~0x0200;
            attribute1 |= (u16)((column << 6) & 0x01ff);

            attribute2 &= (u16)~0x03ff;
            attribute2 |= tile & 0x03ff;
            attribute2 &= (u16)~0x0c00;
            attribute2 |= (u16)((renderer->field_1c & 3) << 10);
            attribute2 &= (u16)~0xf000;
            attribute2 |= palette;

            *(u16 *)(entry + 0x10) = attribute0;
            *(u16 *)(entry + 0x12) = attribute1;
            *(u16 *)(entry + 0x14) = attribute2;
        }
    }
}
