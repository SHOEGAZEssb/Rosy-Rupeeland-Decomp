/*
 * Recovered kind-eight actor construction, interaction, presentation, and
 * delayed grid-effect lifecycle. Actor-owned resources are released here;
 * scene, database, sprite-owner, and global runtime objects remain borrowed.
 */
#include "tingle/types.h"
#include "tingle/actor_runtime_collection.h"
#include "tingle/heap.h"
#include "tingle/vec_fx32.h"

typedef void (*ObjectLifecycle)(void *object);

extern const void *data_020e4064[];
extern const void *data_020e408c[];
extern u8 data_021052fc[];
extern void *data_021f38fc[];
extern void *gGameWork;
extern void *gLupyContext;
extern void *data_020f4e14;
extern void *ActorRuntimeBase_Init(void *actor, const void *descriptor);
extern void *AnimationResourceState_InitEmbedded(void *state);
extern void AnimationResourceState_ReleaseResources(void *state);
extern void AnimationResourceState_Destroy(void *state);
extern void __construct_array(void *array, u32 count, u32 elementSize,
                              ObjectLifecycle constructor,
                              ObjectLifecycle destructor);
extern void func_02057570(void *record);
extern void func_020575a0(void *record);
extern void func_02057ca4(void *state);
extern void *ActorDescriptorTable_GetRecord(void **tables, s32 tableIndex, s32 recordIndex);
extern void ActorDescriptor_SetActive(void *record, s32 enabled);
extern s32 GameWork_TestFlag(void *gameWork, s32 flag);
extern void *GraphicsSpriteGroupOwner_CreateGroupWrapper(void *owner);
extern void S16Rectangle_Translate(void *rectangle, s32 x, s32 y);
extern void ActorKind8_PopulateInteractionPresentations(void *actor, s32 playSound);
extern s32 func_020783f0(void **tables, s32 tableIndex);
extern void func_020575bc(void *state, const void *record, void *owner,
                          s32 valueA, s32 valueB);
extern void *gSoundContext;
extern s32 data_020e3f90[];
extern s32 data_020e3fc0[];
extern s32 data_020e3ff0[];
extern s32 data_020e4020[];
extern void Sound_PlayOwnedEffect(void *soundContext, s32 archive, s32 member,
                          const void *owner, s32 pan, s32 volume);
extern void *data_020f4e18;
extern void *ActorDescriptor_GetComponent(void *record, s32 index);
extern u32 ActorDescriptorComponent_GetCharacterResourceId(void *component);
extern u32 ActorDescriptorComponent_GetPaletteResourceId(void *component);
extern u32 ActorDescriptorComponent_GetCellResourceId(void *component);
extern void func_02071ee0(void *state, void *manager, u32 resource0,
                          u32 resource1, u32 resource2);
extern void *GraphicsSpriteGroup_CreateState(void *group, void *resource0,
                                             void *resource1, void *resource2,
                                             u8 attach);
extern void GraphicsSpriteState_SetAnimationIndex(void *state, s32 index);
extern u32 genrand_int32(void);
extern void *Actor_GetOwningCollection(void *actor);
extern void *ActorCollection_GetSpriteGroup(void *collection);
extern void GraphicsSpriteState_SetAnimation(void *sprite, u32 animation);
extern void OS_Halt(void);
extern void Actor_RequestAttachmentActivation(void *actor, s32 enabled);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *group);
extern void GraphicsSpriteGroup_ReleaseState(void *group, void *state);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *group);
extern void Actor_UpdatePresentation(void *screenPosition, void *actor,
                                     const void *viewPosition);
extern const s16 data_020c9670[];
extern void GraphicsSpriteGroup_Clear(void *group);
extern void GraphicsSpriteGroupOwner_DestroyGroup(void *owner, void *group);
extern void *func_0203130c(void *actor);
extern void Heap_Free(void *allocation);
extern s32 ActorKind8_UpdateDelayedGridEffect(void *object);
extern void ActorKind8_UpdateIdlePresentation(void *state);
extern s32 ActorKind8_GetMotionSample(const void *counter);
extern void ActorKind8_RemovePayloadNode(void *list, void *node);
extern void ActorDescriptor_SetRangeEnd(void *descriptor, u16 index);
extern ActorRuntimeCollection gActorRuntimeCollection;
extern const char data_020d36f8[];
extern const char data_020d3b3b[];
extern const char data_020d3b5d[];
extern const char data_020e3f60[];
extern const char data_020e414c[];
extern s32 GamePhaseCurrencyHud_GetCurrency(void *context);
extern void Actor_BuildCollisionRect(void *output, const void *actor,
                                     const void *position);
extern void Actor_BuildWorldInteractionBounds(void *output, const void *actor,
                                               const void *position);
extern s32 func_02056f34(void *intersection, const void *first,
                         const void *second, void *contact);
