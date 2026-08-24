#include "tingle/graphics_sprite_indexed_release.h"

/*
 * Renderer-facing release dispatch for indexed sprite descriptor chains. Two
 * fixed 16-entry pools occupy renderer offsets 0xbd0 and 0xd20; the root's
 * binding-mode byte selects the pool and whether its byte reference count is
 * used.
 */

typedef struct GraphicsSpriteIndexedRenderer {
    u8 padding_000[0xbd0];
    GraphicsIndexedChainPool pool0;
    GraphicsIndexedChainPool pool1;
} GraphicsSpriteIndexedRenderer;

/*
 * Release entry according to bindingMode. Reference-counted palette modes
 * recycle only when referenceCount reaches zero; immediate-release modes
 * recycle directly. Unknown modes do nothing. Null is ignored. Pool list/count
 * state may change; no SDK or graphics-hardware access occurs.
 */
void GraphicsSpriteRenderer_ReleaseIndexedEntry(
    void *rendererPointer, GraphicsIndexedChainEntry *entry)
{
    GraphicsSpriteIndexedRenderer *renderer =
        (GraphicsSpriteIndexedRenderer *)rendererPointer;

    if (entry == 0) {
        return;
    }
    switch (entry->bindingMode) {
    case GRAPHICS_INDEXED_CHAIN_MODE_SHARED_OBJECT_PALETTE:
        entry->referenceCount--;
        if (entry->referenceCount != 0) {
            return;
        }
        GraphicsIndexedChainPool_ReleaseChain(&renderer->pool0, entry);
        return;
    case GRAPHICS_INDEXED_CHAIN_MODE_IMMEDIATE_RELEASE_OBJECT_PALETTE:
        GraphicsIndexedChainPool_ReleaseChain(&renderer->pool0, entry);
        return;
    case GRAPHICS_INDEXED_CHAIN_MODE_SHARED_OBJECT_EXTENDED_PALETTE:
        entry->referenceCount--;
        if (entry->referenceCount != 0) {
            return;
        }
        GraphicsIndexedChainPool_ReleaseChain(&renderer->pool1, entry);
        return;
    case GRAPHICS_INDEXED_CHAIN_MODE_IMMEDIATE_RELEASE_OBJECT_EXTENDED_PALETTE:
        GraphicsIndexedChainPool_ReleaseChain(&renderer->pool1, entry);
        return;
    default:
        return;
    }
}
