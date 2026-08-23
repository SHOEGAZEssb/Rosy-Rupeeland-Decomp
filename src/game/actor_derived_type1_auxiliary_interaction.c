#include "tingle/heap.h"
#include "tingle/point_2d_s16.h"
#include "tingle/sprite_effect.h"
#include "tingle/types.h"

/* Dispatch type-1 interactions that create, update, or hand off an auxiliary resource. */
extern void *gSceneManager;
extern u8 gActorRuntimeCollection[];
extern u8 gActorRuntimeFlags[];
extern const char data_020df48c[];
extern void *gGameWork;
extern u8 *data_021052fc;

typedef struct Graphics3dPresentation Graphics3dPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorContactState_AddContact(void *actor);
extern void *SceneManager_GetCurrent(void *manager);
extern s32 ActorRuntimeCollection_GetBusyState(void *state);
extern s32 ActorDerivedType1_HasBlockingStateFlags(void *actor);
extern s32 Actor_IsAtCachedTerrainHeight(void *actor);
extern s32 ActorRuntimeFlags_Test(void *state, s32 mask);
extern void ActorDerivedType1_TeardownActiveRecord(void *actor);
extern void *AuxiliaryInteraction_Destroy(void *resource);
extern void AuxiliaryCore_Destroy(void *core);
extern void func_02074058(void *group);
extern void func_02074330(void *manager, void *group);
extern void func_02074038(void *group, void *state);
extern void ActorAttachmentManager_Destroy(void *manager);
extern void AuxiliaryInteraction_BuildTerminalVector(
    void *outputPosition, void *interactionPointer);
extern void GameWork_SetFlag(void *work, u32 flag);
extern void ActorMotionJitter_EnsureMinimum(void *manager, s32 first, s32 second);
extern s32 ActorDerivedType1_IsTargetStateEligible(void *target);
extern void ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect(void *actor);
extern void ActorDerivedType1_ApplyWeightedCollisionDisplacement(
    void *actor, void *target, s32 distance, s32 offset);
extern s32 AuxiliaryInteraction_IsCoreHidden(void *resource);
extern void Type7Actor_HandleResourceInteraction(void *target, void *resource);
extern void *data_020f4e14;
extern const char data_020e5810[];
extern const char data_020e5818[];
extern const char data_020e5820[];
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void *AnimationResource_Init(void *resource, s32 first, s32 second, s32 third);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern void *func_0206b628(void *allocation, void *owner, void *first,
                           void *second, void *third, s32 x, s32 y, s32 z,
                           s32 argument8, s32 argument9, s32 argument10,
                           s32 argument11, s32 argument12);
extern void AuxiliaryCoreSprite_SetVisible(void *object, s32 enabled);
extern u32 genrand_int32(void);
extern void *ActorAttachmentManager_Init(void *allocation);
extern s32 ActorAttachmentManager_AdmitActor(void *manager, void *actor, s32 index);
extern void AuxiliaryInteraction_SelectPresentationVariant(void *resource);
extern void AuxiliaryInteraction_PlaySpatialSound(void *resource, s32 state);
extern const char data_020e55fc[];
extern const char data_020e5604[];
extern const char data_020e560c[];
extern const char data_020e5614[];
extern const char data_020e5728[];
extern u8 data_020e5688[];
extern u8 data_020e56b0[];
extern u8 data_020e56d8[];
extern u8 data_020e5700[];
extern const char data_020e5730[];
extern const u32 data_020c46c8[];
extern u8 data_020e8380[];
extern const s16 data_020e83a0[];
extern void SelfLinkedSpriteConfig_Init(void *configuration);
extern u8 data_020e57a4[];
extern u8 data_020e57c4[];
extern u8 data_020e57e4[];
extern const char data_020e57fc[];
extern void VecFx32Object_Init(void *vector);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_InitCopy(void *vector, const void *source);
extern void *GraphicsSpriteGroup_CreateState(void *group, void *resource0,
                                             void *resource1, void *resource2,
                                             u8 attach);
extern void GraphicsSpriteState_SetAnimation(void *sprite, u32 animation);
extern u32 func_020ada8c(u32 numerator, u32 denominator);
extern void *gLupyContext;
extern s32 GamePhaseCurrencyHud_GetCurrency(void *context);
extern void GamePhaseCurrencyHud_SetCurrency(void *context, s32 value);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern s32 VecFx32Object_GetMagnitude(void *vector);
extern void VecFx32_Subtract(void *destination, const void *left,
                             const void *right);
extern const void *ActorMotionAreaFollower_GetPosition(void *follower);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *group);
extern void AuxiliaryCore_UpdateMotion(void *core, const void *position);
extern s32 func_020adae4(s32 numerator, s32 denominator);
extern void *gSoundContext;
extern void Sound_PlayEffectWithParameters(void *context, s32 archive, s32 member, s32 volume,
                          s32 pan, s32 flags);
extern s32 VecFx32_HorizontalMagnitude(const void *vector);
extern s32 func_020ae024(s32 y, s32 x);
extern s32 SignedAbsoluteValue(s32 value);
extern void AuxiliaryCore_AllocateHistorySprite(void *core, s32 kind);
extern s32 AuxiliaryCoreHistoryRecord_Advance(void *record);
extern void AuxiliaryCoreHistoryRecord_ReleaseSprite(void *record);
extern void AuxiliaryCoreHistoryRecord_ProjectSprite(void *record);
extern s32 func_020adc40(s32 value);
extern const s16 data_020c9670[];
extern void *gTouchPanelManager;
extern void *gSceneTouchInitialData;
extern void TouchPanelManager_GetPoint(void *point, void *initialData);
extern void AuxiliaryCoreSprite_TrackParent(void *sprite, void *parent);
extern void AuxiliaryCoreSprite_UpdatePresentation(void *sprite);
extern s32 AuxiliaryCoreSprite_SelectAnimation(void *core, void *sprite);
extern const s32 data_020c46ec[];
extern void GraphicsSpriteGroup_ReleaseState(void *group, void *state);
extern s32 ActorAttachmentManager_Update(void *manager);
extern void *ActorAttachmentManager_GetEventQueue(void *manager);
extern void AuxiliaryInteraction_FinalizeResult(void *resource, s32 index);
extern void *func_02022cb0(void *allocation, const void *camera, void *owner,
                           s32 velocity, s32 scale, s32 offset);
extern void RuntimePresentationManager_AppendFirstListEffect(void *manager, void *entry);
extern void AuxiliaryCore_ApplyScale(void *core, s32 value, s32 index);
extern void *TimedSpriteConfig_InitTracks(void *config);
extern void *func_0201ea20(void *allocation, void *owner, void *config,
                           s32 spriteValue, s16 offset, s16 spriteByte);
extern void *func_0201ecbc(void *allocation, void *owner, void *config,
                           s32 spriteValue, s16 offset, s16 spriteByte);
extern void TimedSpritePresentation_SetVisible(void *effect, s32 enabled);
extern void *AuxiliaryTimedSpritePresentation_Init(
    void *allocation, const void *position, void *group, s32 first,
    s32 second, s32 third, s32 spriteValue, s32 offset, s32 spriteByte,
    s32 registerWithManager);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *manager);
extern u32 Graphics3dPresentation_CreatePreset11To13SpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z);
extern u32 Graphics3dPresentation_CreatePreset20To21ScaledPointSpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    s32 scaleStep);
extern void
Graphics3dPresentation_CreatePreset22To24TimedPointSpriteEffectWithHorizontalVelocityAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    s32 horizontalVelocityX, s32 horizontalVelocityZ,
    s32 particleLifetime);
extern void TrackedResourceActor_SpawnFromKey(s32 key, const void *first,
                                               const void *second);
extern void AuxiliaryInteraction_ProcessTouchSamples(void *resource, const void *touch);
extern void func_0206e7f4(void *resource, const void *touch);
extern void func_0206e9e0(void *resource, const void *touch);
extern void func_0206ea6c(void *resource, const void *touch);
extern void AuxiliaryInteraction_FlagSecondaryTouch(void *resource);
extern void *ActorAttachmentManager_GetRecord(void *manager, s32 index);
extern s32 ActorAttachmentCounter_Advance(void *queue);
extern void *ActorAttachmentEventQueue_GetList(void *queue);
extern s32 ActorAttachmentManager_ProcessPendingEvents(void *manager);
extern void ActorAttachmentManager_FinalizeRewards(void *manager);
extern s32 ActorAttachmentManager_CountType0Records(void *manager);
extern void ActorDescriptor_InitRange(void *descriptor, u16 value, s32 count);
extern void Actor_ApplyTerrainNeighborAxisBias(void *actor, void *position);
extern void ActorAttachmentDescriptor_CopyPayload(void *destination, const void *source);
extern void ActorDescriptor_SetRangeEnd(void *descriptor, s32 enabled);
extern void func_0204f894(void *position, void *descriptor, s32 duration);
extern s32 func_0203adc4(void);
extern void func_0204e3f4(s32 kind, s32 amount, void *position);
extern void func_0204e628(s32 kind, s32 amount, void *position);
extern void *func_02007f0c(void *scene, s32 value);
extern void func_0202de90(void *actorCollection);
extern void ActorAttachmentEventList_InsertByPriority(void *queue, const void *event);
extern void ActorAttachmentManager_QueueEvent(void *manager, const void *event);
extern void ActorAttachmentRecord_ConfigureHitInterval(void *record, s32 first, s32 second);
extern void *func_02025120(void *effect, void *actor, s32 amount,
                           s32 variant, s32 duration);
extern const char data_020e5828[];
extern const char data_020e5830[];
extern const u16 data_020e5804;
extern u8 *ActorExtendedType2Record_FindByIndex(s32 index);
#ifdef __cplusplus
}
#endif

/* Copy the two-word descriptor payload from source to caller-owned storage. */
void ActorAttachmentDescriptor_CopyPayload(void *destination, const void *source)
{
    *(u32 *)destination = *(const u32 *)source;
    *(u32 *)((u8 *)destination + 4) = *(const u32 *)((const u8 *)source + 4);
}

/* Set the three game-progress flags selected by retail callback 0x0208B96C. */
void ProgressionFlags_SetGate2C8_767_74B(void)
{
    GameWork_SetFlag(gGameWork, 0x2c8);
    GameWork_SetFlag(gGameWork, 0x767);
    GameWork_SetFlag(gGameWork, 0x74b);
}

/* Initialize a two-word counter pair to the supplied capacity. */
void *ActorAttachmentCounter_Init(void *object, s32 capacity)
{
    *(s32 *)((u8 *)object + 0) = capacity;
    *(s32 *)((u8 *)object + 4) = capacity;
    return object;
}

/* Reset the actor-attachment manager's counters, indices, and timers. */
void ActorAttachmentManager_Reset(void *object)
{
    u8 *self = (u8 *)object;
    ActorAttachmentCounter_Init(self + 0x98, 0x10);
    *(s32 *)(self + 0x84) = 0;
    *(s32 *)(self + 0x88) = 0;
    *(s32 *)(self + 0x8c) = -1;
    *(s32 *)(self + 0x90) = -1;
    *(s32 *)(self + 0xa4) = 0;
    *(u32 *)(self + 0x80) = 0;
    *(s32 *)(self + 0xac) = 30;
    *(s32 *)(self + 0xc8) = 0;
    *(s32 *)(self + 0xc0) = 0;
    *(s32 *)(self + 0xa8) = 300;
    if (*(void **)(self + 0xc4) != 0)
        *(s32 *)((u8 *)*(void **)(self + 0xc4) + 0x78) = 0;
}

/* Clear one 12-byte manager entry. */
void *ActorAttachmentSubtableEntry_Init(void *object)
{
    u8 *entry = (u8 *)object;
    *(u32 *)(entry + 0) = 0;
    *(u32 *)(entry + 4) = 0;
    *(u32 *)(entry + 8) = 0;
    return object;
}

/* Retail no-op destructor for a manager entry. */
void *ActorAttachmentSubtableEntry_DeleteNoOp(void *object)
{
    return object;
}

/* Construct the ten-entry manager subtable and clear its active count. */
void *ActorAttachmentSubtable_Init(void *object)
{
    u8 *self = (u8 *)object;
    s32 i;
    for (i = 0; i < 10; i++)
        ActorAttachmentSubtableEntry_Init(self + i * 12);
    *(s32 *)(self + 0x78) = 0;
    return self;
}

/* Clear a four-word auxiliary descriptor. */
void *ActorAttachmentAuxDescriptor_Init(void *object)
{
    u8 *self = (u8 *)object;
    *(u32 *)(self + 0) = 0;
    *(u32 *)(self + 4) = 0;
    *(u32 *)(self + 8) = 0;
    *(u32 *)(self + 12) = 0;
    return self;
}

/* Construct the 0x20-byte manager-owned auxiliary descriptor. */
void *ActorAttachmentEventQueue_Init(void *object)
{
    u8 *self = (u8 *)object;
    void *descriptor;
    *(u32 *)(self + 4) = 0;
    descriptor = Heap_Alloc(0x10, data_020e5728, -4, &gHeapContext);
    if (descriptor != 0)
        descriptor = ActorAttachmentAuxDescriptor_Init(descriptor);
    *(void **)(self + 0) = descriptor;
    return self;
}

/*
 * Construct the actor-attachment manager and all fixed-capacity owned helper
 * records. Each allocation remains independently nullable exactly as in the
 * retail constructor; callers own the returned 0x11c-byte object.
 */
void *ActorAttachmentManager_Init(void *object)
{
    u8 *self = (u8 *)object;
    void *entry;
    s32 i;

    *(void **)(self + 0xc4) = 0;
    ActorAttachmentManager_Reset(self);
    entry = Heap_Alloc(0x20, data_020e55fc, -4, &gHeapContext);
    if (entry != 0)
        entry = ActorAttachmentEventQueue_Init(entry);
    *(void **)(self + 0x94) = entry;
    entry = Heap_Alloc(0x7c, data_020e5604, -4, &gHeapContext);
    if (entry != 0)
        entry = ActorAttachmentSubtable_Init(entry);
    *(void **)(self + 0xc4) = entry;
    for (i = 0; i < 20; i++) {
        entry = Heap_Alloc(0x24, data_020e560c, 4, &gHeapContext);
        if (entry != 0)
            SelfLinkedSpriteConfig_Init(entry);
        *(void **)(self + 0xcc + i * 4) = entry;
    }
    *(s32 *)(self + 0xa0) = 0;
    return self;
}

/* Initialize the common header shared by manager attachment records. */
void *ActorAttachmentRecord_InitBase(void *object, void *manager, void *actor, s32 index)
{
    u8 *self = (u8 *)object;
    *(void **)(self + 0) = data_020e56b0;
    *(void **)(self + 4) = manager;
    *(s32 *)(self + 0x0c) = index;
    *(u32 *)(self + 0x10) = 0;
    *(void **)(self + 0x1d0) = actor;
    return self;
}

/* Construct a type-two attachment record and invoke its initialization slot. */
void *ActorAttachmentRecord_InitType2(void *object, void *manager, void *actor, s32 index)
{
    u8 *self = (u8 *)object;
    ActorAttachmentRecord_InitBase(self, manager, actor, index);
    *(void **)(self + 0) = data_020e5688;
    SelfLinkedSpriteConfig_Init(self + 0x21c);
    *(s32 *)(self + 0x1d8) = data_020e83a0[(*(u16 *)((u8 *)actor + 0x4e) * 0x30) / 2];
    *(u32 *)(self + 8) = 0;
    (*(void (**)(void *))(*(u8 **)self + 0))(self);
    return self;
}

/*
 * Initialize a type-two attachment from its resident actor-type record. Actor
 * health fields and the record's pacing/reward state are synchronized; all
 * counts and probabilities retain their retail integer units.
 */
