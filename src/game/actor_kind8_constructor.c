#include "tingle/types.h"

typedef void (*ObjectLifecycle)(void *object);

extern const void *data_020e4064[];
extern const void *data_020e408c[];
extern u8 data_021052fc[];
extern void *data_021f38fc[];
extern void *gGameWork;
extern void *data_020f4e14;
extern void *func_02030f98(void *actor, const void *descriptor);
extern void *func_02071ea4(void *state);
extern void func_02071f38(void *state);
extern void func_02071eb8(void *state);
extern void __construct_array(void *array, u32 count, u32 elementSize,
                              ObjectLifecycle constructor,
                              ObjectLifecycle destructor);
extern void func_02057570(void *record);
extern void func_020575a0(void *record);
extern void func_02057ca4(void *state);
extern void *func_02078418(void **tables, s32 tableIndex, s32 recordIndex);
extern void func_0207811c(void *record, s32 enabled);
extern s32 GameWork_TestFlag(void *gameWork, s32 flag);
extern void *func_020742cc(void *owner);
extern void S16Rectangle_Translate(void *rectangle, s32 x, s32 y);
extern void func_020587d8(void *actor, s32 playSound);
extern s32 func_020783f0(void **tables, s32 tableIndex);
extern void func_020575bc(void *state, const void *record, void *owner,
                          s32 valueA, s32 valueB);
extern void *gSoundContext;
extern s32 data_020e3f90[];
extern s32 data_020e3fc0[];
extern s32 data_020e3ff0[];
extern s32 data_020e4020[];
extern void func_020593dc(void *soundContext, s32 archive, s32 member,
                          const void *owner, s32 pan, s32 volume);
extern void *data_020f4e18;
extern void *func_02062918(void *record, s32 index);
extern u32 func_02063064(void *component);
extern u32 func_02063074(void *component);
extern u32 func_02063084(void *component);
extern void func_02071ee0(void *state, void *manager, u32 resource0,
                          u32 resource1, u32 resource2);
extern void *GraphicsSpriteGroup_CreateState(void *group, void *resource0,
                                             void *resource1, void *resource2,
                                             u8 attach);
extern void GraphicsSpriteState_SetAnimationIndex(void *state, s32 index);
extern u32 genrand_int32(void);
extern void *Actor_GetCollection(void *actor);
extern void *ActorCollection_GetSpriteOwner(void *collection);
extern void func_02072b68(void *sprite, u32 animation);
extern void OS_Halt(void);
extern void func_02033a6c(void *actor, s32 enabled);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *group);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *group);
extern void func_02031758(void *output, void *actor, const void *transform);
extern const s16 data_020c9670[];
extern void GraphicsSpriteGroup_Clear(void *group);
extern void GraphicsSpriteGroupOwner_DestroyGroup(void *owner, void *group);
extern void *func_0203130c(void *actor);
extern void Heap_Free(void *allocation);

/* Initialize one 0x24-byte interaction-presentation record. */
void func_02057570(void *self)
{
    u8 *record = (u8 *)self;

    func_02071ea4(record);
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
    func_02071f38(self);
    func_02071eb8(self);
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

    func_02030f98(actor, config);
    *(const void ***)actor = data_020e408c;
    func_02071ea4(actor + 0x1f0);
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
    record = (u8 *)func_02078418(data_021f38fc, tableIndex,
                                *(s32 *)(actor + 0x3ac));
    if (*(s32 *)(actor + 0x3c0) == -1) {
        func_0207811c(record, 1);
    } else if (GameWork_TestFlag(gGameWork, *(s32 *)(actor + 0x3c0))) {
        func_0207811c(record, 1);
    } else {
        func_0207811c(record, 0);
    }

    *(void **)(actor + 0x1ec) = func_020742cc(data_020f4e14);
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
    func_020587d8(actor, 0);
    return actor;
}

/*
 * Create the kind-eight actor's primary presentation using the fixed resource
 * triplet selected by its grouped descriptor mode. The sprite is owned by the
 * actor collection and is positioned at the retail lower-screen origin.
 */
