#include "tingle/game_phase_script_vm.h"

/* Implement script queries for actor status bit 0 at offset 0x169. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *Actor_GetCollection(void *actor);
extern void *func_02007f0c(void *runtime, s32 index);
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/* Push actor byte 0x169 bit 0 through the VM value stack. */
static void pushActorBit(GamePhaseActorScriptVm *self, const void *actor)
{
    func_020127f8(&self->base, *((const u8 *)actor + 0x169) & 1);
}

/*
 * Pop a selector. A nonzero selector resolves that indexed actor from the
 * bound collection. Zero instead selects the runtime collection-1 actor at
 * offset 0x2e7c when the bound collection's mode at 0x2e84 is 1, or follows
 * the runtime 0x2fb8 -> 0x2ebc pointers otherwise. Push selected actor byte
 * 0x169 bit 0 and return zero.
 */
s32 func_02013ac8(GamePhaseActorScriptVm *self)
{
    s32 selector = (s32)func_02012704(&self->base);
    u8 *actor;
    if (selector != 0) {
        actor = (u8 *)ActorCollection_FindActorByDescriptorValue(Actor_GetCollection(self->actor_84), selector);
    } else if (*(u32 *)((u8 *)Actor_GetCollection(self->actor_84) + 0x2e84) == 1) {
        u8 *collection = (u8 *)func_02007f0c(data_021052fc, 1);
        actor = *(u8 **)(collection + 0x2e7c);
    } else {
        u8 *owner = *(u8 **)((u8 *)data_021052fc + 0x2fb8);
        actor = *(u8 **)(owner + 0x2ebc);
    }
    pushActorBit(self, actor);
    return 0;
}

/*
 * Pop an index. If runtime pointers 0x24->0 and 0x2fb8->0x2eac->0 differ,
 * return zero immediately. Otherwise collection mode 1 resolves the index
 * from runtime collection 2, mode 2 from collection 1, and other modes halt.
 * Type-1 targets redirect to collection 1's actor at 0x2e7c. Push byte 0x169
 * bit 0 from the final target and return zero.
 */
s32 func_02013b74(GamePhaseActorScriptVm *self)
{
    s32 index = (s32)func_02012704(&self->base);
    u8 *runtime = (u8 *)data_021052fc;
    u8 *owner = *(u8 **)(runtime + 0x2fb8);
    void *first = **(void ***)(runtime + 0x24);
    void *second = **(void ***)(owner + 0x2eac);
    u32 mode;
    u8 *target;
    if (first != second)
        return 0;
    mode = *(u32 *)((u8 *)Actor_GetCollection(self->actor_84) + 0x2e84);
    if (mode == 1)
        target = (u8 *)ActorCollection_FindActorByDescriptorValue(func_02007f0c(runtime, 2), index);
    else if (mode == 2)
        target = (u8 *)ActorCollection_FindActorByDescriptorValue(func_02007f0c(runtime, 1), index);
    else {
        OS_Halt();
        target = 0;
    }
    if (target[0x4d] == 1) {
        u8 *collection = (u8 *)func_02007f0c(runtime, 1);
        target = *(u8 **)(collection + 0x2e7c);
    }
    pushActorBit(self, target);
    return 0;
}
