#include "tingle/types.h"

/*
 * Recovered non-deleting lifecycle for the extended record-array helper and
 * initialization for the actor class following extended type two.
 */
extern u8 data_020dfec0[];
extern u8 data_020e0290[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020c0c24(void *array, s32 elementSize, s32 alignment,
                          void (*destructor)(void *));
extern void NoOpDestructor(void *element);
extern void ActorExtendedType2_Init(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Restore vtable data_020dfec0, destroy owned array +4 when nonnull using
 * eight-byte elements/alignment and NoOpDestructor, then return self. Object and
 * owned allocation state may change; func_020c0c24 performs destruction/freeing
 * but there is no direct hardware access. Unlike
 * ActorExtendedRecordArray_DestroyAndFree, this destructor retains self storage.
 */
void *ActorExtendedRecordArray_Destroy(void *self)
{
    u8 *object = (u8 *)self;
    *(void **)object = data_020dfec0;
    if (*(void **)(object + 4) != 0)
        func_020c0c24(*(void **)(object + 4), 8, 8, NoOpDestructor);
    return object;
}

/*
 * Initialize the base through ActorExtendedType2_Init, install vtable data_020e0290, set
 * halfword +0x298 to two and +0x29a to zero, and return self. Actor/base state
 * changes; no direct SDK or hardware operation occurs.
 */
void *ActorExtendedType3_Init(void *self)
{
    u8 *actor = (u8 *)self;
    ActorExtendedType2_Init(actor);
    *(void **)actor = data_020e0290;
    *(u16 *)(actor + 0x298) = 2;
    *(u16 *)(actor + 0x29a) = 0;
    return actor;
}
