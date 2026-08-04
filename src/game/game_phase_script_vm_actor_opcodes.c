#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement script opcodes that directly control the VM's bound scene actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern u8 data_02105310[];
extern void *func_020337d4(void *actor);
extern void *func_02030ad4(void *collection, s32 index);
extern void *func_02007f0c(void *runtime, s32 index);
extern void func_02032cac(void *actor, s32 active);
extern s32 func_0200b04c(void *state);
extern void func_02034be4(void *actor, u32 value);
extern void func_02033ae8(void *actor, u32 value);
#ifdef __cplusplus
}
#endif

typedef void (*ActorValueMethod)(void *actor, u32 value);

/* Invoke the address-derived actor virtual method at the supplied byte offset. */
static void callActorValueMethod(void *actor, u32 offset, u32 value)
{
    ActorValueMethod *vtable = *(ActorValueMethod **)actor;
    vtable[offset / sizeof(void *)](actor, value);
}

/*
 * Pop integer z, y, and x coordinates, convert them to fx32, and copy the
 * resulting vector into the bound actor's objects at offsets 0x18 and 0x28.
 * The vector helper constructors/destructors provide the observable SDK-style
 * object effects; the opcode returns zero.
 */
s32 func_02012a8c(GamePhaseActorScriptVm *self)
{
    s32 z = (s32)func_02012704(&self->base);
    s32 y = (s32)func_02012704(&self->base);
    s32 x = (s32)func_02012704(&self->base);
    VecFx32Object value;
    u8 *actor = (u8 *)self->actor_84;

    func_0200500c(&value, x << 12, y << 12, z << 12);
    func_020050a4((VecFx32Object *)(actor + 0x18), &value);
    func_020050a4((VecFx32Object *)(actor + 0x28),
                  (VecFx32Object *)(actor + 0x18));
    func_02005058(&value);
    return 0;
}

/*
 * Pop a command value and collection index, resolve that actor through the
 * bound actor's collection, and route the command through virtual method 0x70
 * or 0x74. Type byte 1 redirects to runtime collection 1's actor at offset
 * 0x2e7c. The global state at data_02105310 affects method selection and may
 * reactivate the target through func_02032cac. Returns zero.
 */
s32 func_02012afc(GamePhaseActorScriptVm *self)
{
    u32 value = func_02012704(&self->base);
    s32 index = (s32)func_02012704(&self->base);
    void *collection = func_020337d4(self->actor_84);
    void *target = func_02030ad4(collection, index);

    if (*((u8 *)target + 0x4d) == 1) {
        u8 *runtimeCollection = (u8 *)func_02007f0c(data_021052fc, 1);
        target = *(void **)(runtimeCollection + 0x2e7c);
        callActorValueMethod(target, 0x74, value);
        func_02032cac(target, 1);
        return 0;
    }

    if (target == self->actor_84) {
        callActorValueMethod(target, 0x70, value);
        return 0;
    }

    if (value != 0) {
        if (func_0200b04c(data_02105310) &&
            *(void **)(data_02105310 + 4) == target)
            callActorValueMethod(target, 0x70, value);
        else
            callActorValueMethod(target, 0x74, value);
    }
    if (func_0200b04c(data_02105310))
        func_02032cac(target, 1);
    return 0;
}

/* Pop a value, pass it to the bound actor through func_02034be4, and return zero. */
s32 func_02012c14(GamePhaseActorScriptVm *self)
{
    u32 value = func_02012704(&self->base);
    func_02034be4(self->actor_84, value);
    return 0;
}

/*
 * Pop a boolean and update bits 1, 5, and 0 of the bound actor's halfword at
 * actor->0x54->0x24. Enabling sets bit 1 and clears bit 5; disabling clears
 * bit 1. Both paths clear bit 0. Returns zero.
 */
s32 func_02012c34(GamePhaseActorScriptVm *self)
{
    u32 enabled = func_02012704(&self->base);
    u16 *flags = (u16 *)((u8 *)*(void **)((u8 *)self->actor_84 + 0x54) + 0x24);
    if (enabled != 0) {
        *flags |= 2;
        *flags &= (u16)~0x20;
    } else {
        *flags &= (u16)~2;
    }
    *flags &= (u16)~1;
    return 0;
}

/* Pop a signed countdown value into offset 0x88 and return zero. */
s32 func_02012c98(GamePhaseActorScriptVm *self)
{
    self->waitCounter_88 = (s32)func_02012704(&self->base);
    return 0;
}

/*
 * Decrement the countdown at 0x88. Return zero once it becomes negative;
 * otherwise rewind the bytecode cursor by two bytes and return one so the VM
 * execution loop repeats this opcode on a later update.
 */
s32 func_02012cb0(GamePhaseActorScriptVm *self)
{
    if (--self->waitCounter_88 < 0)
        return 0;
    self->base.cursor_04 -= 2;
    return 1;
}

/*
 * Pop a value and send it through func_02033ae8 when the bound actor's pointer
 * at offset 0x54 is non-null. Returns zero whether or not the pointer exists.
 */
s32 func_02012cd4(GamePhaseActorScriptVm *self)
{
    u32 value = func_02012704(&self->base);
    void *object = *(void **)((u8 *)self->actor_84 + 0x54);
    if (object != 0)
        func_02033ae8(self->actor_84, value);
    return 0;
}

/* Set bit 5 in the bound actor's word at offset 0x14 and return zero. */
s32 func_02012d00(GamePhaseActorScriptVm *self)
{
    *(u32 *)((u8 *)self->actor_84 + 0x14) |= 0x20;
    return 0;
}
