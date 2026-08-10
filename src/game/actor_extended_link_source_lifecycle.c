#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered lifecycle and guarded frame update for the source-side actor class
 * consumed by the cross-type pairing pass.
 */
extern u8 data_020e06b4[];
extern s16 data_02105728;
extern void *data_0210574c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorExtendedType2_Init(void *actor, const void *configuration);
extern void *ActorExtendedType2_Destroy(void *actor);
extern void ActorExtendedType2_UpdateFrame(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the base actor, install vtable data_020e06b4, clear partner
 * +0x298, append self to data_0210574c when its signed count is below eight,
 * and clear flags +0x29c. Return self. Actor and global list state may change.
 */
void *ActorExtendedLinkSource_Init(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    ActorExtendedType2_Init(actor, configuration);
    *(void **)actor = data_020e06b4;
    *(void **)(actor + 0x298) = 0;
    if (data_02105728 < 8) {
        data_0210574c[data_02105728] = actor;
        ++data_02105728;
    }
    *(u32 *)(actor + 0x29c) = 0;
    return actor;
}

/* Invoke base destructor ActorExtendedType2_Destroy and return self; actor state is torn down. */
void *func_02043e38(void *self)
{
    ActorExtendedType2_Destroy(self);
    return self;
}

/*
 * Invoke base destructor ActorExtendedType2_Destroy, free self, and return the original
 * pointer value. Actor storage becomes invalid after the heap operation.
 */
void *ActorExtendedLinkSource_DestroyAndFree(void *self)
{
    ActorExtendedType2_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Invoke base destructor ActorExtendedType2_Destroy and return self; actor state is torn down. */
void *func_02043e68(void *self)
{
    ActorExtendedType2_Destroy(self);
    return self;
}

/*
 * Return immediately while actor +0x14 has bit 0x200000 set. Otherwise run the
 * base frame update and clear bit one in flags +0x29c. Returns no value; actor
 * frame and class flag state may change, with no direct hardware access.
 */
void ActorExtendedLinkSource_UpdateFrame(void *self)
{
    u8 *actor = (u8 *)self;
    if ((*(u32 *)(actor + 0x14) & 0x200000) != 0)
        return;
    ActorExtendedType2_UpdateFrame(actor);
    *(u32 *)(actor + 0x29c) &= ~2u;
}
