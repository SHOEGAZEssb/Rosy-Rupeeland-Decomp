#include "tingle/types.h"

/* Transfer auxiliary-interaction participants and their attachment records
 * between managers, preserving retail admission gates and ownership order. */
#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0206cc68(void *interaction, void *actor, s32 admitToManager);
extern s32 AuxiliaryInteraction_AdmitTarget(void *interaction, void *actor, s32 mode);
extern void AuxiliaryInteraction_SelectPresentationVariant(void *interaction);
#ifdef __cplusplus
}
#endif

/* Append a borrowed existing record unless manager +0xa0 is nonzero or its
 * signed count has reached 32. On success transfer its owner/index, maintain
 * type-specific counters/indices, reset +0xa4, and return one; otherwise zero.
 * Type-zero admission sets +0xac to 30 ticks. No allocation occurs. */
s32 ActorAttachmentManager_AppendExistingRecord(void *manager, void *record)
{
    s32 count = FIELD(s32, manager, 0x84);
    s32 type;
    if (FIELD(s32, manager, 0xa0) != 0 || count >= 32)
        return 0;
    type = FIELD(s32, record, 8);
    if (type == 0) {
        FIELD(s32, manager, 0xac) = 30;
        ++FIELD(s32, manager, 0x88);
    } else if (type == 1) {
        FIELD(s32, manager, 0x8c) = count;
    } else if (type == 2) {
        FIELD(s32, manager, 0x90) = count;
    }
    FIELD(void *, record, 4) = manager;
    FIELD(s32, record, 0xc) = FIELD(s32, manager, 0x84);
    ((void **)manager)[FIELD(s32, manager, 0x84)] = record;
    ++FIELD(s32, manager, 0x84);
    FIELD(s32, manager, 0xa4) = 0;
    return 1;
}

/* Remove a valid record by its stored index and compact following indices.
 * Nonzero preserve keeps record ownership alive for transfer; zero invokes
 * virtual slot 8 before compaction. Maintain type counters and return one. */
s32 ActorAttachmentManager_RemoveRecord(void *manager, void *record, s32 preserve)
{
    s32 type = FIELD(s32, record, 8);
    s32 index = FIELD(s32, record, 0xc);
    if (type == 0)
        --FIELD(s32, manager, 0x88);
    else if (type == 2)
        FIELD(s32, manager, 0x90) = -1;
    else if (type == 1)
        FIELD(s32, manager, 0x8c) = -1;
    if (preserve == 0 && record != 0) {
        typedef void (*Destroy)(void *);
        Destroy destroy = *(Destroy *)(FIELD(u8 *, record, 0) + 8);
        destroy(record);
    }
    for (; index < FIELD(s32, manager, 0x84) - 1; ++index) {
        void *next = ((void **)manager)[index + 1];
        ((void **)manager)[index] = next;
        FIELD(s32, next, 0xc) = index;
    }
    --FIELD(s32, manager, 0x84);
    return 1;
}

/* Admit as many source records as destination allows, then detach admitted
 * records from source without destruction. Admission rewrites each record's
 * index before removal, as in retail. Return zero only for destination +0xa0;
 * otherwise return one, including partial/empty transfers. Capacity is 32. */
s32 ActorAttachmentManager_TransferRecords(void *destination, void *source)
{
    void *accepted[32];
    s32 count = 0;
    s32 i;
    if (FIELD(s32, destination, 0xa0) != 0)
        return 0;
    for (i = 0; i < FIELD(s32, source, 0x84); ++i) {
        if (ActorAttachmentManager_AppendExistingRecord(destination, ((void **)source)[i]) != 0)
            accepted[count++] = ((void **)source)[i];
    }
    for (i = 0; i < count; ++i)
        ActorAttachmentManager_RemoveRecord(source, accepted[i], 1);
    return 1;
}

/* Merge source into destination when its manager is idle and below capacity,
 * and its actor-admission hook accepts source +0x10. Move the selected type-2
 * attachment first, admit targets/participants in signed-count order, then
 * transfer remaining records. Reset +0xac/+0xae and select presentation 30.
 * Returns one on acceptance, zero on an early gate; accepted records survive
 * source teardown. This changes gameplay ownership, not host or SDK state. */
s32 AuxiliaryInteraction_MergeFrom(void *destination, void *source)
{
    void *manager = FIELD(void *, destination, 0x44);
    void *sourceManager;
    void *selected;
    s32 i;
    if (FIELD(s32, manager, 0xa0) != 0 || FIELD(s32, manager, 0x84) >= 32)
        return 0;
    if (func_0206cc68(destination, FIELD(void *, source, 0x10), 0) == 0)
        return 0;
    sourceManager = FIELD(void *, source, 0x44);
    selected = ((void **)sourceManager)[FIELD(s32, sourceManager, 0x90)];
    ActorAttachmentManager_RemoveRecord(sourceManager, selected, 1);
    ActorAttachmentManager_AppendExistingRecord(FIELD(void *, destination, 0x44), selected);
    for (i = 0; i < FIELD(s16, source, 0xa4); ++i)
        AuxiliaryInteraction_AdmitTarget(destination, FIELD(void *, source, 0x54 + i * 4), 0);
    for (i = 0; i < FIELD(s16, source, 0xa6); ++i)
        func_0206cc68(destination, FIELD(void *, source, 0x48 + i * 4), 0);
    ActorAttachmentManager_TransferRecords(FIELD(void *, destination, 0x44), FIELD(void *, source, 0x44));
    FIELD(s16, destination, 0xae) = 0;
    FIELD(s16, destination, 0xac) = 0;
    AuxiliaryInteraction_SelectPresentationVariant(destination);
    return 1;
}
