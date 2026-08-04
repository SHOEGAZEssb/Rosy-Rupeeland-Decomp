#ifndef TINGLE_DEBUG_SPRITE_TEXT_H
#define TINGLE_DEBUG_SPRITE_TEXT_H

#include "tingle/graphics_sprite_renderer.h"

typedef struct DebugSpriteText {
    const u16 *text;
    void *renderEntry;
} DebugSpriteText;

typedef char DebugSpriteTextSizeCheck[
    sizeof(DebugSpriteText) == 8 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

DebugSpriteText *func_02005c90(DebugSpriteText *self);
DebugSpriteText *func_02005cc8(DebugSpriteText *self);
void func_02005cec(DebugSpriteText *self, u16 resourceId);
void func_02005d0c(DebugSpriteText *self, s32 centerX, s32 y);

#ifdef __cplusplus
}
#endif

#endif
