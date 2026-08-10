#ifndef TINGLE_GRAPHICS_SPRITE_INDEXED_RELEASE_H
#define TINGLE_GRAPHICS_SPRITE_INDEXED_RELEASE_H

#include "tingle/graphics_indexed_chain_pool.h"

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsSpriteRenderer_ReleaseIndexedEntry(
    void *renderer, GraphicsIndexedChainEntry *entry);

#ifdef __cplusplus
}
#endif

#endif
