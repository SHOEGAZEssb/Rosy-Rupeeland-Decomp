#include "tingle/types.h"

/*
 * Recovered lifecycle for the actor class following extended type two. The
 * destructor restores its terminal vtable and releases an owned array; the
 * constructor initializes the base and two class-specific halfwords.
 */
extern u8 data_020dfec0[];
extern u8 data_020e0290[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020c0c24(void *array, s32 elementSize, s32 alignment,
                          void (*destructor)(void *));
extern void func_02004ac8(void *element);
extern void func_0203db80(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Restore vtable data_020dfec0, destroy owned array +4 when nonnull using
 * eight-byte elements/alignment and func_02004ac8, then return self. Object and
 * owned allocation state may change; func_020c0c24 performs destruction/freeing
 * but there is no direct hardware access.
 */
void *func_020437f4(void *self)
{
    u8 *object = (u8 *)self;
    *(void **)object = data_020dfec0;
    if (*(void **)(object + 4) != 0)
        func_020c0c24(*(void **)(object + 4), 8, 8, func_02004ac8);
    return object;
}

/*
 * Initialize the base through func_0203db80, install vtable data_020e0290, set
 * halfword +0x298 to two and +0x29a to zero, and return self. Actor/base state
 * changes; no direct SDK or hardware operation occurs.
 */
void *func_02043830(void *self)
{
    u8 *actor = (u8 *)self;
    func_0203db80(actor);
    *(void **)actor = data_020e0290;
    *(u16 *)(actor + 0x298) = 2;
    *(u16 *)(actor + 0x29a) = 0;
    return actor;
}