extern void Actor_SetActive(void *actor, s32 enabled);
extern void ActorDescriptor_InitRange(void *descriptor, u16 id, u16 lastIndex);
extern void *GridEffectActor_Spawn(const void *position, void *source,
                                   s16 timer);

typedef s32 (*ActorAvailabilityQuery)(void *actor);

/*
 * Advance one auxiliary presentation's idle bob in frame units. Active
 * records wait for their randomized delay, move two pixels down and back over
 * two three-frame phases, then choose the next 0..59-frame delay. The sprite
 * and descriptor remain borrowed and no status is returned.
 */
void ActorKind8_UpdateIdlePresentation(void *self)
{
    u8 *state = (u8 *)self;

    --*(s16 *)(state + 0x18);
    switch (*(s16 *)(state + 0x1a)) {
    case 0:
        if (*(s16 *)(state + 0x1c) != 0 &&
            *(s16 *)(state + 0x18) < 0) {
            *(s16 *)(state + 0x1a) = 1;
        }
        return;
    case 1:
        *(s16 *)(*(u8 **)(state + 0x0c) + 0x2e) += 2;
        *(s16 *)(state + 0x18) = 3;
        ++*(s16 *)(state + 0x1a);
        /* Retail continues directly into the phase-two delay check. */
        if (*(s16 *)(state + 0x18) > 0)
            return;
        break;
    case 2:
        if (*(s16 *)(state + 0x18) > 0)
            return;
        break;
    case 3:
        if (*(s16 *)(state + 0x18) > 0)
            return;
        *(s16 *)(state + 0x18) = (s16)(genrand_int32() % 60);
        *(s16 *)(state + 0x1a) = 0;
        return;
    default:
        return;
    }

    *(s16 *)(*(u8 **)(state + 0x0c) + 0x2e) -= 2;
    *(s16 *)(state + 0x18) = 3;
    ++*(s16 *)(state + 0x1a);
}

/*
 * Release an active interaction-presentation record. The descriptor and group
 * are borrowed; the owned sprite state is returned to its group. Returns one
 * when a live record was released and zero when it was already inactive.
 */
s32 ActorKind8_ReleaseInteractionPresentation(void *self)
{
    u8 *state = (u8 *)self;
    u8 *descriptor;
    u16 count;

    if (*(s16 *)(state + 0x1c) == 0)
        return 0;
    descriptor = *(u8 **)(state + 0x14);
    count = *(u16 *)(descriptor + 4);
    if (count >= 1)
        ActorDescriptor_SetRangeEnd(descriptor, (u16)(count - 1));
    GraphicsSpriteGroup_ReleaseState(*(void **)(state + 0x10),
                                     *(void **)(state + 0x0c));
    *(u16 *)(state + 0x1c) = 0;
    *(u16 *)(state + 0x1a) = 0;
    return 1;
}

/*
 * Initialize one heap-owned, 0x20-byte delayed grid-effect request. The
 * presentation state and origin are borrowed/copied respectively; delay is
 * randomized in retail frame units (0, 20, 40, or 60). Returns self.
 */
void *func_020577ec(void *self, s32 mode, void *presentation,
                    const void *origin)
{
    u8 *request = (u8 *)self;

    *(void **)(request + 0) = presentation;
    VecFx32Object_InitCopy((VecFx32Object *)(request + 4),
                           (const VecFx32Object *)origin);
    *(u32 *)(request + 0x14) = 0;
    *(u32 *)(request + 0x18) = (genrand_int32() & 3) * 20;
    *(s32 *)(request + 0x1c) = mode;
    return request;
}

/*
 * Advance one delayed grid-effect request. State zero counts down in frames;
 * state one releases the borrowed presentation record, builds a stack-owned
 * spawn descriptor, and emits the retail effect at the copied world origin.
 * The request retains ownership of its VecFx32Object until the caller sees a
 * return value of one and destroys the request.
 */
