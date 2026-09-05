#include "tingle/graphics_sprite_renderer.h"

/*
 * Construction of the composite sprite renderer. The object embeds all fixed
 * descriptor pools, a 0x400-byte shadow buffer, owner group links, and the
 * transfer queue used by later frame-building and upload paths.
 */

extern void GraphicsSpriteResource_Prepare(void *resource);
extern void *GraphicsBgResourceData_GetDecoded(void *resource);
extern u32 GX_VBlankIntr(u32 enabled);

typedef struct GraphicsSpriteStatePoolPrefix {
    u32 count;
    u32 interrupt_state;
    void *free_head;
} GraphicsSpriteStatePoolPrefix;

extern GraphicsSpriteStatePoolPrefix gGraphicsSpriteStatePool;

/*
 * Construct every embedded allocator/pool in dependency order, store the three
 * caller configuration words, initialize owner-list and control fields, run
 * the renderer-specific setup, reset render entries, and bind the affine matrix
 * cache to shadowBuffer. Finally clear seven leading pointers and set field_20
 * to 16.
 * Returns renderer. No heap allocation occurs; callees initialize fixed arrays
 * and may establish renderer/platform state, but this function directly writes
 * no graphics registers.
 */
GraphicsSpriteRenderer *GraphicsSpriteRenderer_Init(GraphicsSpriteRenderer *renderer,
                                      u32 engine, u32 field28, u32 field2c)
{
    GraphicsVramAllocator_Init(&renderer->vramAllocator);
    GraphicsIndexedChainPool_Init(&renderer->indexedPool0);
    GraphicsIndexedChainPool_Init(&renderer->indexedPool1);
    GraphicsRenderEntryPool_Init(&renderer->renderEntryPool);
    GraphicsAffineMatrixCache_Init(&renderer->affineMatrixCache);
    GraphicsTransferQueue_Init(&renderer->transferQueue);
    renderer->engine = engine;
    renderer->field_28 = field28;
    renderer->field_2c = field2c;
    renderer->field_30 = 1;
    renderer->field_34 = 1;
    renderer->groupCount = 0;
    renderer->groupTail = 0;
    renderer->groupHead = 0;
    GraphicsSpriteRenderer_ConfigureObjectDisplay(renderer);
    GraphicsRenderEntryPool_Reset(&renderer->renderEntryPool);
    GraphicsAffineMatrixCache_BindOamBuffer(
        &renderer->affineMatrixCache, renderer->shadowBuffer);
    renderer->field_38 = 1;
    renderer->field_1c = 0;
    renderer->field_20 = 0x10;
    renderer->field_00 = 0;
    renderer->field_04 = 0;
    renderer->field_08 = 0;
    renderer->field_0c = 0;
    renderer->field_10 = 0;
    renderer->field_14 = 0;
    renderer->field_18 = 0;
    return renderer;
}

#ifndef MATCHING
extern void GraphicsSpriteGraphicsResource_Prepare(void *resource);
extern u32 GraphicsCharacterResource_GetUploadSize(const void *resource);

/* Restore all retained palette chains in one pool. Each resource's decoded
 * bytes remain borrowed until VBlank; restore its prior IRQ state after
 * queuing 32-byte palettes or 512-byte extended palettes. */
static void ResumePalettePool(GraphicsSpriteRenderer *renderer,
                              GraphicsIndexedChainPool *pool, u32 shift,
                              GraphicsTransferKind kind)
{
    GraphicsIndexedChainEntry *root;
    for (root = pool->head; root != 0; root = root->nextOrFreeNext) {
        u8 *resource = (u8 *)root->resource;
        GraphicsIndexedChainEntry *entry = root;
        u32 index;
        if (*(void **)(resource + 0x14) == 0)
            GraphicsSpriteResource_Prepare(resource);
        gGraphicsSpriteStatePool.interrupt_state = GX_VBlankIntr(0);
        for (index = 0; index < *(u16 *)(*(u8 **)(resource + 0x20) + 6);
             ++index) {
            GraphicsTransferQueue_Enqueue(&renderer->transferQueue, kind,
                (u8 *)GraphicsBgResourceData_GetDecoded(resource) + (index << shift),
                (u32)entry->descriptorIndex << shift, 1u << shift);
            entry = entry->chainNext;
        }
        GX_VBlankIntr(gGraphicsSpriteStatePool.interrupt_state);
    }
}

/* Resume a suspended renderer (0x02075020): restore OBJ routing, mark and
 * queue retained character ranges, queue ordinary palettes and enabled
 * extended palettes, then set field_30. Allocations remain renderer-owned;
 * transfer sources are borrowed until VBlank. An active renderer is inert. */
