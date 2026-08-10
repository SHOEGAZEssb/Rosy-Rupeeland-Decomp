#include "tingle/types.h"

/* Provide follow-up separation force and gated table-record interaction dispatch. */
extern u8 data_02105310[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0204cfa4(s32 x, s32 y);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern void func_0204cff4(s32 *x, s32 *y, s32 limit);
extern s32 func_0200b04c(void *state);
extern void ActorTableRecord_ApplyCollisionResponse(void *self, void *other,
                                                    s32 directionalMode,
                                                    s32 scale);
extern void func_02032a94(void *self, void *other, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Compute target-minus-actor X/Y displacement. Below distance 0x1000 use a
 * horizontal +/-0x1000 impulse selected by signed byte +0x48 and zero Y;
 * otherwise divide both components by twice their distance. Add the resulting
 * impulse to target motion +0x8c/+0x90, then clamp that pair to 0x6000 through
 * func_0204cff4. Returns no value; math and clamp helpers mutate target motion.
 */
void ActorTableRecord_ApplySeparationImpulse(void *self, void *targetObject)
{
    u8 *actor = (u8 *)self;
    u8 *target = (u8 *)targetObject;
    s32 x = *(s32 *)(target + 0x1c) - *(s32 *)(actor + 0x1c);
    s32 y = *(s32 *)(target + 0x20) - *(s32 *)(actor + 0x20);
    s32 distance = func_0204cfa4(x, y);
    if (distance < 0x1000) {
        x = *(s8 *)(target + 0x48) >= *(s8 *)(actor + 0x48)
                ? -0x1000 : 0x1000;
        y = 0;
    } else {
        x = func_020adc90(x, distance * 2);
        y = func_020adc90(y, distance * 2);
    }
    *(s32 *)(target + 0x8c) += x;
    *(s32 *)(target + 0x90) += y;
    func_0204cff4((s32 *)(target + 0x8c), (s32 *)(target + 0x90), 0x6000);
}

/*
 * When func_0200b04c(data_02105310) returns zero, dispatch the table-record
 * response with directional mode one and scale 0x1000. Always forward self,
 * other, and mode to func_02032a94 afterward. Returns no value; state query,
 * interaction, and base callback calls have observable actor state.
 */
void ActorTableRecord_HandlePairActive(void *self, void *other, s32 mode)
{
    if (func_0200b04c(data_02105310) == 0)
        ActorTableRecord_ApplyCollisionResponse(self, other, 1, 0x1000);
    func_02032a94(self, other, mode);
}
