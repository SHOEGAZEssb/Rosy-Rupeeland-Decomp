#ifndef TINGLE_GRAPHICS_SPRITE_POOL_H
#define TINGLE_GRAPHICS_SPRITE_POOL_H

#include "tingle/graphics_sprite_group.h"

#ifdef __cplusplus
extern "C" {
#endif

GraphicsSpriteState *func_020743ac(
    void *owner, void *field14, void *field18, void *field1c,
    u8 attach, GraphicsSpriteGroup *group);
void func_0207442c(void *owner, GraphicsSpriteState *state);
void func_0207447c(void *owner, GraphicsSpriteState *state,
                   void *field14, void *field18, void *field1c);

#ifdef __cplusplus
}
#endif

#endif
