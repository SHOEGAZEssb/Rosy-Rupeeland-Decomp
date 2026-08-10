#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"

/* Implement actor-script opcodes that create or bind recovered debug/UI objects. */

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_020d5b2c[];
extern u8 data_021f3ecc[];
extern void *Actor_GetCollection(void *actor);
extern void *func_0201da20(u32 mode, u32 value);
extern void *func_0201d9e4(u32 value);
extern void func_0201da34(GamePhaseActorScriptVm *self);
extern void *func_020791e0(void *state, u16 value);
extern void *func_0200f824(void *value);
extern void *func_0200f7bc(void *value);
extern void func_0200f404(void *state, void *first, void *second, u32 enabled);
extern void func_ov059_0220fd20(void *allocation, void *first,
                               void *second, u32 third);
#ifdef __cplusplus
}
#endif

/*
 * Pop third, second, and first operands. Resolve first through the bound
 * collection mode and second through func_0201d9e4, load overlay 61 (0x3d)
 * in slot 2, allocate 0x3c bytes, and initialize it through the common
 * overlay-59..74 entry point with the third operand. Returns zero.
 */
s32 func_020156fc(GamePhaseActorScriptVm *self)
{
    u32 third = func_02012704(&self->base);
    u32 secondValue = func_02012704(&self->base);
    u32 firstValue = func_02012704(&self->base);
    u8 *collection = (u8 *)Actor_GetCollection(self->actor_84);
    void *second = func_0201da20(*(u32 *)(collection + 0x2e84), firstValue);
    void *first = func_0201d9e4(secondValue);
    void *allocation;
    func_0200222c(func_020022dc(), 2, 0x3d);
    allocation = Heap_Alloc(0x3c, data_020d5b2c, 4, &gHeapContext);
    if (allocation != 0)
        func_ov059_0220fd20(allocation, first, second, third);
    return 0;
}

/*
 * Pop and discard two operands, pop lookup and table operands, update VM-side
 * state through func_0201da34, resolve the table operand through
 * data_021f3ecc/func_020791e0 and the lookup through func_0201d9e4, then feed
 * both to the recovered debug-state chain with enabled=1. Returns zero.
 */
s32 func_0201579c(GamePhaseActorScriptVm *self)
{
    void *first;
    void *second;
    void *state;
    (void)func_02012704(&self->base);
    (void)func_02012704(&self->base);
    {
        u32 lookup = func_02012704(&self->base);
        u32 tableValue = func_02012704(&self->base);
        func_0201da34(self);
        second = func_020791e0(data_021f3ecc, (u16)tableValue);
        first = func_0201d9e4(lookup);
    }
    state = func_0200f824(first);
    state = func_0200f7bc(state);
    state = func_0200f824(state);
    func_0200f404(state, first, second, 1);
    return 0;
}
