#include "tingle/types.h"

/* Probe predicted ground contact, manage its cooldown, and derive escape motion. */
extern u8 gActorRuntimeFlags[];
extern void *gGameWork;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorRuntimeFlags_Test(void *state, s32 index);
extern s32 Actor_QueryTerrainHeight(void *actor, s32 x, s32 y);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern u32 Actor_QueryTerrainCell(void *actor, s32 x, s32 y);
extern s32 Actor_IsTerrainCellEligibleAtHeightOrOneBelow(
    void *actor, s32 gridX, s32 gridY, s32 referenceHeight);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void Sound_Play(void *context, s32 channel, s32 sound);
extern void VecFx32Object_Normalize(void *vector);
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void Actor_ApplyTerrainNeighborRepulsion(void *actor, void *position);
#ifdef __cplusplus
}
#endif

/* Clear recovered contact countdown +0x204 and flag +0xd0 bit 0x40. */
static void clearContactCountdown(u8 *actor)
{
    *(u16 *)(actor + 0x204) = 0;
    *(u32 *)(actor + 0xd0) &= ~0x40;
}

/* Return whether actor subtype byte +0x4d is one. */
static s32 isTypeOne(const u8 *actor)
{
    return actor[0x4d] == 1;
}

/*
 * Return immediately for actor +0x14 bit two, global state query
 * ActorRuntimeFlags_Test(gActorRuntimeFlags,1), or +0xd0 bit 0x80000. Bit 0x10000 selects
 * the landing-release path: probe terrain at position plus all primary and
 * secondary motion; once actor Z +0x24 is not above it, clear bit 0x10000 only
 * when bit 0x10 is clear and Z equals floor +0x1dc.
 *
 * The normal path is disabled by +0xd0 bit 0x10. Otherwise predict X/Y from
 * position +0x1c/+0x20 and motion +0x3c/+0x40, +0x8c/+0x90, +0x9c/+0xa0.
 * If terrain height equals Actor_GetCachedTerrainHeight, clear countdown
 * +0x204 and flag 0x40. For differing terrain, decode class bits 5..9 and
 * subtype bits 10..13 from Actor_QueryTerrainCell. Classes 6,16,20,17 are a
 * confirmed special set for type-one actors; classes 8..13 and class 7
 * participate in the recovered floor gates.
 * Countdown duration is 12 with GameWork flag 0x12, otherwise 48.
 *
 * Qualifying type-one actors without GameWork flag 0x25d, actor +0x230 bit
 * 0x800, or an existing countdown probe four forward samples with the
 * one-below eligibility predicate. If all four are rejected, optionally play
 * cue 0x43, set timer +0x2a2 to eight, and skip the neighborhood response.
 * Otherwise probe surrounding 3x3 offsets, excluding the center and offsets
 * that quantize back to its cell, accumulate -0x18000 X/Y impulses for
 * rejected cells into +0x9c/+0xa0, clear +0xa4, and normalize vector +0x98
 * when nonzero.
 *
 * Install/decrement countdown +0x204. While nonzero set +0xd0 bit 0x40 and,
 * for type one, clear +0x230 bit 0x10000. On expiry clear bit 0x40; qualifying
 * type-one actors with nonzero +0x2a2 set +0xd0 bit 0x10000, copy position
 * +0x28, apply terrain-neighbor repulsion, and retain the adjusted position at
 * +0x284. Returns no value. Terrain, GameWork, sound, vector, and transform
 * calls have observable engine or SDK effects. Raw terrain-class meanings
 * remain intentionally unnamed.
 */
