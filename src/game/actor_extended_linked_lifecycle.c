#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered lifecycle and base-forwarding wrappers for actors participating in
 * the cross-type pairing list maintained by ActorExtendedPairing_UpdateLinks.
 */
extern u8 data_020e04d8[];
extern s16 data_0210572a;
extern void *data_0210572c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorExtendedType2_Init(void *actor, const void *configuration);
extern void *ActorExtendedType2_Destroy(void *actor);
extern void ActorExtendedType2_UpdateFrame(void *actor);
extern s32 ActorExtendedType2_ApplyContactResponse(void *actor, void *other, s32 context);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the base actor from configuration, install vtable data_020e04d8,
 * clear partner pointer +0x298, and append self to data_0210572c when its signed
 * count is below eight. Return self. Base state and the global pairing list may
 * change; no direct SDK or hardware access occurs.
 */
void *ActorExtendedLinked_Init(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    ActorExtendedType2_Init(actor, configuration);
    *(void **)actor = data_020e04d8;
    *(void **)(actor + 0x298) = 0;
    if (data_0210572a < 8) {
        data_0210572c[data_0210572a] = actor;
        ++data_0210572a;
    }
    return actor;
}

/* Invoke base destructor ActorExtendedType2_Destroy and return self; actor state is torn down. */
void *func_02043d1c(void *self)
{
    ActorExtendedType2_Destroy(self);
    return self;
}

/*
 * Invoke base destructor ActorExtendedType2_Destroy, free self, and return the original
 * pointer value. Actor storage becomes invalid after the heap operation.
 */
void *ActorExtendedLinked_DestroyAndFree(void *self)
{
    ActorExtendedType2_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Invoke base destructor ActorExtendedType2_Destroy and return self; actor state is torn down. */
void *func_02043d4c(void *self)
{
    ActorExtendedType2_Destroy(self);
    return self;
}

/* Forward actor to base frame update ActorExtendedType2_UpdateFrame; actor state may change. */
void ActorExtendedLinked_UpdateFrame(void *self)
{
    ActorExtendedType2_UpdateFrame(self);
}

/*
 * Forward actor, other object, and context to ActorExtendedType2_ApplyContactResponse and return its
 * result. Collision response and actor motion state may change.
 */
s32 ActorExtendedLinked_ApplyContactResponse(void *self, void *other, s32 context)
{
    return ActorExtendedType2_ApplyContactResponse(self, other, context);
}