s32 ActorKind8_UpdateDelayedGridEffect(void *self)
{
    u8 *request = (u8 *)self;
    u8 descriptor[0x24];
    VecFx32Object position;
    s32 mode = *(s32 *)(request + 0x14);

    if (mode == 0) {
        if (--*(s32 *)(request + 0x18) > 0)
            return 0;
        *(s32 *)(request + 0x14) = 1;
    } else if (mode != 1) {
        return 0;
    }

    ActorKind8_ReleaseInteractionPresentation(*(void **)request);
    *(u16 *)(descriptor + 2) = 0;
    *(u16 *)(descriptor + 4) = 0;
    *(u16 *)(descriptor + 6) = 0;
    *(u32 *)(descriptor + 0x0c) = 0;
    *(u32 *)(descriptor + 0x10) = 0;
    *(void **)(descriptor + 0x14) = descriptor;
    *(u32 *)(descriptor + 0x18) = 1;
    *(void **)(descriptor + 0x1c) = descriptor;
    *(u32 *)(descriptor + 0x20) = 0;
    ActorDescriptor_InitRange(
        descriptor,
        *(u16 *)*(u8 **)(*(u8 **)(request + 0) + 0x14), 1);

    VecFx32Object_InitCopy(&position,
                           (const VecFx32Object *)(request + 4));
    position.value.y += 0x1000;
    if (*(s16 *)(*(u8 **)request + 0x20) < 0) {
        position.value.z -=
            (s32)*(s16 *)(*(u8 **)request + 0x20) * 0x1000;
    }
    position.value.x +=
        (s32)*(s16 *)(*(u8 **)request + 0x1e) * 0x1000;

    if (*(s32 *)(request + 0x1c) == 2) {
        u8 *effect = (u8 *)GridEffectActor_Spawn(
            &position, descriptor, 0x708);
        VecFx32Object velocity;
        u32 index = (u16)genrand_int32() >> 4;

        VecFx32Object_Init(&velocity);
        velocity.value.x = (s32)data_020c9670[index * 2 + 1] * 2;
        velocity.value.y = (s32)data_020c9670[index * 2] * 2;
        velocity.value.z = 0x3000;
        VecFx32Object_Assign((VecFx32Object *)(effect + 0x38), &velocity);
        VecFx32Object_Destroy(&velocity);
    } else {
        (void)GridEffectActor_Spawn(&position, descriptor, 0x708);
    }
    VecFx32Object_Destroy(&position);
    return 1;
}

/*
 * Append a heap-owned payload node to the embedded request list. The list owns
 * the node and subsequently owns payload; allocation uses the retail tag,
 * four-byte alignment, and root heap. No status is returned.
 */
void ActorKind8_AppendPayloadNode(void *self, void *payload)
{
    u8 *list = (u8 *)self;
    u8 *node = (u8 *)Heap_Alloc(0x0c, data_020e3f60, 4, &gHeapContext);

    if (node != 0) {
        *(void **)(node + 0) = 0;
        *(void **)(node + 4) = 0;
        *(void **)(node + 8) = payload;
    }
    if (*(void **)(list + 8) != 0) {
        **(void ***)(list + 8) = node;
        if (node != 0)
            *(void **)(node + 4) = *(void **)(list + 8);
    } else {
        *(void **)(list + 4) = node;
    }
    *(void **)(list + 8) = node;
    ++*(u32 *)(list + 0x0c);
}

/* Initialize one 0x24-byte interaction-presentation record. */
void func_02057570(void *self)
{
    u8 *record = (u8 *)self;

    AnimationResourceState_InitEmbedded(record);
    *(u32 *)(record + 0x0c) = 0;
    *(u32 *)(record + 0x10) = 0;
    *(u32 *)(record + 0x14) = 0;
    *(u16 *)(record + 0x18) = 0;
    *(u16 *)(record + 0x1a) = 0;
    *(u16 *)(record + 0x1c) = 0;
}

/* Release one interaction-presentation record in reverse ownership order. */
void func_020575a0(void *self)
{
    AnimationResourceState_ReleaseResources(self);
    AnimationResourceState_Destroy(self);
}

/* Initialize the kind-eight actor's embedded four-word state object. */
void func_02057ca4(void *self)
{
    u8 *state = (u8 *)self;

    *(const void ***)state = data_020e4064;
    *(u32 *)(state + 4) = 0;
    *(u32 *)(state + 8) = 0;
    *(u32 *)(state + 0x0c) = 0;
}

/*
 * Construct the 0x3e0-byte kind-eight actor used by area descriptor batches.
 * The descriptor and resident databases are borrowed. Embedded animation and
 * interaction records are owned by the actor; this function allocates no host
 * resources and returns self after applying the retail bounds adjustments.
 */
