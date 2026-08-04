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
    s32 displaySelect;
    u32 field_04;
    u32 field_08;
    u32 field_0c;
    s32 left;
    s32 top;
    s32 width;
    s32 height;
    u32 field_20;
} DebugHudState;

#ifdef __cplusplus
extern "C" {
#endif

DebugHudState *func_0200f260(DebugHudState *self);
DebugHudState *func_0200f314(DebugHudState *self);
void func_0200f328(DebugHudState *self);
s32 func_0200f360(void *unused, s32 value);
void func_0200f38c(DebugHudRect *rect);
void func_0200f404(DebugHudState *self, s32 displaySelect, u32 parameter,
                   u32 active);
void func_0200f52c(DebugHudState *self);
void func_0200f5b8(DebugHudState *self, s32 forceButtons);
void func_0200f67c(DebugHudState *self, s32 row, s32 value);
void func_0200f6f4(DebugHudState *self, s32 row, const u16 *text);
void *func_0200f73c(void *unused, s32 table, s32 index);
void func_0200f788(DebugHudState *self, const DebugHudRect *rect);
void func_0200f7bc(DebugHudState *self);
void func_0200f7e4(DebugHudState *self);
DebugHudState *func_0200f824(void);

#ifdef __cplusplus
}
#endif

#endif
