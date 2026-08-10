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

DebugSpriteText *DebugSpriteText_Init(DebugSpriteText *self);
DebugSpriteText *DebugSpriteText_Destroy(DebugSpriteText *self);
void DebugSpriteText_SetTextResource(DebugSpriteText *self, u16 resourceId);
void DebugSpriteText_DrawCentered(DebugSpriteText *self, s32 centerX, s32 y);

#ifdef __cplusplus
}
#endif

#endif
