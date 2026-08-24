#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/*
 * Recovered type-seven boundary transition. It releases an optional attached
 * object, tests three sample queries along a requested map edge, relocates actor
 * vector
 * state, and enters the associated boundary-transition presentation state.
 */

extern void *gGameWork;
extern u8 *gGamePhaseRuntime;
extern const u32 data_020e17e8[2];

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void Heap_Free(void *allocation);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern s32 Actor_IsTerrainCellEligibleAtHeight(
    void *actor, s32 gridX, s32 gridY, s32 referenceHeight);
extern s32 Actor_ClassifyTerrainCellTransition(
    void *actor, s32 gridX, s32 gridY, s32 referenceHeight);
extern void ActorDerivedType1_SetSpecialModeEnabled(void *object, s32 value);
extern void Type7Actor_SetCallbackPair(void *actor, u32 value0, u32 value1, s32 index);
extern void AuxiliaryInteraction_Destroy(void *object);
extern void func_0206e590(void *object, s32 value);
extern s32 func_020adae4(s32 value, s32 divisor);
extern s32 SignedAbsoluteValueVariant(s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are a type-seven actor, a VecFx32Object destination, and a direction
 * index (zero through three correspond to the four map edges). First detach
 * and free optional object +0x234, clear game-work flag 0x3fd, and clear flag
 * +0xd0 bit 0x80. A boundary move is attempted only when +0x268 bit 0x10 is
 * set and bit 0x40000 is clear.
 *
 * The active edge is compared with map dimensions recovered through global
 * state +0x2ed4. Three sample offsets centered across that edge are queried: the center
 * uses exact-height eligibility and must be nonzero, while its two neighbors
 * accept transition classifications zero or one and reject only two. If all
 * three pass, actor vector fields +0x18, +0x28, and +0x284 are positioned at
 * the edge with a 0x20-world-unit inset (two terrain cells); otherwise they
 * are based on the supplied destination with a 0x30-world-unit clearance
 * (three terrain cells) derived from actor extents +0x68..+0x6e. The unexplained
 * fixed-point spacing 0xdfd7 is retained from the retail code.
 *
 * On a completed attempt, set +0x268 bits 0x4/0x80000, update +0x14, launch
 * the descriptor at data_020e17e8, clear a presentation flag through +0x54,
 * clear +0x246, and notify the global object at +0x2ea4. Finally clear +0x2a6
 * for every call. The function returns no value. It mutates actor, global
 * game-work, heap-owned attachment, collision/presentation, and vector state;
 * there are no direct hardware effects.
 */
void Type7Actor_ProcessBoundaryTransition(
    void *actorPointer, const VecFx32Object *destination, s32 direction)
{
    u8 *actor = (u8 *)actorPointer;
    void *attachment = *(void **)(actor + 0x234);

    if (attachment != 0) {
        func_0206e590(attachment, 0);
        attachment = *(void **)(actor + 0x234);
        if (attachment != 0) {
            AuxiliaryInteraction_Destroy(attachment);
            Heap_Free(attachment);
        }
        *(void **)(actor + 0x234) = 0;
        GameWork_ClearFlag(gGameWork, 0x3fd);
        *(u32 *)(actor + 0xd0) &= ~0x80;
    }

    if ((*(u32 *)(actor + 0x268) & 0x10) != 0
        && (*(u32 *)(actor + 0x268) & 0x40000) == 0) {
        u8 *terrainMap = *(u8 **)(gGamePhaseRuntime + 0x2ed4);
        u32 packedDimensions = *(u32 *)(terrainMap + 0x20);
        s32 rightWorldEdge = (s32)((packedDimensions & 0xffff) << 4);
        s32 bottomWorldEdge = (s32)(packedDimensions >> 16) << 4;
        s32 worldX = *(s32 *)(actor + 0x1c) >> 12;
        s32 worldY = *(s32 *)(actor + 0x20) >> 12;
        s32 halfWidthWorld = func_020adae4(
            (s16)(*(s16 *)(actor + 0x6c) - *(s16 *)(actor + 0x68)), 2);
        s32 referenceHeight = Actor_GetCachedTerrainHeight(actor) >> 16;
        s32 acceptedSampleCount = 0;
        s32 edgeAccepted = 0;
        s32 sampleOffset;

        if (direction == 0) {
            if (worldX - halfWidthWorld < 0x40) {
                for (sampleOffset = -1; sampleOffset <= 1; ++sampleOffset) {
                    s32 sampleGridY =
                        (*(s32 *)(actor + 0x20) + sampleOffset * 0x4000) >> 16;
                    s32 terrainSampleResult = sampleOffset == 0
                        ? Actor_IsTerrainCellEligibleAtHeight(
                            actor, 2, sampleGridY, referenceHeight)
                        : Actor_ClassifyTerrainCellTransition(
                            actor, 2, sampleGridY, referenceHeight);
                    if ((sampleOffset == 0 && terrainSampleResult != 0)
                        || (sampleOffset != 0 && terrainSampleResult <= 1))
                        ++acceptedSampleCount;
                }
                edgeAccepted = acceptedSampleCount == 3;
            }
        } else if (direction == 1) {
            if (worldX + halfWidthWorld > rightWorldEdge - 0x40) {
                s32 sampleGridX = func_020adae4(rightWorldEdge, 0x10) - 2;
                for (sampleOffset = -1; sampleOffset <= 1; ++sampleOffset) {
                    s32 sampleGridY =
                        (*(s32 *)(actor + 0x20) + sampleOffset * 0x4000) >> 16;
                    s32 terrainSampleResult = sampleOffset == 0
                        ? Actor_IsTerrainCellEligibleAtHeight(
                            actor, sampleGridX, sampleGridY, referenceHeight)
                        : Actor_ClassifyTerrainCellTransition(
                            actor, sampleGridX, sampleGridY, referenceHeight);
                    if ((sampleOffset == 0 && terrainSampleResult != 0)
                        || (sampleOffset != 0 && terrainSampleResult <= 1))
                        ++acceptedSampleCount;
                }
                edgeAccepted = acceptedSampleCount == 3;
            }
        } else if (direction == 2) {
            s32 edgeExtentWorld = SignedAbsoluteValueVariant(*(s16 *)(actor + 0x6a));
            if (worldY - edgeExtentWorld < 0x40) {
                for (sampleOffset = -1; sampleOffset <= 1; ++sampleOffset) {
                    s32 sampleGridX =
                        (*(s32 *)(actor + 0x1c) + sampleOffset * 0xdfd7) >> 16;
                    s32 terrainSampleResult = sampleOffset == 0
                        ? Actor_IsTerrainCellEligibleAtHeight(
                            actor, sampleGridX, 2, referenceHeight)
                        : Actor_ClassifyTerrainCellTransition(
                            actor, sampleGridX, 2, referenceHeight);
                    if ((sampleOffset == 0 && terrainSampleResult != 0)
                        || (sampleOffset != 0 && terrainSampleResult <= 1))
                        ++acceptedSampleCount;
                }
                edgeAccepted = acceptedSampleCount == 3;
            }
        } else {
            s32 edgeExtentWorld = SignedAbsoluteValueVariant(*(s16 *)(actor + 0x6e));
            if (worldY + edgeExtentWorld > bottomWorldEdge - 0x40) {
                s32 sampleGridY = func_020adae4(bottomWorldEdge, 0x10) - 2;
                for (sampleOffset = -1; sampleOffset <= 1; ++sampleOffset) {
                    s32 sampleGridX =
                        (*(s32 *)(actor + 0x1c) + sampleOffset * 0xdfd7) >> 16;
                    s32 terrainSampleResult = sampleOffset == 0
                        ? Actor_IsTerrainCellEligibleAtHeight(
                            actor, sampleGridX, sampleGridY, referenceHeight)
                        : Actor_ClassifyTerrainCellTransition(
                            actor, sampleGridX, sampleGridY, referenceHeight);
                    if ((sampleOffset == 0 && terrainSampleResult != 0)
                        || (sampleOffset != 0 && terrainSampleResult <= 1))
                        ++acceptedSampleCount;
                }
                edgeAccepted = acceptedSampleCount == 3;
            }
        }

        if (edgeAccepted) {
            VecFx32Object edgePosition;
            VecFx32Object currentPosition;
            VecFx32Object_Init(&edgePosition);
            VecFx32Object_InitCopy(&currentPosition,
                          (const VecFx32Object *)(actor + 0x18));
            VecFx32Object_Assign(&edgePosition,
                          (const VecFx32Object *)(actor + 0x18));

            if (direction == 0) {
                edgePosition.value.x = destination->value.x;
                currentPosition.value.x = destination->value.x
                    + (worldX - 0x20) * 0x1000;
            } else if (direction == 1) {
                edgePosition.value.x = destination->value.x;
                currentPosition.value.x = destination->value.x
                    - ((rightWorldEdge - 0x20) - worldX) * 0x1000;
            } else if (direction == 2) {
                edgePosition.value.y = destination->value.y;
                currentPosition.value.y = destination->value.y
                    + (worldY - 0x20) * 0x1000;
            } else {
                edgePosition.value.y = destination->value.y;
                currentPosition.value.y = destination->value.y
                    - ((bottomWorldEdge - 0x20) - worldY) * 0x1000;
            }

            VecFx32Object_Assign((VecFx32Object *)(actor + 0x28), &currentPosition);
            VecFx32Object_Assign((VecFx32Object *)(actor + 0x18),
                          (VecFx32Object *)(actor + 0x28));
            VecFx32Object_Assign((VecFx32Object *)(actor + 0x284), &edgePosition);
            if (direction == 2)
                *(s32 *)(actor + 0x28c) += 0x2000;
            if (direction == 3)
                *(s32 *)(actor + 0x28c) -= 0x2000;
            VecFx32Object_Destroy(&currentPosition);
            VecFx32Object_Destroy(&edgePosition);
        } else {
            VecFx32Object position;
            VecFx32Object_InitCopy(&position, destination);
            if (direction == 0) {
                position.value.x += (halfWidthWorld + 0x30) * 0x1000;
            } else if (direction == 1) {
                position.value.x -= (halfWidthWorld + 0x30) * 0x1000;
            } else if (direction == 2) {
                s32 extent = SignedAbsoluteValueVariant(*(s16 *)(actor + 0x6a));
                position.value.y += (extent + 0x30) * 0x1000;
            } else {
                s32 extent = SignedAbsoluteValueVariant(*(s16 *)(actor + 0x6e));
                position.value.y -= (extent + 0x30) * 0x1000;
            }
            VecFx32Object_Assign((VecFx32Object *)(actor + 0x28), &position);
            VecFx32Object_Assign((VecFx32Object *)(actor + 0x18),
                          (VecFx32Object *)(actor + 0x28));
            VecFx32Object_Assign((VecFx32Object *)(actor + 0x284), destination);
            if (direction == 2)
                *(s32 *)(actor + 0x28c) += 0x1000;
            VecFx32Object_Destroy(&position);
        }

        *(u32 *)(actor + 0x268) |= 0x80004;
        *(u32 *)(actor + 0x14) =
            (*(u32 *)(actor + 0x14) | 6) & ~0x02000000;
        Type7Actor_SetCallbackPair(actor, data_020e17e8[0], data_020e17e8[1], -1);
        *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) &= (u16)~0x10;
        *(u16 *)(actor + 0x246) = 0;
        ActorDerivedType1_SetSpecialModeEnabled(*(void **)(gGamePhaseRuntime + 0x2ea4), 1);
    }
    *(u16 *)(actor + 0x2a6) = 0;
}
