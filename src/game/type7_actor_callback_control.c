#include "tingle/types.h"

/*
 * Recovered type-seven callback-state controls. These routines select callback
 * pairs, assign their timers, dispatch the selected representation, and reset
 * actor state around those transitions.
 */
extern void *gGameWork;
extern u32 data_020e1938[];
extern u32 data_020e19d4[];
extern s32 data_020e1a84[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *gameWork, u32 flag);
extern void Heap_Free(void *allocation);
extern void func_0206c978(void *resource);
extern void GraphicsSpriteState_SetAnimationIndex(void *object, u32 value);
extern void Type7Actor_SetCallbackPair(void *actor, u32 first, u32 second, s32 duration);
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/* Invoke the actor's virtual +0x54 mode callback with mode one. */
static void enter_callback_mode(u8 *actor)
{
    typedef void (*ModeCallback)(void *actor, s32 mode);
    ModeCallback callback = *(ModeCallback *)(*(u8 **)actor + 0x54);
    callback(actor, 1);
}

/*
 * Input is a type-seven actor. Enter callback mode one, select animation three,
 * set +0x264 to 60, update object +0x54 using byte +0xd4 plus eight, and install
 * data_020e1938 for 120 ticks. Null +0x210 and clear flags 0xa0. If resource
 * +0x234 exists, destroy and free it, clear game-work flag 0x3fd, clear actor
 * +0xd0 bit 0x80, and null the resource. Finally clear timer +0x246. Actor,
 * callback, owned heap, animation, and game-work state may change; Heap_Free is
 * the SDK-facing allocator effect. This routine has no return value.
 */
void Type7Actor_ResetCallbackState(void *self)
{
    u8 *actor = (u8 *)self;
    void *resource;

    enter_callback_mode(actor);
    *(u16 *)(actor + 0xd6) = 3;
    *(u16 *)(actor + 0x264) = 60;
    GraphicsSpriteState_SetAnimationIndex(*(void **)(actor + 0x54), (actor[0xd4] + 8) & 0xff);
    Type7Actor_SetCallbackPair(actor, data_020e1938[0], data_020e1938[1], 120);
    *(void **)(actor + 0x210) = 0;
    *(u32 *)(actor + 0x268) &= ~0xa0;
    resource = *(void **)(actor + 0x234);
    if (resource != 0) {
        func_0206c978(resource);
        Heap_Free(resource);
        *(void **)(actor + 0x234) = 0;
        GameWork_ClearFlag(gGameWork, 0x3fd);
        *(u32 *)(actor + 0xd0) &= ~0x80;
    }
    *(u16 *)(actor + 0x246) = 0;
}

/*
 * Input is a type-seven actor. Draw one random value with its sign bit cleared.
 * One time in sixteen, select callback-pair index four and timer 60..119.
 * Otherwise choose index random modulo nine, increment it for +0xd0 bit 0x10
 * and again by two when byte +0x4a is nonzero, clamp it to four, and choose a
 * timer of 80..199. Store the timer at +0x24a, install the indexed pair from
 * data_020e19d4, enter callback mode one, and clear actor +0x14 bits two/four
 * and +0x10 mask 0x1f0000. Random, callback, actor flag, and animation state
 * change; no value is returned and there is no direct hardware access.
 */
void Type7Actor_SelectRandomCallback(void *self)
{
    u8 *actor = (u8 *)self;
    u32 random = genrand_int32() & 0x7fffffff;
    s32 index;
    s32 timer;

    if ((random & 0x0f) == 0) {
        index = 4;
        timer = func_020ada8c((s32)random, 60) + 60;
    } else {
        index = func_020ada8c((s32)random, 9);
        if ((*(u32 *)(actor + 0xd0) & 0x10) != 0)
            ++index;
        if (actor[0x4a] != 0)
            index += 2;
        if (index > 4)
            index = 4;
        timer = func_020ada8c((s32)random, 120) + 80;
    }
    *(u16 *)(actor + 0x24a) = (u16)timer;
    Type7Actor_SetCallbackPair(actor, data_020e19d4[index * 2],
                  data_020e19d4[index * 2 + 1], timer);
    enter_callback_mode(actor);
    *(u32 *)(actor + 0x14) &= ~(2 | 4);
    *(u32 *)(actor + 0x10) &= ~0x1f0000;
}

/*
 * Input is a type-seven actor. Draw one random value to select callback-pair
 * index zero or one by its low bit, then another sign-cleared value for timer
 * 60..119. Store and install the selection from data_020e19d4, enter callback
 * mode one, and clear actor +0x14 bits two/four and +0x10 mask 0x1f0000.
 * Random, callback, actor flag, and animation state change; no value is
 * returned and no hardware is accessed directly.
 */
void Type7Actor_SelectRandomCallbackPair01(void *self)
{
    u8 *actor = (u8 *)self;
    u32 selector = genrand_int32();
    s32 timer = func_020ada8c(
        (s32)(genrand_int32() & 0x7fffffff), 60) + 60;
    s32 index = selector & 1;

    *(u16 *)(actor + 0x24a) = (u16)timer;
    Type7Actor_SetCallbackPair(actor, data_020e19d4[index * 2],
                  data_020e19d4[index * 2 + 1], timer);
    enter_callback_mode(actor);
    *(u32 *)(actor + 0x14) &= ~(2 | 4);
    *(u32 *)(actor + 0x10) &= ~0x1f0000;
}

/*
 * Input is a type-seven actor. Search 22 callback pairs in data_020e19d4 for
 * actor words +0x208/+0x20c using the retail null-first-word rule. For the
 * matching index, data_020e1a84 provides a byte function/vtable offset and an
 * encoded this-pointer adjustment: shift the second word right once, and when
 * its low bit is set load the callback from the adjusted object's vtable;
 * otherwise call the first word directly. Invoke the callback and return. If
 * no pair matches, call OS_Halt; it is expected not to return. Callback state
 * may change and OS_Halt is a direct SDK effect. This routine returns no value.
 */
void Type7Actor_DispatchCurrentCallback(void *self)
{
    u8 *actor = (u8 *)self;
    s32 i;
    for (i = 0; i < 22; ++i) {
        void *first = *(void **)(data_020e19d4 + i * 2);
        void *actorFirst = *(void **)(actor + 0x208);
        if (actorFirst == first
            && (*(void **)(actor + 0x20c)
                    == *(void **)(data_020e19d4 + i * 2 + 1)
                || actorFirst == 0)) {
            typedef void (*DispatchCallback)(void *adjustedActor);
            s32 functionWord = data_020e1a84[i * 2];
            s32 adjustment = data_020e1a84[i * 2 + 1];
            u8 *adjustedActor = actor + (adjustment >> 1);
            DispatchCallback callback;
            if ((adjustment & 1) != 0)
                callback = *(DispatchCallback *)(*(u8 **)adjustedActor
                                                  + functionWord);
            else
                callback = (DispatchCallback)functionWord;
            callback(adjustedActor);
            return;
        }
    }
    OS_Halt();
}

/*
 * Inputs are actor, two callback representation words, and duration. Store the
 * words at +0x208/+0x20c, clear halfword counters +0x244/+0x248, and store the
 * duration at +0x24a. No value is returned and there are no SDK or hardware
 * effects.
 */
void Type7Actor_SetCallbackPair(void *self, u32 first, u32 second, s32 duration)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x208) = first;
    *(u32 *)(actor + 0x20c) = second;
    *(u16 *)(actor + 0x244) = 0;
    *(u16 *)(actor + 0x248) = 0;
    *(u16 *)(actor + 0x24a) = (u16)duration;
}
