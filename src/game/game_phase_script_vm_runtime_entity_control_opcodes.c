#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/*
 * Control the active game-phase runtime entity and expose one bound-actor
 * state operation.  The large dispatcher retains offset-based entity fields
 * until their owning type and individual mode meanings are confirmed.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern const u8 data_020ea9b0[];
extern s32 data_020e1964;
extern void *Actor_GetInteractionIcon(void *actor);
extern void ActorInteractionIcon_SetDirection(void *icon, s32 direction);
extern void Type7Actor_SetMotionTargetWithTimer(void *entity, const VecFx32Object *position,
                          s32 angle);
extern void Type7Actor_ResetMotionAndCooldown(void *entity);
extern void Type7Actor_ClearTarget(void *entity);
extern void Type7Actor_DisableTargeting(void *entity);
extern void Type7Actor_SetFlag40StateEnabled(void *entity, s32 value);
extern void Type7Actor_SetActorEnabled(void *entity, s32 value);
extern void Type7Actor_ConfigureAttachmentController(void *entity, s32 value);
extern void Type7Actor_StartAnimation19Interaction(void *entity, u16 value, s32 enabled);
extern void Type7Actor_SpawnFromRecord(s32 first, void *owner, s32 second, s32 third,
                          s32 fourth);
#ifdef __cplusplus
}
#endif

/*
 * Pop one direction, resolve the bound actor's interaction icon, map the low
 * two bits to quarter-turn angle units, and return zero. Retail requires the
 * icon pointer to be non-null.
 */
s32 GamePhaseActorScriptVm_SetInteractionIconDirection(GamePhaseActorScriptVm *self)
{
    s32 direction = (s32)GamePhaseScriptVm_Pop(&self->base);
    ActorInteractionIcon_SetDirection(Actor_GetInteractionIcon(self->actor),
                                      direction);
    return 0;
}

/*
 * Pop fourth, third, second, first, and command operands.  Dispatch commands
 * 0..15 against the active runtime entity at runtime offset 0x2ea8.  Commands
 * include creation, recovered state calls, an fx32 position update, flag and
 * field writes, a 36-entry table lookup whose result is pushed to the VM, and
 * global fallback-state clearing when no entity exists.  Missing entities and
 * unsupported commands do nothing unless the recovered case explicitly
 * updates the fallback state.  Return zero.
 */
s32 GamePhaseActorScriptVm_DispatchActiveType7ActorCommand(GamePhaseActorScriptVm *self)
{
    s32 fourth = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 third = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *runtime = (u8 *)data_021052fc;
    u8 *entity = *(u8 **)(runtime + 0x2ea8);

    switch (command) {
    case 0:
        Type7Actor_SpawnFromRecord(first, **(void ***)(runtime + 0x30bc),
                      second, third, fourth);
        break;
    case 1:
        if (entity)
            Type7Actor_ClearTarget(entity);
        break;
    case 2:
        break;
    case 3:
        if (entity)
            Type7Actor_SetFlag40StateEnabled(entity, first);
        break;
    case 4:
        if (entity)
            Type7Actor_StartAnimation19Interaction(entity, (u16)first, second != 0);
        break;
    case 5:
        if (entity) {
            VecFx32Object position;
            VecFx32Object_InitComponents(&position, first << 12, second << 12, third << 12);
            Type7Actor_SetMotionTargetWithTimer(entity, &position, 0xb4);
            VecFx32Object_Destroy(&position);
        }
        break;
    case 6:
        if (entity)
            Type7Actor_SetActorEnabled(entity, first);
        break;
    case 7:
        if (entity)
            Type7Actor_ConfigureAttachmentController(entity, first);
        break;
    case 8:
        if (entity) {
            u32 *flags = (u32 *)(entity + 0x268);
            if (first)
                *flags &= ~0x4000;
            else
                *flags |= 0x4000;
        }
        break;
    case 9: {
        s32 index;
        GamePhaseScriptVm_SetResult(&self->base, (u32)-1);
        for (index = 0; index < 36; index++) {
            const u8 *record = data_020ea9b0 + index * 0x68;
            if (*(const s16 *)record == first) {
                GamePhaseScriptVm_SetResult(&self->base, (u32)*(const s16 *)(record + 0x2e));
                break;
            }
        }
        break;
    }
    case 10:
        if (!entity && data_020e1964 != -1)
            data_020e1964 = -1;
        break;
    case 11:
        if (!entity)
            data_020e1964 = -1;
        else
            Type7Actor_DisableTargeting(entity);
        break;
    case 12:
        if (entity)
            *(u16 *)(entity + 0x2a6) = (u16)first;
        break;
    case 13:
        if (entity) {
            if (first) {
                *(u32 *)(entity + 0x14) |= 0x400;
                *(u32 *)(entity + 0xd0) |= 4;
            } else {
                *(u32 *)(entity + 0x14) &= ~0x400;
                *(u32 *)(entity + 0xd0) &= ~4;
            }
        }
        break;
    case 14:
        if (entity)
            *(s32 *)(entity + 0x1fc) = first;
        break;
    case 15:
        if (entity && (*(u32 *)(entity + 0x268) & 0x10))
            Type7Actor_ResetMotionAndCooldown(entity);
        break;
    }
    return 0;
}
