#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered lifecycle for an extended actor owning the transform-like value at
 * +0x29c. Two entry points share the same constructor implementation.
 */
extern u8 data_020e08ec[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0203db80(void *actor, const void *configuration);
extern void *func_0203e494(void *actor);
extern void func_0200500c(void *value, s32 x, s32 y, s32 z);
extern void func_02005058(void *value);
extern s32 func_02043610(const void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the base actor from configuration, install vtable data_020e08ec,
 * clear halfword +0x298, construct a zero value at +0x29c, and store the
 * func_02043610 result at +0x29a. Return self; actor/owned-value state changes.
 */
void *func_020440cc(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    func_0203db80(actor, configuration);
    *(void **)actor = data_020e08ec;
    *(u16 *)(actor + 0x298) = 0;
    func_0200500c(actor + 0x29c, 0, 0, 0);
    *(u16 *)(actor + 0x29a) = (u16)func_02043610(actor);
    return actor;
}

/* Same inputs, state changes, and return contract as func_020440cc. */
void *func_02044118(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    func_0203db80(actor, configuration);
    *(void **)actor = data_020e08ec;
    *(u16 *)(actor + 0x298) = 0;
    func_0200500c(actor + 0x29c, 0, 0, 0);
    *(u16 *)(actor + 0x29a) = (u16)func_02043610(actor);
    return actor;
}

/* Finalize +0x29c, invoke the base destructor, and return self. */
void *func_02044164(void *self)
{
    func_02005058((u8 *)self + 0x29c);
    func_0203e494(self);
    return self;
}

/*
 * Finalize +0x29c, invoke the base destructor, free self, and return the
 * original pointer value. Actor storage becomes invalid after Heap_Free.
 */
void *func_02044184(void *self)
{
    func_02005058((u8 *)self + 0x29c);
    func_0203e494(self);
    Heap_Free(self);
    return self;
}

/* Finalize +0x29c, invoke the base destructor, and return self. */
void *func_020441ac(void *self)
{
    func_02005058((u8 *)self + 0x29c);
    func_0203e494(self);
    return self;
}
