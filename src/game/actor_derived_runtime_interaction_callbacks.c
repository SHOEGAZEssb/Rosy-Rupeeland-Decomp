#include "tingle/scene_touch.h"
#include "tingle/types.h"

/* Forward touch points and process derived-actor contact/cancellation callbacks. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02031758(void *source);
extern void func_02031cac(void *actor, const TouchPoint *point);
extern void func_02032a94(void *actor, void *other, s32 mode);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void VecFx32Stepper_Reset(void *track);
extern s32 Actor_TryDispatchActivationMode2(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Pass source through func_02031758, copy its words +0x04/+0x08 into a stack
 * TouchPoint using gSceneTouchInitialData's point vtable, and forward that
 * point to actor through func_02031cac. Returns no value; both helpers can
 * mutate source/actor interaction state.
 */
void ActorDerivedRuntime_ForwardTouchPoint(void *source, void *actor)
{
    u8 *input = (u8 *)source;
    TouchPoint point;
    func_02031758(source);
    point.vtable = &gSceneTouchInitialData.pointVTable;
    point.x = *(u32 *)(input + 4);
    point.y = *(u32 *)(input + 8);
    func_02031cac(actor, &point);
}

/*
 * Invoke func_02032a94(self,other,mode). For mode zero, clear self motion
 * +0x38; if self +0x10 bit 0x40 and +0x14 bit 0x40000000 are set while other
 * +0x14 bit 0x10 is clear, also clear bit 0x40 and cancel track +0x198.
 * Finally, when other subtype byte +0x4d is one, its virtual +0xa8 returns
 * zero, mode is zero, and self +0x188 is nonnull, invoke Actor_TryDispatchActivationMode2(self).
 * Return one. Base contact, vector, track, virtual, and follow-up helpers have
 * observable actor state effects.
 */
s32 ActorDerivedRuntime_HandlePairActive(void *self, void *other, s32 mode)
{
    u8 *actor = (u8 *)self;
    u8 *target = (u8 *)other;
    func_02032a94(actor, target, mode);
    if (mode == 0) {
        s32 zero[4];
        VecFx32Object_InitComponents(zero, 0, 0, 0);
        VecFx32Object_Assign(actor + 0x38, zero);
        VecFx32Object_Destroy(zero);
        if ((*(u32 *)(actor + 0x10) & 0x40) != 0 &&
            (*(u32 *)(actor + 0x14) & 0x40000000) != 0 &&
            (*(u32 *)(target + 0x14) & 0x10) == 0) {
            *(u32 *)(actor + 0x10) &= ~0x40;
            VecFx32Stepper_Reset(actor + 0x198);
        }
    }
    if (target[0x4d] == 1 &&
        (*(s32 (**)(void *))(*(u8 **)target + 0xa8))(target) == 0 &&
        mode == 0 && *(void **)(actor + 0x188) != 0)
        Actor_TryDispatchActivationMode2(actor);
    return 1;
}
