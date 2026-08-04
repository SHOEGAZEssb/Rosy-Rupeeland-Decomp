#ifndef TINGLE_GAME_PHASE_STATE_H
#define TINGLE_GAME_PHASE_STATE_H

#include "tingle/types.h"

/* Large runtime state embedded at GamePhaseRuntime offset 0x24. */
typedef struct GamePhaseState {
    void *configuration;
    u8 storage_0004[0x2ea0];
    u8 helper_2ea4[0x0c];
    void *owned_2eb0;
    u8 helper_2eb4[0xa4];
    u8 helper_2f58[0x28];
    u32 flags_2f7c;
    u8 helper_2f80[0x10];
    u16 field_2f90;
    s16 field_2f92;
} GamePhaseState;

#ifdef __cplusplus
extern "C" {
#endif

GamePhaseState *func_0200e4dc(GamePhaseState *self);
GamePhaseState *func_0200e574(GamePhaseState *self);
void func_0200e5bc(GamePhaseState *self);
void func_0200e61c(GamePhaseState *self);
void func_0200e650(GamePhaseState *self, const void *configuration);
void func_0200e714(GamePhaseState *self, const void *configuration);
void func_0200e780(GamePhaseState *self, const void *configuration);
void func_0200e9e0(GamePhaseState *self);
void func_0200ea34(GamePhaseState *self, u16 vcount);
void func_0200ea48(GamePhaseState *self);
void *func_0200eb0c(GamePhaseState *self);
void *func_0200eb14(GamePhaseState *self, s32 x, s32 y);
void func_0200eb58(GamePhaseState *self, s32 use3dMode);
void func_0200ec6c(GamePhaseState *self, s32 enabled);
void func_0200ecbc(GamePhaseState *self, s32 value);
s32 func_0200ecf0(GamePhaseState *self);
s32 func_0200efe0(GamePhaseState *self);
void func_0200f0b4(GamePhaseState *self, const void *configuration);

#ifdef __cplusplus
}
#endif

#endif