void Actor_UpdateGroundContactProbe(void *self)
{
    u8 *actor = (u8 *)self;
    u32 flags;
    s32 totalX;
    s32 totalY;
    s32 predictedX;
    s32 predictedY;
    s32 terrainHeightFx32;
    s32 cachedTerrainHeightFx32;
    u32 packedCell;
    u32 terrainClass;
    u32 terrainSubtype;
    s32 class8Through13;
    s32 isClass7;
    s32 isSpecialTerrainClass;
    u16 duration;

    if ((*(u32 *)(actor + 0x14) & 2) != 0 ||
        ActorRuntimeFlags_Test(gActorRuntimeFlags, 1) != 0)
        return;
    flags = *(u32 *)(actor + 0xd0);
    if ((flags & 0x80000) != 0)
        return;
    if ((flags & 0x10000) != 0) {
        predictedX = *(s32 *)(actor + 0x1c) + *(s32 *)(actor + 0x3c) +
                     *(s32 *)(actor + 0x8c) + *(s32 *)(actor + 0x9c);
        predictedY = *(s32 *)(actor + 0x20) + *(s32 *)(actor + 0x40) +
                     *(s32 *)(actor + 0x90) + *(s32 *)(actor + 0xa0);
        terrainHeightFx32 =
            Actor_QueryTerrainHeight(actor, predictedX >> 16,
                                     predictedY >> 16) << 16;
        if (*(s32 *)(actor + 0x24) <= terrainHeightFx32 &&
            (*(u32 *)(actor + 0xd0) & 0x10) == 0 &&
            *(s32 *)(actor + 0x24) == *(s32 *)(actor + 0x1dc))
            *(u32 *)(actor + 0xd0) &= ~0x10000;
        return;
    }
    if ((flags & 0x10) != 0) {
        *(u32 *)(actor + 0xd0) &= ~0x40;
        return;
    }

    totalX = *(s32 *)(actor + 0x3c) + *(s32 *)(actor + 0x8c) +
             *(s32 *)(actor + 0x9c);
    totalY = *(s32 *)(actor + 0x40) + *(s32 *)(actor + 0x90) +
             *(s32 *)(actor + 0xa0);
    predictedX = *(s32 *)(actor + 0x1c) + totalX;
    predictedY = *(s32 *)(actor + 0x20) + totalY;
    terrainHeightFx32 =
        Actor_QueryTerrainHeight(actor, predictedX >> 16, predictedY >> 16)
        << 16;
    cachedTerrainHeightFx32 = Actor_GetCachedTerrainHeight(actor);
    if (terrainHeightFx32 == cachedTerrainHeightFx32) {
        clearContactCountdown(actor);
        return;
    }

    packedCell = Actor_QueryTerrainCell(
        actor, predictedX >> 16, predictedY >> 16);
    terrainClass = (packedCell >> 5) & 0x1f;
    terrainSubtype = (packedCell >> 10) & 0x0f;
    class8Through13 = terrainClass >= 8 && terrainClass <= 13;
    isClass7 = terrainClass == 7;
    isSpecialTerrainClass = isTypeOne(actor) &&
        (terrainClass == 6 || terrainClass == 16 || terrainClass == 20 ||
         terrainClass == 17);
    duration = GameWork_TestFlag(gGameWork, 0x12) ? 12 : 48;

    if (terrainSubtype != 1) {
        s32 baselineTerrainHeightFx32 = *(s32 *)(actor + 0x1dc);
        s32 actorZFx32 = *(s32 *)(actor + 0x24);
        if (actorZFx32 != baselineTerrainHeightFx32 ||
            !((baselineTerrainHeightFx32 > terrainHeightFx32 + 0x10000 ||
               baselineTerrainHeightFx32 < terrainHeightFx32 ||
               (isClass7 &&
                terrainHeightFx32 == baselineTerrainHeightFx32)) &&
              !class8Through13)) {
            clearContactCountdown(actor);
            return;
        }
    }

    if (isSpecialTerrainClass && *(u16 *)(actor + 0x204) != 0)
        goto updateCountdown;

    if (isTypeOne(actor) && GameWork_TestFlag(gGameWork, 0x25d) == 0 &&
        *(u16 *)(actor + 0x204) == 0 &&
        (*(u32 *)(actor + 0x230) & 0x800) == 0 &&
        isSpecialTerrainClass) {
        s32 eligibleForwardSampleCount = 4;
        s32 i;
        s32 referenceHeight = Actor_GetCachedTerrainHeight(actor) >> 16;
        for (i = 0; i < 4; ++i) {
            s32 lookaheadMultiplier = i * 9 + 8;
            if (Actor_IsTerrainCellEligibleAtHeightOrOneBelow(actor,
                    (predictedX + totalX * lookaheadMultiplier) >> 16,
                    (predictedY + totalY * lookaheadMultiplier) >> 16,
                    referenceHeight) == 0)
                --eligibleForwardSampleCount;
        }
        if (eligibleForwardSampleCount == 0) {
            if (*(u16 *)(actor + 0x2a2) == 0 &&
                *(s32 *)(actor + 0x1dc) < terrainHeightFx32 + 0x40000)
                Sound_Play(gSoundContext, 0, 0x43);
            *(u16 *)(actor + 0x2a2) = 8;
        } else {
            s32 impulseX = 0;
            s32 impulseY = 0;
            s32 centerX = *(s32 *)(actor + 0x1c) >> 16;
            s32 centerY = *(s32 *)(actor + 0x20) >> 16;
            s32 x;
            s32 y;
            for (x = -1; x <= 1; ++x) {
                for (y = -1; y <= 1; ++y) {
                    if ((x != 0 || y != 0) &&
                        (centerX != (*(s32 *)(actor + 0x1c) +
                                     x * 17 * 0x1000) >> 16 ||
                         centerY != (*(s32 *)(actor + 0x20) +
                                     y * 0x7000) >> 16) &&
                        Actor_IsTerrainCellEligibleAtHeightOrOneBelow(actor,
                            (*(s32 *)(actor + 0x1c) + x * 17 * 0x1000) >> 16,
                            (*(s32 *)(actor + 0x20) + y * 0x7000) >> 16,
                            referenceHeight) == 0) {
                        impulseX += x * -0x18000;
                        impulseY += y * -0x18000;
                    }
                }
            }
            *(s32 *)(actor + 0x9c) = impulseX;
            *(s32 *)(actor + 0xa0) = impulseY;
            *(s32 *)(actor + 0xa4) = 0;
            if (impulseX != 0 || impulseY != 0)
                VecFx32Object_Normalize(actor + 0x98);
        }
    }
    *(u16 *)(actor + 0x204) = duration;

updateCountdown:
    if (*(u16 *)(actor + 0x204) != 0) {
        --*(u16 *)(actor + 0x204);
        if (*(u16 *)(actor + 0x204) != 0) {
            *(u32 *)(actor + 0xd0) |= 0x40;
            if (isTypeOne(actor))
                *(u32 *)(actor + 0x230) &= ~0x10000;
            return;
        }
        *(u32 *)(actor + 0xd0) &= ~0x40;
        if (isSpecialTerrainClass && isTypeOne(actor) &&
            *(u16 *)(actor + 0x2a2) != 0) {
            s32 terrainAdjustedPosition[4];
            *(u32 *)(actor + 0xd0) |= 0x10000;
            VecFx32Object_InitCopy(terrainAdjustedPosition, actor + 0x28);
            Actor_ApplyTerrainNeighborRepulsion(
                actor, terrainAdjustedPosition);
            VecFx32Object_Assign(actor + 0x284, terrainAdjustedPosition);
            VecFx32Object_Destroy(terrainAdjustedPosition);
        }
    } else {
        *(u32 *)(actor + 0xd0) &= ~0x40;
    }
}
