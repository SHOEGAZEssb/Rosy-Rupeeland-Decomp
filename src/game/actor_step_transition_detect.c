#include "tingle/actor.h"

/* Detect and begin a short actor step/height transition from contact motion. */
#ifdef __cplusplus
extern "C" {
#endif
extern u32 Actor_QueryTerrainCell(Actor *self, s32 gridX, s32 gridY);
extern s32 Actor_QueryTerrainHeight(Actor *self, s32 gridX, s32 gridY);
extern void Actor_SaveAndForceFlags(Actor *self);
extern s32 func_020adae4(s32, s32);
#ifdef __cplusplus
}
#endif

static s32 terrainCodeBlocksStep(u32 terrain)
{
    u32 code = (terrain >> 5) & 0x1f;
    return code == 7 || code == 6 || code == 16 || code == 17 ||
           code == 18 || code == 20;
}

/*
 * Require current Z to equal cached terrain height and a low contact bit in
 * either pair-state byte. Probe 20 motion units ahead, reject recovered terrain
 * codes, and accept a positive height rise of at most 16 units (32 with motion
 * flag 0x400000), provided the eight-unit midpoint also stays within that
 * limit. On success store the target position, save/force actor flags, configure
 * the transition with the rise, derive per-frame X/Y deltas as motion*20/24,
 * clear vertical velocity, and return one. Return zero without transition
 * otherwise. Terrain helpers observe world state but no direct hardware is
 * accessed.
 */
s32 Actor_TryStartStepUpTransition(Actor *self)
{
    s32 baseline = self->cachedTerrainHeight;
    s32 targetX;
    s32 targetY;
    s32 targetHeight;
    s32 rise;
    s32 limit;
    u32 terrain;

    if (self->position.value.z != baseline ||
        !((self->pairStateBytes[0] | self->pairStateBytes[1]) & 0x0f))
        return 0;
    targetX = self->position.value.x + self->velocity.value.x * 20;
    targetY = self->position.value.y + self->velocity.value.y * 20;
    terrain = Actor_QueryTerrainCell(self, targetX >> 16, targetY >> 16);
    if (terrainCodeBlocksStep(terrain))
        return 0;
    targetHeight =
        Actor_QueryTerrainHeight(self, targetX >> 16, targetY >> 16) << 4;
    rise = targetHeight - (baseline >> 12);
    limit = (self->motionFlags & 0x400000) ? 32 : 16;
    if (rise <= 0 || rise > limit)
        return 0;
    if ((Actor_QueryTerrainHeight(
             self,
             (self->position.value.x + self->velocity.value.x * 8) >> 16,
             (self->position.value.y + self->velocity.value.y * 8) >> 16)
         << 4) - (baseline >> 12) > limit)
        return 0;
    self->positionTransitionTarget.value.x = targetX;
    self->positionTransitionTarget.value.y = targetY;
    self->positionTransitionTarget.value.z = targetHeight << 12;
    Actor_SaveAndForceFlags(self);
    self->vtable->configurePositionTransition(self, rise);
    self->positionTransitionDeltaX = func_020adae4(
        self->velocity.value.x * 20, ACTOR_POSITION_TRANSITION_DEFAULT_FRAMES);
    self->positionTransitionDeltaY = func_020adae4(
        self->velocity.value.y * 20, ACTOR_POSITION_TRANSITION_DEFAULT_FRAMES);
    self->velocity.value.z = 0;
    return 1;
}
