#include "tingle/actor_motion.h"
#include "tingle/game_phase_region_table.h"

/* Area-index refresh and full state reset for the area-aware motion helper. */

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitPlanarProjection(VecFx32Object *result,
                                               const void *source);
#ifdef __cplusplus
}
#endif

/*
 * Transform the bound actor vector at offset 0x18, query areaContext at its
 * integer X and Y-16 position, and store the returned current area index.
 * Returns no value; only this helper changes and no hardware is touched.
 */
void ActorMotionAreaFollower_RefreshCurrentArea(ActorMotionAreaFollower *self)
{
    VecFx32Object position;
    u8 *actor = (u8 *)self->jitter.base.actor;

    VecFx32Object_InitPlanarProjection(&position, actor + 0x18);
    self->currentAreaIndex = GamePhaseRegionTable_FindContainingRegion(self->areaContext,
                                       position.value.x >> 12,
                                       (position.value.y >> 12) - 0x10);
    VecFx32Object_Destroy(&position);
}

/*
 * Reset the base motion without replacing its vtable, clear jitter and
 * smoothing fields, assign a zero smoothed-position vector, and restore the
 * current-area index to -1. Returns no value and affects no external or
 * hardware state.
 */
void ActorMotionAreaFollower_Reset(ActorMotionAreaFollower *self)
{
    VecFx32Object zero;

    ActorMotion_Reset(&self->jitter.base);
    self->jitter.remainingFrames = 0;
    self->jitter.radius = 0;
    VecFx32Object_InitComponents(&zero, 0, 0, 0);
    VecFx32Object_Assign(&self->smoothedPosition, &zero);
    VecFx32Object_Destroy(&zero);
    self->smoothingActive = 0;
    self->smoothingWeight = 0;
    self->currentAreaIndex = -1;
}