void ActorAttachmentRecord_InitializeType2State(void *object)
{
    u8 *self = (u8 *)object;
    u8 *actor = *(u8 **)(self + 0x1d0);
    const u8 *source = ActorExtendedType2Record_FindByIndex(*(s32 *)(self + 0x1d8));
    s32 i;

    for (i = 0; i < 10; i++)
        *(u32 *)(self + 0x1dc + i * 4) = *(const u32 *)(source + i * 4);
    for (i = 0; i < 6; i++)
        *(u32 *)(self + 0x204 + i * 4) = *(const u32 *)(source + 0x28 + i * 4);
    ActorAttachmentRecord_ConfigureHitInterval(self, 0, 0);
    if (*(s32 *)(actor + 0x200) < 0 || *(s32 *)(actor + 0x1fc) == 0) {
        *(s32 *)(self + 0x14) = *(s32 *)(self + 0x1e8);
        *(s32 *)(self + 0x18) = *(s32 *)(self + 0x1e8);
        *(s32 *)(actor + 0x200) = *(s32 *)(self + 0x1e8);
        *(s32 *)(actor + 0x1fc) = *(s32 *)(self + 0x18);
    } else {
        *(s32 *)(self + 0x14) = *(s32 *)(actor + 0x200);
        *(s32 *)(self + 0x18) = *(s32 *)(actor + 0x1fc);
    }
    *(s32 *)(actor + 0x1fc) = *(s32 *)(self + 0x18);
    *(s32 *)(self + 0x1c) = *(s32 *)(self + 0x1f4);
    *(s32 *)(self + 0x20) = *(s32 *)(self + 0x1f0);
    *(s32 *)(self + 0x1c4) = *(s32 *)(self + 0x1ec);
    *(s32 *)(self + 0x244) = *(s32 *)(self + 0x1fc);
    ActorAttachmentCounter_Init(self + 0x1c8, *(s32 *)(self + 0x20));
}

/*
 * Regenerate the randomized hit schedule for a type-two attachment. The first
 * count positions are selected without replacement from the second count;
 * one RNG sample is consumed per selected position, matching retail.
 */
void ActorAttachmentRecord_RandomizeHitSchedule(void *object)
{
    u8 *self = (u8 *)object;
    s32 selectedCount = *(s32 *)(self + 0x24);
    s32 positionCount = *(s32 *)(self + 0x28);
    s32 selected;
    s32 position;

    if (selectedCount != 0) {
        for (position = 0; position < positionCount; position++)
            *(u32 *)(self + 0x2c + position * 4) = 0;
        for (selected = 0; selected < selectedCount; selected++) {
            u32 rank = genrand_int32() % (u32)(positionCount - selected);
            for (position = 0; position < positionCount; position++) {
                if (*(u32 *)(self + 0x2c + position * 4) == 0) {
                    if (rank == 0) {
                        *(u32 *)(self + 0x2c + position * 4) = 1;
                        break;
                    }
                    rank--;
                }
            }
        }
    }
    *(s32 *)(self + 0x1c0) = 0;
}

/* Return whether one interpolated type-two attachment step consumed a hit. */
s32 ActorAttachmentRecord_ConsumeScheduledHit(void *object)
{
    u8 *self = (u8 *)object;
    s32 hit = 0;
    s32 index;

    if (*(s32 *)(self + 0x24) == 0)
        return 0;
    if (*(s32 *)(self + 0x24) == 100)
        return 1;
    index = (*(s32 *)(self + 0x1c0))++;
    if (*(void **)(self + 0x2c + index * 4) != 0)
        hit = 1;
    if (*(s32 *)(self + 0x1c0) >= *(s32 *)(self + 0x28))
        ActorAttachmentRecord_RandomizeHitSchedule(self);
    return hit;
}

/* Clamp a type-two actor's health after applying a signed damage delta. */
void ActorAttachmentRecord_ApplyHealthDelta(void *object, s32 delta)
{
    u8 *self = (u8 *)object;
    u8 *actor = *(u8 **)(self + 0x1d0);
    s32 current = *(s32 *)(actor + 0x1fc);
    s32 updated = current + delta;

    *(s32 *)(self + 0x18) = current;
    if (updated <= 0)
        *(s32 *)(self + 0x18) = 0;
    else if (updated >= *(s32 *)(self + 0x14))
        *(s32 *)(self + 0x18) = *(s32 *)(self + 0x14);
    else
        *(s32 *)(self + 0x18) = updated;
    if ((*(u32 *)(actor + 0xd0) & 0x20000) != 0 &&
        *(s32 *)(self + 0x18) == 0)
        *(s32 *)(self + 0x18) = 1;
    *(s32 *)(actor + 0x1fc) = *(s32 *)(self + 0x18);
}

/* Consume a type-two damage event and report when its health reaches zero. */
s32 ActorAttachmentRecord_ConsumeDamageEvent(void *object, const void *eventObject)
{
    u8 *self = (u8 *)object;
    const s32 *event = (const s32 *)eventObject;
    if ((*(u32 *)(self + 0x10) & 4) != 0)
        return 0;
    if (event[0] == 1 && !ActorAttachmentRecord_ConsumeScheduledHit(self))
        ActorAttachmentRecord_ApplyHealthDelta(self, -event[5]);
    return *(s32 *)(self + 0x18) == 0;
}

/* Return the embedded reward descriptor owned by a type-two record. */
void *ActorAttachmentRecord_GetRewardDescriptor(void *object)
{
    return (u8 *)object + 0x21c;
}

/* Queue paced type-two attack events against the manager's selected records. */
void ActorAttachmentRecord_QueuePacedAttacks(void *object)
{
    u8 *self = (u8 *)object;
    u8 *manager = *(u8 **)(self + 4);
    if ((*(u32 *)(self + 0x10) & 2) != 0 ||
        (*(s32 *)(manager + 0x8c) < 0 && *(s32 *)(manager + 0x90) < 0) ||
        *(void **)(self + 0x18) == 0 ||
        (*(u32 *)(*(u8 **)(self + 0x1d0) + 0xd0) & 0x20000) != 0)
        return;
    for (;;) {
        s32 cursor = ActorAttachmentCounter_Advance(self + 0x1c8);
        u32 event[6];
        u32 mask = 0;
        if (cursor < 0)
            break;
        if (*(s32 *)(manager + 0x8c) >= 0)
            mask |= 1u << (*(u32 *)(manager + 0x8c) & 0xff);
        if (*(s32 *)(manager + 0x90) >= 0)
            mask |= 1u << (*(u32 *)(manager + 0x90) & 0xff);
        event[0] = 1;
        event[1] = 0;
        event[2] = (u32)cursor;
        event[3] = (u32)self;
        event[4] = mask;
        event[5] = *(u32 *)(self + 0x1c);
        ActorAttachmentManager_QueueEvent(manager, event);
    }
}

/* Select a type-two reward descriptor when its actor reaches zero health. */
void ActorAttachmentRecord_SelectDefeatReward(void *object)
{
    u8 *self = (u8 *)object;
    u8 *actor = *(u8 **)(self + 0x1d0);
    u32 random;
    *(s32 *)(self + 0x18) = *(s32 *)(actor + 0x1fc);
    if (*(s32 *)(self + 0x18) == 0) {
        if ((*(u32 *)(actor + 0x260) & 0x2000) != 0) {
            *(s32 *)(self + 0x244) = 0;
        } else {
            random = genrand_int32() % 100;
            if (random < *(u32 *)(self + 0x20c)) {
                ActorDescriptor_InitRange(self + 0x21c, *(u16 *)(self + 0x204), 1);
                *(s32 *)(self + 0x244) = 0;
            } else if (random < *(u32 *)(self + 0x20c) +
                                *(u32 *)(self + 0x218)) {
                ActorDescriptor_InitRange(self + 0x21c, *(u16 *)(self + 0x210), 1);
                *(s32 *)(self + 0x244) = 0;
            }
        }
    }
    *(s32 *)(actor + 0x1fc) = *(s32 *)(self + 0x18);
}

/* Publish the retained health for resident type 0x3e6 into GameWork. */
void ActorAttachmentRecord_PublishRetainedHealth(void *object)
{
    u8 *self = (u8 *)object;
    if (*(s32 *)(self + 0x1e0) == 0x3e6)
        *(u16 *)((u8 *)gGameWork + 0x80) = (u16)*(s32 *)(self + 0x18);
}

/* Accumulate currency loss from an incoming type-two attack event. */
s32 ActorAttachmentRecord_AccumulateCurrencyLoss(void *object, const void *eventObject)
{
    u8 *self = (u8 *)object;
    const u32 *event = (const u32 *)eventObject;
    u8 *manager = *(u8 **)(self + 4);

    if ((*(u32 *)(self + 0x10) & 4) != 0)
        return 0;
    if (event[0] == 1) {
        u8 *attacker = (u8 *)event[3];
        if (*(s32 *)(manager + 0x90) < 0 || (genrand_int32() & 1) == 0) {
            s32 amount = func_020befec((s32)event[5] *
                                      *(s32 *)(attacker + 0x1c4) * 65, 100);
            if (*(s32 *)(manager + 0x90) >= 0)
                amount /= 2;
            amount = func_020befec(amount * *(s32 *)(attacker + 0x1f8), 100);
            if (!ActorAttachmentRecord_ConsumeScheduledHit(self))
                *(s32 *)(self + 0x1d8) += amount;
        }
    }
    return *(s32 *)(self + 0x18) == 0;
}

/* Construct a type-one attachment record and invoke its initialization slot. */
void *ActorAttachmentRecord_InitType1(void *object, void *manager, void *actor, s32 index)
{
    u8 *self = (u8 *)object;
    ActorAttachmentRecord_InitBase(self, manager, actor, index);
    *(void **)(self + 0) = data_020e5700;
    *(s32 *)(self + 8) = 1;
    (*(void (**)(void *))(*(u8 **)self + 0))(self);
    return self;
}

/* Configure the optional attachment-record interpolation interval. */
void ActorAttachmentRecord_ConfigureHitInterval(void *object, s32 first, s32 second)
{
    u8 *self = (u8 *)object;
    if (first == 0) {
        *(s32 *)(self + 0x24) = 0;
    } else if (first == second) {
        *(s32 *)(self + 0x24) = 100;
    } else {
        *(s32 *)(self + 0x24) = first;
        *(s32 *)(self + 0x28) = second;
    }
}

/* Initialize type-one attachment dimensions from the current currency tier. */
void ActorAttachmentRecord_InitializeType1State(void *object)
{
    u8 *self = (u8 *)object;
    s32 extent = GamePhaseCurrencyHud_GetCurrency(gLupyContext) * 10;
    *(s32 *)(self + 0x14) = extent;
    *(s32 *)(self + 0x18) = extent;
    *(u32 *)(self + 0x1d8) = 0;
    *(u32 *)(self + 0x1dc) = 0;
    *(s32 *)(self + 0x1c) = 0xa0;
    *(s32 *)(self + 0x20) = 0x1e0;
    ActorAttachmentCounter_Init(self + 0x1c8, 0x1e0);
    ActorAttachmentRecord_ConfigureHitInterval(self, 0, 0);
}

/* Construct a type-seven attachment record and invoke its initialization slot. */
void *ActorAttachmentRecord_InitType7(void *object, void *manager, void *actor, s32 index)
{
    u8 *self = (u8 *)object;
    ActorAttachmentRecord_InitBase(self, manager, actor, index);
    *(void **)(self + 0) = data_020e56d8;
    *(s32 *)(self + 8) = 2;
    (*(void (**)(void *))(*(u8 **)self + 0))(self);
    return self;
}

/*
 * Admit one actor to the manager's 32-entry attachment table. Type-specific
 * records own their allocations and initialize through their retail vtables.
 * Returns zero while locked/full, otherwise one even for unclassified actors.
 */
s32 ActorAttachmentManager_AdmitActor(void *object, void *actorObject, s32 index)
{
    u8 *self = (u8 *)object;
    u8 *actor = (u8 *)actorObject;
    void *record = 0;
    s32 slot;

    if (*(s32 *)(self + 0xa0) != 0 || *(s32 *)(self + 0x84) >= 32)
        return 0;
    slot = *(s32 *)(self + 0x84);
    if (actor[0x4d] == 2) {
        record = Heap_Alloc(0x248, data_020e5614, -4, &gHeapContext);
        if (record != 0)
            record = ActorAttachmentRecord_InitType2(record, self, actor, slot);
        if (index >= 0)
            *(s32 *)((u8 *)record + 0x244) += index;
        *(s32 *)(self + 0xac) = 30;
        ++*(s32 *)(self + 0x88);
    } else if (actor[0x4d] == 7) {
        record = Heap_Alloc(0x1e8, data_020e5614, -4, &gHeapContext);
        if (record != 0)
            record = ActorAttachmentRecord_InitType7(record, self, actor, slot);
        *(s32 *)(self + 0x90) = slot;
    } else if (actor[0x4d] == 1) {
        record = Heap_Alloc(0x1e0, data_020e5614, -4, &gHeapContext);
        if (record != 0)
            record = ActorAttachmentRecord_InitType1(record, self, actor, slot);
        *(s32 *)(self + 0x8c) = slot;
    }
    *(void **)(self + slot * 4) = record;
    *(s32 *)(self + 0x84) = slot + 1;
    *(s32 *)(self + 0xa4) = 0;
    return 1;
}

typedef struct CoreSpriteConfig {
    s16 kind;
    s16 layer;
    const void *position;
    s32 field08;
    s32 field0c;
    s32 field10;
    void *core;
    void *group;
    void *resource0;
    void *resource1;
    void *resource2;
    u32 attach;
    u32 animation;
    s32 priority;
    u32 byte34;
} CoreSpriteConfig;

/* Construct the common 0x50-byte sprite wrapper from a core sprite record. */
void *AuxiliaryCoreSprite_InitBase(void *object, const CoreSpriteConfig *config)
{
    u8 *self = (u8 *)object;
    void *sprite;
    *(void **)(self + 0) = data_020e57c4;
    *(s16 *)(self + 4) = config->kind;
    *(s16 *)(self + 6) = config->layer;
    VecFx32Object_InitCopy(self + 8, config->position);
    *(s32 *)(self + 0x18) = config->field08;
    *(s32 *)(self + 0x1c) = config->field0c;
    *(u32 *)(self + 0x20) = 0;
    *(u32 *)(self + 0x28) = 0;
    *(s32 *)(self + 0x2c) = config->field10;
    *(s32 *)(self + 0x30) = 0x1000;
    *(void **)(self + 0x38) = config->core;
    *(u32 *)(self + 0x3c) = config->priority;
    sprite = GraphicsSpriteGroup_CreateState(
        config->group, config->resource0, config->resource1,
        config->resource2, (u8)config->attach);
    *(void **)(self + 0x34) = sprite;
    GraphicsSpriteState_SetAnimation(sprite, (u8)config->animation);
    if (config->priority >= 0)
        *(s16 *)((u8 *)sprite + 0x28) = (s16)config->priority;
    *((u8 *)sprite + 0x3a) = (u8)config->byte34;
    *(u16 *)((u8 *)sprite + 0x24) &= (u16)~2;
    *(u16 *)((u8 *)sprite + 0x24) |= 8;
    *(u32 *)(self + 0x24) = *(u32 *)(self + 0x20);
    return self;
}

/* Add the intermediate core-sprite vtable and retain its control word. */
void *AuxiliaryCoreSprite_InitControlled(void *object, const CoreSpriteConfig *config, s32 control)
{
    u8 *self = (u8 *)AuxiliaryCoreSprite_InitBase(object, config);
    *(void **)(self + 0) = data_020e57a4;
    *(s32 *)(self + 0x40) = control;
    return self;
}

/* Add the concrete core-sprite vtable and its presentation parameters. */
void *func_0206b4b0(void *object, const CoreSpriteConfig *config, s32 control,
                    s32 extent, s32 phase)
{
    u8 *self = (u8 *)AuxiliaryCoreSprite_InitControlled(object, config, 0);
    *(void **)(self + 0) = data_020e57e4;
    *(s32 *)(self + 0x44) = phase;
    *(s32 *)(self + 0x48) = control;
    *(s32 *)(self + 0x4c) = extent;
    return self;
}

/* Initialize one of the core object's sixteen transform/history records. */
void *AuxiliaryCoreHistoryRecord_Init(void *object)
{
    u8 *self = (u8 *)object;
    VecFx32Object_Init(self + 4);
    VecFx32Object_Init(self + 0x14);
    self[0x27] = 0;
    return self;
}

