#include "tingle/graphics_render_entry_pool.h"
#include "tingle/graphics_sprite_render_helpers.h"

/*
 * Small helpers shared by the sprite render builders: adjustment of the most
 * recently appended root entry and a halfword-safe copy of an 8-byte record.
 */

/*
 * Add delta to the active list tail's offset-0x14 payload. An empty pool is
 * ignored. The pool and entry links are unchanged, no value is returned, and
 * there is no SDK or graphics-hardware access.
 */
void GraphicsRenderEntryPool_AddToTailPayload(GraphicsRenderEntryPool *pool, u32 delta)
{
    GraphicsRenderEntry *tail = pool->tail;

    if (tail != 0) {
        tail->field_14 += delta;
    }
}

/*
 * Copy all four halfwords from source to destination in ascending offset order.
 * The explicit 16-bit accesses preserve the retail alignment contract. Returns
 * no value and has no SDK or graphics-hardware effects.
 */
void GraphicsSpriteRecord8_Copy(GraphicsSpriteRecord8 *destination,
                   const GraphicsSpriteRecord8 *source)
{
    destination->field_00 = source->field_00;
    destination->field_02 = source->field_02;
    destination->field_04 = source->field_04;
    destination->field_06 = source->field_06;
}
