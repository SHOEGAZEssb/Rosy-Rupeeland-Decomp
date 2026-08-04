#include "tingle/actor_motion.h"

/* Area-index refresh and full state reset for the area-aware motion helper. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02056f00(VecFx32Object *result, const void *source);
extern s32 func_020116e8(void *context, s32 x, s32 y);
#ifdef __cplusplus
}
#endif

/*
 * Transform the bound actor vector at offset 0x18, query areaContext at its
 * integer X and Y-16 position, and store the returned area as previousArea.
 * Returns no value; only this helper changes and no hardware is touched.
 */
void func_0200a310(ActorMotionAreaFollower *self)
{
    VecFx32Object position;
    u8 *actor = (u8 *)self->jitter.base.actor;

    func_02056f00(&position, actor + 0x18);
    self->previousArea = func_020116e8(self->areaContext,
                                       position.value.x >> 12,
                                       (position.value.y >> 12) - 0x10);
    func_02005058(&position);
}

/*
 * Reset the base motion without replacing its vtable, clear jitter and
 * transition fields, assign a zero offset vector, and restore previousArea to
 * -1. Returns no value and affects no external or hardware state.
 */
void func_0200a35c(ActorMotionAreaFollower *self)
{
    VecFx32Object zero;

    func_020090c0(&self->jitter.base);
    self->jitter.remainingFrames = 0;
    self->jitter.radius = 0;
    func_0200500c(&zero, 0, 0, 0);
    func_020050a4(&self->offset, &zero);
    func_02005058(&zero);
    self->transitionActive = 0;
    self->transitionTimer = 0;
    self->previousArea = -1;
}