static void fillCoreSpriteConfig(CoreSpriteConfig *config, u8 *core,
                                 void *group, void *descriptor)
{
    u8 *resource = (u8 *)descriptor;
    config->position = core + 0x2b4;
    config->field08 = 0x10000;
    config->field0c = 0x8000;
    config->field10 = 0x800;
    config->core = core;
    config->group = group;
    config->resource0 = *(void **)(resource + 4);
    config->resource1 = *(void **)(resource + 8);
    config->resource2 = *(void **)(resource + 12);
    config->attach = 1;
    config->animation = 0;
    config->priority = -1;
}

static void *createCoreSprite(const CoreSpriteConfig *config, s32 control,
                              s32 extent, s32 phase)
{
    void *sprite = Heap_Alloc(0x50, data_020e57fc, 4, &gHeapContext);
    if (sprite != 0)
        sprite = func_0206b4b0(sprite, config, control, extent, phase);
    return sprite;
}

/*
 * Construct the 0x308-byte auxiliary presentation core. The caller supplies
 * its sprite group, animation descriptors, position, controls, and trailing
 * halfwords. The result owns nine wrappers and sixteen embedded history
 * records; allocation and sprite-pool failures retain retail behavior.
 */
void *func_0206b628(void *object, void *owner, void *firstDescriptor,
                    void *secondDescriptor, void *thirdDescriptor, s32 x,
                    s32 y, s32 z, s32 radial, s32 flagged, s32 argument10,
                    s32 argument11, s32 argument12)
{
    u8 *self = (u8 *)object;
    CoreSpriteConfig config;
    s32 group;
    s32 i;

    for (i = 0; i < 16; i++)
        AuxiliaryCoreHistoryRecord_Init(self + 0x24 + i * 0x28);
    *(void **)(self + 0x2a4) = owner;
    VecFx32Object_InitComponents(self + 0x2b4, x, y, z);
    VecFx32Object_InitComponents(self + 0x2c4, x, y, z);
    *(s16 *)(self + 0x2e8) = 0;
    *(s16 *)(self + 0x2ea) = 20;
    *(s16 *)(self + 0x2ec) = 0;
    *(s16 *)(self + 0x2ee) = 0;
    *(s32 *)(self + 0x2f0) = argument10;
    *(u32 *)(self + 0x2f4) = 0;
    *(u32 *)(self + 0x2f8) = 0;
    *(u32 *)(self + 0x2fc) = 0;
    *(u32 *)(self + 0x300) = 0;
    *(s16 *)(self + 0x304) = (s16)argument11;
    *(s16 *)(self + 0x306) = (s16)argument12;
    *(void **)(self + 0x2a8) = firstDescriptor;
    *(void **)(self + 0x2ac) = secondDescriptor;
    *(void **)(self + 0x2b0) = thirdDescriptor;

    fillCoreSpriteConfig(&config, self, owner, firstDescriptor);
    config.kind = 0;
    config.layer = 0;
    config.byte34 = (u32)argument11;
    *(void **)(self + 0) = createCoreSprite(&config, 0, 0xd0, 0);
    config.kind = 1;
    config.layer = 11;
    config.field0c = radial << 13;
    config.field10 = 0x1000;
    *(void **)(self + 4) = createCoreSprite(&config, 8, 0xb8, 0x6d60);

    for (group = 0; group < 2; group++) {
        s32 offset = group * 12;
        config.kind = (s16)(group * 3 + 2);
        config.layer = 20;
        config.field08 = 0x10000;
        config.field0c = group == 0 ? 0xa000 : 0x6000;
        config.field10 = 0x800;
        *(void **)(self + 8 + offset) = createCoreSprite(
            &config, 0, 0xb8, 0x2710 + group * 0x8000);
        ++config.kind;
        config.layer += 12;
        config.field0c = group == 0 ? 0xc000 : 0x4000;
        config.field10 = 0x400;
        *(void **)(self + 0x0c + offset) = createCoreSprite(
            &config, 0, 0xb0, 0x4e20 + group * 0x8000);
        config.layer += 12;
        config.field0c = group == 0 ? 0xe000 : 0x2000;
        *(void **)(self + 0x10 + offset) = createCoreSprite(
            &config, 0, 0xa0, 0x7530 + group * 0x8000);
    }

    config.kind = 8;
    config.layer = 11;
    config.field08 = 0x10000;
    config.field0c = 0;
    config.field10 = 0x400;
    *(void **)(self + 0x20) = createCoreSprite(&config, 0, 0x90, 0);
    *(s32 *)(self + 0x2d8) = radial << 13;
    *(s16 *)(self + 0x2dc) = 0;
    *(s16 *)(self + 0x2e2) = 0x30;
    *(s16 *)(self + 0x2e0) = 0x100;
    *(u16 *)(self + 0x2e4) = (u16)genrand_int32();
    *(u16 *)(self + 0x2e6) =
        (u16)(func_020ada8c(genrand_int32() & 0x7fff, 0x28) + 0x14);
    if (flagged != 0)
        *(u16 *)(self + 0x2ee) |= 1;
    AuxiliaryCoreSprite_SetVisible(self, 1);
    return self;
}

/*
 * Move the auxiliary core toward its requested transform, update vertical
 * spring state, dispatch every owned sprite wrapper, advance its sixteen
 * history records, and maintain idle animation/touch proximity flags. The
 * position is Q12; timers are frames and angle fields use the retail 16-bit
 * turn representation.
 */
void AuxiliaryCore_UpdateMotion(void *object, const void *requestedPosition)
{
    u8 *self = (u8 *)object;
    s32 delta[4];
    s32 touch[4];
    s32 i;

    *(s16 *)(self + 0x2e2) =
        (s16)((*(s16 *)(self + 0x2e0) + *(s16 *)(self + 0x2e2) * 15) >> 4);
    VecFx32Object_Assign(self + 0x2c4, self + 0x2b4);
    VecFx32_Subtract(delta, requestedPosition, self + 0x2c4);
    delta[2] += *(s32 *)(self + 0x2f0);
    delta[3] = 0;
    if (VecFx32_HorizontalMagnitude(delta) > 0x1000) {
        *(s32 *)(self + 0x2d8) = func_020ae024(delta[2], delta[1]);
        VecFx32Object_Assign(self + 0x2b4, requestedPosition);
        *(s32 *)(self + 0x2bc) += *(s32 *)(self + 0x2f0);
    }

    if (*(s32 *)(self + 0x2f4) == 0 && *(s32 *)(self + 0x2f8) == 0) {
        *(s32 *)(self + 0x2c0) = *(s32 *)((const u8 *)requestedPosition + 12);
        if (*(s32 *)(self + 0x300) <= 0) {
            *(s32 *)(self + 0x300) = 0;
            *(s32 *)(self + 0x2fc) = 0;
        } else {
            s32 step = *(s32 *)(self + 0x300) <= 0x4000
                           ? 0x800
                           : func_020adae4(*(s32 *)(self + 0x300) - 0x4000, 8) + 0x200;
            *(s32 *)(self + 0x300) -= step;
            if (*(s32 *)(self + 0x300) < 0)
                *(s32 *)(self + 0x300) = 0;
            *(s32 *)(self + 0x2fc) =
                -data_020c9670[(*(s32 *)(self + 0x300) >> 4) * 2];
        }
    } else {
        if ((*(u16 *)(self + 0x2ee) & 2) == 0)
            *(s32 *)(self + 0x2f4) -= 0x800;
        else
            *(s32 *)(self + 0x2f4) = 0;
        *(s32 *)(self + 0x2f8) += *(s32 *)(self + 0x2f4);
        if (*(s32 *)(self + 0x2f8) < 0) {
            *(s32 *)(self + 0x2f8) = 0;
            *(s32 *)(self + 0x2f4) = 0;
            *(s32 *)(self + 0x300) = 0x8000;
        }
        *(s32 *)(self + 0x2fc) =
            func_020adae4(SignedAbsoluteValue(*(s32 *)(self + 0x2f4)), 8);
        *(s32 *)(self + 0x2c0) =
            *(s32 *)((const u8 *)requestedPosition + 12) + *(s32 *)(self + 0x2f8);
    }

    (*(void (**)(void *, const void *, s32))(**(u8 ***)(self + 4) + 8))(
        *(void **)(self + 4), self + 0x2b4, *(s32 *)(self + 0x2d8));
    (*(void (**)(void *, void *))(**(u8 ***)self + 0x0c))(
        *(void **)self, *(void **)(self + 4));
    for (i = 0; i < 2; i++) {
        s32 base = 8 + i * 12;
        s32 item;
        for (item = 0; item < 3; item++) {
            void *sprite = *(void **)(self + base + item * 4);
            (*(void (**)(void *, void *))(*(u8 **)sprite + 0x0c))(
                sprite, *(void **)(self + 4));
        }
    }
    (*(void (**)(void *, void *))(**(u8 ***)(self + 0x20) + 0x0c))(
        *(void **)(self + 0x20), *(void **)(self + 4));

    if ((*(u16 *)(self + 0x2ee) & 2) == 0) {
        if ((*(u16 *)(self + 0x2ee) & 1) != 0) {
            if (--*(s16 *)(self + 0x2ea) < 0)
                *(s16 *)(self + 0x2ea) = 0;
            if (*(s16 *)(self + 0x2ea) == 0 && *(s16 *)(self + 0x2de) != 0) {
                *(s16 *)(self + 0x2ea) = 15;
                AuxiliaryCore_AllocateHistorySprite(self, 2);
            }
        }
        if (--*(s16 *)(self + 0x2e6) == 0) {
            *(u16 *)(self + 0x2e6) =
                (u16)((func_020ada8c(genrand_int32() & 0x7ff, 20) + 10) & 0xff);
            AuxiliaryCore_AllocateHistorySprite(self, 1);
        }
        if (--*(s16 *)(self + 0x2e8) < 1) {
            AuxiliaryCore_AllocateHistorySprite(self, 3);
            *(s16 *)(self + 0x2e8) = 6;
        }
    }
    for (i = 0; i < 16; i++) {
        u8 *record = self + 0x24 + i * 0x28;
        if (record[0x27] != 0 && AuxiliaryCoreHistoryRecord_Advance(record) != 0) {
            if (record[0x27] == 2 && *(s16 *)(self + 0x2ec) > 0)
                --*(s16 *)(self + 0x2ec);
            AuxiliaryCoreHistoryRecord_ReleaseSprite(record);
        }
    }
    *(u16 *)(self + 0x2e4) =
        (u16)(*(u16 *)(self + 0x2e4) + (genrand_int32() & 0x7ff) + 0x1000);
    for (i = 0; i < 16; i++) {
        u8 *record = self + 0x24 + i * 0x28;
        if (record[0x27] != 0)
            AuxiliaryCoreHistoryRecord_ProjectSprite(record);
    }
    AuxiliaryCoreSprite_SetVisible(self, *(s16 *)(self + 0x2e2) > 0x40);
    *(u16 *)(self + 0x2ee) &= (u16)~8;

    if (*(s16 *)(self + 0x2de) != 0 &&
        *(s16 *)((u8 *)gTouchPanelManager + 0x44) == 1 &&
        *(s16 *)((u8 *)gTouchPanelManager + 0x3c) != 1) {
        TouchPanelManager_GetPoint(touch, gSceneTouchInitialData);
        touch[1] = *(s16 *)(*(u8 **)(*(u8 **)(self + 4) + 0x34) + 0x2c) - touch[1];
        touch[2] = *(s16 *)(*(u8 **)(*(u8 **)(self + 4) + 0x34) + 0x2e) - touch[2];
        if (func_020adc40((touch[1] * touch[1] + touch[2] * touch[2]) * 0x1000) <
            *(s16 *)(self + 0x2e2) * 0x1c0)
            *(u16 *)(self + 0x2ee) |= 8;
    }
}

static u32 integerSquareRoot(u64 value)
{
    u64 bit = (u64)1 << 62;
    u64 result = 0;
    while (bit > value)
        bit >>= 2;
    while (bit != 0) {
        if (value >= result + bit) {
            value -= result + bit;
            result = (result >> 1) + bit;
        } else {
            result >>= 1;
        }
        bit >>= 2;
    }
    return (u32)result;
}

/* Return the integer magnitude of the two Q12 horizontal vector components. */
s32 VecFx32_HorizontalMagnitude(const void *vector)
{
    const s32 *value = (const s32 *)vector;
    s64 x = value[1];
    s64 y = value[2];
    return (s32)integerSquareRoot((u64)(x * x + y * y));
}

/* Copy parent transform state into a sprite wrapper and run its update slot. */
void AuxiliaryCoreSprite_SetTransform(void *object, const void *position, s32 angle)
{
    u8 *self = (u8 *)object;
    VecFx32Object_Assign(self + 8, position);
    *(s32 *)(self + 0x20) = angle;
    *(u32 *)(self + 0x28) = 0;
    (*(void (**)(void *))(*(u8 **)self + 0x14))(self);
}

/* The concrete wrapper's slot forwards to its shared presentation update. */
void AuxiliaryCoreSprite_UpdateFromParent(void *object, void *parent)
{
    AuxiliaryCoreSprite_TrackParent(object, parent);
}

/* Create a sprite state from descriptor zero or one with retail attach mode. */
void *AuxiliaryCore_GetDescriptor(void *object, s32 descriptorIndex)
{
    u8 *self = (u8 *)object;
    u8 *descriptor = *(u8 **)(self + 0x2a8 + descriptorIndex * 4);
    return GraphicsSpriteGroup_CreateState(
        *(void **)(self + 0x2a4), *(void **)(descriptor + 4),
        *(void **)(descriptor + 8), *(void **)(descriptor + 12),
        descriptorIndex == 0 ? 1 : 2);
}

/* Find the first inactive one of the core's sixteen 0x28-byte records. */
void *AuxiliaryCore_GetSpriteGroup(void *object)
{
    u8 *self = (u8 *)object;
    s32 i;
    for (i = 0; i < 16; i++) {
        u8 *record = self + 0x24 + i * 0x28;
        if (record[0x27] == 0)
            return record;
    }
    return 0;
}

/*
 * Populate an available core history record for idle, bounce, or burst
 * presentation kind. Position and velocity remain Q12 and palette/animation
 * selection uses the retail random distributions.
 */
void func_0206c1b4(void *recordObject, void *coreObject, const void *position,
                   s32 kind, s32 palette)
{
    u8 *record = (u8 *)recordObject;
    u8 *core = (u8 *)coreObject;
    u16 angle = *(u16 *)(core + 0x2e4);

    if (kind == 1) {
        s32 scale;
        s32 direction;
        *(void **)(record + 0) = AuxiliaryCore_GetDescriptor(core, (*(u16 *)(core + 0x2ee) & 4) ? 2 : 1);
        GraphicsSpriteState_SetAnimation(*(void **)(record + 0),
                      (u8)func_020ada8c((u16)genrand_int32(), 19));
        scale = (*(s16 *)(core + 0x2e2) *
                 ((s32)func_020ada8c((u16)genrand_int32(), 10) + 6)) >> 8;
        record[0x26] = (u8)func_020ada8c((u16)genrand_int32(), 3) + 1;
        *(s16 *)((u8 *)*(void **)(record + 0) + 0x28) =
            record[0x26] == 1 ? 0x59 : 0x40;
        direction = (angle >> 4) * 2;
        *(s32 *)(record + 0x18) =
            func_020adae4(data_020c9670[direction] * 2, record[0x26]);
        *(s32 *)(record + 0x1c) =
            func_020adae4(data_020c9670[direction + 1] * 2, record[0x26]);
        VecFx32Object_Assign(record + 4, position);
        *(s32 *)(record + 8) += *(s32 *)(record + 0x18) * scale;
        *(s32 *)(record + 12) += *(s32 *)(record + 0x1c) * scale;
    } else if (kind == 2) {
        *(void **)(record + 0) = AuxiliaryCore_GetDescriptor(core, 0);
        GraphicsSpriteState_SetAnimation(*(void **)(record + 0), 2);
        *(u16 *)((u8 *)*(void **)(record + 0) + 0x24) &= (u16)~2;
        *(s16 *)((u8 *)*(void **)(record + 0) + 0x28) =
            (s16)(0xdd - *(s16 *)(core + 0x2ec));
        *(s32 *)(record + 0x18) = 0;
        *(s32 *)(record + 0x1c) = 0;
        VecFx32Object_Assign(record + 4, *(u8 **)(core + 0x20) + 8);
        *(s16 *)((u8 *)*(void **)(record + 0) + 0x32) = 0xd0;
        *(s16 *)((u8 *)*(void **)(record + 0) + 0x34) = 0xd0;
        ++*(s16 *)(core + 0x2ec);
    } else if (kind == 3) {
        s32 scale;
        s32 direction = (angle >> 4) * 2;
        s32 offset[4] = {0, 0, 0, 0};
        *(void **)(record + 0) = AuxiliaryCore_GetDescriptor(core, 0);
        GraphicsSpriteState_SetAnimation(*(void **)(record + 0), (genrand_int32() & 3) + 13);
        *(s16 *)((u8 *)*(void **)(record + 0) + 0x28) =
            (s16)(func_020ada8c((u16)genrand_int32(), 4) + 0x44);
        scale = (*(s16 *)(core + 0x2e2) *
                 ((s32)func_020ada8c((u16)genrand_int32(), 14) + 14)) >> 8;
        *(s32 *)(record + 0x18) = data_020c9670[direction] * scale;
        *(s32 *)(record + 0x1c) = data_020c9670[direction + 1] * scale;
        offset[1] = *(s32 *)(record + 0x18);
        offset[2] = *(s32 *)(record + 0x1c);
        ((s32 *)record)[1] = ((const s32 *)position)[0] + offset[0];
        ((s32 *)record)[2] = ((const s32 *)position)[1] + offset[1];
        ((s32 *)record)[3] = ((const s32 *)position)[2] + offset[2];
        ((s32 *)record)[4] = ((const s32 *)position)[3] + offset[3];
        *(s32 *)(record + 0x18) >>= 5;
        *(s32 *)(record + 0x1c) >>= 5;
    }
    *((u8 *)*(void **)(record + 0) + 0x3a) = (u8)palette;
    record[0x27] = (u8)kind;
    *(u16 *)(record + 0x24) = 0;
    record[0x26] = 0;
}

