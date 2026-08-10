#include "tingle/game_phase_script_vm.h"

/* Implement actor-script cleanup and indexed actor-interaction opcodes. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void func_02047d40(void *actor);
extern u32 func_02032e14(void *actor, u32 value);
extern void func_020330fc(void *actor, u32 first, u32 second);
extern void *func_020337d4(void *actor);
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
#ifdef __cplusplus
}
#endif

typedef void (*ActorVoidMethod)(void *actor);
typedef void (*ActorPointerMethod)(void *actor, void *value);

/*
 * Clear actor flag 0x01000000 and perform type-specific cleanup. Type 2 calls
 * virtual method 0x114, then for byte 0x27e values 1/2/3/29/32 calls virtual
 * method 0xd4 with the runtime pointer at 0x2ea4. Type 7 delegates to
 * func_02047d40. Returns zero. The meaning of these type values is unconfirmed.
 */
s32 func_02013930(GamePhaseActorScriptVm *self)
{
    u8 *actor = (u8 *)self->actor_84;
    *(u32 *)(actor + 0x10) &= ~0x01000000u;
    if (actor[0x4d] == 2) {
        ActorVoidMethod cleanup =
            *(ActorVoidMethod *)((u8 *)*(void **)actor + 0x114);
        u32 index;
        cleanup(actor);
        index = (actor[0x27e] - 1) & 0xff;
        if (index <= 31 && ((0x90000007u >> index) & 1) != 0) {
            ActorPointerMethod method =
                *(ActorPointerMethod *)((u8 *)*(void **)actor + 0xd4);
            method(actor, *(void **)((u8 *)data_021052fc + 0x2ea4));
        }
    } else if (actor[0x4d] == 7) {
        func_02047d40(actor);
    }
    return 0;
}

/* No-op script handler; ignores the VM and returns zero. */
s32 func_020139d0(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}

/* Pop a value, push func_02032e14(bound actor, value), and return zero. */
s32 func_020139d8(GamePhaseActorScriptVm *self)
{
    u32 value = func_02012704(&self->base);
    func_020127f8(&self->base, func_02032e14(self->actor_84, value));
    return 0;
}

/* Pop second then first, call func_020330fc on the bound actor, and return zero. */
s32 func_02013a04(GamePhaseActorScriptVm *self)
{
    u32 second = func_02012704(&self->base);
    u32 first = func_02012704(&self->base);
    func_020330fc(self->actor_84, first, second);
    return 0;
}

/*
 * Pop a value and actor index, resolve the indexed actor from the bound
 * collection, push func_02032e14(target, value), and return zero.
 */
s32 func_02013a34(GamePhaseActorScriptVm *self)
{
    u32 value = func_02012704(&self->base);
    s32 index = (s32)func_02012704(&self->base);
    void *target = ActorCollection_FindActorByDescriptorValue(func_020337d4(self->actor_84), index);
    func_020127f8(&self->base, func_02032e14(target, value));
    return 0;
}

/*
 * Pop second, first, and actor index; resolve that target and invoke
 * func_020330fc(target, first, second). Returns zero.
 */
s32 func_02013a7c(GamePhaseActorScriptVm *self)
{
    u32 second = func_02012704(&self->base);
    u32 first = func_02012704(&self->base);
    s32 index = (s32)func_02012704(&self->base);
    void *target = ActorCollection_FindActorByDescriptorValue(func_020337d4(self->actor_84), index);
    func_020330fc(target, first, second);
    return 0;
}
