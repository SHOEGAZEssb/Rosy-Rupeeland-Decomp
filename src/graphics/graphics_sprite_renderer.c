#include "tingle/graphics_sprite_renderer.h"

/*
 * Construction of the composite sprite renderer. The object embeds all fixed
 * descriptor pools, a 0x400-byte shadow buffer, owner group links, and the
 * transfer queue used by later frame-building and upload paths.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void func_02074f0c(GraphicsSpriteRenderer *renderer);

#ifdef __cplusplus
}
#endif

/*
 * Construct every embedded allocator/pool in dependency order, store the three
 * caller configuration words, initialize owner-list and control fields, run
 * the renderer-specific setup, reset render entries, and bind the lookup cache
 * to shadowBuffer. Finally clear seven leading pointers and set field_20 to 16.
 * Returns renderer. No heap allocation occurs; callees initialize fixed arrays
 * and may establish renderer/platform state, but this function directly writes
 * no graphics registers.
 */
GraphicsSpriteRenderer *func_02074200(GraphicsSpriteRenderer *renderer,
                                      u32 engine, u32 field28, u32 field2c)
{
    GraphicsVramAllocator_Init(&renderer->vramAllocator);
    GraphicsIndexedChainPool_Init(&renderer->indexedPool0);
    GraphicsIndexedChainPool_Init(&renderer->indexedPool1);
    GraphicsRenderEntryPool_Init(&renderer->renderEntryPool);
    GraphicsLookupCache_Init(&renderer->lookupCache);
    GraphicsTransferQueue_Init(&renderer->transferQueue);
    renderer->engine = engine;
    renderer->field_28 = field28;
    renderer->field_2c = field2c;
    renderer->field_30 = 1;
    renderer->field_34 = 1;
    renderer->groupCount = 0;
    renderer->groupTail = 0;
    renderer->groupHead = 0;
    func_02074f0c(renderer);
    GraphicsRenderEntryPool_Reset(&renderer->renderEntryPool);
    GraphicsLookupCache_BindRecords(
        &renderer->lookupCache, renderer->shadowBuffer);
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
