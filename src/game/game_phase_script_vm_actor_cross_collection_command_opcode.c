#include "tingle/game_phase_script_vm.h"

/* Implement the actor command opcode that resolves its target from the runtime's opposite collection. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern u8 data_02105310[];
extern void *func_02007f0c(void *runtime, s32 index);
extern s32 func_0200b04c(void *state);
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern void Actor_SetActive(void *actor, s32 active);
extern void *func_020337d4(void *actor);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

typedef void (*ActorValueMethod)(void *actor, u32 value);

/* Invoke an actor virtual method whose address-derived byte offset is confirmed. */
static void callActorValueMethod(void *actor, u32 offset, u32 value)
{
    ActorValueMethod *vtable = *(ActorValueMethod **)actor;
    vtable[offset / sizeof(void *)](actor, value);
}

/*
 * Pop a command and index. If the runtime's two owner links do not identify
 * the same object, return zero without pushing a result. Otherwise select the
 * opposite actor collection according to the bound collection's mode at
 * 0x2e84, dispatch through virtual method 0x70 or 0x74, activate non-local
 * targets, push one, and return zero. Mode values other than 1 or 2 halt.
 */
s32 func_02015b64(GamePhaseActorScriptVm *self)
{
    u32 value = func_02012704(&self->base);
    s32 index = (s32)func_02012704(&self->base);
    u8 *runtime = (u8 *)data_021052fc;
    u8 *owner = *(u8 **)(runtime + 0x2fb8);
    void *target;
    u32 mode;

    if (**(void ***)(runtime + 0x24) != **(void ***)(owner + 0x2eac))
        return 0;

    mode = *(u32 *)((u8 *)func_020337d4(self->actor_84) + 0x2e84);
    if (mode == 1)
        target = ActorCollection_FindActorByDescriptorValue(func_02007f0c(runtime, 2), index);
    else if (mode == 2)
        target = ActorCollection_FindActorByDescriptorValue(func_02007f0c(runtime, 1), index);
    else {
        OS_Halt();
        target = 0; /* OS_Halt does not return; this only makes the C flow explicit. */
    }

    if (*((u8 *)target + 0x4d) == 1) {
        u8 *collection = (u8 *)func_02007f0c(runtime, 1);
        target = *(void **)(collection + 0x2e7c);
        callActorValueMethod(target, 0x74, value);
        Actor_SetActive(target, 1);
    } else if (target == self->actor_84) {
        callActorValueMethod(target, 0x70, value);
    } else {
        if (value != 0) {
            if (func_0200b04c(data_02105310) &&
                *(void **)(data_02105310 + 4) == target)
                callActorValueMethod(target, 0x70, value);
            else
                callActorValueMethod(target, 0x74, value);
        }
        Actor_SetActive(target, 1);
    }

    func_020127f8(&self->base, 1);
    return 0;
}
