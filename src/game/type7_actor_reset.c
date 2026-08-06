#include "tingle/types.h"

/*
 * Recovered type-seven actor reset and flag-control routines. They tear down an
 * attached resource, restore idle state, and clear motion-related fields.
 */
extern void *gGameWork;
extern u32 data_020e1930[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *gameWork, u32 flag);
extern void GameWork_ClearFlag(void *gameWork, u32 flag);
extern void func_02047dd8(void *actor);
extern void func_0200b2c0(void *value, s32 x, s32 y, s32 z);
extern void func_02035518(void *value, s32 mode);
extern void func_0206e590(void *resource, s32 mode);
extern void func_0206c978(void *resource);
extern void Heap_Free(void *allocation);
extern void func_02072b68(void *object, u32 value);
extern void func_020481dc(void *actor, u32 first, u32 second, s32 duration);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. If attached resource +0x234 exists and its
 * halfword +0x1a is at most one, set game-work flag 0x417. Run the full reset
 * in func_02047dd8, set cooldown +0x2a6 to 15, and zero the recovered vector-
 * like values at +0x38, +0x88, and +0x98 through func_0200b2c0. Actor and
 * global game-work state may change; there is no return or direct hardware
 * access.
 */
void func_02047d40(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *resource = *(u8 **)(actor + 0x234);
    if (resource != 0 && *(u16 *)(resource + 0x1a) <= 1)
        GameWork_SetFlag(gGameWork, 0x417);
    func_02047dd8(actor);
    *(u16 *)(actor + 0x2a6) = 15;
    func_0200b2c0(actor + 0x38, 0, 0, 0);
    func_0200b2c0(actor + 0x88, 0, 0, 0);
    func_0200b2c0(actor + 0x98, 0, 0, 0);
}

/*
 * Input is a type-seven actor. Invoke virtual callback +0x54 with argument one,
 * clear bit 0x10 in object +0x54 halfword +0x24, clear the flag mask 0x808ac,
 * reset timers +0x2a6/+0x250, and finalize actor subobject +0x2a8. If resource
 * +0x234 exists, disable and destroy it, free its heap allocation, clear game-
 * work flag 0x3fd, clear actor collision bit 0x80, and null the pointer.
 *
 * Null related object +0x210, select animation two, update object +0x54 from
 * byte +0xd4 plus eight, and begin the data_020e1930 response for 120 ticks.
 * Clear actor +0x14 bits two/four, +0x10 mask 0x1f0000, +0x268 bit 0x200,
 * +0xd0 bit 0x4000, and timer +0x246. Actor, owned resource, heap, callback,
 * animation, and game-work state may change. Heap_Free is the SDK-facing
 * allocator effect; this routine has no return value.
 */
void func_02047dd8(void *self)
{
    u8 *actor = (u8 *)self;
    typedef void (*ActorModeCallback)(void *actor, s32 mode);
    ActorModeCallback callback = *(ActorModeCallback *)(*(u8 **)actor + 0x54);
    u8 *object;
    void *resource;

    callback(actor, 1);
    object = *(u8 **)(actor + 0x54);
    *(u16 *)(object + 0x24) &= (u16)~0x10;
    *(u32 *)(actor + 0x268) &= 0xfff7f753;
    *(u16 *)(actor + 0x2a6) = 0;
    *(u16 *)(actor + 0x250) = 0;
    func_02035518(actor + 0x2a8, 0);

    resource = *(void **)(actor + 0x234);
    if (resource != 0) {
        func_0206e590(resource, 0);
        func_0206c978(resource);
        Heap_Free(resource);
        *(void **)(actor + 0x234) = 0;
        GameWork_ClearFlag(gGameWork, 0x3fd);
        *(u32 *)(actor + 0xd0) &= ~0x80;
    }
    *(void **)(actor + 0x210) = 0;
    *(u16 *)(actor + 0xd6) = 2;
    func_02072b68(*(void **)(actor + 0x54), (actor[0xd4] + 8) & 0xff);
    func_020481dc(actor, data_020e1930[0], data_020e1930[1], 120);
    *(u32 *)(actor + 0x14) &= ~(2 | 4);
    *(u32 *)(actor + 0x10) &= ~0x1f0000;
    *(u32 *)(actor + 0x268) &= ~0x200;
    *(u32 *)(actor + 0xd0) &= ~0x4000;
    *(u16 *)(actor + 0x246) = 0;
}

/*
 * Inputs are actor and condition. Clear actor +0x14 bit two when condition is
 * nonzero, or set it when condition is zero. No value is returned and there
 * are no SDK or hardware effects.
 */
void func_02047f08(void *self, s32 condition)
{
    u8 *actor = (u8 *)self;
    if (condition != 0)
        *(u32 *)(actor + 0x14) &= ~2;
    else
        *(u32 *)(actor + 0x14) |= 2;
}

/*
 * Inputs are actor and condition. Clear actor +0x14 bit four when condition is
 * nonzero, or set it when condition is zero. No value is returned and there
 * are no SDK or hardware effects.
 */
void func_02047f20(void *self, s32 condition)
{
    u8 *actor = (u8 *)self;
    if (condition != 0)
        *(u32 *)(actor + 0x14) &= ~4;
    else
        *(u32 *)(actor + 0x14) |= 4;
}
