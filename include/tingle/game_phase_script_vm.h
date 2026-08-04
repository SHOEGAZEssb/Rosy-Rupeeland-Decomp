#ifndef TINGLE_GAME_PHASE_SCRIPT_VM_H
#define TINGLE_GAME_PHASE_SCRIPT_VM_H

#include "tingle/types.h"

/* Compact bytecode interpreter state with callback and value stacks. */
typedef struct GamePhaseScriptVm {
    const void *vtable;
    const s8 *cursor_04;
    const s8 *start_08;
    void *callbacks_0c[8];
    u32 values_2c[8];
    u32 stack_4c[12];
    s8 stackDepth_7c;
    u8 flags_7d;
    s8 field_7e;
    s8 field_7f;
    void *context_80;
} GamePhaseScriptVm;

/* Script VM specialization used by actor-bound phase scripts. */
typedef struct GamePhaseActorScriptVm {
    GamePhaseScriptVm base;
    void *actor_84;
    s32 waitCounter_88;
    u32 flags_8c;
    u8 value_90;
    u8 padding_91[3];
} GamePhaseActorScriptVm;

#ifdef __cplusplus
extern "C" {
#endif
GamePhaseScriptVm *func_02012564(GamePhaseScriptVm *self);
void func_02012584(GamePhaseScriptVm *self);
GamePhaseScriptVm *func_020125ec(GamePhaseScriptVm *self);
GamePhaseScriptVm *func_020125f0(GamePhaseScriptVm *self);
GamePhaseScriptVm *func_02012604(GamePhaseScriptVm *self);
GamePhaseScriptVm *func_02012608(GamePhaseScriptVm *self,
                                 const s8 *script, void *context);
void func_02012628(GamePhaseScriptVm *self,
                   const s8 *script, void *context);
GamePhaseScriptVm *func_0201264c(GamePhaseScriptVm *self,
                                 const GamePhaseScriptVm *source);
void func_02012668(GamePhaseScriptVm *self,
                   const GamePhaseScriptVm *source);
u32 func_02012704(GamePhaseScriptVm *self);
void func_02012720(GamePhaseScriptVm *self, u32 value);
s32 func_0201273c(GamePhaseScriptVm *self, s32 singleStep);
s32 func_020127f0(GamePhaseScriptVm *self);
void func_020127f8(GamePhaseScriptVm *self, u32 value);
s32 func_02012814(GamePhaseScriptVm *self);
s32 func_02012a60(GamePhaseScriptVm *self);
s32 func_02012a8c(GamePhaseActorScriptVm *self);
s32 func_02012afc(GamePhaseActorScriptVm *self);
s32 func_02012c14(GamePhaseActorScriptVm *self);
s32 func_02012c34(GamePhaseActorScriptVm *self);
s32 func_02012c98(GamePhaseActorScriptVm *self);
s32 func_02012cb0(GamePhaseActorScriptVm *self);
s32 func_02012cd4(GamePhaseActorScriptVm *self);
s32 func_02012d00(GamePhaseActorScriptVm *self);
s32 func_02012d18(GamePhaseActorScriptVm *self);
s32 func_02012d50(GamePhaseActorScriptVm *self);
s32 func_02012d90(GamePhaseActorScriptVm *self);
s32 func_02012dd8(GamePhaseActorScriptVm *self);
s32 func_02012e18(GamePhaseActorScriptVm *self);
s32 func_02012e58(GamePhaseActorScriptVm *self);
s32 func_02012e98(GamePhaseActorScriptVm *self);
s32 func_02012f40(GamePhaseActorScriptVm *self);
s32 func_02012f64(GamePhaseActorScriptVm *self);
s32 func_02013014(GamePhaseActorScriptVm *self);
s32 func_02013030(GamePhaseActorScriptVm *self);
s32 func_02013074(GamePhaseActorScriptVm *self);
s32 func_02013094(GamePhaseActorScriptVm *self);
s32 func_020130c0(GamePhaseActorScriptVm *self);
s32 func_020130ec(GamePhaseActorScriptVm *self);
s32 func_020133e8(GamePhaseActorScriptVm *self);
s32 func_020134a0(GamePhaseActorScriptVm *self);
s32 func_020134d0(GamePhaseActorScriptVm *self);
s32 func_0201350c(GamePhaseActorScriptVm *self);
s32 func_02013568(GamePhaseActorScriptVm *self);
s32 func_02013584(GamePhaseActorScriptVm *self);
s32 func_020135a0(GamePhaseActorScriptVm *self);
s32 func_020135f4(GamePhaseActorScriptVm *self);
s32 func_0201364c(GamePhaseActorScriptVm *self);
s32 func_020136a4(GamePhaseActorScriptVm *self);
s32 func_020136fc(GamePhaseActorScriptVm *self);
s32 func_02013758(GamePhaseActorScriptVm *self);
s32 func_02013790(GamePhaseActorScriptVm *self);
s32 func_020137c8(GamePhaseActorScriptVm *self);
s32 func_020137ec(GamePhaseActorScriptVm *self);
s32 func_0201389c(GamePhaseActorScriptVm *self);
s32 func_02013914(GamePhaseActorScriptVm *self);
s32 func_02013930(GamePhaseActorScriptVm *self);
s32 func_020139d0(GamePhaseActorScriptVm *self);
s32 func_020139d8(GamePhaseActorScriptVm *self);
s32 func_02013a04(GamePhaseActorScriptVm *self);
s32 func_02013a34(GamePhaseActorScriptVm *self);
s32 func_02013a7c(GamePhaseActorScriptVm *self);
s32 func_02013ac8(GamePhaseActorScriptVm *self);
s32 func_02013b74(GamePhaseActorScriptVm *self);
s32 func_02013c7c(GamePhaseActorScriptVm *self);
s32 func_02013ca0(GamePhaseActorScriptVm *self);
s32 func_02013cc4(GamePhaseActorScriptVm *self);
s32 func_02013cf8(GamePhaseActorScriptVm *self);
s32 func_02013d68(GamePhaseActorScriptVm *self);
s32 func_02013d80(GamePhaseActorScriptVm *self);
s32 func_02013db0(GamePhaseActorScriptVm *self);
s32 func_02013ddc(GamePhaseActorScriptVm *self);
void func_02013dfc(void *actor, s32 enabled);
s32 func_02013e14(GamePhaseActorScriptVm *self);
s32 func_02013e64(GamePhaseActorScriptVm *self);
s32 func_02013ea0(GamePhaseActorScriptVm *self);
s32 func_02013eb0(GamePhaseActorScriptVm *self);
s32 func_02013ec4(GamePhaseActorScriptVm *self);
s32 func_02013ed8(GamePhaseActorScriptVm *self);
s32 func_02013efc(GamePhaseActorScriptVm *self);
s32 func_02013f10(GamePhaseActorScriptVm *self);
s32 func_0201409c(GamePhaseActorScriptVm *self);
s32 func_0201410c(GamePhaseActorScriptVm *self);
s32 func_0201413c(GamePhaseActorScriptVm *self);
s32 func_0201416c(GamePhaseActorScriptVm *self);
s32 func_020141d4(GamePhaseActorScriptVm *self);
s32 func_02014250(GamePhaseActorScriptVm *self);
s32 func_020142cc(GamePhaseActorScriptVm *self);
s32 func_020142ec(GamePhaseActorScriptVm *self);
s32 func_020142f4(GamePhaseActorScriptVm *self);
s32 func_02014314(GamePhaseActorScriptVm *self);
s32 func_0201433c(GamePhaseActorScriptVm *self);
s32 func_020143a8(GamePhaseActorScriptVm *self);
u32 *func_02015548(u32 *result, s32 left, s32 top, s32 right, s32 bottom);
s32 func_0201555c(GamePhaseActorScriptVm *self);
s32 func_02015580(GamePhaseActorScriptVm *self);
s32 func_020155a4(GamePhaseActorScriptVm *self);
s32 func_02015610(GamePhaseActorScriptVm *self);
s32 func_02015690(GamePhaseActorScriptVm *self);
s32 func_020156c8(GamePhaseActorScriptVm *self);
s32 func_020156fc(GamePhaseActorScriptVm *self);
s32 func_0201579c(GamePhaseActorScriptVm *self);
s32 func_02015818(GamePhaseActorScriptVm *self);
s32 func_0201593c(GamePhaseActorScriptVm *self);
s32 func_0201597c(GamePhaseActorScriptVm *self);
s32 func_020159b4(GamePhaseActorScriptVm *self);
s32 func_020159d4(GamePhaseActorScriptVm *self);
s32 func_02015a34(GamePhaseActorScriptVm *self);
s32 func_02015a80(GamePhaseActorScriptVm *self);
s32 func_02015acc(GamePhaseActorScriptVm *self);
s32 func_02015b18(GamePhaseActorScriptVm *self);
s32 func_02015b64(GamePhaseActorScriptVm *self);
s32 func_02015d0c(GamePhaseActorScriptVm *self);
s32 func_02015d4c(GamePhaseActorScriptVm *self);
s32 func_02015dc8(GamePhaseActorScriptVm *self);
s32 func_02015e40(GamePhaseActorScriptVm *self);
s32 func_02015e64(GamePhaseActorScriptVm *self);
s32 func_02015e9c(GamePhaseActorScriptVm *self);
s32 func_02015f10(GamePhaseActorScriptVm *self);
s32 func_02015f50(GamePhaseActorScriptVm *self);
s32 func_02016014(GamePhaseActorScriptVm *self);
s32 func_02016030(GamePhaseActorScriptVm *self);
s32 func_02016070(GamePhaseActorScriptVm *self);
s32 func_020160b0(GamePhaseActorScriptVm *self);
s32 func_020160f0(GamePhaseActorScriptVm *self);
s32 func_02016144(GamePhaseActorScriptVm *self);
s32 func_0201616c(GamePhaseActorScriptVm *self);
s32 func_020161ac(GamePhaseActorScriptVm *self);
s32 func_020161f4(GamePhaseActorScriptVm *self);
s32 func_02016238(GamePhaseActorScriptVm *self);
s32 func_02016814(GamePhaseActorScriptVm *self);
s32 func_02016898(GamePhaseActorScriptVm *self);
s32 func_020168a0(GamePhaseActorScriptVm *self);
s32 func_020168a8(GamePhaseActorScriptVm *self);
s32 func_020168d0(GamePhaseActorScriptVm *self);
#ifdef __cplusplus
}
#endif

#endif
