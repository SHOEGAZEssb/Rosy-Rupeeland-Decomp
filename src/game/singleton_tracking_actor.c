#include "tingle/types.h"

/*
 * Recovered derived actor that tracks the category-one singleton at half scale.
 * Its lifecycle also owns a persistent vertical offset in game work.
 */

extern const u8 data_020e1f2c[];
extern u8 *data_021052fc;
extern u8 *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 category);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void *ActorDerivedRuntime_Init(void *actor, const void *descriptor);
extern void ActorDerivedRuntime_DestroyAlternate(void *actor);
extern void ActorDerivedRuntime_UpdateFrame(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Input is destination actor storage. Construct the recovered base through
 * ActorDerivedRuntime_Init, install vtable data_020e1f2c, and clear words
 * +0x208/+0x20c/+0x210/+0x214. Return self. Base construction may mutate
 * actor-owned engine state; there are no direct hardware effects.
 */
void *func_0204d068(void *self, const void *descriptor)
{
    u8 *actor = (u8 *)self;
    ActorDerivedRuntime_Init(actor, descriptor);
    *(const void **)actor = data_020e1f2c;
    *(u32 *)(actor + 0x208) = 0;
    *(u32 *)(actor + 0x20c) = 0;
    *(u32 *)(actor + 0x210) = 0;
    *(u32 *)(actor + 0x214) = 0;
    return actor;
}

/*
 * Input is a tracking actor. Restore vtable data_020e1f2c, clear game-work
 * halfword +0x9e, and invoke the non-deleting base destructor ActorDerivedRuntime_DestroyAlternate.
 * Return self. Actor and game-work state change; no hardware effects occur.
 */
void *func_0204d09c(void *self)
{
    u8 *actor = (u8 *)self;
    *(const void **)actor = data_020e1f2c;
    *(u16 *)(gGameWork + 0x9e) = 0;
    ActorDerivedRuntime_DestroyAlternate(actor);
    return actor;
}

/*
 * Input is a tracking actor. Perform the same vtable, game-work, and base
 * teardown as func_0204d09c, then release self through Heap_Free. Return the
 * original address. Heap, actor, and game-work state change without direct
 * hardware effects.
 */
void *func_0204d0d0(void *self)
{
    u8 *actor = (u8 *)self;
    *(const void **)actor = data_020e1f2c;
    *(u16 *)(gGameWork + 0x9e) = 0;
    ActorDerivedRuntime_DestroyAlternate(actor);
    Heap_Free(actor);
    return actor;
}

/*
 * Input is a tracking actor. If actor +0x10 bit 0x01000000 is set, delegate to
 * base update ActorDerivedRuntime_UpdateFrame. Otherwise cache the category-one singleton from
 * collection +0x2e7c at actor +0x208. When game-work flag 0x405 is set, invoke
 * actor virtual slot 0x54 with zero. Read mode bits 18..19 from global phase
 * state +0x30bc/+0x40. In mode two, set actor X to half the singleton X, Y to
 * half singleton Y plus signed game-work halfword +0x9e in 20.12 units, and Z
 * to zero. Other modes copy half of all three singleton coordinates. Signed
 * halving truncates toward zero. No value is returned. Actor, virtual-method,
 * collection, and game-work state may change; there are no direct hardware
 * effects.
 */
void func_0204d10c(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *collection;
    u8 *target;
    u32 mode;
    if ((*(u32 *)(actor + 0x10) & 0x01000000) != 0) {
        ActorDerivedRuntime_UpdateFrame(actor);
        return;
    }
    collection = (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
    target = *(u8 **)(collection + 0x2e7c);
    *(u8 **)(actor + 0x208) = target;
    if (GameWork_TestFlag(gGameWork, 0x405) != 0) {
        void (**vtable)(void *, s32) = *(void (***)(void *, s32))actor;
        vtable[0x54 / 4](actor, 0);
    }
    mode = (*(u32 *)(*(u8 **)(data_021052fc + 0x30bc) + 0x40) >> 18) & 3;
    *(s32 *)(actor + 0x1c) = *(s32 *)(target + 0x1c) / 2;
    if (mode == 2) {
        *(s32 *)(actor + 0x20) = *(s32 *)(target + 0x20) / 2
            + *(s16 *)(gGameWork + 0x9e) * 0x1000;
        *(s32 *)(actor + 0x24) = 0;
    } else {
        *(s32 *)(actor + 0x20) = *(s32 *)(target + 0x20) / 2;
        *(s32 *)(actor + 0x24) = *(s32 *)(target + 0x24) / 2;
    }
}
