#include "tingle/types.h"

/* Save actor flags, cache runtime values, and apply bounded motion impulses. */
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_RefreshCachedTerrainHeight(void *actor);
extern void Fx32Vector2_LimitMagnitude(s32 *x, s32 *y, s32 maximum);
extern void ActorRuntimeTriple_Assign(void *state, s32 first, s32 second, s32 third);
#ifdef __cplusplus
}
#endif

/*
 * On the first call, set marker 0x400 at actor+0xd0, save actor flags +0x14
 * into +0x0c, and force flag bits 1..3. Calls while marked are no-ops. Returns
 * no value and touches no hardware or SDK state.
 */
void Actor_SaveAndForceFlags(void *self)
{
    u8 *actor = (u8 *)self;

    if ((*(u32 *)(actor + 0xd0) & 0x400) != 0) return;
    *(u32 *)(actor + 0xd0) |= 0x400;
    *(u32 *)(actor + 0x0c) = *(u32 *)(actor + 0x14);
    *(u32 *)(actor + 0x14) |= 0x0e;
}

/*
 * If marker 0x400 at actor+0xd0 is set, clear it and restore flags +0x14 from
 * saved word +0x0c. Otherwise do nothing. Returns no value.
 */
void Actor_RestoreSavedFlags(void *self)
{
    u8 *actor = (u8 *)self;

    if ((*(u32 *)(actor + 0xd0) & 0x400) != 0) {
        *(u32 *)(actor + 0xd0) &= ~0x400;
        *(u32 *)(actor + 0x14) = *(u32 *)(actor + 0x0c);
    }
}

/* Store the actor's Q12 presentation scale at +0x1d0 and return no value. */
void Actor_SetScale(void *self, s32 scale)
{
    *(s32 *)((u8 *)self + 0x1d0) = scale;
}

/* Store the attachment's Q12 base X/Y scales at actor+0x1d4/+0x1d8. */
void Actor_SetAttachmentBaseScale(void *self, s32 scaleX, s32 scaleY)
{
    *(s32 *)((u8 *)self + 0x1d4) = scaleX;
    *(s32 *)((u8 *)self + 0x1d8) = scaleY;
}

/*
 * Refresh the signed FX32 Q20.12 terrain height cached at actor+0x1dc unless
 * actor flag 0x01000000 at +0x14 is set. A skipped refresh preserves both the
 * cached height and its related status flag. Returns no value; the refresh
 * helper reads global map state and no ownership is transferred.
 */
void Actor_RefreshCachedTerrainHeightIfEnabled(void *actorPointer)
{
    if ((*(u32 *)((u8 *)actorPointer + 0x14) & 0x01000000) == 0)
        Actor_RefreshCachedTerrainHeight(actorPointer);
}

/* Return actor+0x1dc's signed FX32 Q20.12 cached world height. */
s32 Actor_GetCachedTerrainHeight(void *actorPointer)
{
    return *(s32 *)((u8 *)actorPointer + 0x1dc);
}

/*
 * Return the signed FX32 gravity acceleration selected from GameWork halfword
 * +0x212 when actor flag 0x20000000 is set, or the primary halfword +0x210
 * otherwise. Consumers subtract this value from vertical velocity once per
 * update, so its units are world units per frame squared. No state, ownership,
 * timing source, or hardware is changed.
 */
s32 Actor_GetGravityAcceleration(void *actorPointer)
{
    u8 *actor = (u8 *)actorPointer;
    u8 *gameWork = (u8 *)gGameWork;

    return *(s16 *)(gameWork +
        ((*(u32 *)(actor + 0x14) & 0x20000000) != 0 ? 0x212 : 0x210));
}

/*
 * Apply vector X/Y words +4/+8 to actor motion +0x8c/+0x90, clamp that pair
 * to magnitude 0x6000, and pass vector Z at +0x0c to state object actor+0x38
 * with two zero arguments. If mark is nonzero, set flag 0x4000 at +0xd0.
 * Returns no value; the state and clamp helpers may update SDK-managed values.
 */
void Actor_ApplyMotionImpulse(void *self, const void *vector, s32 mark)
{
    u8 *actor = (u8 *)self;
    const u8 *values = (const u8 *)vector;

    *(s32 *)(actor + 0x8c) += *(s32 *)(values + 4);
    *(s32 *)(actor + 0x90) += *(s32 *)(values + 8);
    Fx32Vector2_LimitMagnitude((s32 *)(actor + 0x8c), (s32 *)(actor + 0x90), 0x6000);
    ActorRuntimeTriple_Assign(actor + 0x38, 0, 0, *(s32 *)(values + 0x0c));
    if (mark != 0) *(u32 *)(actor + 0xd0) |= 0x4000;
}
