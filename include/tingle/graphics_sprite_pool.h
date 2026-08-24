#ifndef TINGLE_GRAPHICS_SPRITE_POOL_H
#define TINGLE_GRAPHICS_SPRITE_POOL_H

#include "tingle/graphics_sprite_group.h"

#ifdef __cplusplus
extern "C" {
#endif

GraphicsSpriteState *GraphicsSpriteStatePool_Allocate(
    void *owner, void *graphicsResource, void *paletteResource,
    void *animationResource, u8 graphicsBindingMode,
    GraphicsSpriteGroup *group);
void GraphicsSpriteStatePool_Release(void *owner, GraphicsSpriteState *state);
void GraphicsSpriteState_ReplaceResources(void *owner,
                                          GraphicsSpriteState *state,
                                          void *graphicsResource,
                                          void *paletteResource,
                                          void *animationResource);

#ifdef __cplusplus
}
#endif

#endif