/* Allocate and initialize a new core history sprite when capacity permits. */
void AuxiliaryCore_AllocateHistorySprite(void *object, s32 kind)
{
    u8 *self = (u8 *)object;
    void *record = AuxiliaryCore_GetSpriteGroup(self);
    if (record != 0)
        func_0206c1b4(record, self, self + 0x2b4, kind,
                      *(s16 *)(self + 0x304));
}

static s32 multiplyFx32(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

/*
 * Compute a wrapper's orbit target from its parent angle and core amplitude,
 * blend its Q12 position toward that target, refresh direction/distance, and
 * invoke the concrete presentation slot.
 */
void AuxiliaryCoreSprite_TrackParent(void *object, void *parentObject)
{
    u8 *self = (u8 *)object;
    u8 *parent = (u8 *)parentObject;
    u8 *core = *(u8 **)(self + 0x38);
    s32 target[4];
    s32 delta[4];
    s32 angle = ((*(u32 *)(parent + 0x20) + *(u32 *)(self + 0x1c)) & 0xffff) >> 4;
    s32 amplitude = multiplyFx32(*(s32 *)(self + 0x18),
                                 *(s16 *)(core + 0x2e2) << 4);
    s32 vertical = *(s32 *)(core + 0x2fc);
    s32 blend = *(s32 *)(self + 0x2c);
    s32 i;

    VecFx32Object_InitCopy(target, parent + 8);
    target[1] -= multiplyFx32(
        multiplyFx32(data_020c9670[angle * 2 + 1], amplitude),
        0x1000 - vertical);
    target[2] -= multiplyFx32(
        multiplyFx32(data_020c9670[angle * 2], amplitude),
        vertical + 0x1000);
    for (i = 1; i < 4; i++)
        ((s32 *)self)[i + 2] =
            multiplyFx32(((s32 *)self)[i + 2], 0x1000 - blend) +
            multiplyFx32(target[i], blend);
    VecFx32_Subtract(delta, target, self + 8);
    *(s32 *)(self + 0x28) = VecFx32_HorizontalMagnitude(delta);
    *(s32 *)(self + 0x24) = *(s32 *)(self + 0x20);
    if (*(s32 *)(self + 0x28) > 0x1000)
        *(s32 *)(self + 0x20) = func_020ae024(delta[2], delta[1]);
    (*(void (**)(void *))(*(u8 **)self + 0x14))(self);
}

/* Update the concrete core sprite's pulse scale after its shared base update. */
void AuxiliaryCoreSprite_UpdatePulseScale(void *object)
{
    u8 *self = (u8 *)object;
    u8 *core = *(u8 **)(self + 0x38);
    u8 *sprite = *(u8 **)(self + 0x34);
    s32 scale;

    AuxiliaryCoreSprite_UpdatePresentation(self);
    if (*(s16 *)(core + 0x306) != 0) {
        if (*(s32 *)(self + 0x28) <= 0x1000) {
            scale = 0x100;
        } else {
            s32 difference = *(s32 *)(self + 0x20) - *(s32 *)(self + 0x24);
            if (difference < 0)
                difference = -difference;
            if (difference > 0x8000)
                difference = 0x10000 - difference;
            scale = difference < 0x1001 ? *(s32 *)(self + 0x4c) : 0x180;
        }
        *(u32 *)(self + 0x44) = (*(u32 *)(self + 0x44) + 0x1000) & 0xffff;
        scale = (scale + *(s32 *)(self + 0x48) + *(s16 *)(sprite + 0x32) * 3) >> 2;
        scale += ((data_020c9670[(*(u32 *)(self + 0x44) >> 4) * 2] * 8 +
                   0x4000) * 0x10) >> 16;
        scale = (((func_020adae4(*(s16 *)(core + 0x2e2) - 0x100, 4) +
                   0x100) * 0x10000 >> 16) * scale * 0x100) >> 16;
        *(s16 *)(sprite + 0x32) = (s16)scale;
        *(s16 *)(sprite + 0x34) = (s16)scale;
    } else {
        *(s16 *)(sprite + 0x32) = 0x100;
        *(s16 *)(sprite + 0x34) = 0x100;
    }
}

/*
 * Project a concrete core wrapper into camera space, apply its optional
 * 64-frame pixel jitter, hide it outside the DS viewport, and advance or
 * release a completed sprite animation through the owning core.
 */
void AuxiliaryCoreSprite_UpdatePresentation(void *object)
{
    u8 *self = (u8 *)object;
    u8 *sprite = *(u8 **)(self + 0x34);
    const s32 *camera = (const s32 *)ActorMotionAreaFollower_GetPosition(
        data_021052fc + 0x2fbc);
    s32 first = 0;
    s32 second = 0;
    s32 x;
    s32 y;

    if (*(s16 *)(self + 6) != -1) {
        *(s16 *)(self + 6) = (s16)((*(s16 *)(self + 6) + 1) & 0x3f);
        first = *(s16 *)(self + 6) >> 2;
        second = (first + 7) & 0x0f;
    }
    x = ((*(s32 *)(self + 12) - camera[1]) + data_020c46ec[first]) >> 12;
    y = (((*(s32 *)(self + 16) - camera[2]) + data_020c46ec[second]) -
         *(s32 *)(self + 20)) >> 12;
    if ((*(u16 *)(sprite + 0x24) & 4) == 0 && x >= -48 && x < 0x130 &&
        y >= -32 && y < 0xf0) {
        *(s16 *)(sprite + 0x2c) = (s16)x;
        *(s16 *)(sprite + 0x2e) = (s16)y;
        if (*(s32 *)(self + 0x3c) < 0)
            *(s16 *)(sprite + 0x28) = (s16)(0x7fff - y);
        *(u16 *)(sprite + 0x24) &= (u16)~8;
    } else {
        *(u16 *)(sprite + 0x24) |= 8;
    }
    if ((*(u16 *)(sprite + 0x24) & 1) != 0 && *(void **)(self + 0x38) != 0) {
        s32 animation = AuxiliaryCoreSprite_SelectAnimation(*(void **)(self + 0x38), self);
        if (animation == -2) {
            GraphicsSpriteState_SetAnimation(sprite, sprite[0x38]);
            *(u16 *)(sprite + 0x24) &= (u16)~1;
        } else if (animation != -1) {
            GraphicsSpriteState_SetAnimation(sprite, (u8)animation);
        }
    }
}

/* Choose the next animation for one core wrapper from its signed kind. */
s32 AuxiliaryCoreSprite_SelectAnimation(void *core, void *wrapperObject)
{
    const u8 *wrapper = (const u8 *)wrapperObject;
    s32 animation = (s32)func_020ada8c(genrand_int32() & 0x7ff, 6);
    (void)core;
    if (*(s16 *)(wrapper + 4) == 0)
        return -1;
    if (*(s16 *)(wrapper + 4) >= 1 && *(s16 *)(wrapper + 4) <= 8)
        return animation;
    return animation + 6;
}

/* Advance one active core history record and report when it should be freed. */
s32 AuxiliaryCoreHistoryRecord_Advance(void *object)
{
    u8 *record = (u8 *)object;
    if (record[0x27] == 1 || record[0x27] == 3) {
        if (++*(s16 *)(record + 0x24) > 19)
            return 1;
        *(s32 *)(record + 8) += *(s32 *)(record + 0x18);
        *(s32 *)(record + 12) += *(s32 *)(record + 0x1c);
    } else if (record[0x27] == 2) {
        u8 *sprite = *(u8 **)record;
        if ((*(u16 *)(sprite + 0x24) & 1) != 0)
            return 1;
        *(s32 *)(record + 8) += *(s32 *)(record + 0x18);
        *(s32 *)(record + 12) += *(s32 *)(record + 0x1c);
        if (*(s16 *)(sprite + 0x32) > 8) {
            *(s16 *)(sprite + 0x32) -= 6;
            *(s16 *)(sprite + 0x34) -= 6;
        }
    }
    return 0;
}

/* Release a completed history sprite back to its owning group and clear it. */
void AuxiliaryCoreHistoryRecord_ReleaseSprite(void *object)
{
    u8 *record = (u8 *)object;
    void *sprite = *(void **)record;
    GraphicsSpriteGroup_ReleaseState(*(void **)sprite, sprite);
    *(void **)record = 0;
    record[0x27] = 0;
}

/* Project a history sprite into camera space and hide it outside DS bounds. */
void AuxiliaryCoreHistoryRecord_ProjectSprite(void *object)
{
    u8 *record = (u8 *)object;
    u8 *sprite = *(u8 **)record;
    const s32 *camera = (const s32 *)ActorMotionAreaFollower_GetPosition(
        data_021052fc + 0x2fbc);
    s32 x = (*(s32 *)(record + 8) - camera[1]) >> 12;
    s32 y = ((*(s32 *)(record + 12) - camera[2]) - *(s32 *)(record + 16)) >> 12;
    if (x > -33 && x < 0x120 && y > -33 && y < 0x100) {
        *(u16 *)(sprite + 0x24) &= (u16)~8;
        *(s16 *)(sprite + 0x2c) = (s16)x;
        *(s16 *)(sprite + 0x2e) = (s16)y;
        if (record[0x27] == 2)
            *(s16 *)(sprite + 0x28) = (s16)(0x7fff - y);
    } else {
        *(u16 *)(sprite + 0x24) |= 8;
    }
}

/* Toggle visibility for every sprite owned by a 0x308-byte core object. */
void AuxiliaryCore_SetAllSpritesVisible(void *object, s32 visible)
{
    u8 *sprite = *(u8 **)((u8 *)object + 0x34);
    if (visible != 0)
        *(u16 *)(sprite + 0x24) &= (u16)~4;
    else
        *(u16 *)(sprite + 0x24) |= 4;
}

/* Apply visibility to all eight core sprites and retain the requested state. */
void AuxiliaryCoreSprite_SetVisible(void *object, s32 visible)
{
    u8 *self = (u8 *)object;
    s32 group;
    s32 item;
    AuxiliaryCore_SetAllSpritesVisible(*(void **)(self + 0), visible);
    AuxiliaryCore_SetAllSpritesVisible(*(void **)(self + 4), visible);
    for (group = 0; group < 2; group++)
        for (item = 0; item < 3; item++)
            AuxiliaryCore_SetAllSpritesVisible(*(void **)(self + 8 + group * 12 + item * 4), visible);
    AuxiliaryCore_SetAllSpritesVisible(*(void **)(self + 0x20), visible);
    *(s16 *)(self + 0x2de) = (s16)visible;
}

/* Select auxiliary presentation variant 30 and palette band five. */
void AuxiliaryInteraction_SelectPresentationVariant(void *object)
{
    u8 *self = (u8 *)object;
    *(u16 *)(self + 0x24) = (*(u16 *)(self + 0x24) & 0x03c0) | 0x141e;
}

typedef struct AuxiliaryEffectConfig {
    void *group;
    void *resource0;
    void *resource1;
    void *resource2;
    s32 first[4];
    s32 second[4];
    s32 lifetime;
    s32 mode;
} AuxiliaryEffectConfig;

static void initializeEffectConfig(AuxiliaryEffectConfig *config, void *group,
                                   const u8 *descriptor,
                                   const void *position)
{
    TimedSpriteConfig_InitTracks(config);
    config->group = group;
    config->resource0 = *(void **)(descriptor + 4);
    config->resource1 = *(void **)(descriptor + 8);
    config->resource2 = *(void **)(descriptor + 12);
    VecFx32Object_Assign(config->first, position);
    config->second[1] = 0;
    config->second[2] = 0;
    config->lifetime = 60;
    config->mode = 2;
}

static void updateOwnedEffect(void **field, s32 height)
{
    u8 *effect = (u8 *)*field;
    if (effect == 0)
        return;
    *(s32 *)(effect + 0x30) = height;
    if ((*(s32 (**)(void *))(*(u8 **)effect + 0x0c))(effect) != 0) {
        (*(void (**)(void *))(*(u8 **)effect + 4))(effect);
        *field = 0;
    }
}

/* Return the actor owned by one type-specific manager attachment record. */
void *ActorAttachmentManager_GetRecord(void *object, s32 index)
{
    u8 *self = (u8 *)object;
    return *(void **)(*(u8 **)(self + index * 4) + 0x1d0);
}

/* Pop the next queued manager event from its fixed subtable. */
void *ActorAttachmentManager_GetEventQueue(void *object)
{
    return ActorAttachmentEventQueue_GetList(*(void **)((u8 *)object + 0xc4));
}

/* Advance the packed four-bit manager queue cursor, returning -1 between ticks. */
s32 ActorAttachmentCounter_Advance(void *object)
{
    u8 *queue = (u8 *)object;
    u32 state = *(u32 *)(queue + 0);
    if ((state >> 4) != 0) {
        *(u32 *)(queue + 0) = state - 0x10;
        return -1;
    }
    *(u32 *)(queue + 0) = state + *(u32 *)(queue + 4);
    return (s32)(state & 0x0f);
}

/* Pop the last event from a ten-entry, 12-byte event stack. */
void *ActorAttachmentEventQueue_GetList(void *object)
{
    u8 *queue = (u8 *)object;
    s32 count = *(s32 *)(queue + 0x78);
    if (count == 0)
        return 0;
    --count;
    *(s32 *)(queue + 0x78) = count;
    return queue + count * 12;
}

/* Count active type-zero manager records that currently own runtime state. */
s32 ActorAttachmentManager_CountType0Records(void *object)
{
    u8 *self = (u8 *)object;
    s32 count = 0;
    s32 i;
    for (i = 0; i < *(s32 *)(self + 0x84); i++) {
        u8 *record = *(u8 **)(self + i * 4);
        if (*(s32 *)(record + 8) == 0 && *(void **)(record + 0x18) != 0)
            count++;
    }
    return count;
}

/* Copy one six-word attachment event between queue storage and stack storage. */
void ActorAttachmentEvent_Copy(void *destination, const void *source)
{
    u32 *out = (u32 *)destination;
    const u32 *in = (const u32 *)source;
    s32 i;
    for (i = 0; i < 6; i++)
        out[i] = in[i];
}

/* Report whether an intrusive event list has an item and reset its cursor. */
s32 ActorAttachmentEventList_HasCurrent(void *object)
{
    u8 *list = (u8 *)object;
    if (*(void **)(list + 4) == 0)
        return 0;
    *(void **)(list + 4) = *(void **)(list + 8);
    return 1;
}

/* Return the event at the intrusive list's current cursor. */
void *ActorAttachmentEventList_GetCurrent(void *object)
{
    return *(void **)((u8 *)object + 4);
}

/*
 * Insert a new event node after the intrusive list cursor and return it. The
 * list owns the 0x20-byte node; its first 24 bytes remain caller-populated.
 */
void *ActorAttachmentEventList_GetCurrentNode(void *object)
{
    u8 *list = (u8 *)object;
    u8 *current = *(u8 **)(list + 4);
    u8 *next = current != 0 ? *(u8 **)(current + 0x1c) : 0;
    u8 *node = (u8 *)Heap_Alloc(0x20, data_020e5730, 4, &gHeapContext);

    if (current == 0) {
        *(void **)(node + 0x18) = 0;
        *(void **)(node + 0x1c) = 0;
        *(void **)(list + 4) = node;
        *(void **)(list + 8) = node;
        *(void **)(list + 12) = node;
    } else {
        *(void **)(node + 0x18) = current;
        *(void **)(node + 0x1c) = next;
        *(void **)(list + 4) = node;
        *(void **)(current + 0x1c) = node;
        if (next != 0)
            *(void **)(next + 0x18) = node;
        else
            *(void **)(list + 12) = node;
    }
    ++*(s32 *)(list + 0);
    return node;
}

/* Insert a six-word manager event in ascending priority order. */
void ActorAttachmentEventList_InsertByPriority(void *object, const void *eventObject)
{
    u8 *queue = (u8 *)object;
    u8 *list = *(u8 **)queue;
    const u32 *event = (const u32 *)eventObject;
    u8 *node = 0;

    if (!ActorAttachmentEventList_HasCurrent(list)) {
        node = (u8 *)ActorAttachmentEventList_GetCurrentNode(list);
    } else {
        for (;;) {
            u8 *current = (u8 *)ActorAttachmentEventList_GetCurrent(list);
            if (*(u32 *)(current + 8) > event[2]) {
                u8 *previous = *(u8 **)(current + 0x18);
                node = (u8 *)Heap_Alloc(0x20, data_020e5730, 4, &gHeapContext);
                *(void **)(node + 0x18) = previous;
                *(void **)(node + 0x1c) = current;
                *(void **)(list + 4) = node;
                *(void **)(current + 0x18) = node;
                if (previous != 0)
                    *(void **)(previous + 0x1c) = node;
                else
                    *(void **)(list + 8) = node;
                ++*(s32 *)(list + 0);
                break;
            }
            if (*(void **)(current + 0x1c) == 0) {
                node = (u8 *)ActorAttachmentEventList_GetCurrentNode(list);
                break;
            }
            *(void **)(list + 4) = *(void **)(current + 0x1c);
        }
    }
    if (node != 0)
        ActorAttachmentEvent_Copy(node, event);
    ++*(s32 *)(queue + 4);
}

/* Remove and free the current intrusive-list event, preserving its cursor. */
s32 ActorAttachmentEventList_RemoveCurrent(void *object)
{
    u8 *list = (u8 *)object;
    u8 *node = *(u8 **)(list + 4);
    u8 *cursor;
    u8 *next;
    u8 *previous;
    if (node == 0)
        return 0;
    next = *(u8 **)(node + 0x1c);
    previous = *(u8 **)(node + 0x18);
    *(u8 **)(list + 4) = next;
    if (next == 0) {
        *(u8 **)(list + 4) = previous;
        if (previous != 0)
            next = 0;
    } else {
        *(u8 **)(next + 0x18) = previous;
        if (previous != 0)
            next = *(u8 **)(list + 4);
    }
    if (previous != 0)
        *(u8 **)(previous + 0x1c) = next;
    cursor = *(u8 **)(list + 4);
    if (cursor == 0) {
        *(void **)(list + 8) = 0;
        *(void **)(list + 12) = 0;
    } else {
        if (*(void **)(cursor + 0x18) == 0)
            *(void **)(list + 8) = cursor;
        if (*(void **)(cursor + 0x1c) == 0)
            *(void **)(list + 12) = cursor;
    }
    Heap_Free(node);
    --*(s32 *)(list + 0);
    return 1;
}

/* Pop the oldest priority event into caller-owned six-word storage. */
s32 ActorAttachmentEventList_PopOldest(void *object, void *event)
{
    u8 *queue = (u8 *)object;
    void *list = *(void **)(queue + 0);
    void *node;
    if (!ActorAttachmentEventList_HasCurrent(list))
        return 0;
    node = ActorAttachmentEventList_GetCurrent(list);
    ActorAttachmentEvent_Copy(event, node);
    ActorAttachmentEventList_RemoveCurrent(list);
    --*(s32 *)(queue + 4);
    return 1;
}

/* Append a three-word presentation event to the manager's fixed stack. */
void ActorAttachmentEventQueue_Append(void *object, const void *event)
{
    u8 *queue = (u8 *)object;
    s32 count = *(s32 *)(queue + 0x78);
    if (count >= 10)
        return;
    ((u32 *)queue)[count * 3 + 0] = ((const u32 *)event)[0];
    ((u32 *)queue)[count * 3 + 1] = ((const u32 *)event)[1];
    ((u32 *)queue)[count * 3 + 2] = ((const u32 *)event)[2];
    *(s32 *)(queue + 0x78) = count + 1;
}

/* Return whether a type-zero record's owner uses a reward-bearing subtype. */
s32 ActorAttachmentRecord_HasRewardSubtype(void *object)
{
    u8 subtype = *(u8 *)(*(u8 **)((u8 *)object + 0x1d0) + 0x27e);
    u32 index = (u32)(u8)(subtype - 1);
    return index < 32 && ((0x90000007u & (1u << index)) != 0);
}

/* Count reward-bearing live type-zero attachments. */
s32 ActorAttachmentManager_CountRewardRecords(void *object)
{
    u8 *manager = (u8 *)object;
    s32 count = 0;
    s32 i;
    for (i = 0; i < *(s32 *)(manager + 0x84); i++) {
        u8 *record = *(u8 **)(manager + i * 4);
        if (*(s32 *)(record + 8) == 0 && ActorAttachmentRecord_HasRewardSubtype(record))
            count++;
    }
    return count;
}

/* Initialize and retain one manager reward descriptor. */
void ActorAttachmentReward_Init(void *object, u16 value)
{
    u8 *manager = (u8 *)object;
    s32 count = *(s32 *)(manager + 0xc8);
    ActorDescriptor_InitRange(*(void **)(manager + 0xcc + count * 4), value, 1);
    *(s32 *)(manager + 0xc8) = count + 1;
}

/* Choose one record reward using its two weighted descriptor alternatives. */
s32 ActorAttachmentRecord_SelectWeightedReward(void *object, s32 *fallback)
{
    u8 *record = (u8 *)object;
    u32 random = genrand_int32() % 100;
    if (random < *(u32 *)(record + 0x20c)) {
        *fallback = 0;
        return *(s32 *)(record + 0x204);
    }
    if (random < *(u32 *)(record + 0x20c) + *(u32 *)(record + 0x218)) {
        *fallback = 0;
        return *(s32 *)(record + 0x210);
    }
    *fallback = 1;
    return *(s32 *)(record + 0x1fc);
}

/* Return the selected attachment count across the manager's two indices. */
s32 ActorAttachmentManager_CountSelectedRecords(void *object)
{
    u8 *manager = (u8 *)object;
    s32 total = 0;
    s32 index = *(s32 *)(manager + 0x8c);
    if (index >= 0)
        total = *(s32 *)(*(u8 **)(manager + index * 4) + 0x18);
    index = *(s32 *)(manager + 0x90);
    if (index >= 0)
        total += *(s32 *)(*(u8 **)(manager + index * 4) + 0x18);
    return total;
}

/* Sum the live quantities held by every type-zero attachment. */
s32 ActorAttachmentManager_SumLiveQuantities(void *object)
{
    u8 *manager = (u8 *)object;
    s32 total = 0;
    s32 i;
    for (i = 0; i < *(s32 *)(manager + 0x84); i++) {
        u8 *record = *(u8 **)(manager + i * 4);
        if (*(s32 *)(record + 8) == 0 && *(s32 *)(record + 0x18) != 0)
            total += *(s32 *)(record + 0x18);
    }
    return total;
}

/* Consume pending record events and select terminal manager phases. */
s32 ActorAttachmentManager_ProcessPendingEvents(void *object)
{
    u8 *manager = (u8 *)object;
    u32 event[6];
    s32 i;
    if (*(s32 *)(manager + 0xa0) != 0)
        return *(s32 *)(manager + 0xa0);
    while (ActorAttachmentEventList_PopOldest(*(void **)(manager + 0x94), event)) {
        for (i = 0; i < *(s32 *)(manager + 0x84); i++) {
            u8 *record = *(u8 **)(manager + i * 4);
            if ((event[4] & (1u << (i & 0xff))) != 0 &&
                *(void **)(record + 0x18) != 0 &&
                (*(s32 (**)(void *, void *))(*(u8 **)record + 0x1c))(record, event)) {
                if (*(s32 *)(record + 8) == 1)
                    *(s32 *)(manager + 0xa0) = 3;
                else if (*(s32 *)(record + 8) == 2 &&
                         *(s32 *)(manager + 0x8c) < 0)
                    *(s32 *)(manager + 0xa0) = 4;
            }
        }
    }
    return *(s32 *)(manager + 0xa0);
}

/* Finalize records and select weighted rewards for the teardown presentation. */
void ActorAttachmentManager_FinalizeRewards(void *object)
{
    u8 *manager = (u8 *)object;
    u8 *candidates[20];
    s32 candidateCount = 0;
    s16 occupied = 0;
    s32 selectionCount;
    s32 i;

    for (i = 0; i < *(s32 *)(manager + 0x84); i++) {
        u8 *record = *(u8 **)(manager + i * 4);
        (*(void (**)(void *))(*(u8 **)record + 0x10))(record);
    }
    *(s32 *)(manager + 0xc8) = 0;
    *(s32 *)(manager + 0xb0) = 0;
    for (i = 0; i < *(s32 *)(manager + 0x84); i++) {
        u8 *record = *(u8 **)(manager + i * 4);
        if (*(s32 *)(record + 8) != 0)
            continue;
        if (*(void **)(record + 0x18) == 0) {
            u8 *descriptor;
            *(s32 *)(manager + 0xb0) += *(s32 *)(record + 0x244);
            candidates[candidateCount++] = record;
            descriptor = (u8 *)(*(void *(**)(void *))
                (*(u8 **)record + 0x14))(record);
            if (*(s16 *)(descriptor + 4) != 0)
                ActorAttachmentReward_Init(manager, *(u16 *)descriptor);
        } else {
            occupied++;
        }
    }
    *(s16 *)((u8 *)gGameWork + 0x94) = occupied;
    if (ActorAttachmentManager_CountRewardRecords(manager) != 0 || candidateCount == 0)
        return;

    selectionCount = candidateCount;
    if (*(s32 *)(manager + 0x90) >= 0) {
        u32 chance = candidateCount < 5 ? data_020c46c8[candidateCount] : 100;
        if (genrand_int32() % 100 < chance)
            selectionCount++;
    }
    if (selectionCount == 2 || selectionCount == 3) {
        for (i = 0; i < selectionCount - 1; i++) {
            s32 fallback;
            s32 value = ActorAttachmentRecord_SelectWeightedReward(candidates[genrand_int32() % candidateCount],
                                      &fallback);
            if (!fallback)
                ActorAttachmentReward_Init(manager, (u16)value);
            else
                *(s32 *)(manager + 0xb0) += value;
        }
    } else if (selectionCount > 3) {
        for (i = 0; i < 2; i++) {
            s32 fallback;
            s32 value = ActorAttachmentRecord_SelectWeightedReward(candidates[genrand_int32() % candidateCount],
                                      &fallback);
            if (!fallback)
                ActorAttachmentReward_Init(manager, (u16)value);
            else
                *(s32 *)(manager + 0xb0) += value;
        }
        for (i = 0; i < selectionCount - 3; i++)
            *(s32 *)(manager + 0xb0) +=
                *(s32 *)(candidates[genrand_int32() % candidateCount] + 0x1fc);
    }
}

/* Drain one tenth of a record's pending amount every thirty frames. */
void ActorAttachmentRecord_DrainPendingAmount(void *object)
{
    u8 *record = (u8 *)object;
    s32 currency;
    if (*(s32 *)(record + 0x18) == 0)
        return;
    if (++*(s32 *)(record + 0x1dc) > 29) {
        s32 amount = *(s32 *)(record + 0x1d8);
        s32 drain = amount / 10;
        currency = GamePhaseCurrencyHud_GetCurrency(gLupyContext);
        if (drain > 0) {
            u32 event[3] = {1, (u32)drain, 0};
            currency -= drain;
            if (currency < 0)
                currency = 0;
            GamePhaseCurrencyHud_SetCurrency(gLupyContext, currency);
            ActorAttachmentEventQueue_Append(*(void **)(*(u8 **)(record + 4) + 0xc4), event);
        }
        *(s32 *)(record + 0x1d8) = amount % 10;
        *(s32 *)(record + 0x1dc) = 0;
    }
    currency = GamePhaseCurrencyHud_GetCurrency(gLupyContext);
    *(s32 *)(record + 0x18) = currency * 10;
    if ((*(u32 *)(*(u8 **)(record + 0x1d0) + 0xd0) & 0x20000) != 0 &&
        *(s32 *)(record + 0x18) == 0)
        *(s32 *)(record + 0x18) = 1;
}

/* Insert an attachment event into the manager's priority queue. */
void ActorAttachmentManager_QueueEvent(void *object, const void *event)
{
    ActorAttachmentEventList_InsertByPriority(*(void **)((u8 *)object + 0x94), event);
}

/* Emit each paced type-two record event while its attachment remains live. */
void ActorAttachmentRecord_EmitPacedEvents(void *object)
{
    u8 *record = (u8 *)object;
    if ((*(u32 *)(record + 0x10) & 2) != 0 ||
        GameWork_TestFlag(gGameWork, 0x44b) != 0 ||
        *(void **)(record + 0x18) == 0)
        return;
    for (;;) {
        u32 event[6];
        s32 cursor = ActorAttachmentCounter_Advance(record + 0x1c8);
        u32 mask = ~(1u << (*(u32 *)(record + 0x0c) & 0xff));
        s32 selected = *(s32 *)(*(u8 **)(record + 4) + 0x90);
        if (cursor < 0)
            break;
        if (selected >= 0)
            mask &= ~(1u << ((u32)selected & 0xff));
        event[0] = 1;
        event[1] = 0;
        event[2] = (u32)cursor;
        event[3] = (u32)record;
        event[4] = mask;
        event[5] = *(u32 *)(record + 0x1c);
        ActorAttachmentManager_QueueEvent(*(void **)(record + 4), event);
    }
}

/* Retail type-two attachment post-update hook; this variant is intentionally empty. */
void ActorAttachmentRecord_PostUpdateType2NoOp(void *object)
{
    (void)object;
}

/* Clear a caller-owned byte range, matching the SDK-local zero-fill helper. */
void Memory_ClearBytes(void *destination, u32 size)
{
    u8 *bytes = (u8 *)destination;
    u32 i;
    if (bytes == 0 || size == 0)
        return;
    for (i = 0; i < size; i++)
        bytes[i] = 0;
}

/* Retail VecFx32 terminal hook; vectors own no resources. */
void VecFx32_TerminateNoOp(void *vector)
{
    (void)vector;
}

/*
 * Destroy an auxiliary interaction and every object it owns. Presentation
 * pointers, the rotating core, sprite group, and attachment manager are
 * exclusively owned by this resource; callbacks observe terminal actor state
 * before the manager storage is released. The returned pointer remains valid
 * only for the caller to free the outer allocation.
 */
void *AuxiliaryInteraction_Destroy(void *object)
{
    u8 *self = (u8 *)object;
    s32 terminalPosition[4];
    s32 i;


    for (i = 0; i < 3; i++) {
        void *presentation = *(void **)(self + 0x28 + i * 4);
        if (presentation != 0)
            (*(void (**)(void *))(*(u8 **)presentation + 4))(presentation);
    }
    for (i = 0; i < 3; i++) {
        void *presentation = *(void **)(self + 0x34 + i * 4);
        if (presentation != 0)
            (*(void (**)(void *))(*(u8 **)presentation + 4))(presentation);
    }
    if (*(void **)(self + 0x14) != 0) {
        AuxiliaryCore_Destroy(*(void **)(self + 0x14));
        Heap_Free(*(void **)(self + 0x14));
    }
    func_02074058(*(void **)(self + 0x0c));
    func_02074330(data_020f4e14, *(void **)(self + 0x0c));
    for (i = 0; i < 3; i++) {
        void *presentation = *(void **)(self + i * 4);
        if (presentation != 0)
            (*(void (**)(void *))(*(u8 **)presentation + 4))(presentation);
    }
    if ((*(u32 *)(self + 0x20) & 0x40000) == 0) {
        u8 *manager = *(u8 **)(self + 0x44);
        s32 count;
        AuxiliaryInteraction_BuildTerminalVector(terminalPosition, self);
        count = *(s32 *)(manager + 0x84);
        for (i = 0; i < count; i++) {
            u8 *actor = (u8 *)ActorAttachmentManager_GetRecord(manager, i);
            if ((*(s32 (**)(void *))(*(u8 **)actor + 0xa8))(actor) != 0)
                (*(void (**)(void *, void *, s32))(*(u8 **)actor + 0x80))(
                    actor, terminalPosition, 0);
        }
        VecFx32_TerminateNoOp(terminalPosition);
    }
    if (*(void **)(self + 0x44) != 0) {
        ActorAttachmentManager_Destroy(*(void **)(self + 0x44));
        Heap_Free(*(void **)(self + 0x44));
    }
    return self;
}

/*
 * Release the rotating core's owned sprite presentations. Its embedded
 * vector and particle records contain no separately owned storage, so their
 * retail terminal hooks have no observable effect beyond orderly teardown.
 */
void AuxiliaryCore_Destroy(void *object)
{
    u8 *core = (u8 *)object;
    s32 row;
    s32 column;
    void *presentation;

    presentation = *(void **)(core + 0);
    if (presentation != 0)
        (*(void (**)(void *))(*(u8 **)presentation + 4))(presentation);
    presentation = *(void **)(core + 4);
    if (presentation != 0)
        (*(void (**)(void *))(*(u8 **)presentation + 4))(presentation);
    for (row = 0; row < 2; row++) {
        for (column = 0; column < 3; column++) {
            presentation = *(void **)(core + 8 + row * 12 + column * 4);
            if (presentation != 0)
                (*(void (**)(void *))(*(u8 **)presentation + 4))(presentation);
        }
    }
    presentation = *(void **)(core + 0x20);
    if (presentation != 0)
        (*(void (**)(void *))(*(u8 **)presentation + 4))(presentation);
    VecFx32_TerminateNoOp(core + 0x2c4);
    VecFx32_TerminateNoOp(core + 0x2b4);
}

/*
 * Destroy an attachment manager. Records and reward descriptors are owned by
 * the manager; queued event nodes are drained before their list and wrapper
 * allocations are freed. No actor-owned storage is released here.
 */
void ActorAttachmentManager_Destroy(void *object)
{
    u8 *manager = (u8 *)object;
    s32 i;
    for (i = 0; i < *(s32 *)(manager + 0x84); i++) {
        void *record = *(void **)(manager + i * 4);
        if (record != 0)
            (*(void (**)(void *))(*(u8 **)record + 8))(record);
    }
    if (*(void **)(manager + 0x94) != 0) {
        u8 *queue = *(u8 **)(manager + 0x94);
        void *list = *(void **)(queue + 0);
        if (list != 0) {
            while (ActorAttachmentEventList_RemoveCurrent(list) != 0) {
            }
            Heap_Free(list);
        }
        Heap_Free(queue);
    }
    if (*(void **)(manager + 0xc4) != 0)
        Heap_Free(*(void **)(manager + 0xc4));
    for (i = 0; i < 20; i++)
        Heap_Free(*(void **)(manager + 0xcc + i * 4));
}

/* Delete a plain attachment record whose subtype owns no child resources. */
void *ActorAttachmentRecord_DeletePlain(void *object)
{
    Heap_Free(object);
    return object;
}

/* Delete a plain manager queue node and return its former address. */
void *ActorAttachmentRecord_DeleteType2(void *object)
{
    Heap_Free(object);
    return object;
}

/* Retail type-one record update hook; this variant has no per-frame work. */
void ActorAttachmentRecord_UpdateType1NoOp(void *object)
{
    (void)object;
}

/* Retail type-one reward accessor; this record never owns a descriptor. */
void *ActorAttachmentRecord_DeleteType1(void *object)
{
    (void)object;
    return 0;
}

/* Retail type-two record update hook; this variant has no per-frame work. */
void ActorAttachmentRecord_UpdateType2NoOp(void *object)
{
    (void)object;
}

/*
 * Delete a sprite-backed attachment record. The sprite state at +0x34 is
 * borrowed from its group; teardown releases that state, terminates the
 * embedded vector, and then frees the record allocation.
 */
void *AuxiliaryCoreSprite_Delete(void *object)
{
    u8 *record = (u8 *)object;
    void *state = *(void **)(record + 0x34);
    *(const void **)(record + 0) = data_020e57c4;
    func_02074038(*(void **)state, state);
    VecFx32_TerminateNoOp(record + 8);
    Heap_Free(record);
    return object;
}

/* Build the terrain-biased world position passed to terminal callbacks. */
void AuxiliaryInteraction_BuildTerminalVector(
    void *outputPosition, void *interactionPointer)
{
    u8 *interaction = (u8 *)interactionPointer;
    u8 *actor = *(u8 **)(interaction + 0x10);
    VecFx32Object_InitCopy(outputPosition, actor + 0x28);
    Actor_ApplyTerrainNeighborAxisBias(actor, outputPosition);
}

static void releaseOwnedPresentation(void **field)
{
    void *presentation = *field;
    if (presentation != 0)
        (*(void (**)(void *))(*(u8 **)presentation + 4))(presentation);
    *field = 0;
}

/*
 * Finalize an auxiliary interaction, hand terminal state to every attached
 * actor, spawn its recovered reward presentation, and publish the resulting
 * counters. All positions remain Q12 and all counts retain retail ownership.
 */
void AuxiliaryInteraction_FinalizeResult(void *object, s32 requestedResult)
{
    u8 *self = (u8 *)object;
    u8 *manager = *(u8 **)(self + 0x44);
    u8 *owner = *(u8 **)(self + 0x10);
    s32 attachmentCount = *(s32 *)(manager + 0x84);
    s32 terminalPosition[4];
    s32 rewardPosition[4];
    s16 emptyTypeTwoCount = 0;
    s32 typeOneEmpty = -1;
    s32 typeSevenEmpty = -1;
    s32 typeSevenState = 0;
    s32 result;
    s32 i;

    *(s16 *)(self + 0x1a) = 2;
    *(u32 *)(self + 0x20) &= ~2u;
    *(s16 *)(self + 0x1c) = 0;
    releaseOwnedPresentation((void **)(self + 0x38));
    releaseOwnedPresentation((void **)(self + 0x3c));
    releaseOwnedPresentation((void **)(self + 0x34));
    for (i = 0; i < 3; i++)
        releaseOwnedPresentation((void **)(self + 0x28 + i * 4));

    if (requestedResult == -1)
        result = ActorAttachmentManager_CountSelectedRecords(manager) > 0 && ActorAttachmentManager_SumLiveQuantities(manager) != 0;
    else
        result = requestedResult == 1;

    AuxiliaryInteraction_BuildTerminalVector(terminalPosition, self);
    for (i = 0; i < attachmentCount; i++) {
        u8 *actor = (u8 *)ActorAttachmentManager_GetRecord(manager, i);
        if (actor[0x4d] == 1) {
            typeOneEmpty = GamePhaseCurrencyHud_GetCurrency(gLupyContext) == 0;
        } else if (actor[0x4d] == 2) {
            if (*(s32 *)(actor + 0x1fc) == 0) {
                emptyTypeTwoCount++;
            } else {
                u16 descriptorFlags =
                    *(u16 *)(data_020e8380 + *(u16 *)(actor + 0x4e) * 0x30 + 0x26);
                if ((descriptorFlags & 1) != 0) {
                    void *effect = Heap_Alloc(0x14, data_020e5828, 4, &gHeapContext);
                    if (effect != 0)
                        func_02025120(effect, actor, *(s32 *)(actor + 0x1fc),
                                     descriptorFlags >> 1, 60);
                }
            }
        } else if (actor[0x4d] == 7) {
            typeSevenEmpty = *(s32 *)(actor + 0x1fc) == 0;
            if (*(s16 *)(actor + 0xe4) == 1)
                typeSevenState = 1;
        }
        (*(void (**)(void *, void *, s32))(*(u8 **)actor + 0x80))(
            actor, terminalPosition, result);
    }
    if (!GameWork_TestFlag(gGameWork, 0x417)) {
        if (typeOneEmpty >= 0) {
            if (typeOneEmpty) {
                AuxiliaryInteraction_PlaySpatialSound(self, 0x2d);
            } else if (!result) {
                AuxiliaryInteraction_PlaySpatialSound(self, 0x18);
            }
        }
        if (typeSevenState) {
            u16 base = (u16)*(s16 *)((u8 *)gGameWork + 0x1d0);
            AuxiliaryInteraction_PlaySpatialSound(self, (u16)(base | (typeSevenEmpty ? 5 : 2)));
        }
    }
    VecFx32Object_InitCopy(rewardPosition, owner + 0x18);
    rewardPosition[3] += 0x14000;
    for (i = 0; i < *(s32 *)(manager + 0xc8); i++) {
        u8 descriptor[0x24];
        u8 *source = *(u8 **)(manager + 0xcc + i * 4);
        s32 j;
        for (j = 0; j < 0x10; j++)
            descriptor[j] = source[j];
        ActorAttachmentDescriptor_CopyPayload(descriptor + 0x10, source + 0x10);
        ActorAttachmentDescriptor_CopyPayload(descriptor + 0x18, source + 0x18);
        *(u32 *)(descriptor + 0x20) = *(u32 *)(source + 0x20);
        ActorDescriptor_SetRangeEnd(descriptor, 1);
        for (j = 0; j < *(u16 *)(descriptor + 4); j++)
            func_0204f894(rewardPosition, descriptor, 300);
    }
    if (*(s32 *)(manager + 0xb0) != 0) {
        s32 amount = *(s32 *)(manager + 0xb0);
        if (amount <= 1000) {
            s32 scale = func_0203adc4();
            if (scale < 1)
                scale = 1;
            func_0204e3f4(0xf0, (s16)scale, rewardPosition);
        } else {
            func_0204e628(0xf0, (s16)amount, rewardPosition);
        }
    }
    *(u16 *)(*(u8 **)(self + 0x14) + 0x2ee) |= 2;
    if (owner[0x4d] == 1)
        *(s16 *)((u8 *)gGameWork + 0x184) = emptyTypeTwoCount;
    else if (owner == *(u8 **)(data_021052fc + 0x2ea8))
        *(s16 *)((u8 *)gGameWork + 0x186) = emptyTypeTwoCount;
    func_0202de90(func_02007f0c(data_021052fc, 1));
    *(u32 *)(self + 0x20) |= 0x40000;
    VecFx32_TerminateNoOp(rewardPosition);
    VecFx32_TerminateNoOp(terminalPosition);
}

/* Apply the core scale and optional secondary scale to its two halfwords. */
void AuxiliaryCore_ApplyScale(void *object, s32 scale, s32 secondary)
{
    u8 *core = (u8 *)object;
    *(s16 *)(core + 0x2e0) = (s16)scale;
    if (secondary != -1)
        *(s16 *)(core + 0x2e2) = (s16)secondary;
}

/*
 * Advance every live manager attachment, consume queued pair work, maintain
 * its idle timeout, run post-update slots, and return the manager phase.
 */
s32 ActorAttachmentManager_Update(void *object)
{
    u8 *self = (u8 *)object;
    s32 i;

    if (*(s32 *)(self + 0xa0) != 0)
        return *(s32 *)(self + 0xa0);
    if ((*(u32 *)(self + 0x80) & 1) == 0) {
        while (ActorAttachmentCounter_Advance(self + 0x98) >= 0) {
            for (i = 0; i < *(s32 *)(self + 0x84); i++) {
                u8 *record = *(u8 **)(self + i * 4);
                if (*(void **)(record + 0x18) != 0)
                    (*(void (**)(void *))(*(u8 **)record + 0x0c))(record);
            }
            if (ActorAttachmentManager_ProcessPendingEvents(self) != 0) {
                ActorAttachmentManager_FinalizeRewards(self);
                break;
            }
        }
    }
    if (*(s32 *)(self + 0xa0) == 0 && ActorAttachmentManager_CountType0Records(self) == 0) {
        if (--*(s32 *)(self + 0xac) == 0) {
            *(s32 *)(self + 0xa0) = 1;
            ActorAttachmentManager_FinalizeRewards(self);
        }
    }
    for (i = 0; i < *(s32 *)(self + 0x84); i++) {
        u8 *record = *(u8 **)(self + i * 4);
        if (*(void **)(record + 0x18) != 0)
            (*(void (**)(void *))(*(u8 **)record + 0x18))(record);
    }
    ++*(s32 *)(self + 0xa4);
    if (*(s32 *)(self + 0xa4) >= *(s32 *)(self + 0xa8)) {
        *(s32 *)(self + 0xa0) = 2;
        ActorAttachmentManager_FinalizeRewards(self);
    }
    return *(s32 *)(self + 0xa0);
}

/*
 * Advance the complete auxiliary-resource state machine. This consumes
 * attachment-manager events, maintains transient timed sprites, handles touch
 * presentation modes, synchronizes every attachment position, and returns
 * movement mode zero (active), one (finishing), or two (terminal). Timers are
 * frames, positions are Q12, and all allocation/manager/audio calls retain
 * their retail ownership and observable effects.
 */
s32 AuxiliaryInteraction_RunSelectedSequence(void *object, s32 selectedIndex)
{
    u8 *self = (u8 *)object;
    u8 *owner = *(u8 **)(self + 0x10);
    u8 *core = *(u8 **)(self + 0x14);
    u8 *manager = *(u8 **)(self + 0x44);
    s32 maximum;
    s32 coreHeight;
    s32 i;

    *(u32 *)(self + 0x20) &= ~2u;
    maximum = 0x100;
    if (owner[0x4d] == 1) {
        selectedIndex = *(s32 *)(manager + 0x90);
        if (selectedIndex != -1) {
            *(u16 *)(core + 0x2ee) |= 4;
            maximum = 0x120;
        } else {
            *(u16 *)(core + 0x2ee) &= (u16)~4;
        }
    } else {
        *(u16 *)(core + 0x2ee) &= (u16)~4;
    }

    switch (*(s16 *)(self + 0x1a)) {
    case 0:
        *(s16 *)(self + 0x18) = 0x100;
        *(s16 *)(self + 0x1a) = 1;
        /* fall through */
    case 1:
        *(s16 *)(self + 0x18) =
            (s16)((*(s32 *)(manager + 0x88) << 4) + 0xe0);
        if ((*(u16 *)(self + 0x24) & 0x03ff) != 0)
            *(s16 *)(self + 0x18) += 0x30;
        if (*(s16 *)(self + 0x18) > maximum)
            *(s16 *)(self + 0x18) = (s16)maximum;
        break;
    case 2:
        if (++*(s16 *)(self + 0x1c) > 10)
            *(s16 *)(self + 0x1a) = 3;
        *(s16 *)(self + 0x18) = 8;
        break;
    case 3:
        *(s16 *)(self + 0x18) = 8;
        AuxiliaryCoreSprite_SetVisible(core, 0);
        break;
    }

    *(u16 *)(self + 0x1e) =
        (u16)(*(u16 *)(self + 0x1e) + (genrand_int32() & 0x2fff) + 0x4000);
    if (*(s16 *)(self + 0x1a) == 1 && *(s16 *)(self + 0xb2) == 0) {
        s32 eventState = ActorAttachmentManager_Update(manager);
        if (eventState == 1 || eventState == 2 || eventState == 3 || eventState == 4)
            AuxiliaryInteraction_FinalizeResult(self, -1);
        for (;;) {
            s32 *event = (s32 *)ActorAttachmentManager_GetEventQueue(manager);
            if (event == 0)
                break;
            if (event[0] == 1 && event[1] != 0) {
                void *effect = Heap_Alloc(0x44, data_020e5828, 4, &gHeapContext);
                if (effect != 0)
                    effect = func_02022cb0(
                        effect,
                        ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc),
                        owner, -event[1], 0x2000, -0xc0);
                RuntimePresentationManager_AppendFirstListEffect(data_021052fc + 0x2f7c, effect);
                switch (genrand_int32() & 3) {
                case 0: AuxiliaryInteraction_PlaySpatialSound(self, 0x42); break;
                case 1: AuxiliaryInteraction_PlaySpatialSound(self, 0x43); break;
                default: AuxiliaryInteraction_PlaySpatialSound(self, 0x44); break;
                }
            } else if (event[0] == 5 && event[1] != 0 && owner[0x4d] == 7) {
                AuxiliaryInteraction_PlaySpatialSound(self, 0x34);
            }
        }
    }

    AuxiliaryCore_ApplyScale(core, *(s16 *)(self + 0x1a) < 2
                              ? *(s16 *)(self + 0x18) : 0x20, -1);
    coreHeight = *(s32 *)(core + 0x2f8);

    if (*(s16 *)(self + 0x1a) < 2 && *(s16 *)(self + 0x40) == 0) {
        s32 freeSlot = -1;
        s32 used = 0;
        for (i = 0; i < 3; i++) {
            if (*(void **)(self + 0x28 + i * 4) == 0)
                freeSlot = i;
            else
                used++;
        }
        if (freeSlot != -1 && used < *(s16 *)(self + 0xa4)) {
            u8 *actor = *(u8 **)(self + 0x54 + *(s16 *)(self + 0x42) * 4);
            u8 *descriptor = *(u8 **)(actor + 0x20c);
            AuxiliaryEffectConfig config;
            s32 angle = *(u16 *)(self + 0x1e) >> 4;
            s32 animation;
            void *effect;
            initializeEffectConfig(&config, *(void **)(self + 0x0c), descriptor,
                                   owner + 0x18);
            config.first[1] += data_020c9670[angle * 2 + 1] * 0x10;
            config.first[2] += data_020c9670[angle * 2] * 0x10 - 0x18000;
            animation = (*(s32 (**)(void *))(*(u8 **)actor + 0x1cc))(actor);
            effect = Heap_Alloc(0x40, data_020e5830, 4, &gHeapContext);
            if (effect != 0)
                effect = func_0201ea20(effect, owner, &config, animation, 0, 1);
            *(void **)(self + 0x28 + freeSlot * 4) = effect;
            if ((genrand_int32() & 0x20) != 0)
                *(u16 *)(*(u8 **)((u8 *)effect + 4) + 0x24) |= 0x80;
            TimedSpritePresentation_SetVisible(effect, 1);
            *(s16 *)(self + 0x40) = 20;
            if (++*(s16 *)(self + 0x42) >= *(s16 *)(self + 0xa4))
                *(s16 *)(self + 0x42) = 0;
        }
    } else {
        --*(s16 *)(self + 0x40);
    }
    for (i = 0; i < 3; i++)
        updateOwnedEffect((void **)(self + 0x28 + i * 4), coreHeight);

    if (*(s16 *)(self + 0xa6) != 0 && *(s16 *)(self + 0x1a) < 2 &&
        *(s16 *)(self + 0xa8) == 0 && *(void **)(self + 0x34) == 0) {
        u8 *descriptor = *(u8 **)(self + 0x48 + *(s16 *)(self + 0xaa) * 4);
        AuxiliaryEffectConfig config;
        s32 angle = *(u16 *)(self + 0x1e) >> 4;
        void *effect;
        u32 random;
        initializeEffectConfig(&config, *(void **)(self + 0x0c), descriptor,
                               owner + 0x18);
        config.first[1] += data_020c9670[angle * 2 + 1] * 0x10;
        config.first[2] += data_020c9670[angle * 2] * 0x10 - 0x18000;
        random = genrand_int32();
        effect = Heap_Alloc(0x40, data_020e5830, 4, &gHeapContext);
        if (effect != 0)
            effect = func_0201ea20(
                effect, owner, &config,
                (s32)func_020ada8c(genrand_int32() & 0x7fffffff, 3) + 0x1b,
                0, 1);
        *(void **)(self + 0x34) = effect;
        if ((random & 1) != 0)
            *(u16 *)(*(u8 **)((u8 *)effect + 4) + 0x24) |= 0x80;
        if ((random & 2) != 0)
            *(u16 *)(*(u8 **)((u8 *)effect + 4) + 0x24) |= 0x40;
        TimedSpritePresentation_SetVisible(effect, 1);
        *(s16 *)(self + 0xa8) = 30;
        if (++*(s16 *)(self + 0xaa) >= *(s16 *)(self + 0xa6))
            *(s16 *)(self + 0xaa) = 0;
    }
    if (*(s16 *)(self + 0xa8) > 0)
        --*(s16 *)(self + 0xa8);
    updateOwnedEffect((void **)(self + 0x34), coreHeight);

    if (*(s16 *)(self + 0x1a) < 2 && *(void **)(self + 0x38) == 0) {
        AuxiliaryEffectConfig config;
        const u8 *descriptor;
        s32 angle = *(u16 *)(self + 0x1e) >> 4;
        s32 spriteValue;
        s32 offset = -0x40;
        s32 special = 0;
        void *effect;
        u32 random;

        if (owner[0x4d] == 1) {
            descriptor = *(u8 **)(owner + 0x214);
            spriteValue = (s32)func_020ada8c(genrand_int32() & 0x7fffffff, 5);
        } else {
            descriptor = *(u8 **)(owner + 0x54) + 0x10;
            if ((s32)(*(u32 *)(self + 0x20) << 17) >> 20 < 1) {
                spriteValue = (s32)func_020ada8c(genrand_int32() & 0x7fffffff, 3) + 0x1b;
            } else {
                u32 flags = *(u32 *)(self + 0x20);
                *(u32 *)(self + 0x20) |= 0x20000;
                spriteValue = ((s32)(flags << 29) < 0) ? 0x2f : 0x30;
                *(u32 *)(self + 0x20) =
                    (*(u32 *)(self + 0x20) & ~4u) |
                    (((((*(u32 *)(self + 0x20) >> 2) & 1) ^ 1) & 1) << 2);
                special = 1;
            }
        }
        initializeEffectConfig(&config, *(void **)(self + 0x0c), descriptor,
                               owner + 0x18);
        config.first[1] += data_020c9670[angle * 2 + 1] * 0x10;
        config.first[2] += data_020c9670[angle * 2] * 0x10 - 0x18000;
        config.lifetime = 0x23;
        random = genrand_int32();
        effect = Heap_Alloc(0x40, data_020e5830, 4, &gHeapContext);
        if (effect != 0) {
            if (special)
                effect = func_0201ecbc(effect, owner, &config, spriteValue,
                                       (s16)offset, 1);
            else
                effect = func_0201ea20(effect, owner, &config, spriteValue,
                                      (s16)offset, 1);
        }
        *(void **)(self + 0x38) = effect;
        if (special) {
            s32 position[4];
            void *auxiliary;
            *(s32 *)((u8 *)effect + 0x30) = coreHeight + 0x18000;
            if (*(void **)(self + 0x3c) != 0)
                (*(void (**)(void *))(**(u8 ***)(self + 0x3c) + 4))(
                    *(void **)(self + 0x3c));
            VecFx32Object_InitCopy(position, owner + 0x18);
            position[3] += coreHeight;
            auxiliary = Heap_Alloc(0x14, data_020e5828, 4, &gHeapContext);
            if (auxiliary != 0)
                auxiliary = AuxiliaryTimedSpritePresentation_Init(
                    auxiliary, position, **(void ***)(owner + 0x54),
                    0x113f, 0x1140, 0x1141,
                    (s32)(*(u32 *)(self + 0x20) << 29) >= 0,
                    offset - 3, 1, 0);
            *(void **)(self + 0x3c) = auxiliary;
            (*(void (**)(void *, s32))(*(u8 **)auxiliary + 0x18))(auxiliary, 1);
        } else {
            if ((random & 1) != 0)
                *(u16 *)(*(u8 **)((u8 *)effect + 4) + 0x24) |= 0x80;
            if ((random & 2) != 0)
                *(u16 *)(*(u8 **)((u8 *)effect + 4) + 0x24) |= 0x40;
        }
        TimedSpritePresentation_SetVisible(effect, 1);
    }
    if (*(void **)(self + 0x38) != 0) {
        u8 *effect = *(u8 **)(self + 0x38);
        *(s32 *)(effect + 0x30) = coreHeight;
        if ((s32)(*(u32 *)(self + 0x20) << 14) < 0)
            *(s32 *)(effect + 0x30) += 0x18000;
        if ((*(s32 (**)(void *))(*(u8 **)effect + 0x0c))(effect) != 0) {
            if ((s32)(*(u32 *)(self + 0x20) << 14) < 0)
                *(u32 *)(self + 0x20) &= ~0x20000u;
            (*(void (**)(void *))(*(u8 **)effect + 4))(effect);
            *(void **)(self + 0x38) = 0;
        }
    }

    if (*(s16 *)(self + 0x1a) < 2 && (*(u16 *)(core + 0x2ee) & 8) != 0) {
        s32 touch[4];
        TouchPanelManager_GetPoint(touch, gTouchPanelManager);
        touch[1] += ((s32 *)ActorMotionAreaFollower_GetPosition(
                         data_021052fc + 0x2fbc))[1] >> 12;
        touch[2] += ((s32 *)ActorMotionAreaFollower_GetPosition(
                         data_021052fc + 0x2fbc))[2] >> 12;
        if (owner[0x4d] == 7) {
            switch (*(s16 *)(*(u8 **)(owner + 0x29c) + 0x3c)) {
            case 0: AuxiliaryInteraction_ProcessTouchSamples(self, touch); break;
            case 1: func_0206e7f4(self, touch); break;
            case 2: func_0206e9e0(self, touch); break;
            case 3: func_0206ea6c(self, touch); break;
            }
        } else {
            AuxiliaryInteraction_ProcessTouchSamples(self, touch);
            AuxiliaryInteraction_FlagSecondaryTouch(self);
        }
    }

    *(u32 *)(self + 0x20) |= 0x10000;
    {
        Graphics3dPresentation *presentation =
            (Graphics3dPresentation *)RuntimePresentationManager_GetGraphics3dPresentation(
                data_021052fc + 0x2f7c);
        if (owner[0x4d] == 7) {
            u8 *state = *(u8 **)(owner + 0x29c);
            switch (*(s16 *)(state + 0x3c)) {
            case 1: {
                s32 counter = (s32)(*(u32 *)(self + 0x20) << 17) >> 20;
                if (counter > 0)
                    *(u32 *)(self + 0x20) =
                        (*(u32 *)(self + 0x20) & 0xffff8007) |
                        ((u32)((counter - 1) * 0x100000) >> 17);
                break;
            }
            case 2:
                if (*(s16 *)(state + 0x36) == 5) {
                    if (*(s16 *)(self + 0xb0) > 0)
                        --*(s16 *)(self + 0xb0);
                    if (func_020ada8c(*(s16 *)(self + 0xb0), 10) == 9) {
                        s32 position[4];
                        s32 angle;
                        s32 sine;
                        s32 cosine;
                        VecFx32Object_InitCopy(position, owner + 0x18);
                        angle = (genrand_int32() & 0xffff) >> 4;
                        sine = data_020c9670[angle * 2 + 1];
                        cosine = data_020c9670[angle * 2];
                        position[1] += multiplyFx32(sine, 0x50000);
                        position[2] += multiplyFx32(cosine, 0x50000);
                        Graphics3dPresentation_CreatePreset22To24TimedPointSpriteEffectWithHorizontalVelocityAt(presentation, 0, position[1] >> 12,
                                      (position[2] >> 12) - (position[3] >> 12),
                                      sine * -4, cosine * -4, 0x12);
                    }
                }
                break;
            case 3:
                if (*(s16 *)(self + 0xb2) == 0) {
                    *(u32 *)(self + 0x20) &= ~0x10000u;
                } else if (*(s16 *)(self + 0xb2) == 1) {
                    *(s16 *)(self + 0xb2) = 2;
                    *(u32 *)(self + 0x20) &= ~0x10000u;
                } else if (*(s16 *)(self + 0xb2) == 2) {
                    if (*(s16 *)(core + 0x2de) != 0) {
                        TrackedResourceActor_SpawnFromKey(0x36, owner + 0x18,
                                                          owner + 0x18);
                        ActorMotionJitter_EnsureMinimum(data_021052fc + 0x2fbc,
                                                       0x14, 3);
                        Graphics3dPresentation_CreatePreset11To13SpriteEffectAt(presentation, 2,
                                      *(s32 *)(owner + 0x1c) >> 12,
                                      ((*(s32 *)(owner + 0x20) >> 12) -
                                       (*(s32 *)(owner + 0x24) >> 12)) + 6);
                        *(s16 *)(self + 0xb2) = 3;
                    }
                } else if (++*(s16 *)(self + 0xb2) > 30) {
                    *(s16 *)(self + 0xb2) = 0;
                    *(u32 *)(owner + 0x10) &= ~0x90000u;
                }
                break;
            }
        }
    }

    if (AuxiliaryInteraction_IsCoreHidden(self) != 0)
        return 2;
    if (*(s16 *)(self + 0x1a) >= 2)
        return 1;
    {
        s32 position[4];
        s32 count = *(s32 *)(manager + 0x84);
        VecFx32Object_InitCopy(position, owner + 0x18);
        for (i = 0; i < count; i++)
            VecFx32Object_Assign((u8 *)ActorAttachmentManager_GetRecord(manager, i) + 0x18,
                                 position);
    }
    return 0;
}