void *func_020579b0(void *self, const void *descriptor)
{
    u8 *actor = (u8 *)self;
    const u8 *config = (const u8 *)descriptor;
    u8 *runtime;
    u8 *record;
    s32 tableIndex;
    s32 mode;
    s32 index;

    ActorRuntimeBase_Init(actor, config);
    *(const void ***)actor = data_020e408c;
    AnimationResourceState_InitEmbedded(actor + 0x1f0);
    __construct_array(actor + 0x1fc, 12, 0x24,
                      func_02057570, func_020575a0);
    *(u32 *)(actor + 0x3bc) |= 0x80000000u;
    *(s32 *)(actor + 0x3c0) = -1;
    *(u32 *)(actor + 0x3c8) = 0;
    *(u32 *)(actor + 0x3cc) = 0;
    func_02057ca4(actor + 0x3d0);
    *(u32 *)(actor + 0x3ac) = *(const u16 *)(config + 2);
    *(s32 *)(actor + 0x3c0) = *(const s32 *)(config + 0x48);

    runtime = *(u8 **)data_021052fc;
    tableIndex = **(s32 **)(runtime + 0x30bc);
    record = (u8 *)ActorDescriptorTable_GetRecord(data_021f38fc, tableIndex,
                                *(s32 *)(actor + 0x3ac));
    if (*(s32 *)(actor + 0x3c0) == -1) {
        ActorDescriptor_SetActive(record, 1);
    } else if (GameWork_TestFlag(gGameWork, *(s32 *)(actor + 0x3c0))) {
        ActorDescriptor_SetActive(record, 1);
    } else {
        ActorDescriptor_SetActive(record, 0);
    }

    *(void **)(actor + 0x1ec) = GraphicsSpriteGroupOwner_CreateGroupWrapper(data_020f4e14);
    mode = (*(u16 *)(record + 4) & 0x0ff0) >> 4;
    if (mode == 2) {
        *(s16 *)(actor + 0x60) -= 0x18;
        *(s16 *)(actor + 0x64) += 0x18;
        *(s16 *)(actor + 0x62) += 0x0c;
        *(s16 *)(actor + 0x66) += 0x20;
        *(s16 *)(actor + 0x68) -= 0x18;
        *(s16 *)(actor + 0x6c) += 0x18;
        *(s16 *)(actor + 0x6a) += 0x0c;
        *(s16 *)(actor + 0x6e) += 0x20;
        *(s8 *)(actor + 8) -= 0x18;
        *(s8 *)(actor + 0x0a) += 0x18;
        *(s8 *)(actor + 9) -= 0x20;
        *(s8 *)(actor + 0x0b) += 0x20;
        *(s16 *)(actor + 0x70) = *(s8 *)(actor + 8);
        *(s16 *)(actor + 0x72) = *(s8 *)(actor + 9);
        *(s16 *)(actor + 0x74) = *(s8 *)(actor + 0x0a);
        *(s16 *)(actor + 0x76) = *(s8 *)(actor + 0x0b);
        S16Rectangle_Translate(actor + 0x70, 0, 1);
    } else if (mode == 4 || mode == 5) {
        *(s16 *)(actor + 0x60) = -0x14;
        *(s16 *)(actor + 0x64) = 0x14;
        *(s16 *)(actor + 0x62) = -0x20;
        *(s16 *)(actor + 0x68) = -0x10;
        *(s16 *)(actor + 0x6c) = 0x10;
        *(s16 *)(actor + 0x6a) = -0x20;
        *(s16 *)(actor + 0x70) -= 0x10;
        *(s16 *)(actor + 0x74) += 0x10;
        *(s8 *)(actor + 8) = -0x10;
        *(s8 *)(actor + 0x0a) = 0x10;
    } else {
        *(s16 *)(actor + 0x60) -= 0x18;
        *(s16 *)(actor + 0x64) += 0x18;
        *(s16 *)(actor + 0x62) -= 0x20;
        *(s16 *)(actor + 0x68) -= 0x18;
        *(s16 *)(actor + 0x6c) += 0x18;
        *(s16 *)(actor + 0x6a) -= 0x20;
        *(s16 *)(actor + 0x70) -= 0x18;
        *(s16 *)(actor + 0x74) += 0x18;
        *(s8 *)(actor + 8) -= 0x18;
        *(s8 *)(actor + 0x0a) += 0x18;
    }
    for (index = 0; index < 3; ++index)
        *(u32 *)(actor + 0x3b0 + index * 4) = 0;
    ActorKind8_PopulateInteractionPresentations(actor, 0);
    return actor;
}

/*
 * Create the kind-eight actor's primary presentation using the fixed resource
 * triplet selected by its grouped descriptor mode. The sprite is owned by the
 * actor collection and is positioned at the retail lower-screen origin.
 */
void ActorKind8_CreatePrimaryPresentation(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *runtime = *(u8 **)data_021052fc;
    s32 tableIndex = **(s32 **)(runtime + 0x30bc);
    u8 *record = (u8 *)ActorDescriptorTable_GetRecord(
        data_021f38fc, tableIndex, *(s32 *)(actor + 0x3ac));
    u32 mode = (*(u16 *)(record + 4) & 0x0ff0) >> 4;
    u32 lastResource;
    void *owner;
    void *sprite;

    switch (mode) {
    case 0:
        lastResource = 0x21b1;
        break;
    case 1:
    case 2:
        lastResource = 0x21ae;
        break;
    case 3:
        lastResource = 0x21b4;
        break;
    case 4:
        lastResource = 0x21ba;
        break;
    case 5:
        lastResource = 0x21bd;
        break;
    default:
        OS_Halt();
        return;
    }

    func_02071ee0(actor + 0x1f0, data_020f4e18,
                  lastResource - 2, lastResource - 1, lastResource);
    owner = ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor));
    sprite = GraphicsSpriteGroup_CreateState(
        owner, *(void **)(actor + 0x1f0), *(void **)(actor + 0x1f4),
        *(void **)(actor + 0x1f8), 2);
    *(void **)(actor + 0x54) = sprite;
    GraphicsSpriteState_SetAnimation(sprite, 0);
    *(s16 *)((u8 *)sprite + 0x2c) = 0x80;
    *(s16 *)((u8 *)sprite + 0x2e) = 0x60;
    *(u16 *)((u8 *)sprite + 0x24) |= 2;
    *(u8 *)((u8 *)sprite + 0x3a) = 2;
}

