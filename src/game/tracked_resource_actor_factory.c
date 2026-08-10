#include "tingle/types.h"

/*
 * Recovered record-driven factory for tracked-resource actors. It searches a
 * fixed 67-entry table, converts the matching record into an actor descriptor,
 * then delegates record-specific initialization through virtual callbacks.
 */

extern const u8 data_020eb850[];
extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseRuntime_GetActorCollection(void *context, s32 index);
extern void *func_02028388(s32 index);
extern void *ActorCollection_SpawnActorFromDescriptor(void *manager, const void *descriptor);
extern void ActorSpawnDescriptor_Init(void *destination, ...);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct TrackedActorRecord {
    s16 key;
    u16 resource0;
    u16 resource1;
    u16 resource2;
    u8 actor_type;
    u8 flag_mode;
    u8 unknown_0a[9];
    s8 width;
    s8 height;
    s8 z_offset;
    u8 unknown_16[28];
} TrackedActorRecord;

typedef void (*ActorRecordCallback)(void *actor,
                                    const TrackedActorRecord *record,
                                    u32 argument);
typedef void (*ActorCallback)(void *actor);

/*
 * Inputs are a signed table key, fixed-point position, and opaque callback
 * argument. Search all 67 records of size 0x32 and retain the matching record
 * (a valid key is assumed). Build a descriptor from its actor type, three
 * resource halfwords, signed dimensions and Z offset. Descriptor flags start
 * at 8, add 0x10 unless type is 0x22, and add 0x2000000 unless type is 0x1C or
 * key is 0x37; the recovered alternate descriptor value is one for type 0x26
 * only on the non-flagged path. Mirror the latest global record's two-bit mode
 * into descriptor bit zero, allocate the actor, invoke virtual slot 0xC0 with
 * the record and argument, set flags 0x140000 plus 0x10000/0x20000 according to
 * record byte 9, invoke virtual slot 0xCC, and return the actor. Manager and
 * actor state change; no hardware is accessed directly.
 */
void *func_02050078(s32 key, const void *position, u32 argument)
{
    const TrackedActorRecord *record = 0;
    u8 descriptor[100];
    s32 i;
    u32 flags = 8;
    u32 alternate = 2;

    for (i = 0; i < 67; i++) {
        const TrackedActorRecord *candidate =
            (const TrackedActorRecord *)(data_020eb850 + i * 0x32);
        if (candidate->key == key)
            record = candidate;
    }

    if (record->actor_type != 0x22)
        flags |= 0x10;
    if (record->actor_type != 0x1c && record->key != 0x37) {
        flags |= 0x2000000;
    } else if (record->actor_type == 0x26) {
        alternate = 1;
    }

    ActorSpawnDescriptor_Init(descriptor, 4, record->actor_type,
                  record->resource0, record->resource1, record->resource2,
                  alternate, 0,
                  FIELD(s32, position, 4) >> 12,
                  FIELD(s32, position, 8) >> 12,
                  (FIELD(s32, position, 12) >> 12) + record->z_offset,
                  record->width, record->height, flags,
                  0, 0, 0, 0, 0xff, 0, 0, 0, 0);

    void *records = FIELD(void *, data_021052fc, 0x24);
    void *latest = func_02028388(FIELD(s32, records, 0) - 1);
    if ((FIELD(u32, latest, 0x40) >> 18 & 3) == 3)
        FIELD(u32, descriptor, 0x28) |= 1;

    void *actor = ActorCollection_SpawnActorFromDescriptor(
        GamePhaseRuntime_GetActorCollection(data_021052fc, 1), descriptor);
    ActorRecordCallback initialize =
        *(ActorRecordCallback *)((u8 *)FIELD(void *, actor, 0) + 0xc0);
    initialize(actor, record, argument);
    FIELD(u32, actor, 0x10) |= 0x140000;
    if (record->flag_mode == 1)
        FIELD(u32, actor, 0x10) |= 0x10000;
    else if (record->flag_mode == 0)
        FIELD(u32, actor, 0x10) |= 0x20000;
    ActorCallback finish =
        *(ActorCallback *)((u8 *)FIELD(void *, actor, 0) + 0xcc);
    finish(actor);
    return actor;
}