/* Return whether a hidden core has reached terminal auxiliary state three. */
s32 AuxiliaryInteraction_IsCoreHidden(void *object)
{
    u8 *self = (u8 *)object;
    u8 *core = *(u8 **)(self + 0x14);
    if (*(s16 *)(core + 0x2de) != 0)
        return 0;
    return *(s16 *)(self + 0x1a) == 3;
}

/* Play the common touch response sound at one of its two retail pan values. */
void AuxiliaryInteraction_PlayTouchSound(void *object, s32 centered)
{
    (void)object;
    Sound_PlayEffectWithParameters(gSoundContext, 0, 0x60, centered ? 0x7f : 0x50, 0, 0);
}

/* Select the stronger touch-response presentation band. */
void AuxiliaryInteraction_ApplyStrongResponse(void *object)
{
    u8 *self = (u8 *)object;
    *(u16 *)(self + 0x24) = (*(u16 *)(self + 0x24) & 0xfc00) | 0x1e;
    *(u16 *)(self + 0x24) = (*(u16 *)(self + 0x24) & 0x03ff) | 0x2000;
}

/* Select the weaker touch-response presentation band. */
void AuxiliaryInteraction_ApplyWeakResponse(void *object)
{
    u8 *self = (u8 *)object;
    *(u16 *)(self + 0x24) = (*(u16 *)(self + 0x24) & 0xfc00) | 0x0a;
    *(u16 *)(self + 0x24) = (*(u16 *)(self + 0x24) & 0x03ff) | 0x1000;
}