/*
 * Toggle the kind-eight actor and its auxiliary sprite group together. The
 * embedded group is borrowed; disabling releases its indexed entries while
 * enabling marks it active for subsequent presentation updates.
 */
void ActorKind8_SetVisible(void *self, s32 enabled)
{
    u8 *actor = (u8 *)self;
    u8 *group;

    Actor_RequestAttachmentActivation(actor, enabled);
    if (enabled != 0) {
        *(u32 *)(actor + 0x3bc) |= 0x80000000u;
        group = *(u8 **)(actor + 0x1ec);
        *(u32 *)(group + 0x20) = 1;
    } else {
        *(u32 *)(actor + 0x3bc) &= ~0x80000000u;
        GraphicsSpriteGroup_ReleaseIndexedEntries(*(void **)(actor + 0x1ec));
    }
}

/*
 * Advance the kind-eight actor's interaction presentations (retail
 * 0x02057EE4). A nonzero +0x3DC count advances and retires linked-list
 * payloads; an empty list refreshes presentation visibility from the active
 * descriptor's progression flag. After either path, the descriptor mode
 * selects one or all twelve embedded idle-animation states. The frame counters
 * use retail frame units and descriptor/GameWork storage remains borrowed.
 */
void ActorKind8_UpdateInteractionPresentations(void *self)
{
    u8 *actor = (u8 *)self;

    if (*(u32 *)(actor + 0x3dc) != 0) {
        u8 *node = *(u8 **)(actor + 0x3d4);

        while (node != 0) {
            u8 *next = *(u8 **)node;
            u8 *payload = *(u8 **)(node + 8);

            if (ActorKind8_UpdateDelayedGridEffect(payload) != 0) {
                if (payload != 0) {
                    VecFx32Object_Destroy((VecFx32Object *)(payload + 4));
                    Heap_Free(payload);
                }
                ActorKind8_RemovePayloadNode(actor + 0x3d0, node);
            }
            node = next;
        }
    } else {
        u8 *runtime = *(u8 **)data_021052fc;
        s32 tableIndex = **(s32 **)(runtime + 0x30bc);
        u8 *record = (u8 *)ActorDescriptorTable_GetRecord(
            data_021f38fc, tableIndex, *(s32 *)(actor + 0x3ac));
        s32 enabled = *(s32 *)(actor + 0x3c0) == -1 ||
            GameWork_TestFlag(gGameWork, *(s32 *)(actor + 0x3c0));

        ActorDescriptor_SetActive(record, enabled);
        ActorKind8_SetVisible(actor, enabled);
        ActorKind8_PopulateInteractionPresentations(actor, 1);
    }

    {
        u8 *runtime = *(u8 **)data_021052fc;
        s32 tableIndex = **(s32 **)(runtime + 0x30bc);
        u8 *record = (u8 *)ActorDescriptorTable_GetRecord(
            data_021f38fc, tableIndex, *(s32 *)(actor + 0x3ac));
        u32 mode;
        s32 index;

        mode = (*(u16 *)(record + 4) & 0x0ff0) >> 4;
        if (mode == 4 || mode == 5) {
            ActorKind8_UpdateIdlePresentation(actor + 0x1fc);
        } else {
            for (index = 0; index < 12; ++index)
                ActorKind8_UpdateIdlePresentation(actor + 0x1fc + index * 0x24);
        }
    }

    ++*(s32 *)(actor + 0x3c4);
    if ((*(s32 *)(actor + 0x3bc) & 0x7fffffff) != 1)
        return;

    (void)ActorKind8_GetMotionSample(actor + 0x3c8);
    *(s32 *)(actor + 0x3c8) += *(s32 *)(actor + 0x3cc);
    if (*(s32 *)(actor + 0x3c4) > 15)
        *(u32 *)(actor + 0x3bc) &= 0x80000000u;
}

/* Return the signed motion sample selected by the high 12 bits of a counter. */
s32 ActorKind8_GetMotionSample(const void *counter)
{
    u32 index = (u16)*(const u32 *)counter;

    return data_020c9670[(index >> 4) * 2];
}

