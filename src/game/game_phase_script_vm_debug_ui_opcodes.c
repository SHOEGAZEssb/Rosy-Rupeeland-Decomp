#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes that feed the recovered debug/UI subsystem. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0201da34(GamePhaseActorScriptVm *self);
extern void *Actor_GetCollection(void *actor);
extern void *func_0201da20(u32 mode, u32 value);
extern void *func_0201d9e4(u32 value);
extern void *DebugHudState_GetGlobal(void *value);
extern void *DebugHudState_RefreshRectangle(void *value);
extern void DebugHudState_Open(void *state, void *first, void *second, u32 enabled);
extern void func_0201da9c(GamePhaseActorScriptVm *self,
                         u32 first, u32 second, u32 third,
                         s32 fourth, s32 fifth);
#ifdef __cplusplus
}
#endif

/*
 * Pop and discard two operands, then pop lookup and value operands. Let
 * func_0201da34 consume/update VM-side state, resolve the value through the
 * bound collection's mode at 0x2e84 and the lookup through func_0201d9e4,
 * refresh the global debug-HUD rectangle, and open the HUD with font reset
 * enabled. Returns one to stop the VM loop.
 */
s32 func_02015610(GamePhaseActorScriptVm *self)
{
    void *first;
    void *second;
    void *state;
    (void)GamePhaseScriptVm_Pop(&self->base);
    (void)GamePhaseScriptVm_Pop(&self->base);
    {
        u32 lookup = GamePhaseScriptVm_Pop(&self->base);
        u32 value = GamePhaseScriptVm_Pop(&self->base);
        u8 *collection;
        func_0201da34(self);
        collection = (u8 *)Actor_GetCollection(self->actor);
        second = func_0201da20(*(u32 *)(collection + 0x2e84), value);
        first = func_0201d9e4(lookup);
    }
    state = DebugHudState_GetGlobal(first);
    state = DebugHudState_RefreshRectangle(state);
    state = DebugHudState_GetGlobal(state);
    DebugHudState_Open(state, first, second, 1);
    return 1;
}

/*
 * Submit the fixed ID tuple 0x136f/0x1370/0x1371 and values 0x79/0x7a to
 * func_0201da9c for this VM, then return zero.
 */
s32 func_02015690(GamePhaseActorScriptVm *self)
{
    func_0201da9c(self, 0x136f, 0x1370, 0x1371, 0x79, 0x7a);
    return 0;
}

/*
 * Submit the fixed ID tuple 0x1372/0x1373/0x1374 and two -1 values to
 * func_0201da9c for this VM, then return zero.
 */
s32 func_020156c8(GamePhaseActorScriptVm *self)
{
    func_0201da9c(self, 0x1372, 0x1373, 0x1374, -1, -1);
    return 0;
}
