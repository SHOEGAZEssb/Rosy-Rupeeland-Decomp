#include "tingle/game_phase_visual_effect.h"
#include "tingle/game_phase_runtime.h"

/* Track phase position and smoothly offset the BG1-backed visual effect. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 data_02105684[2];
extern void *data_021052fc;
#ifdef __cplusplus
}
#endif

static s32 quantizeComponent(s32 value)
{
    s32 sign = value >> 31;
    return (s32)(((u32)(value * 0x4000 + sign) >> 14) |
                 ((u32)sign << 18)) - sign;
}

/*
 * When resources and flags_94 bit 0 are active, maintain a smoothed offset in
 * vectors[2] using a 120-frame stepper toward an input-dependent target. The
 * target scale is 8 or 32 depending on the active actor's flag 0x10; runtime
 * flag 0x30cc bit 2 instead forces the smoothed vector to zero. Then derive
 * position - vectors[0], quantize x/y, store position in vectors[0], subtract
 * the smoothed offset, optionally halve all components for flags bit 2, and
 * accumulate the result into vectors[1].
 */
void func_0200fe0c(GamePhaseVisualEffect *self,
                   const VecFx32Object *position)
{
    VecFx32Object current;
    VecFx32Object temporary;
    GamePhaseRuntime *runtime = (GamePhaseRuntime *)data_021052fc;

    if (!self->resources.resource0 || !(self->flags_94 & 1))
        return;
    func_0200500c(&current, 0, 0, 0);
    if (!(*((u8 *)runtime + 0x30cc) & 4)) {
        void *area;
        u8 *actor;
        func_020050c8(&self->vectors[1], &self->vectors[3]);
        area = GamePhaseRuntime_GetActorCollection(runtime, 1);
        actor = *(u8 **)((u8 *)area + 0x2e7c);
        if (!(*(u32 *)(actor + 0xd0) & 0x10))
            func_0200500c(&temporary, data_02105684[0] * 8,
                          data_02105684[1] * -8, 0);
        else
            func_0200500c(&temporary, data_02105684[0] * 32,
                          data_02105684[1] * -32, 0);
        func_020050a4(&current, &temporary);
        func_02005058(&temporary);
        if (current.value.x != self->vectors[2].value.x ||
            current.value.y != self->vectors[2].value.y ||
            current.value.z != self->vectors[2].value.z) {
            VecFx32Stepper newStepper;
            VecFx32Stepper_InitTransition(&newStepper, &current, &self->vectors[2], 0x78);
            VecFx32Stepper_Assign(&self->stepper, &newStepper);
            VecFx32Stepper_Destroy(&newStepper);
        }
        VecFx32Stepper_Update(&self->stepper);
        func_020050a4(&self->vectors[2], VecFx32Stepper_GetCurrent(&self->stepper));
    } else {
        func_0200500c(&temporary, 0, 0, 0);
        func_020050a4(&self->vectors[2], &temporary);
        func_02005058(&temporary);
    }

    VecFx32_Subtract(&temporary, position, &self->vectors[0]);
    func_020050a4(&current, &temporary);
    func_02005058(&temporary);
    current.value.x = quantizeComponent(current.value.x);
    current.value.y = quantizeComponent(current.value.y);
    func_020050a4(&self->vectors[0], position);
    VecFx32_Subtract(&temporary, &current, &self->vectors[2]);
    func_020050a4(&current, &temporary);
    func_02005058(&temporary);
    if (self->flags_94 & 4) {
        current.value.x /= 2;
        current.value.y /= 2;
        current.value.z /= 2;
    }
    func_020050c8(&self->vectors[1], &current);
    func_02005058(&current);
}