/*
 * Handle the standard fight-cloud touch. Every fifth accumulated sample adds
 * bounded damage pressure to selected records and emits the strong response;
 * intervening samples emit only the weak response. Touch coordinates are DS
 * pixels and the counter is measured in accepted samples.
 */
void AuxiliaryInteraction_ProcessTouchSamples(void *object, const void *touchObject)
{
    u8 *self = (u8 *)object;
    const s32 *touch = (const s32 *)touchObject;
    u8 *manager = *(u8 **)(self + 0x44);
    Graphics3dPresentation *presentation =
        (Graphics3dPresentation *)RuntimePresentationManager_GetGraphics3dPresentation(
            data_021052fc + 0x2f7c);

    if (func_020ada8c((u32)*(s16 *)(self + 0xac), 5) == 0) {
        s32 quotient;
        s32 amount;
        Sound_PlayEffectWithParameters(gSoundContext, 0, 0x60, 0x7f, 0, 0);
        AuxiliaryInteraction_ApplyStrongResponse(self);
        Graphics3dPresentation_CreatePreset20To21ScaledPointSpriteEffectAt(
            presentation, 1, touch[1], touch[2], 8);
        if (*(s16 *)(self + 0xac) >= 40)
            *(s16 *)(self + 0xac) = 40;
        quotient = func_020adae4(*(s16 *)(self + 0xac), 5);
        if (quotient < 4) {
            s32 index;
            amount = 40 - quotient * 10;
            if ((s32)(*(u32 *)(self + 0x20) << 16) < 0)
                amount = func_020adae4(amount, 2);
            index = *(s32 *)(manager + 0x8c);
            if (index >= 0)
                *(s32 *)(*(u8 **)(manager + index * 4) + 0x1c) += amount;
            index = *(s32 *)(manager + 0x90);
            if (index >= 0)
                *(s32 *)(*(u8 **)(manager + index * 4) + 0x1c) += amount;
        }
    } else {
        Graphics3dPresentation_CreatePreset20To21ScaledPointSpriteEffectAt(
            presentation, 0, touch[1], touch[2], 5);
        AuxiliaryInteraction_PlayTouchSound(self, 0);
        AuxiliaryInteraction_ApplyWeakResponse(self);
    }
    ++*(s16 *)(self + 0xac);
}

