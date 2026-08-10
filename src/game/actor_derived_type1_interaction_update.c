#include "tingle/types.h"

/* Process type-1 actor impacts, proximity responses, terrain interaction, and scale events. */
extern u8 gSystemState[];
extern s16 data_020c9670[];
extern void *gActorTargetSelectionCandidates[10];
extern u8 gActorTargetSelectionMetadata[4];
extern void *data_021052fc;
extern s8 data_020c3d80[8];
extern s8 data_020c3d88[8];
extern u8 gActorRuntimeCollection[];
extern void *gGameWork;
extern u8 data_020d37dc[];
extern void *data_021e9ac0;
extern void *gSoundContext;
extern u8 gSceneTouchInitialData[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_IsAtCachedTerrainHeight(void *actor);
extern s32 ActorFeedback_DispatchEnvironment(void *actor);
extern void func_020349b8(void *actor, u32 sound, s32 extra);
extern void VecFx32Object_Init(void *value);
extern void VecFx32Object_InitCopy(void *temporary, const void *source);
extern void VecFx32Object_Destroy(void *temporary);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern s32 func_020adcac(const void *first, const void *second);
extern void VecFx32_Subtract(void *output, const void *first, const void *second);
extern void VecFx32Object_Normalize(void *value);
extern void func_020328d0(void *value, s32 scale);
extern void *GamePhaseRuntime_GetActorCollection(void *manager, u32 slot);
extern s32 Actor_QueryTerrainHeight(void *actor, s32 x, s32 y);
extern s32 ActorDerivedType1_HasBlockingStateFlags(void *actor);
extern s32 ActorRuntimeCollection_GetBusyState(void *state);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern s32 ActorRuntimeCollection_IsQueuedValueMissing(void *state, const void *record);
extern void ActorRuntimeCollection_QueueValue(void *state, const void *record);
extern void GraphicsSpriteState_SetAnimationIndex(void *attachment, u32 animation);
extern void ActorDerivedType1_ResetSpecialModeFlags(void *actor);
extern void func_02063820(void *state, u32 value);
extern void Sound_Play(void *context, u32 sound, u32 variant);
extern void *func_0201e0ec(void *state);
extern void func_020a25c8(void *object, s32 first, s32 x, s32 y,
                          s32 width, s32 height, s32 kind);
extern void ActorFeedback_ProcessSnapshotCell(const void *snapshot);
extern void ActorDerivedType1_ScanActiveRecordCollisions(void *actor);
#ifdef __cplusplus
}
#endif

/* Return the two signed trigonometric table entries for an eight-way direction. */
static void directionPair(u8 direction, s16 *first, s16 *second)
{
    u32 index = (u32)(direction & 7) * 0x400;
    const s16 *pair = (const s16 *)((const u8 *)data_020c9670 + index * 2);
    *first = pair[0];
    *second = pair[1];
}

/* Store descriptor identity and target coordinates at actor+0x294..+0x298. */
static void storeTarget(u8 *actor, s16 identity, s32 x, s32 y)
{
    *(s16 *)(actor + 0x294) = identity;
    *(s16 *)(actor + 0x296) = (s16)x;
    *(s16 *)(actor + 0x298) = (s16)y;
}

/* Decrease halfword +0x282 by four while retaining a minimum of one. */
static void reduceScaleCounter(u8 *actor)
{
    s16 *counter = (s16 *)(actor + 0x282);
    if (*counter > 0) {
        *counter -= 4;
        if (*counter < 1) *counter = 1;
    }
}

/*
 * Return zero unless +0x230 bit 4 is set, +0xd0 bit 0x100 is clear, resource
 * +0x274 exists, countdown +0x280 is zero, and the actor is height-ready. A
 * deferred object +0x278 instead receives descriptor offsets chosen by
 * gSystemState bits 0x00f0, merges primary/secondary motion, starts countdown
 * 30, sets +0x230 bit 0x8000, and returns one. With +0x230 bit 0x1000, update
 * target metadata from the direction trig table, clear motion, repel selected
 * nearby targets and eligible type-4 collection actors, and return one. With
 * bit 0x2000, inspect the direction-adjacent terrain cell: when all confirmed
 * GameWork, resource, height, packed-terrain, and cooldown gates pass, trigger
 * animation/effects/sound and four scene effects; otherwise store fallback
 * target coordinates and clear motion. Bit 0x4000 uses
 * ActorDerivedType1_ScanActiveRecordCollisions and current X. Remaining
 * descriptor IDs/bytes 0x7b/0x7c/0x80 or 0x73/0x74 adjust byte
 * +0x26b, countdown +0x282, and attachment scale. Returns one when a branch is
 * handled, zero otherwise. Virtual, terrain, resource, sound, scene, and effect
 * helpers have observable engine/SDK/hardware effects.
 */
