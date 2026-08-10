#include "tingle/heap.h"
#include "tingle/types.h"

/* Apply table-record presentation state and manage a registered derived subclass lifecycle. */
extern void *data_020df840;
extern u8 data_02105714[];
extern void *gActorRegisteredSubclassRegistry[4];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *attachment, u32 animation);
extern void *ActorTableRecord_Init(void *actor, const void *descriptor);
extern void *ActorDerivedRuntime_DestroyAlternate(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Return unless actor word +0x20c bit 0x2000 is set. Select attachment +0x54
 * animation from actor byte +0xd4, clear attachment halfword +0x24 bit one,
 * and set bit two. Returns no value; animation and flag writes mutate the
 * actor's presentation.
 */
void ActorTableRecord_UpdatePresentationState(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *attachment;
    if ((*(u32 *)(actor + 0x20c) & 0x2000) == 0)
        return;
    attachment = *(u8 **)(actor + 0x54);
    GraphicsSpriteState_SetAnimationIndex(attachment, actor[0xd4]);
    *(u16 *)(attachment + 0x24) &= ~1;
    *(u16 *)(attachment + 0x24) |= 2;
}

/*
 * Initialize the table-record base through ActorTableRecord_Init and install
 * this subclass vtable. Clear halfword +0x218, set +0x21a to 120 and +0xd6
 * to two, OR actor flags +0x14 with six, set word +0x114 to one, increment
 * shared signed halfword data_02105714+2, set word +0x108 to 24, and return
 * self. Base construction and shared-counter mutation have observable engine
 * state.
 */
void *ActorRegisteredSubclass_Init(void *self, const void *descriptor)
{
    u8 *actor = (u8 *)ActorTableRecord_Init(self, descriptor);
    *(void **)actor = data_020df840;
    *(u16 *)(actor + 0x218) = 0;
    *(u16 *)(actor + 0x21a) = 0x78;
    *(s16 *)(actor + 0xd6) = 2;
    *(u32 *)(actor + 0x14) |= 6;
    *(s32 *)(actor + 0x114) = 1;
    ++*(s16 *)(data_02105714 + 2);
    *(s32 *)(actor + 0x108) = 0x18;
    return actor;
}

/* Clear matching self entries before the first null in the four-slot registry. */
static void removeRegisteredActor(void *self)
{
    s32 i;
    for (i = 0; i < 4 && gActorRegisteredSubclassRegistry[i] != 0; ++i) {
        if (gActorRegisteredSubclassRegistry[i] == self)
            gActorRegisteredSubclassRegistry[i] = 0;
    }
}

/*
 * Remove self from matching entries before the first null in gActorRegisteredSubclassRegistry,
 * invoke ActorDerivedRuntime_DestroyAlternate, and return self without
 * freeing it.
 */
void *ActorRegisteredSubclass_Destroy(void *self)
{
    removeRegisteredActor(self);
    ActorDerivedRuntime_DestroyAlternate(self);
    return self;
}

/*
 * Perform ActorRegisteredSubclass_Destroy's registry/base teardown, free
 * self, and return its former address.
 */
void *ActorRegisteredSubclass_DestroyAndFree(void *self)
{
    removeRegisteredActor(self);
    ActorDerivedRuntime_DestroyAlternate(self);
    Heap_Free(self);
    return self;
}
