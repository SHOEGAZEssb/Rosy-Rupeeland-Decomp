#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Reconstruct the actor-script opcode that starts a timed or speed-based move. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02032d64(void *actor, fx32 x, fx32 y);
extern void *func_020066dc(void *self, const VecFx32Object *target,
                          const VecFx32Object *source, s32 duration);
extern void func_0200676c(void *destination, const void *source);
extern void func_02006788(void *self);
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
 * clears actor flag 1, pushes the chosen duration, and returns zero. The exact
 * semantic names of the movement modes and helper object remain unconfirmed.
 */
s32 func_020130ec(GamePhaseActorScriptVm *self)
{
    u32 useZ = func_02012704(&self->base);
    u32 mode = func_02012704(&self->base);
    s32 durationOrSpeed = (s32)func_02012704(&self->base);
    fx32 z = (s32)func_02012704(&self->base) << 12;
    fx32 y = (s32)func_02012704(&self->base) << 12;
    fx32 x = (s32)func_02012704(&self->base) << 12;
    u8 *actor = (u8 *)self->actor_84;
    VecFx32Object *position = (VecFx32Object *)(actor + 0x18);
    VecFx32Object target;
    fx32 dx = 0;
    fx32 dy = 0;
    fx32 dz = 0;
    s32 duration;
    u8 movement[0x34];

    func_02004fe0(&target);
    if (actor[0xe6] == 1) {
        if ((mode & 1) == 0)
            func_02032d64(actor, x, y);
        else
            func_02032d64(actor,
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
        target.value.x = position->value.x + x;
        target.value.y = position->value.y + y;
        target.value.z = useZ ? position->value.z + z : position->value.z;
        dx = x;
        dy = y;
        dz = z;
    } else {
        target.value.x = x;
        target.value.y = y;
        target.value.z = useZ ? z : position->value.z;
        dx = x - position->value.x;
        dy = y - position->value.y;
        dz = z - position->value.z;
    }

    if (mode < 4) {
        duration = durationOrSpeed;
    } else {
        fx32 distance = func_020adc40(
            squareFx32(dx) + squareFx32(dy) + squareFx32(dz));
        duration = func_020befec(distance, durationOrSpeed);
        if (duration <= 0)
            duration = 1;
    }

    *(u32 *)(actor + 0x10) |= 0x40;
    func_020066dc(movement, &target, position, duration);
    func_0200676c(actor + 0x198, movement);
    func_02006788(movement);
    *(u32 *)(actor + 0x10) &= ~1u;
    func_020127f8(&self->base, duration);
    if (*(s16 *)(actor + 0xe4) == 1 && *(void **)(actor + 0x54) != 0)
        *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) &= (u16)~0x20;
    func_02005058(&target);
    return 0;
}