/* Occasionally flag the current secondary actor for a standard touch event. */
void AuxiliaryInteraction_FlagSecondaryTouch(void *object)
{
    u8 *self = (u8 *)object;
    u8 *secondary;
    s32 i;

    if (data_020e5804 == 0 || GameWork_TestFlag(gGameWork, 0x16) ||
        func_020ada8c((u32)*(s16 *)(self + 0xac), 10) != 0 ||
        func_020ada8c(genrand_int32() & 0x7fffffff,
                      data_020e5804) != 0)
        return;
    secondary = *(u8 **)(data_021052fc + 0x2ea8);
    if (secondary == 0 || *(s32 *)(secondary + 0x1fc) <= 0)
        return;
    for (i = 0; i < 3; i++) {
        if (*(void **)(self + 0x48 + i * 4) == secondary)
            *(u32 *)(self + 0x20) |= 2;
    }
}

/* Play a spatial auxiliary sound using distance attenuation and signed pan. */
void AuxiliaryInteraction_PlaySpatialSound(void *object, s32 sound)
{
    u8 *self = (u8 *)object;
    s32 delta[4];
    s32 magnitude;
    s32 volume = 0;
    s32 pan;
    const void *camera = ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);

    VecFx32_Subtract(delta, *(u8 **)(self + 0x10) + 0x18, camera);
    delta[1] -= 0x80000;
    delta[2] -= 0x74000;
    pan = delta[1] >> 13;
    if (pan < -128)
        pan = -128;
    else if (pan > 127)
        pan = 127;
    magnitude = VecFx32Object_GetMagnitude(delta) >> 12;
    if (magnitude <= 0x100)
        volume = 0x78 - func_020adae4(magnitude * 0x78, 0x100);
    Sound_PlayEffectWithParameters(gSoundContext, sound >> 7, sound & 0x7f, volume, pan, 0);
}

