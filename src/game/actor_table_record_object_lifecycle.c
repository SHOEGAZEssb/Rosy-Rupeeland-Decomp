#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Construct and destroy an actor subclass configured from a recovered
 * 12-entry record table.
 */
extern void *data_020df910;
extern u8 data_020ed638[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorDerivedRuntime_Init(void *actor);
extern void *ActorDerivedRuntime_DestroyAlternate(void *actor);
#ifdef __cplusplus
}
#endif

/* Shared portable constructor equivalent for the two retail entry points. */
static void *initializeTableRecordActor(void *self, const void *descriptor)
{
    u8 *actor = (u8 *)ActorDerivedRuntime_Init(self);
    const u8 *record = 0;
    s16 key = *(const s16 *)((const u8 *)descriptor + 0x4e);
    s32 i;
    u32 flags;

    *(void **)actor = data_020df910;
    *(u16 *)(actor + 0x20a) = 0;
    *(u32 *)(actor + 0x20c) &= ~(0x4000 | 0x8000);
    actor[0x210] = 0;
    actor[0x211] = 0;
    for (i = 0; i < 12; ++i) {
        const u8 *candidate = data_020ed638 + i * 0x0e;
        if (*(const s16 *)candidate == key)
            record = candidate;
    }
    *(const u8 **)(actor + 0x214) = record;
    *(u16 *)(actor + 0x208) = (u16)*(const s16 *)(record + 4);
    if (*(u16 *)(actor + 0x208) < 1)
        *(u16 *)(actor + 0x208) = 1;
    flags = *(u32 *)(actor + 0x20c);
    flags = (flags & ~0x1fff) | (*(u16 *)(actor + 0x208) & 0x1fff);
    flags &= ~0x2000;
    flags |= (record[0x0d] & 1) << 13;
    *(u32 *)(actor + 0x20c) = flags;
    return actor;
}

/*
 * Initialize the base and install this vtable; clear +0x20a, bits 0x4000 and
 * 0x8000 of +0x20c, and bytes +0x210/+0x211. Search all twelve 0x0e-byte
 * records in data_020ed638 for signed key descriptor+0x4e, retaining the last
 * match at +0x214. Copy signed record halfword +0x04 to +0x208 and clamp it to
 * at least one. Copy that value into low 13 bits of +0x20c, then set bit
 * 0x2000 from record byte +0x0d bit zero. Return self. The retail path assumes
 * a matching record exists before dereferencing it; base initialization
 * establishes actor-owned runtime state.
 */
void *ActorTableRecord_Init(void *self, const void *descriptor)
{
    return initializeTableRecordActor(self, descriptor);
}

/* Alternate constructor entry identical to ActorTableRecord_Init; return self. */
void *ActorTableRecord_InitAlternate(void *self, const void *descriptor)
{
    return initializeTableRecordActor(self, descriptor);
}

/*
 * Run ActorDerivedRuntime_DestroyAlternate and return self without freeing
 * it.
 */
void *ActorTableRecord_Destroy(void *self)
{
    ActorDerivedRuntime_DestroyAlternate(self);
    return self;
}

/* Run recovered base teardown, free self, and return its former address. */
void *ActorTableRecord_DestroyAndFree(void *self)
{
    ActorDerivedRuntime_DestroyAlternate(self);
    Heap_Free(self);
    return self;
}
