#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes that feed the recovered debug/UI subsystem. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0201da34(GamePhaseActorScriptVm *self);
extern void *func_020337d4(void *actor);
extern void *func_0201da20(u32 mode, u32 value);
extern void *func_0201d9e4(u32 value);
extern void *func_0200f824(void *value);
extern void *func_0200f7bc(void *value);
extern void func_0200f404(void *state, void *first, void *second, u32 enabled);
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
 * traverse the address-derived debug-state accessors, and call func_0200f404
 * with enabled=1. Returns one to stop the VM loop.
 */
s32 func_02015610(GamePhaseActorScriptVm *self)
{
    void *first;
    void *second;
    void *state;
    (void)func_02012704(&self->base);
    (void)func_02012704(&self->base);
    {
        u32 lookup = func_02012704(&self->base);
        u32 value = func_02012704(&self->base);
        u8 *collection;
        func_0201da34(self);
        collection = (u8 *)func_020337d4(self->actor_84);
        second = func_0201da20(*(u32 *)(collection + 0x2e84), value);
        first = func_0201d9e4(lookup);
    }
    state = func_0200f824(first);
    state = func_0200f7bc(state);
    state = func_0200f824(state);
    func_0200f404(state, first, second, 1);
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