/*
 * Advance auxiliary effects, update their camera-relative positions, apply
 * the resource's bounded random jitter, publish the core transform, and
 * advance the owned sprite group once per frame.
 */
void AuxiliaryInteraction_UpdateResourceFrame(void *object)
{
    u8 *self = (u8 *)object;
    s32 position[4];
    const void *camera = ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);
    s32 i;

    for (i = 0; i < 3; i++) {
        void *effect = *(void **)(self + 0x28 + i * 4);
        if (effect != 0)
            (*(void (**)(void *, const void *))(*(u8 **)effect + 0x10))(effect, camera);
    }
    for (i = 0; i < 2; i++) {
        void *effect = *(void **)(self + 0x34 + i * 4);
        if (effect != 0)
            (*(void (**)(void *, const void *))(*(u8 **)effect + 0x10))(effect, camera);
    }
    if (*(void **)(self + 0x3c) != 0) {
        void *effect = *(void **)(self + 0x3c);
        VecFx32Object_InitCopy(position, *(u8 **)(self + 0x10) + 0x18);
        position[2] -= 0x18000;
        position[3] += *(s32 *)(*(u8 **)(self + 0x14) + 0x2f8);
        VecFx32Object_Assign(*(u8 **)((u8 *)effect + 8) + 8, position);
        if ((*(s32 (**)(void *))(*(u8 **)effect + 8))(effect) != 0) {
            (*(void (**)(void *))(*(u8 **)effect + 4))(effect);
            *(void **)(self + 0x3c) = 0;
        }
    }

    VecFx32Object_InitCopy(position, *(u8 **)(self + 0x10) + 0x18);
    if ((*(u16 *)(self + 0x24) & 0x03ff) != 0) {
        u32 amplitude = (*(u16 *)(self + 0x24) >> 10) & 0x3f;
        position[1] += ((s32)amplitude - (s32)func_020ada8c(genrand_int32() & 0x7fffffff,
                                                            amplitude * 4)) << 12;
        position[2] += ((s32)amplitude - (s32)func_020ada8c(genrand_int32() & 0x7fffffff,
                                                            amplitude * 4)) << 12;
        *(u16 *)(self + 0x24) =
            (*(u16 *)(self + 0x24) & 0xfc00) |
            ((*(u16 *)(self + 0x24) - 1) & 0x03ff);
    }
    AuxiliaryCore_UpdateMotion(*(void **)(self + 0x14), position);
    GraphicsSpriteGroup_AdvanceAnimations(*(void **)(self + 0x0c));
}

/*
 * Initialize the 0xb4-byte auxiliary resource around its owning actor. This
 * allocates three animation descriptors, a 0x308-byte presentation object,
 * and a 0x11c-byte attachment manager. It also snapshots the actor transform,
 * seeds presentation state, registers the actor with the manager, and invokes
 * the actor's slot-0x7c notification. Allocation failures are preserved as
 * null fields; the retail constructor assumes the final manager allocation
 * succeeds before configuring it.
 */
void *AuxiliaryInteraction_Init(void *allocation, void *owner)
{
    u8 *self = (u8 *)allocation;
    u8 *actor = (u8 *)owner;
    CPoint2DS16 center;
    void *object;
    void *manager;
    s32 i;

    *(void **)(self + 0x10) = actor;
    *(u32 *)(self + 0x20) &= 0xffff8001;
    *(s16 *)(self + 0x40) = 0;
    *(s16 *)(self + 0x42) = 0;
    for (i = 0; i < 6; i++)
        *(s16 *)(self + 0xa8 + i * 2) = 0;

    *(void **)(self + 0x0c) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    *(void **)(self + 0x00) = Heap_Alloc(0x10, data_020e5810, 4, &gHeapContext);
    if (*(void **)(self + 0x00) != 0)
        *(void **)(self + 0x00) = AnimationResource_Init(
            *(void **)(self + 0x00), 0x1367, 0x1140, 0x1368);
    *(void **)(self + 0x04) = Heap_Alloc(0x10, data_020e5810, 4, &gHeapContext);
    if (*(void **)(self + 0x04) != 0)
        *(void **)(self + 0x04) = AnimationResource_Init(
            *(void **)(self + 0x04), 0x1357, 0x1001, 0x1358);
    *(void **)(self + 0x08) = Heap_Alloc(0x10, data_020e5810, 4, &gHeapContext);
    if (*(void **)(self + 0x08) != 0)
        *(void **)(self + 0x08) = AnimationResource_Init(
            *(void **)(self + 0x08), 0x1359, 0x1001, 0x135a);

    CPoint2DS16_InitFromRectangle(&center, actor + 0x68);
    object = Heap_Alloc(0x308, data_020e5818, 4, &gHeapContext);
    if (object != 0) {
        s32 mirrored = actor[0x4d] == 1;
        s32 vertical = func_020befec(center.y * 2, 3) << 12;
        object = func_0206b628(
            object, *(void **)(self + 0x0c), *(void **)(self + 0x00),
            *(void **)(self + 0x04), *(void **)(self + 0x08),
            *(s32 *)(actor + 0x1c), *(s32 *)(actor + 0x20),
            *(s32 *)(actor + 0x24), 0, mirrored, vertical, 1, 1);
    }
    *(void **)(self + 0x14) = object;
    AuxiliaryCoreSprite_SetVisible(object, 0);
    *(s16 *)(self + 0x18) = 0x100;
    *(s16 *)(self + 0x1a) = 0;
    *(s16 *)(self + 0x1c) = 0;
    *(u16 *)(self + 0x1e) = (u16)genrand_int32();
    *(u16 *)(self + 0x24) &= 0x03ff;
    *(u32 *)(self + 0x20) &= ~1u;
    for (i = 0; i < 3; i++)
        *(void **)(self + 0x28 + i * 4) = 0;
    *(void **)(self + 0x38) = 0;
    *(void **)(self + 0x3c) = 0;
    for (i = 0; i < 20; i++)
        *(void **)(self + 0x54 + i * 4) = 0;
    *(s16 *)(self + 0xa4) = 0;
    for (i = 0; i < 3; i++)
        *(void **)(self + 0x48 + i * 4) = 0;
    *(void **)(self + 0x34) = 0;
    *(s16 *)(self + 0xa6) = 0;

    manager = Heap_Alloc(0x11c, data_020e5820, -4, &gHeapContext);
    if (manager != 0)
        manager = ActorAttachmentManager_Init(manager);
    *(void **)(self + 0x44) = manager;
    *(u32 *)((u8 *)manager + 0x80) &= ~1u;
    ActorAttachmentManager_AdmitActor(manager, actor, -1);
    (*(void (**)(void *))(*(u8 **)actor + 0x7c))(actor);
    return self;
}

/*
 * Attach an actor (and, for linked type-five actors, its active successors) to
 * an auxiliary resource. A nonzero admitTarget registers each actor with the
 * fight manager; zero retains actors only for presentation. The manager can
 * reject admission, and successful attachment records at most 20 actors,
 * notifies each actor, sets the resource classification flag for selected
 * actor types, and advances the resource to state 0x19. Returns one on success
 * and zero on rejection/full.
 */
s32 AuxiliaryInteraction_AdmitTarget(void *allocation, void *targetObject, s32 admitTarget)
{
    u8 *self = (u8 *)allocation;
    u8 *target = (u8 *)targetObject;

    if (*(s16 *)(self + 0xa4) >= 20)
        return 0;

    for (;;) {
        s8 type = *(s8 *)(target + 0x27e);
        if (admitTarget != 0) {
            s32 index = -1;
            if (type == 7)
                index = *(s32 *)(target + 0x298);
            if (ActorAttachmentManager_AdmitActor(*(void **)(self + 0x44), target, index) == 0)
                return 0;
        }

        *(void **)(self + 0x54 + *(s16 *)(self + 0xa4) * 4) = target;
        (*(void (**)(void *))(*(u8 **)target + 0x7c))(target);
        *(s16 *)(self + 0x42) = *(s16 *)(self + 0xa4);
        ++*(s16 *)(self + 0xa4);

        if (type == 5) {
            target = *(u8 **)(target + 0x298);
            if (target != 0 && (*(u32 *)(target + 0x29c) & 1) != 0)
                continue;
        } else {
            u32 bit = ((u8)type - 1u) & 0xff;
            if (bit <= 31 && ((1u << bit) & 0x90000007) != 0)
                *(u32 *)(self + 0x20) |= 0x8000;
        }
        break;
    }

    AuxiliaryInteraction_SelectPresentationVariant(self);
    AuxiliaryInteraction_PlaySpatialSound(self, 0x19);
    return 1;
}

/* Allocate and initialize the confirmed 0xb4-byte auxiliary resource. */
static void *createAuxiliary(u8 *actor)
{
    void *resource = Heap_Alloc(0xb4, data_020df48c, 4, &gHeapContext);
    if (resource != 0) resource = AuxiliaryInteraction_Init(resource, actor);
    *(void **)(actor + 0x26c) = resource;
    GameWork_SetFlag(gGameWork, 0x3ee);
    return resource;
}

/*
 * Notify ActorContactState_AddContact, then consume the interaction by returning one through
 * all paths. Scene mode 2, global state, actor state/flag, disabled target,
 * and height gates suppress further work. Target type 2 can reset the actor,
 * recreate +0x26c, attach it with AuxiliaryInteraction_AdmitTarget, play a manager event, or use
 * target +0x260/+0x27f/+0x29e to dispatch
 * ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect or
 * ActorDerivedType1_ApplyWeightedCollisionDisplacement.
 * Target type 7 can create +0x26c when its +0x234 resource is eligible and hand that
 * auxiliary resource to Type7Actor_HandleResourceInteraction. Allocation, freeing, GameWork, scene,
 * manager, target virtual, and resource calls have observable engine/SDK
 * effects; the target itself may also be modified by the called handlers.
 */
s32 ActorDerivedType1_HandleAuxiliaryInteraction(void *self, void *other)
{
    u8 *actor = (u8 *)self;
    u8 *target = (u8 *)other;
    void *scene;

    ActorContactState_AddContact(actor);
    scene = SceneManager_GetCurrent(gSceneManager);
    if (*(s32 *)((u8 *)scene + 4) == 2 || ActorRuntimeCollection_GetBusyState(gActorRuntimeCollection) != 0 ||
        ActorDerivedType1_HasBlockingStateFlags(actor) != 0 || *(s16 *)(actor + 0xd6) == 0x0d ||
        (*(u32 *)(actor + 0x230) & 0x20000) != 0)
        return 1;
    if ((*(u32 *)(actor + 0xd0) & 0x100) != 0 ||
        (*(u32 *)(target + 0x10) & 0x1000000) != 0 ||
        Actor_IsAtCachedTerrainHeight(actor) == 0)
        return 1;

    if (target[0x4d] == 2) {
        if (ActorRuntimeFlags_Test(gActorRuntimeFlags, 0x40) != 0 ||
            *(s16 *)(actor + 0x268) > 0)
            return 1;
        ActorDerivedType1_TeardownActiveRecord(actor);
        if ((*(s32 (**)(void *))(*(u8 **)target + 0x1ac))(target) != 0) {
            if ((*(s32 (**)(void *))(*(u8 **)actor + 0xa8))(actor) == 0) {
                void *resource = *(void **)(actor + 0x26c);
                if (resource != 0) {
                    AuxiliaryInteraction_Destroy(resource);
                    Heap_Free(resource);
                }
                createAuxiliary(actor);
            }
            if (AuxiliaryInteraction_AdmitTarget(*(void **)(actor + 0x26c), target, 1) != 0) {
                *(u32 *)(actor + 0x10) &= ~0x1f0000;
                ActorMotionJitter_EnsureMinimum(data_021052fc + 0x2fbc, 0x14, 2);
            }
        } else if ((*(u32 *)(target + 0x260) & 1) != 0) {
            s32 offset = *(s8 *)(target + 0x27f);
            if (ActorDerivedType1_IsTargetStateEligible(target) != 0)
                offset += *(s16 *)(target + 0x29e);
            if (ActorDerivedType1_IsTargetStateEligible(target) != 0 || target[0x24c] == 3)
                ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect(actor);
            ActorDerivedType1_ApplyWeightedCollisionDisplacement(actor, target, 0x14, offset);
        }
    } else if (target[0x4d] == 7) {
        void *targetResource;
        s32 eligible = 0;
        if (ActorRuntimeFlags_Test(gActorRuntimeFlags, 0x40) != 0) return 1;
        targetResource = *(void **)(target + 0x234);
        if (targetResource != 0 && AuxiliaryInteraction_IsCoreHidden(targetResource) == 0)
            eligible = 1;
        if (*(void **)(actor + 0x26c) == 0 && eligible) {
            ActorDerivedType1_TeardownActiveRecord(actor);
            createAuxiliary(actor);
        }
        if (*(void **)(actor + 0x26c) != 0 &&
            (targetResource == 0 || eligible)) {
            *(u32 *)(actor + 0x10) &= ~0x1f0000;
            Type7Actor_HandleResourceInteraction(target, *(void **)(actor + 0x26c));
        }
    }
    return 1;
}