void func_020580f8(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *runtime = *(u8 **)data_021052fc;
    s32 tableIndex = **(s32 **)(runtime + 0x30bc);
    u8 *record = (u8 *)func_02078418(
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
    owner = ActorCollection_GetSpriteOwner(Actor_GetCollection(actor));
    sprite = GraphicsSpriteGroup_CreateState(
        owner, *(void **)(actor + 0x1f0), *(void **)(actor + 0x1f4),
        *(void **)(actor + 0x1f8), 2);
    *(void **)(actor + 0x54) = sprite;
    func_02072b68(sprite, 0);
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
void func_0205878c(void *self, s32 enabled)
{
    u8 *actor = (u8 *)self;
    u8 *group;

    func_02033a6c(actor, enabled);
    if (enabled != 0) {
        *(u32 *)(actor + 0x3bc) |= 0x80000000u;
        group = *(u8 **)(actor + 0x1ec);
        *(u32 *)(group + 0x20) = 1;
    } else {
        *(u32 *)(actor + 0x3bc) &= ~0x80000000u;
        GraphicsSpriteGroup_ReleaseIndexedEntries(*(void **)(actor + 0x1ec));
    }
}

/* Return the signed motion sample selected by the high 12 bits of a counter. */
s32 func_020580d4(const void *counter)
{
    u32 index = (u16)*(const u32 *)counter;

    return data_020c9670[(index >> 4) * 2];
}

/* Mirror one active auxiliary sprite's priority and display plane. */
void func_02057698(void *self, const void *primarySprite)
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
 * sprite group. The output and transform are caller-owned frame data.
 */
void func_020582b8(void *output, void *self, const void *transform)
{
    u8 *actor = (u8 *)self;
    u8 *sprite;
    u8 *group;
    u8 *runtime;
    u8 *record;
    s32 tableIndex;
    u32 mode;
    s32 index;

    func_02031758(output, actor, transform);
    sprite = *(u8 **)(actor + 0x54);
    *(s16 *)(sprite + 0x2c) = (s16)(
        *(s16 *)(sprite + 0x2c) + (func_020580d4(actor + 0x3c8) * 2 >> 12));
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
    record = (u8 *)func_02078418(
        data_021f38fc, tableIndex, *(s32 *)(actor + 0x3ac));
    mode = (*(u16 *)(record + 4) & 0x0ff0) >> 4;
    if (mode == 4 || mode == 5) {
        func_02057698(actor + 0x1fc, sprite);
    } else {
        for (index = 0; index < 12; ++index)
            func_02057698(actor + 0x1fc + index * 0x24, sprite);
    }
    GraphicsSpriteGroup_AdvanceAnimations(group);
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
void func_02057e7c(void *self, void *nodePointer)
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
    func_02071f38(actor + 0x1f0);
    GraphicsSpriteGroup_Clear(*(void **)(actor + 0x1ec));
    GraphicsSpriteGroupOwner_DestroyGroup(
        data_020f4e14, *(void **)(actor + 0x1ec));
    node = *(u8 **)(actor + 0x3d4);
    while (node != 0) {
        u8 *next = *(u8 **)node;

        func_02057e7c(actor + 0x3d0, node);
        node = next;
    }
    *(const void ***)(actor + 0x3d0) = data_020e4064;
    func_02057ce4(actor + 0x3d0);
    {
        s32 index;

        for (index = 11; index >= 0; --index)
            func_020575a0(actor + 0x1fc + index * 0x24);
    }
    func_02071eb8(actor + 0x1f0);
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
void func_020587d8(void *self, s32 playSound)
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
        record = (u8 *)func_02078418(data_021f38fc, tableIndex, group);
        mode = (*(u16 *)(record + 4) & 0x0ff0) >> 4;
        entryCount = *(u16 *)(record + 0x0c);
        if ((mode == 4 || mode == 5) && entryCount != 0) {
            if (*(s16 *)(actor + 0x218) == 0) {
                func_020575bc(actor + 0x1fc, record + 8,
                              *(void **)(actor + 0x1ec), 0, -0x10);
                if (playSound != 0)
                    func_020593dc(gSoundContext, 0xf5, 1,
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
                    func_020593dc(gSoundContext, 0xf5, 1,
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
    void *component = func_02062918((void *)descriptor, 0);
    void *sprite;

    *(const void **)(state + 0x14) = descriptor;
    *(void **)(state + 0x10) = owner;
    func_02071ee0(state, data_020f4e18,
                  func_02063064(component),
                  func_02063074(component),
                  func_02063084(component));
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
