#ifndef TINGLE_GRAPHICS_SPRITE_RENDER_HELPERS_H
#define TINGLE_GRAPHICS_SPRITE_RENDER_HELPERS_H

#include "tingle/types.h"

/* One 8-byte record copied as four independently addressable halfwords. */
typedef struct GraphicsSpriteRecord8 {
    u16 field_00;
    u16 field_02;
    u16 field_04;
    u16 field_06;
} GraphicsSpriteRecord8;

typedef char GraphicsSpriteRecord8SizeCheck[
    sizeof(GraphicsSpriteRecord8) == 8 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsSpriteRecord8_Copy(GraphicsSpriteRecord8 *destination,
                   const GraphicsSpriteRecord8 *source);

#ifdef __cplusplus
}
#endif

#endif
