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
        u8 *resource = (u8 *)root->field_0c;
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
                (u32)entry->index << 9, 0x200);
            entry = entry->chainNext;
        }
        GX_VBlankIntr(gGraphicsSpriteStatePool.interrupt_state);
        root = root->next;
    }
    renderer->field_34 = 1;
}
#endif