/* Mirror one active auxiliary sprite's priority and display plane. */
void ActorKind8_SyncAuxiliarySpriteLayer(void *self, const void *primarySprite)
{
    u8 *state = (u8 *)self;
    const u8 *primary = (const u8 *)primarySprite;
    u8 *sprite;

    if (*(s16 *)(state + 0x1c) == 0)
        return;
    sprite = *(u8 **)(state + 0x0c);
    *(u16 *)(sprite + 0x28) = (u16)(*(const u16 *)(primary + 0x28) - 1);
    sprite[0x3a] = primary[0x3a];
}

/*
 * Project the actor into presentation space, advance its horizontal motion,
 * synchronize auxiliary sprite placement/visibility, and advance the owned
 * sprite group. The screen-position record and view position are caller-owned
 * frame data.
 */
void func_020582b8(void *screenPosition, void *self,
                   const void *viewPosition)
{
    u8 *actor = (u8 *)self;
    u8 *sprite;
    u8 *group;
    u8 *runtime;
    u8 *record;
    s32 tableIndex;
    u32 mode;
    s32 index;

    Actor_UpdatePresentation(screenPosition, actor, viewPosition);
    sprite = *(u8 **)(actor + 0x54);
    *(s16 *)(sprite + 0x2c) = (s16)(
        *(s16 *)(sprite + 0x2c) + (ActorKind8_GetMotionSample(actor + 0x3c8) * 2 >> 12));
    group = *(u8 **)(actor + 0x1ec);
    *(s32 *)(group + 0x18) = *(s16 *)(sprite + 0x2c);
    *(s32 *)(group + 0x1c) = *(s16 *)(sprite + 0x2e);
    if ((*(u32 *)(actor + 0x10) & 4) != 0 &&
        *(s32 *)(actor + 0x3bc) < 0) {
        *(u32 *)(group + 0x20) = 1;
    } else {
        GraphicsSpriteGroup_ReleaseIndexedEntries(group);
    }

    runtime = *(u8 **)data_021052fc;
    tableIndex = **(s32 **)(runtime + 0x30bc);
    record = (u8 *)ActorDescriptorTable_GetRecord(
        data_021f38fc, tableIndex, *(s32 *)(actor + 0x3ac));
    mode = (*(u16 *)(record + 4) & 0x0ff0) >> 4;
    if (mode == 4 || mode == 5) {
        ActorKind8_SyncAuxiliarySpriteLayer(actor + 0x1fc, sprite);
    } else {
        for (index = 0; index < 12; ++index)
            ActorKind8_SyncAuxiliarySpriteLayer(actor + 0x1fc + index * 0x24, sprite);
    }
    GraphicsSpriteGroup_AdvanceAnimations(group);
}

/*
 * Handle contact between a kind-eight actor and the active player actor. The
 * routine is gated by global attachment/queue state, player availability, and
 * positive currency. On contact it starts the retail 16-frame actor response,
 * queues the mode-specific script value, and creates delayed, heap-owned grid
 * effects for active presentation records. All scene/database pointers are
 * borrowed. Retail returns zero for both handled and unhandled frames.
 */
