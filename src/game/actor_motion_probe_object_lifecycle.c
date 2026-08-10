#include "tingle/heap.h"
#include "tingle/types.h"

/* Construct, destroy, debug-render, initialize, and update a motion-probe actor subclass. */
extern void *data_020df61c;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02033b38(void *actor, s32 column);
extern void *ActorDerivedRuntime_Init(void *actor);
extern void *ActorDerivedRuntime_DestroyAlternate(void *actor);
extern void func_02004fe0(void *vector);
extern void func_02005058(void *vector);
extern void Actor_InitializeFromDescriptor(void *actor,
                                           const void *descriptor);
extern void ActorDerivedRuntime_UpdateFrame(void *actor);
#ifdef __cplusplus
}
#endif

/* Forward actor and debug column to func_02033b38; return no value. */
void func_0203c134(void *actor, s32 column)
{
    func_02033b38(actor, column);
}

/*
 * Initialize the recovered base through ActorDerivedRuntime_Init, install this subclass
 * vtable, set halfwords +0x208/+0x20a to 0x4000/zero and word +0x20c to
 * 0x1000, initialize vectors +0x210/+0x220/+0x230, clear +0x240, and set
 * +0x244/+0x248/+0x24c/+0x250/+0x254 to 16/16/30/5/1600. Return self; base
 * and vector initialization establish actor-owned runtime state.
 */
void *func_0203c140(void *self)
{
    u8 *actor = (u8 *)ActorDerivedRuntime_Init(self);
    *(void **)actor = data_020df61c;
    *(u16 *)(actor + 0x208) = 0x4000;
    *(u16 *)(actor + 0x20a) = 0;
    *(s32 *)(actor + 0x20c) = 0x1000;
    func_02004fe0(actor + 0x210);
    func_02004fe0(actor + 0x220);
    func_02004fe0(actor + 0x230);
    *(s32 *)(actor + 0x240) = 0;
    *(s32 *)(actor + 0x244) = 0x10;
    *(s32 *)(actor + 0x248) = 0x10;
    *(s32 *)(actor + 0x24c) = 0x1e;
    *(s32 *)(actor + 0x250) = 5;
    *(s32 *)(actor + 0x254) = 0x640;
    return actor;
}

/* Destroy vectors +0x230/+0x220/+0x210 in reverse order, run base teardown, and return self. */
void *func_0203c1c0(void *self)
{
    u8 *actor = (u8 *)self;
    func_02005058(actor + 0x230);
    func_02005058(actor + 0x220);
    func_02005058(actor + 0x210);
    ActorDerivedRuntime_DestroyAlternate(actor);
    return actor;
}

/* Perform func_0203c1c0's teardown, free self, and return its former address. */
void *func_0203c1f0(void *self)
{
    void *result = func_0203c1c0(self);
    Heap_Free(self);
    return result;
}

/* Forward actor and descriptor to Actor_InitializeFromDescriptor. */
void func_0203c228(void *actor, const void *descriptor)
{
    Actor_InitializeFromDescriptor(actor, descriptor);
}

/* Forward actor to base per-frame update ActorDerivedRuntime_UpdateFrame; return no value. */
void func_0203c234(void *actor)
{
    ActorDerivedRuntime_UpdateFrame(actor);
}
