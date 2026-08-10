#ifndef TINGLE_DEBUG_HUD_STATE_H
#define TINGLE_DEBUG_HUD_STATE_H

#include "tingle/types.h"

typedef struct DebugHudRect {
    s32 left;
    s32 top;
    s32 right;
    s32 bottom;
} DebugHudRect;

/* State for a debug/HUD grid and its screen-space bounds. */
typedef struct DebugHudState {
    s32 fontSelect;
    u32 resourceHandle;
    u32 rendererHandle;
    u32 field_0c;
    s32 left;
    s32 top;
    s32 width;
    s32 height;
    u32 resetFontOnClose;
} DebugHudState;

#ifdef __cplusplus
extern "C" {
#endif

DebugHudState *DebugHudState_Init(DebugHudState *self);
DebugHudState *DebugHudState_Destroy(DebugHudState *self);
void DebugHudState_ResetSelectedFont(DebugHudState *self);
s32 DebugHud_CountDecimalDigits(void *unused, s32 value);
void DebugHud_GetCurrentRectangle(DebugHudRect *rect);
void DebugHudState_Open(DebugHudState *self, s32 fontSelect, u32 parameter,
                        u32 resetFontOnClose);
void DebugHudState_Close(DebugHudState *self);
u32 DebugHudState_PollInput(DebugHudState *self, s32 forceButtons);
void DebugHudState_SetNumberRow(DebugHudState *self, s32 row, s32 value);
void DebugHudState_SetTextRow(DebugHudState *self, s32 row, const u16 *text);
void *DebugHud_GetTextTableEntry(void *unused, s32 table, s32 index);
void DebugHudState_SetRectangle(DebugHudState *self, const DebugHudRect *rect);
void DebugHudState_RefreshRectangle(DebugHudState *self);
void DebugHudState_UploadRows(DebugHudState *self);
DebugHudState *DebugHudState_GetGlobal(void);

#ifdef __cplusplus
}
#endif

#endif