s32 ActorKind8_HandlePlayerContact(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *runtime;
    u8 *player;
    u8 *record;
    void **vtable;
    s32 playerBounds[4];
    s32 actorBounds[4];
    s32 intersection[4];
    s32 contact;
    s32 tableIndex;
    s32 mode;
    s32 index;

    if (ActorRuntimeCollection_GetPendingAttachmentFlag(
            &gActorRuntimeCollection) != 0 ||
        ActorRuntimeCollection_GetBusyState(&gActorRuntimeCollection) != 0 ||
        ActorRuntimeCollection_IsQueuedValueMissing(
            &gActorRuntimeCollection, data_020d36f8) != 0 ||
        ActorRuntimeCollection_IsQueuedValueMissing(
            &gActorRuntimeCollection, data_020d3b5d) != 0) {
        return 0;
    }

    runtime = *(u8 **)data_021052fc;
    player = *(u8 **)(runtime + 0x2ea4);
    vtable = *(void ***)player;
    if (((ActorAvailabilityQuery)vtable[0xa8 / 4])(player) != 0 ||
        (*(u32 *)(player + 0xd0) & 0x10) != 0 ||
        GamePhaseCurrencyHud_GetCurrency(gLupyContext) <= 0) {
        return 0;
    }

    {
        VecFx32Object position;

        VecFx32Object_InitCopy(&position,
                               (const VecFx32Object *)(player + 0x18));
        Actor_BuildCollisionRect(playerBounds, player, &position);
        VecFx32Object_Destroy(&position);
    }
    Actor_BuildWorldInteractionBounds(actorBounds, actor, actor + 0x18);
    (void)func_02056f34(intersection, playerBounds, actorBounds, &contact);
    if (contact == 0)
        return 0;

    if (*(void **)(runtime + 0x2ea8) != 0)
        *(u16 *)(*(u8 **)(runtime + 0x2ea8) + 0x2a6) = 0x5a;
    *(u32 *)(actor + 0x3c8) = 0;
    *(u32 *)(actor + 0x3cc) = 0x2000;
    *(u32 *)(actor + 0x3c4) = 0;
    *(u32 *)(actor + 0x3bc) =
        (*(u32 *)(actor + 0x3bc) & 0x80000000u) | 1;

    if (*(u32 *)(actor + 0x3dc) == 0) {
        tableIndex = **(s32 **)(runtime + 0x30bc);
        record = (u8 *)ActorDescriptorTable_GetRecord(
            data_021f38fc, tableIndex, *(s32 *)(actor + 0x3ac));
        mode = (*(u16 *)(record + 4) & 0x0ff0) >> 4;
        if (mode == 4 || mode == 5) {
            if (*(s16 *)(actor + 0x218) != 0) {
                void *request = Heap_Alloc(
                    0x20, data_020e414c, 4, &gHeapContext);

                if (request != 0)
                    func_020577ec(request, mode, actor + 0x1fc,
                                  actor + 0x18);
                ActorKind8_AppendPayloadNode(actor + 0x3d0, request);
            }
        } else {
            for (index = 0; index < 12; ++index) {
                u8 *state = actor + 0x1fc + index * 0x24;

                if (*(s16 *)(state + 0x1c) != 0) {
                    void *request = Heap_Alloc(
                        0x20, data_020e414c, 4, &gHeapContext);

                    if (request != 0)
                        func_020577ec(request, mode, state, actor + 0x18);
                    ActorKind8_AppendPayloadNode(actor + 0x3d0, request);
                }
            }
        }
    }

    Actor_SetActive(actor, 1);
    tableIndex = **(s32 **)(runtime + 0x30bc);
    record = (u8 *)ActorDescriptorTable_GetRecord(
        data_021f38fc, tableIndex, *(s32 *)(actor + 0x3ac));
    mode = (*(u16 *)(record + 4) & 0x0ff0) >> 4;
    if (mode != 2) {
        *(u16 *)((u8 *)gGameWork + 0x9a) =
            (u16)(*(s32 *)(actor + 0x1c) >> 12);
        *(u16 *)((u8 *)gGameWork + 0x9c) =
            (u16)(*(s32 *)(actor + 0x20) >> 12);
        ActorRuntimeCollection_QueueValue(
            &gActorRuntimeCollection,
            (void *)(mode == 4 || mode == 5
                         ? data_020d3b5d
                         : data_020d3b3b));
    }
    return 0;
}

/* Release every node owned by the kind-eight actor's embedded linked list. */
void func_02057ce4(void *self)
{
    u8 *list = (u8 *)self;
    u8 *node = *(u8 **)(list + 4);

    while (node != 0) {
        u8 *next = *(u8 **)node;

        Heap_Free(node);
        node = next;
    }
    *(void **)(list + 4) = 0;
    *(void **)(list + 8) = 0;
    *(u32 *)(list + 0x0c) = 0;
}

/* Unlink and free one node, clearing the list when its count reaches zero. */
void ActorKind8_RemovePayloadNode(void *self, void *nodePointer)
{
    u8 *list = (u8 *)self;
    u8 *node = (u8 *)nodePointer;
    u8 *next = *(u8 **)node;
    u8 *previous = *(u8 **)(node + 4);

    if (*(void **)(list + 4) == node)
        *(void **)(list + 4) = next;
    else
        *(void **)previous = next;
    if (*(void **)(list + 8) == node)
        *(void **)(list + 8) = previous;
    else
        *(void **)(next + 4) = previous;
    Heap_Free(node);
    --*(u32 *)(list + 0x0c);
    if (*(u32 *)(list + 0x0c) == 0)
        func_02057ce4(list);
}

/* Common kind-eight teardown; optionally release the actor allocation itself. */
static void *destroyKind8Actor(void *self, s32 releaseAllocation)
{
    u8 *actor = (u8 *)self;
    void (*cleanup)(void *);
    u8 *node;

    *(const void ***)actor = data_020e408c;
    cleanup = (void (*)(void *))data_020e408c[0xbc / 4];
    cleanup(actor);
    AnimationResourceState_ReleaseResources(actor + 0x1f0);
    GraphicsSpriteGroup_Clear(*(void **)(actor + 0x1ec));
    GraphicsSpriteGroupOwner_DestroyGroup(
        data_020f4e14, *(void **)(actor + 0x1ec));
    node = *(u8 **)(actor + 0x3d4);
    while (node != 0) {
        u8 *next = *(u8 **)node;

        ActorKind8_RemovePayloadNode(actor + 0x3d0, node);
        node = next;
    }
    *(const void ***)(actor + 0x3d0) = data_020e4064;
    func_02057ce4(actor + 0x3d0);
    {
        s32 index;

        for (index = 11; index >= 0; --index)
            func_020575a0(actor + 0x1fc + index * 0x24);
    }
    AnimationResourceState_Destroy(actor + 0x1f0);
    func_0203130c(actor);
    if (releaseAllocation != 0)
        Heap_Free(actor);
    return actor;
}

