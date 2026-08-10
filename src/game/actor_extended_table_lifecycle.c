#include "tingle/types.h"

/*
 * Recovered duplicated constructors for an extended actor whose limits are
 * selected from fixed 0x32-byte records by a virtual descriptor byte.
 */
extern u8 data_020e0d50[];
extern u8 data_020eb850[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorExtendedType2_Init(void *actor, const void *configuration);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the base and install vtable data_020e0d50. Clear halfwords +0x298,
 * +0x29c, and +0x2a0; ask vtable +0xc8 to fill a temporary descriptor; then
 * scan all 67 0x32-byte data_020eb850 records for a signed key matching byte
 * +0x25. Store the last matching record at +0x2a4. A match supplies record
 * halfwords +0x22/+0x24/+0x26 to actor +0x29a/+0x29e/+0x2a2; without one those
 * actor halfwords are zeroed. Return self; actor and virtual-query state change.
 */
void *ActorExtendedTable_Init(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    u8 descriptor[0x30];
    u8 *match = 0;
    s32 i;
    ActorExtendedType2_Init(actor, configuration);
    *(void **)actor = data_020e0d50;
    *(u16 *)(actor + 0x298) = 0;
    *(u16 *)(actor + 0x29c) = 0;
    *(u16 *)(actor + 0x2a0) = 0;
    (*(void (**)(void *, void *))(*(u8 **)actor + 0xc8))(actor, descriptor);
    for (i = 0; i < 67; ++i) {
        u8 *record = data_020eb850 + i * 0x32;
        if (*(s16 *)record == *(s8 *)(descriptor + 0x25))
            match = record;
    }
    *(void **)(actor + 0x2a4) = match;
    if (match == 0) {
        *(u16 *)(actor + 0x29a) = 0;
        *(u16 *)(actor + 0x29e) = 0;
        *(u16 *)(actor + 0x2a2) = 0;
    } else {
        *(u16 *)(actor + 0x29a) = *(u16 *)(match + 0x22);
        *(u16 *)(actor + 0x2a2) = *(u16 *)(match + 0x26);
        *(u16 *)(actor + 0x29e) = *(u16 *)(match + 0x24);
    }
    return actor;
}

/* Same inputs, table scan, state changes, and return contract as ActorExtendedTable_Init. */
void *ActorExtendedTable_InitDuplicate(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    u8 descriptor[0x30];
    u8 *match = 0;
    s32 i;
    ActorExtendedType2_Init(actor, configuration);
    *(void **)actor = data_020e0d50;
    *(u16 *)(actor + 0x298) = 0;
    *(u16 *)(actor + 0x29c) = 0;
    *(u16 *)(actor + 0x2a0) = 0;
    (*(void (**)(void *, void *))(*(u8 **)actor + 0xc8))(actor, descriptor);
    for (i = 0; i < 67; ++i) {
        u8 *record = data_020eb850 + i * 0x32;
        if (*(s16 *)record == *(s8 *)(descriptor + 0x25))
            match = record;
    }
    *(void **)(actor + 0x2a4) = match;
    if (match == 0) {
        *(u16 *)(actor + 0x29a) = 0;
        *(u16 *)(actor + 0x29e) = 0;
        *(u16 *)(actor + 0x2a2) = 0;
    } else {
        *(u16 *)(actor + 0x29a) = *(u16 *)(match + 0x22);
        *(u16 *)(actor + 0x2a2) = *(u16 *)(match + 0x26);
        *(u16 *)(actor + 0x29e) = *(u16 *)(match + 0x24);
    }
    return actor;
}
