#include "tingle/types.h"

/* Build category bootstrap descriptors and register a caller-provided actor descriptor batch. */
extern u8 *data_021052fc;
extern void *gGameWork;
extern s32 data_020e1964[];
extern void *gActorCategory1DescriptorTable;
extern void *gActorCategory2DescriptorTable;

typedef struct ActorSpawnDescriptor {
    u8 bytes[0x64];
} ActorSpawnDescriptor;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorSpawnDescriptor_Init(
    void *, u16, u16, s32, s32, s32, u8, u8, u16, u16, u16, u8, u8,
    s32, s32, s32, s32, s32, u16, u8, u8, u8, u8);
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 category);
extern void *ActorCollection_SpawnActorFromDescriptor(void *collection, const void *descriptor);
extern void *GamePhaseMetadata_GetFlagsBits12To15(s32 value);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void Type7Actor_SpawnFromRecord(s32 field00, s32 phase, s32 x, s32 y, s32 field04);
#ifdef __cplusplus
}
#endif

/* Return category's runtime collection. */
static u8 *actorCollection(s32 category)
{
    return (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, category);
}

/* Add one descriptor and overwrite its recovered post-init halfword +0x52. */
static void *addDescriptor(s32 category, ActorSpawnDescriptor *descriptor,
                           s16 field52)
{
    *(s16 *)(descriptor->bytes + 0x52) = field52;
    return ActorCollection_SpawnActorFromDescriptor(actorCollection(category), descriptor);
}

/*
 * Inputs r0/r1 are unused in the recovered implementation. For category one,
 * ensure collection singleton +0x2e7c exists by constructing a type-one
 * bootstrap actor, setting its +0x230 bit four, and invoking virtual +0x54 with
 * value one. Clear GameWork flag 0x10 in phase 0x29. Phase 0x5a disables the
 * shared transition record; otherwise, when singleton +0x2e80 is absent and
 * the flag is clear, derive transition coordinates from data_020e1964 or the
 * singleton and call Type7Actor_SpawnFromRecord when all raw gates pass. Store
 * descriptors in gActorCategory1DescriptorTable. Category two creates its
 * distinct bootstrap descriptor and stores the input in
 * gActorCategory2DescriptorTable.
 *
 * For every category, construct and add the common type-three descriptor with
 * post-init +0x52 equal to two. Then walk inputDescriptors in 0x64-byte records
 * until halfword +0x00 is zero: set word +0x28 bit eight, and add records whose
 * signed halfword +0x50 is nonnegative. Returns no value. Collection creation,
 * actor virtual dispatch, GameWork mutation, phase lookup, and transition
 * request calls have observable engine state. Unidentified descriptor fields
 * deliberately retain their offset-derived initializer arguments.
 */
void ActorDescriptorBatch_RegisterAndSpawn(void *unused0, void *unused1,
                   ActorSpawnDescriptor *inputDescriptors, s32 category)
{
    ActorSpawnDescriptor descriptor;
    (void)unused0;
    (void)unused1;

    if (category == 1) {
        u8 *collection = actorCollection(1);
        if (*(void **)(collection + 0x2e7c) == 0) {
            u8 *phaseState = *(u8 **)(data_021052fc + 0x30bc);
            void *actor;
            ActorSpawnDescriptor_Init(&descriptor, 1, 0, -1, -1, 2, 0, 0,
                           *(s32 *)(phaseState + 0x2c),
                           *(s32 *)(phaseState + 0x30), 0, 24, 8,
                           0x02000008, 0, 0, 0, 0, 255, 0, 0, 0, 0);
            actor = addDescriptor(1, &descriptor, 0);
            *(u32 *)((u8 *)actor + 0x230) |= 4;
            (*(void (**)(void *, s32))(*(u8 **)actor + 0x54))(actor, 1);
        }

        {
            s32 phase = **(s32 **)(data_021052fc + 0x30bc);
            if (phase == 0x29)
                GameWork_ClearFlag(gGameWork, 0x10);
            if (phase == 0x5a) {
                data_020e1964[0] = -1;
            } else {
                u8 *collection = actorCollection(1);
                s32 valid = 0;
                s32 x = 0;
                s32 y = 0;
                if (*(void **)(collection + 0x2e80) == 0 &&
                    GameWork_TestFlag(gGameWork, 0x10) == 0 &&
                    data_020e1964[0] != -1) {
                    if (data_020e1964[7] != 0) {
                        u8 *actor = *(u8 **)(collection + 0x2e7c);
                        valid = 1;
                        x = *(s32 *)(actor + 0x1c) >> 12;
                        y = *(s32 *)(actor + 0x20) >> 12;
                    } else if (data_020e1964[2] > 0) {
                        void *current = GamePhaseMetadata_GetFlagsBits12To15(phase);
                        void *saved = GamePhaseMetadata_GetFlagsBits12To15(data_020e1964[3]);
                        if (data_020e1964[6] == 0 || current == 0 ||
                            saved == 0 || saved == current) {
                            u8 *actor = *(u8 **)(collection + 0x2e7c);
                            valid = 1;
                            data_020e1964[3] = phase;
                            x = *(s32 *)(actor + 0x1c) >> 12;
                            y = *(s32 *)(actor + 0x20) >> 12;
                        }
                    } else if (data_020e1964[3] == phase) {
                        x = data_020e1964[4];
                        y = data_020e1964[5];
                        valid = 1;
                    }
                    if (valid)
                        Type7Actor_SpawnFromRecord(data_020e1964[0], phase, x, y,
                                      data_020e1964[1]);
                }
            }
        }
        gActorCategory1DescriptorTable = inputDescriptors;
    } else if (category == 2) {
        ActorSpawnDescriptor_Init(&descriptor, 3, 3, 0x138a, 0x1078, 0x138b,
                       2, 0x1d, 0, 0, 0, 0, 0, 0x04088008,
                       0, 0, 0, 0, 1, 0, 0, 0, 0);
        addDescriptor(2, &descriptor, 0);
        gActorCategory2DescriptorTable = inputDescriptors;
    }

    ActorSpawnDescriptor_Init(&descriptor, 3, 4, -1, -1, -1, 0, (u8)-100,
                   (u16)-100, 0, 0, 0, 0, 8, 0, 0, 0, 0,
                   255, 0, 0, 0, 0);
    addDescriptor(category, &descriptor, 2);

    while (*(u16 *)inputDescriptors->bytes != 0) {
        *(u32 *)(inputDescriptors->bytes + 0x28) |= 8;
        if (*(s16 *)(inputDescriptors->bytes + 0x50) >= 0)
            ActorCollection_SpawnActorFromDescriptor(actorCollection(category), inputDescriptors);
        ++inputDescriptors;
    }
}