/* Destroy a kind-eight actor while retaining its caller-owned allocation. */
void *func_02057d24(void *self)
{
    return destroyKind8Actor(self, 0);
}

/* Destroy a heap-owned kind-eight actor and return its former identity. */
void *func_02057dcc(void *self)
{
    return destroyKind8Actor(self, 1);
}

/*
 * Populate the kind-eight actor's embedded interaction-presentation records
 * from the active descriptor table. The constructor passes playSound as zero;
 * later callers may request the retail archive/member cue for each populated
 * non-mode-2 record. No allocations are performed directly here.
 */
void ActorKind8_PopulateInteractionPresentations(void *self, s32 playSound)
{
    u8 *actor = (u8 *)self;
    u8 *runtime = *(u8 **)data_021052fc;
    s32 tableIndex = **(s32 **)(runtime + 0x30bc);
    s32 group;
    s32 groupCount = func_020783f0(data_021f38fc, tableIndex);

    for (group = 0; group < groupCount; ++group) {
        u8 *record;
        s32 mode;
        s32 entry;
        s32 entryCount;

        if (group != *(s32 *)(actor + 0x3ac))
            continue;
        record = (u8 *)ActorDescriptorTable_GetRecord(data_021f38fc, tableIndex, group);
        mode = (*(u16 *)(record + 4) & 0x0ff0) >> 4;
        entryCount = *(u16 *)(record + 0x0c);
        if ((mode == 4 || mode == 5) && entryCount != 0) {
            if (*(s16 *)(actor + 0x218) == 0) {
                func_020575bc(actor + 0x1fc, record + 8,
                              *(void **)(actor + 0x1ec), 0, -0x10);
                if (playSound != 0)
                    Sound_PlayOwnedEffect(gSoundContext, 0xf5, 1,
                                  actor, 0, 0x100);
            }
            continue;
        }
        for (entry = 0; entry < entryCount; ++entry) {
            u8 *state = actor + 0x1fc + entry * 0x24;

            if (*(s16 *)(state + 0x1c) != 0)
                continue;
            if (mode == 2) {
                func_020575bc(state, record + 8,
                              *(void **)(actor + 0x1ec),
                              data_020e3fc0[entry],
                              data_020e3ff0[entry]);
            } else {
                func_020575bc(state, record + 8,
                              *(void **)(actor + 0x1ec),
                              data_020e4020[entry],
                              data_020e3f90[entry]);
                if (playSound != 0)
                    Sound_PlayOwnedEffect(gSoundContext, 0xf5, 1,
                                  actor, 0, 0x100);
            }
        }
    }
}

/*
 * Bind one descriptor entry to an embedded animation state and create its
 * owned sprite state in owner. x/y are stored in pixels on the sprite and in
 * the record; the initial random delay is measured in frames (0..59).
 */
void func_020575bc(void *self, const void *descriptor, void *owner,
                   s32 x, s32 y)
{
    u8 *state = (u8 *)self;
    void *component = ActorDescriptor_GetComponent((void *)descriptor, 0);
    void *sprite;

    *(const void **)(state + 0x14) = descriptor;
    *(void **)(state + 0x10) = owner;
    func_02071ee0(state, data_020f4e18,
                  ActorDescriptorComponent_GetCharacterResourceId(component),
                  ActorDescriptorComponent_GetPaletteResourceId(component),
                  ActorDescriptorComponent_GetCellResourceId(component));
    sprite = GraphicsSpriteGroup_CreateState(
        owner, *(void **)(state + 0), *(void **)(state + 4),
        *(void **)(state + 8), 1);
    *(void **)(state + 0x0c) = sprite;
    GraphicsSpriteState_SetAnimationIndex(sprite, 1);
    *(s16 *)((u8 *)sprite + 0x2c) = (s16)x;
    *(s16 *)((u8 *)sprite + 0x2e) = (s16)y;
    *(u16 *)((u8 *)sprite + 0x24) |= 2;
    *(u16 *)(state + 0x18) = (u16)(genrand_int32() % 60);
    *(u16 *)(state + 0x1c) = 1;
    *(s16 *)(state + 0x1e) = (s16)x;
    *(s16 *)(state + 0x20) = (s16)y;
}
