#include "tingle/types.h"

/* Advance derived actor track motion, auxiliary motion, height correction, and virtual frame work. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SetRuntimeFlag80(void *actor);
extern s32 func_02034164(void *actor);
extern void *VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Destroy(void *vector);
extern void VecFx32Object_Add(void *destination, const void *delta);
extern void VecFx32Stepper_Update(void *track);
extern void *VecFx32Stepper_GetStep(void *track);
extern s32 VecFx32Stepper_IsComplete(void *track);
extern void *VecFx32Stepper_GetTarget(void *track);
extern void Actor_UpdateTerrainMotionFeedback(void *actor);
#ifdef __cplusplus
}
#endif

/* Clear vector at the supplied actor offset through the recovered temporary-vector lifecycle. */
static void clearActorVector(u8 *actor, u32 offset)
{
    s32 zero[4];
    VecFx32Object_InitComponents(zero, 0, 0, 0);
    VecFx32Object_Assign(actor + offset, zero);
    VecFx32Object_Destroy(zero);
}

/*
 * Run base frame helper Actor_SetRuntimeFlag80 and return early when func_02034164 says
 * the actor is inactive. Copy position +0x18 to +0x28. While +0x10 bit 0x40
 * permits track processing (with the recovered bit-one/+0x14 bit-0x10 gate),
 * advance track +0x198 and copy sampled components +4/+8/+0xc to motion
 * +0x3c/+0x40/+0x44, retaining Z when +0x10 bit 0x400 is set. A completed
 * track clears bit 0x40 and motion +0x38, then copies its terminal vector to
 * +0x28 and +0x18. An incomplete track can instead be cancelled when byte
 * +0x4b or virtual +0xa0 is true and +0x14 bit 0x40000000 is set.
 *
 * Invoke Actor_UpdateTerrainMotionFeedback for +0x14 bit 0x100000, add motion +0x38 to position,
 * and process the +0x10 bit-0x400 height correction unless +0x14 bit 0x40 is
 * set. Above floor +0x1dc, subtract virtual +0xb0 from vertical motion +0x44;
 * at or below it, clamp a strictly lower height, clear +0x14 bit 0x20000000,
 * clear correction bit 0x400, and zero +0x44. Finish with virtual +0x20.
 * Returns no value; track, vector, correction, and virtual calls mutate actor
 * and presentation state.
 */
void ActorDerivedRuntime_UpdateFrame(void *self)
{
    u8 *actor = (u8 *)self;
    Actor_SetRuntimeFlag80(actor);
    if (func_02034164(actor) == 0)
        return;
    VecFx32Object_Assign(actor + 0x28, actor + 0x18);

    if ((*(u32 *)(actor + 0x10) & 0x40) != 0 &&
        ((*(u32 *)(actor + 0x10) & 1) == 0 ||
         (*(u32 *)(actor + 0x14) & 0x10) != 0)) {
        u8 *sample;
        VecFx32Stepper_Update(actor + 0x198);
        sample = (u8 *)VecFx32Stepper_GetStep(actor + 0x198);
        *(s32 *)(actor + 0x3c) = *(s32 *)(sample + 4);
        sample = (u8 *)VecFx32Stepper_GetStep(actor + 0x198);
        *(s32 *)(actor + 0x40) = *(s32 *)(sample + 8);
        if ((*(u32 *)(actor + 0x10) & 0x400) == 0) {
            sample = (u8 *)VecFx32Stepper_GetStep(actor + 0x198);
            *(s32 *)(actor + 0x44) = *(s32 *)(sample + 0x0c);
        }
        if (VecFx32Stepper_IsComplete(actor + 0x198) != 0) {
            void *terminal;
            *(u32 *)(actor + 0x10) &= ~0x40;
            clearActorVector(actor, 0x38);
            terminal = VecFx32Stepper_GetTarget(actor + 0x198);
            VecFx32Object_Assign(actor + 0x28, terminal);
            VecFx32Object_Assign(actor + 0x18, actor + 0x28);
        } else {
            s32 cancel = actor[0x4b] != 0;
            if (!cancel)
                cancel = (*(s32 (**)(void *))(*(u8 **)actor + 0xa0))(actor);
            if (cancel && (*(u32 *)(actor + 0x14) & 0x40000000) != 0) {
                *(u32 *)(actor + 0x10) &= ~0x40;
                clearActorVector(actor, 0x38);
            }
        }
    }
    if ((*(u32 *)(actor + 0x14) & 0x100000) != 0)
        Actor_UpdateTerrainMotionFeedback(actor);
    VecFx32Object_Add(actor + 0x18, actor + 0x38);
    if ((*(u32 *)(actor + 0x14) & 0x40) == 0 &&
        (*(u32 *)(actor + 0x10) & 0x400) != 0) {
        s32 floor = *(s32 *)(actor + 0x1dc);
        if (*(s32 *)(actor + 0x24) > floor) {
            s32 delta = (*(s32 (**)(void *))(*(u8 **)actor + 0xb0))(actor);
            *(s32 *)(actor + 0x44) -= delta;
        } else {
            if (*(s32 *)(actor + 0x24) < floor) {
                *(s32 *)(actor + 0x24) = floor;
                *(u32 *)(actor + 0x14) &= ~0x20000000;
            }
            *(u32 *)(actor + 0x10) &= ~0x400;
            *(s32 *)(actor + 0x44) = 0;
        }
    }
    (*(void (**)(void *))(*(u8 **)actor + 0x20))(actor);
}
