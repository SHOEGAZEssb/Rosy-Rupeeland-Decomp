#include "tingle/actor_motion.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/* Tear down the common actor geometry header, with optional heap release. */
typedef struct ActorBaseGeometryLifecycle {
    void *vtable_00;
    ActorCollisionBoundsS8 collisionBounds;
    u8 field_08[0x10];
    VecFx32Object position;
    VecFx32Object previousPosition;
    VecFx32Object motionVector;
} ActorBaseGeometryLifecycle;

extern u8 data_020def7c[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_StopOwnerEffects(void *, ActorBaseGeometryLifecycle *);
#ifdef __cplusplus
}
#endif

static ActorBaseGeometryLifecycle *destroyGeometry(
    ActorBaseGeometryLifecycle *self)
{
    self->vtable_00 = data_020def7c;
    Sound_StopOwnerEffects(gSoundContext, self);
    VecFx32Object_Destroy(&self->motionVector);
    VecFx32Object_Destroy(&self->previousPosition);
    VecFx32Object_Destroy(&self->position);
    return self;
}

/*
 * Restore the base vtable, detach self from the sound context, destroy vector
 * values at 0x38, 0x28, and 0x18 in that order, and return self without
 * freeing it. Helpers own any sound/SDK effects.
 */
ActorBaseGeometryLifecycle *func_02030d70(ActorBaseGeometryLifecycle *self)
{
    return destroyGeometry(self);
}

/*
 * Perform the base geometry teardown, free self through Heap_Free, and return
 * its former address. The returned pointer no longer owns live storage.
 */
ActorBaseGeometryLifecycle *ActorBaseGeometry_DestroyAndFree(
    ActorBaseGeometryLifecycle *self)
{
    destroyGeometry(self);
    Heap_Free(self);
    return self;
}

/*
 * Restore the vtable, detach sound state, and destroy the three vector values.
 * This address-derived destructor variant returns self without freeing it.
 */
ActorBaseGeometryLifecycle *func_02030e08(ActorBaseGeometryLifecycle *self)
{
    return destroyGeometry(self);
}

/* Return a pointer to the four-byte bounds record at self offset 0x04. */
ActorCollisionBoundsS8 *Actor_GetCollisionBounds(ActorBaseGeometryLifecycle *self)
{
    return &self->collisionBounds;
}