s32 ActorDerivedType1_ProcessInteraction(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *descriptor;
    void *object;
    s16 first;
    s16 second;
    s32 x;
    s32 y;
    u32 i;

    if ((*(u32 *)(actor + 0x230) & 4) == 0 ||
        (*(u32 *)(actor + 0xd0) & 0x100) != 0)
        return 0;

    object = *(void **)(actor + 0x278);
    descriptor = *(u8 **)(actor + 0x27c);
    if (object != 0) {
        s32 useAlternate = (*(u16 *)(gSystemState + 0x1a) & 0xf0) != 0;
        s16 a = *(s16 *)(descriptor + (useAlternate ? 0x2a : 0x26));
        s16 b = *(s16 *)(descriptor + (useAlternate ? 0x2c : 0x28));
        void (*impact)(void *, u32, s32, s32) =
            *(void (**)(void *, u32, s32, s32))(*(u8 **)object + 0xd0);
        impact(object, actor[0xd4], a, b);
        *(void **)(actor + 0x278) = 0;
        *(s32 *)(actor + 0x8c) += *(s32 *)(actor + 0x3c);
        *(s32 *)(actor + 0x90) += *(s32 *)(actor + 0x40);
        *(s32 *)(actor + 0x3c) = 0;
        *(s32 *)(actor + 0x40) = 0;
        *(s16 *)(actor + 0x280) = 0x1e;
        *(u32 *)(actor + 0x230) |= 0x8000;
        return 1;
    }

    if (*(void **)(actor + 0x274) == 0 || *(s16 *)(actor + 0x280) != 0 ||
        Actor_IsAtCachedTerrainHeight(actor) == 0)
        return 0;

    if ((*(u32 *)(actor + 0x230) & 0x1000) != 0) {
        s32 result = ActorFeedback_DispatchEnvironment(actor);
        s32 actorPosition[4];
        s32 origin[4];
        s32 displacement[4];

        if (result != 0) {
            if (result == -1 && *(u16 *)(descriptor + 0x2e) != 0)
                func_020349b8(actor, *(u16 *)(descriptor + 0x2e), 0);
            directionPair(actor[0xd4], &first, &second);
            storeTarget(actor, *(s16 *)descriptor,
                        (*(s32 *)(actor + 0x1c) >> 12) +
                            ((first * -12) >> 12),
                        (*(s32 *)(actor + 0x20) >> 12) +
                            ((second * 12) >> 12));
        }
        *(s16 *)(actor + 0x280) = 0x1e;
        *(s32 *)(actor + 0x3c) = 0;
        *(s32 *)(actor + 0x40) = 0;
        *(s32 *)(actor + 0x8c) = 0;
        *(s32 *)(actor + 0x90) = 0;
        VecFx32Object_Init(origin);
        VecFx32Object_InitCopy(actorPosition, actor + 0x18);
        directionPair(actor[0xd4], &first, &second);
        actorPosition[1] -= first << 4;
        actorPosition[2] += second << 4;

        for (i = 0; i < (u32)*(s16 *)(gActorTargetSelectionMetadata + 2); ++i) {
            u8 *target = (u8 *)gActorTargetSelectionCandidates[i];
            if ((*(s32 (**)(void *))(*(u8 **)target + 0x1d0))(target) != 0 &&
                func_020adcac(target + 0x1c, actorPosition + 1) < 0x20000) {
                VecFx32_Subtract(displacement, target + 0x18, actor + 0x18);
                VecFx32Object_Normalize(displacement);
                func_020328d0(displacement, 0x1800);
                (*(void (**)(void *, const void *, s32))
                    (*(u8 **)target + 0xb8))(target, displacement, 1);
                VecFx32Object_Destroy(displacement);
            }
        }

        for (i = 0;; ++i) {
            u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
            u8 *target;
            if (i >= *(u32 *)(collection + 0x2e74)) break;
            target = *(u8 **)(collection + i * 4);
            if (target != 0 && target[0x4d] == 4 &&
                *(u16 *)(target + 0x4e) >= 0x15 &&
                *(u16 *)(target + 0x4e) <= 0x1b &&
                (*(s32 (**)(void *))(*(u8 **)target + 0xd0))(target) == 0 &&
                func_020adcac(target + 0x1c, actorPosition + 1) < 0x20000) {
                (*(void (**)(void *, s32))(*(u8 **)target + 0xc4))(target, 0);
                VecFx32_Subtract(displacement, target + 0x18, actor + 0x18);
                VecFx32Object_Normalize(displacement);
                func_020328d0(displacement, 0x3000);
                VecFx32Object_Assign(target + 0x38, displacement);
                VecFx32Object_Destroy(displacement);
            }
        }
        VecFx32Object_Destroy(actorPosition);
        VecFx32Object_Destroy(origin);
        return 1;
    }

    if ((*(u32 *)(actor + 0x230) & 0x2000) != 0) {
        u32 packed;
        u32 terrainField;
        s32 heightDelta;
        s32 eligible;
        *(s16 *)(actor + 0x280) = 0x28;
        x = (*(s32 *)(actor + 0x1c) >> 16) + data_020c3d80[actor[0xd4]];
        y = (*(s32 *)(actor + 0x20) >> 16) + data_020c3d88[actor[0xd4]];
        {
            void *terrain = *(void **)((u8 *)data_021052fc + 0x2ed4);
            u32 (*query)(void *, s32, s32, s32) =
                *(u32 (**)(void *, s32, s32, s32))(*(u8 **)terrain + 0x2c);
            packed = query(terrain, x, y, 0);
        }
        terrainField = (packed >> 10) & 0x0f;
        heightDelta = (*(s32 *)(actor + 0x24) >> 12) -
                      ((s32)Actor_QueryTerrainHeight(actor, x, y) << 4);
        eligible = ((*(u32 *)(actor + 0xd0) & 0x100) == 0 &&
                    ActorDerivedType1_HasBlockingStateFlags(actor) == 0 &&
                    *(void **)(actor + 0x270) == 0 &&
                    Actor_IsAtCachedTerrainHeight(actor) != 0 &&
                    *(s16 *)(actor + 0x268) == 0 &&
                    (*(u32 *)(actor + 0xd0) & 0x4000) == 0);

        if (eligible && ActorRuntimeCollection_GetBusyState(gActorRuntimeCollection) == 0 &&
            GameWork_TestFlag(gGameWork, 0x11) == 0 &&
            GameWork_TestFlag(gGameWork, 0x12) != 0 && terrainField == 1 &&
            heightDelta >= 0 && heightDelta <= 0x10 &&
            ActorRuntimeCollection_IsQueuedValueMissing(gActorRuntimeCollection, data_020d37dc) == 0) {
            u8 snapshot[12];
            ActorRuntimeCollection_QueueValue(gActorRuntimeCollection, data_020d37dc);
            GraphicsSpriteState_SetAnimationIndex(*(void **)(actor + 0x54),
                          (actor[0xd4] + 0x10) & 0xff);
            *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) &= (u16)~2;
            *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) &= (u16)~1;
            ActorDerivedType1_ResetSpecialModeFlags(actor);
            func_02063820(data_021e9ac0, 0x41);
            if (*(u16 *)(descriptor + 0x1a) != 0)
                Sound_Play(gSoundContext, *(u16 *)(descriptor + 0x1a) >> 7,
                           *(u16 *)(descriptor + 0x1a) & 0x7f);
            for (i = 0; i < 4; ++i) {
                void *effect = func_0201e0ec((u8 *)data_021052fc + 0x2f7c);
                func_020a25c8(effect, 0,
                              (*(s32 *)(actor + 0x1c) >> 12) - 0x10,
                              (*(s32 *)(actor + 0x20) >> 12) -
                                  (*(s32 *)(actor + 0x24) >> 12) - 0x14,
                              0x20, 0x18, 0x46);
            }
            *(void **)snapshot = gSceneTouchInitialData;
            *(s32 *)(snapshot + 4) = x << 4;
            *(s32 *)(snapshot + 8) = y << 4;
            ActorFeedback_ProcessSnapshotCell(snapshot);
            *(u32 *)(actor + 0x230) |= 0x8000;
            return 1;
        }

        if (*(u16 *)(descriptor + 0x2e) != 0)
            func_020349b8(actor, *(u16 *)(descriptor + 0x2e), 0);
        storeTarget(actor, *(s16 *)descriptor, x << 4, y << 4);
        *(s32 *)(actor + 0x3c) = 0;
        *(s32 *)(actor + 0x40) = 0;
        *(s32 *)(actor + 0x8c) = 0;
        *(s32 *)(actor + 0x90) = 0;
        return 1;
    }

    if ((*(u32 *)(actor + 0x230) & 0x4000) != 0) {
        ActorDerivedType1_ScanActiveRecordCollisions(actor);
        x = (*(s32 *)(actor + 0x1c) << 4) >> 16;
        storeTarget(actor, *(s16 *)descriptor, x, x);
        return 1;
    }

    if (*(s16 *)descriptor == 0x7b || *(s16 *)descriptor == 0x7c ||
        *(s16 *)descriptor == 0x80) {
        actor[0x26b] = 10;
        reduceScaleCounter(actor);
        *(u16 *)(*(u8 **)(actor + 0x54) + 0x36) = 0x300;
        return 1;
    }
    if (descriptor[8] == 0x73 || descriptor[8] == 0x74) {
        actor[0x26b] = 10;
        reduceScaleCounter(actor);
        if (descriptor[8] == 0x73)
            *(u16 *)(*(u8 **)(actor + 0x54) + 0x36) = 0x200;
        return 1;
    }
    return 0;
}
