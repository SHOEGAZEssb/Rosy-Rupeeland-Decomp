#include "tingle/graphics_sprite_indexed_release.h"

/*
 * Renderer-facing release dispatch for indexed sprite descriptor chains. Two
 * fixed 16-entry pools occupy renderer offsets 0xbd0 and 0xd20; the root's
 * mode byte selects the pool and whether its byte-sized share count is used.
 */

typedef struct GraphicsSpriteIndexedRenderer {
    u8 padding_000[0xbd0];
    GraphicsIndexedChainPool pool0;
    GraphicsIndexedChainPool pool1;
} GraphicsSpriteIndexedRenderer;

/*
 * Release entry according to mode at offset 0x11. Modes 1 and 3 decrement the
 * byte share count at 0x10 and recycle only on zero; modes 2 and 4 recycle
 * immediately. Modes 0 and values above 4 do nothing. Null is ignored. Pool
 * list/count state may change; no SDK or graphics-hardware access occurs.
 */
void GraphicsSpriteRenderer_ReleaseIndexedEntry(
    void *rendererPointer, GraphicsIndexedChainEntry *entry)
{
    GraphicsSpriteIndexedRenderer *renderer =
        (GraphicsSpriteIndexedRenderer *)rendererPointer;

    if (entry == 0) {
        return;
    }
    switch (entry->mode) {
    case 1:
        entry->field_10--;
        if (entry->field_10 != 0) {
            return;
        }
        GraphicsIndexedChainPool_ReleaseChain(&renderer->pool0, entry);
        return;
    case 2:
        GraphicsIndexedChainPool_ReleaseChain(&renderer->pool0, entry);
        return;
    case 3:
        entry->field_10--;
        if (entry->field_10 != 0) {
            return;
        }
        GraphicsIndexedChainPool_ReleaseChain(&renderer->pool1, entry);
        return;
    case 4:
        GraphicsIndexedChainPool_ReleaseChain(&renderer->pool1, entry);
        return;
    default:
        return;
    }
}
