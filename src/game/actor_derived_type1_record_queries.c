#include "tingle/types.h"

/* Query the active type-1 actor descriptor's identifier and type byte. */

/* Return signed descriptor +0x27c halfword +0x00, or -1 when absent. */
s32 ActorDerivedType1_GetActiveRecordId(void *self)
{
    u8 *descriptor = *(u8 **)((u8 *)self + 0x27c);
    return descriptor != 0 ? *(s16 *)descriptor : -1;
}

/* Return one exactly when an active descriptor has type byte 0x69. */
s32 ActorDerivedType1_IsActiveRecordType69(void *self)
{
    u8 *descriptor = *(u8 **)((u8 *)self + 0x27c);
    return descriptor != 0 && descriptor[8] == 0x69;
}

/* Return one exactly when an active descriptor has type byte 0x6a. */
s32 ActorDerivedType1_IsActiveRecordType6A(void *self)
{
    u8 *descriptor = *(u8 **)((u8 *)self + 0x27c);
    return descriptor != 0 && descriptor[8] == 0x6a;
}

/* Return one exactly when an active descriptor has type byte 0x6f. */
s32 ActorDerivedType1_IsActiveRecordType6F(void *self)
{
    u8 *descriptor = *(u8 **)((u8 *)self + 0x27c);
    return descriptor != 0 && descriptor[8] == 0x6f;
}