void GraphicsSpriteRenderer_Resume(GraphicsSpriteRenderer *renderer)
{
    GraphicsVramRangeNode *range;
    GraphicsSpriteGroup *group;
    if (renderer->field_30 != 0)
        return;
    GraphicsSpriteRenderer_ConfigureObjectDisplay(renderer);
    for (range = &renderer->vramAllocator.nodes[0]; range != 0;
         range = range->next) {
        if (range->type == 1) {
            u8 *resource = (u8 *)range->owner;
            if (*(void **)(resource + 0x14) == 0)
                GraphicsSpriteGraphicsResource_Prepare(resource);
            gGraphicsSpriteStatePool.interrupt_state = GX_VBlankIntr(0);
            range->field_0c = 1;
            GraphicsTransferQueue_Enqueue(&renderer->transferQueue,
                GRAPHICS_TRANSFER_KIND_OBJECT_CHARACTER,
                *(void **)(resource + 0x24), (u32)range->blockStart << 7,
                GraphicsCharacterResource_GetUploadSize(resource));
            GX_VBlankIntr(gGraphicsSpriteStatePool.interrupt_state);
        } else {
            range->field_0c = 0;
        }
    }
    /* Retail walks these owner/state links without modifying them. */
    for (group = renderer->groupHead; group != 0;
         group = *(GraphicsSpriteGroup **)((u8 *)group + 8)) {
        void *state = *(void **)((u8 *)group + 0xc);
        while (state != 0)
            state = *(void **)((u8 *)state + 8);
    }
    ResumePalettePool(renderer, &renderer->indexedPool0, 5,
                      GRAPHICS_TRANSFER_KIND_OBJECT_PALETTE);
    if (renderer->field_34 != 0)
        ResumePalettePool(renderer, &renderer->indexedPool1, 9,
                          GRAPHICS_TRANSFER_KIND_OBJECT_EXTENDED_PALETTE);
    renderer->field_30 = 1;
}

extern u16 func_020ae79c(void);
extern u16 func_020ae754(void);
extern u16 func_020ae6c8(void);
extern u16 func_020ae678(void);

/* Release the selected engine's OBJ bank routing, and its extended-palette
 * routing when field_34 is set, then clear the active flag (0x02075238).
 * The borrowed renderer and all resource allocations survive suspension;
 * repeated suspension is inert. SDK return values are intentionally ignored. */
void GraphicsSpriteRenderer_Suspend(GraphicsSpriteRenderer *renderer)
{
    if (renderer->field_30 == 0)
        return;
    if (renderer->engine == 0) {
        func_020ae79c();
        if (renderer->field_34 != 0)
            func_020ae754();
    } else {
        func_020ae6c8();
        if (renderer->field_34 != 0)
            func_020ae678();
    }
    renderer->field_30 = 0;
}

/* Queue every pending 0x200-byte indexed graphics block at retail 0x02075290.
 * The renderer retains its resources and descriptor chains; the transfer
 * queue borrows source buffers until VBlank consumption. IRQ state is restored
 * after each resource, byte destinations are derived from chain indices, and
 * field_34 records completion. Repeated calls or disabled renderers are inert. */
void GraphicsSpriteRenderer_QueuePendingBlocks(GraphicsSpriteRenderer *renderer)
{
    GraphicsIndexedChainEntry *root;

    if (renderer->field_30 == 0 || renderer->field_34 != 0)
        return;
    GraphicsSpriteRenderer_ConfigureObjectDisplay(renderer);
    root = renderer->indexedPool1.head;
    while (root != 0) {
        u8 *resource = (u8 *)root->resource;
        GraphicsIndexedChainEntry *entry = root;
        u16 count;
        u32 interrupt_state;
        u32 index;

        if (*(void **)(resource + 0x14) == 0)
            GraphicsSpriteResource_Prepare(resource);
        interrupt_state = GX_VBlankIntr(0);
        gGraphicsSpriteStatePool.interrupt_state = interrupt_state;
        count = *(u16 *)(*(u8 **)(resource + 0x20) + 6);
        for (index = 0; index < count; ++index) {
            GraphicsTransferQueue_Enqueue(
                &renderer->transferQueue,
                GRAPHICS_TRANSFER_KIND_OBJECT_EXTENDED_PALETTE,
                (u8 *)GraphicsBgResourceData_GetDecoded(resource) + index * 0x200,
                (u32)entry->descriptorIndex << 9, 0x200);
            entry = entry->chainNext;
        }
        GX_VBlankIntr(gGraphicsSpriteStatePool.interrupt_state);
        root = root->nextOrFreeNext;
    }
    renderer->field_34 = 1;
}
#endif
