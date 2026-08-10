#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes for actor commands, flags, and completion polling. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern u8 data_02105310[];
extern void *Actor_GetCollection(void *actor);
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void ActorRuntimeCollection_SelectObject(void *state, void *actor, u32 value);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

typedef s32 (*ActorModeMethod)(void *actor, u32 mode, u32 value);
typedef void (*RuntimeDispatchMethod)(void *object, u32 first, u16 second,
                                     u32 third, u32 fourth);

/*
 * Pop a value and mode. Modes 1-3 call the bound actor's virtual method at
 * 0xac with that pair; mode 3 also registers the command in data_02105310 and
 * returns one to stop the VM loop. Other modes return zero without effects.
 */
s32 GamePhaseActorScriptVm_DispatchActorModeCommand(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    u32 mode = GamePhaseScriptVm_Pop(&self->base);
    ActorModeMethod method;
    if (mode < 1 || mode > 3)
        return 0;
    method = *(ActorModeMethod *)((u8 *)*(void **)self->actor + 0xac);
    method(self->actor, mode, value);
    if (mode == 3) {
        ActorRuntimeCollection_SelectObject(data_02105310, self->actor, value);
        return 1;
    }
    return 0;
}

/* Push whether bit 0 is set in the bound actor's word at offset 0x10. */
s32 GamePhaseActorScriptVm_IsActorFlag1Set(GamePhaseActorScriptVm *self)
{
    u32 flags = *(u32 *)((u8 *)self->actor + 0x10);
    GamePhaseScriptVm_SetResult(&self->base, (flags & 1) != 0);
    return 0;
}

/*
 * Pop four operands and inspect the actor collection's word at offset 0x2e84.
 * Value 1 dispatches the operands through virtual method 0x30 of the runtime
 * object at offset 0x2ed4 (the second operand is narrowed to u16); value 2
 * enters OS_Halt. Other values have no effect. Returns zero.
 */
s32 GamePhaseActorScriptVm_DispatchCollectionModeCommand(GamePhaseActorScriptVm *self)
{
    u32 fourth = GamePhaseScriptVm_Pop(&self->base);
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 fifth = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    u8 *collection = (u8 *)Actor_GetCollection(self->actor);
    u32 mode = *(u32 *)(collection + 0x2e84);

    if (mode == 1) {
        u8 *runtime = (u8 *)data_021052fc;
        void *object = *(void **)(runtime + 0x2ed4);
        RuntimeDispatchMethod method =
            *(RuntimeDispatchMethod *)((u8 *)*(void **)object + 0x30);
        method(object, fourth, (u16)second, first, fifth);
    } else if (mode == 2) {
        OS_Halt();
    }
    return 0;
}

/* Push the byte at actor->0x54->0x38 and return zero. */
s32 GamePhaseActorScriptVm_GetAttachmentByte38(GamePhaseActorScriptVm *self)
{
    u8 *object = *(u8 **)((u8 *)self->actor + 0x54);
    GamePhaseScriptVm_SetResult(&self->base, object[0x38]);
    return 0;
}

/*
 * Clear bit 1 in actor->0x54->0x24. If bit 0 remains set, return zero;
 * otherwise rewind the opcode by two bytes and return one, polling again on a
 * later VM update.
 */
s32 GamePhaseActorScriptVm_WaitForAttachmentFlag1Set(GamePhaseActorScriptVm *self)
{
    u16 *flags = (u16 *)(*(u8 **)((u8 *)self->actor + 0x54) + 0x24);
    *flags &= (u16)~2;
    if ((*flags & 1) != 0)
        return 0;
    self->base.cursor -= 2;
    return 1;
}

/* Pop a value, store its low halfword at actor->0x54->0x36, and return zero. */
s32 GamePhaseActorScriptVm_SetAttachmentHalfword36(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    u8 *object = *(u8 **)((u8 *)self->actor + 0x54);
    *(u16 *)(object + 0x36) = (u16)value;
    return 0;
}

/* Pop a boolean; clear actor flag bit 1 when true and set it when false. */
s32 GamePhaseActorScriptVm_SetActorFlag2Inverse(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    u32 *flags = (u32 *)((u8 *)self->actor + 0x14);
    if (value != 0)
        *flags &= ~2u;
    else
        *flags |= 2;
    return 0;
}

/* Pop a boolean; clear actor flag bit 2 when true and set it when false. */
s32 GamePhaseActorScriptVm_SetActorFlag4Inverse(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    u32 *flags = (u32 *)((u8 *)self->actor + 0x14);
    if (value != 0)
        *flags &= ~4u;
    else
        *flags |= 4;
    return 0;
}
