#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Reconstruct the actor-script opcode that starts a timed or speed-based move. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_UpdateAttachmentDirectionFromVector(void *actor, fx32 x, fx32 y);
extern void *VecFx32Stepper_InitTransition(void *self, const VecFx32Object *target,
                          const VecFx32Object *source, s32 duration);
extern void VecFx32Stepper_Assign(void *destination, const void *source);
extern void VecFx32Stepper_Destroy(void *self);
extern fx32 func_020adc40(fx32 value);
extern fx32 func_020befec(fx32 numerator, fx32 denominator);
#ifdef __cplusplus
}
#endif

/* Fixed-point square used only to explain the retail distance calculation. */
static fx32 squareFx32(fx32 value)
{
    return (fx32)(((s64)value * value + 0x800) >> 12);
}

/*
 * Pop use-Z, movement mode, duration/speed, and z/y/x coordinates. Modes
 * 0/2/4/6 treat x and y as actor-relative; modes 1/3/5/7 treat them as
 * absolute. A zero use-Z operand preserves the current z coordinate. Modes
 * 0-3 use the popped duration directly, while modes 4-7 derive a duration from
 * three-dimensional distance divided by the popped speed and clamp it to at
 * least one.
 *
 * For actors whose byte at 0xe6 is 1, the opcode also updates facing from the
 * horizontal displacement and normalizes flags at actor->0x54. It then sets
 * actor flag 0x40, constructs/copies a movement object into offset 0x198,
 * clears actor flag 1, stores the chosen duration as the VM result, and returns zero. The exact
 * semantic names of the movement modes and helper object remain unconfirmed.
 */
s32 GamePhaseActorScriptVm_StartMovement(GamePhaseActorScriptVm *self)
{
    u32 useZCoordinate = GamePhaseScriptVm_Pop(&self->base);
    u32 mode = GamePhaseScriptVm_Pop(&self->base);
    s32 durationOrSpeed = (s32)GamePhaseScriptVm_Pop(&self->base);
    fx32 z = (s32)GamePhaseScriptVm_Pop(&self->base) << 12;
    fx32 y = (s32)GamePhaseScriptVm_Pop(&self->base) << 12;
    fx32 x = (s32)GamePhaseScriptVm_Pop(&self->base) << 12;
    u8 *actor = (u8 *)self->actor;
    VecFx32Object *position = (VecFx32Object *)(actor + 0x18);
    VecFx32Object targetPosition;
    fx32 displacementX = 0;
    fx32 displacementY = 0;
    fx32 displacementZ = 0;
    s32 duration;
    u8 movementStepper[0x34];

    VecFx32Object_Init(&targetPosition);
    if (actor[0xe6] == 1) {
        if ((mode & 1) == 0)
            Actor_UpdateAttachmentDirectionFromVector(actor, x, y);
        else
            Actor_UpdateAttachmentDirectionFromVector(actor,
                          x - position->value.x,
                          y - position->value.y);
        {
            u16 *flags = (u16 *)(*(u8 **)(actor + 0x54) + 0x24);
            *flags |= 2;
            *flags &= (u16)~0x20;
            *flags &= (u16)~1;
            if (*(s16 *)(*(u8 **)(actor + 0x54) + 0x36) == 0)
                *(u16 *)(*(u8 **)(actor + 0x54) + 0x36) = 0x100;
        }
    }

    if ((mode & 1) == 0) {
        targetPosition.value.x = position->value.x + x;
        targetPosition.value.y = position->value.y + y;
        targetPosition.value.z = useZCoordinate ? position->value.z + z : position->value.z;
        displacementX = x;
        displacementY = y;
        displacementZ = z;
    } else {
        targetPosition.value.x = x;
        targetPosition.value.y = y;
        targetPosition.value.z = useZCoordinate ? z : position->value.z;
        displacementX = x - position->value.x;
        displacementY = y - position->value.y;
        displacementZ = z - position->value.z;
    }

    if (mode < 4) {
        duration = durationOrSpeed;
    } else {
        fx32 distance = func_020adc40(
            squareFx32(displacementX) + squareFx32(displacementY) +
            squareFx32(displacementZ));
        duration = func_020befec(distance, durationOrSpeed);
        if (duration <= 0)
            duration = 1;
    }

    *(u32 *)(actor + 0x10) |= 0x40;
    VecFx32Stepper_InitTransition(movementStepper, &targetPosition, position, duration);
    VecFx32Stepper_Assign(actor + 0x198, movementStepper);
    VecFx32Stepper_Destroy(movementStepper);
    *(u32 *)(actor + 0x10) &= ~1u;
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, duration);
    if (*(s16 *)(actor + 0xe4) == 1 && *(void **)(actor + 0x54) != 0)
        *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) &= (u16)~0x20;
    VecFx32Object_Destroy(&targetPosition);
    return 0;
}
