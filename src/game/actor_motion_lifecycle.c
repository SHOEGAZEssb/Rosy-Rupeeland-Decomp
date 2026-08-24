#include "tingle/actor_motion.h"
#include "tingle/heap.h"

/*
 * Lifecycle and elementary state controls for a polymorphic actor-motion
 * helper. The base object binds an actor, retains two fixed-point positions,
 * and tracks a compact two-triple movement state used by later update code.
 */

extern const void *gActorMotionVTable[];

/*
 * Construct an unbound motion helper, zero its embedded state, and initialize
 * the target position to (-0x80000, -0x74000, 0). Returns self; vector
 * construction/assignment has no hardware effects.
 */
ActorMotion *ActorMotion_Init(ActorMotion *self)
{
    VecFx32Object temporary;

    self->vtable = gActorMotionVTable;
    self->actor = 0;
    VecFx32Object_Init(&self->position);
    self->mode = 0;
    self->flags = 0;
    VecFx32Object_Init(&self->target);
    ActorMotionState_Init(&self->state);
    self->velocityX = 0;
    self->velocityY = 0;
    self->destinationX = 0;
    self->destinationY = 0;
    self->remainingSteps = 0;
    VecFx32Object_InitComponents(&temporary, -0x80000, -0x74000, 0);
    VecFx32Object_Assign(&self->target, &temporary);
    VecFx32Object_Destroy(&temporary);
    return self;
}

/* Zero both triples and both trailing words of the embedded movement state. */
ActorMotionState *ActorMotionState_Init(ActorMotionState *self)
{
    ActorMotionTriple_Clear(&self->xOscillation);
    ActorMotionTriple_Clear(&self->yOscillation);
    self->sampledOffsetX = 0;
    self->sampledOffsetY = 0;
    return self;
}

/* Zero the three signed components of a movement-state triple and return it. */
ActorMotionTriple *ActorMotionTriple_Clear(ActorMotionTriple *self)
{
    self->halfRange = 0;
    self->midpoint = 0;
    self->phaseIncrement = 0;
    return self;
}

/* Destroy both owned vector wrappers in reverse order and return self. */
ActorMotion *ActorMotion_Destroy(ActorMotion *self)
{
    VecFx32Object_Destroy(&self->target);
    VecFx32Object_Destroy(&self->position);
    return self;
}

/* Destroy both vector wrappers, free the object, and return its old address. */
ActorMotion *ActorMotion_DestroyAndFree(ActorMotion *self)
{
    VecFx32Object_Destroy(&self->target);
    VecFx32Object_Destroy(&self->position);
    Heap_Free(self);
    return self;
}

/* Alternate non-deleting destructor used by derived classes; returns self. */
ActorMotion *ActorMotion_DestroyBase(ActorMotion *self)
{
    VecFx32Object_Destroy(&self->target);
    VecFx32Object_Destroy(&self->position);
    return self;
}

/*
 * Reset an existing helper without replacing its vtable. This unbinds the
 * actor, reconstructs a zero position, clears movement state and fields, and
 * restores the default target position. Returns no value.
 */
void ActorMotion_Reset(ActorMotion *self)
{
    VecFx32Object zero;
    VecFx32Object target;

    self->actor = 0;
    VecFx32Object_InitComponents(&zero, 0, 0, 0);
    VecFx32Object_Assign(&self->position, &zero);
    VecFx32Object_Destroy(&zero);
    self->mode = 0;
    self->flags = 0;
    self->velocityX = 0;
    self->velocityY = 0;
    self->destinationX = 0;
    self->destinationY = 0;
    self->remainingSteps = 0;
    ActorMotionState_Reset(&self->state);
    VecFx32Object_InitComponents(&target, -0x80000, -0x74000, 0);
    VecFx32Object_Assign(&self->target, &target);
    VecFx32Object_Destroy(&target);
}

/*
 * Clear the two movement triples through the class copy helper and zero the
 * trailing words. Returns no value; temporary triples contain no resources.
 */
void ActorMotionState_Reset(ActorMotionState *self)
{
    ActorMotionTriple first;
    ActorMotionTriple second;

    ActorMotionTriple_Clear(&first);
    ActorMotionTriple_Assign(&self->xOscillation, &first);
    ActorMotionTriple_Clear(&second);
    ActorMotionTriple_Assign(&self->yOscillation, &second);
    self->sampledOffsetX = 0;
    self->sampledOffsetY = 0;
}

/* Assign all three components unless source and destination are identical. */
ActorMotionTriple *ActorMotionTriple_Assign(ActorMotionTriple *self,
                                 const ActorMotionTriple *source)
{
    if (self != source) {
        self->halfRange = source->halfRange;
        self->midpoint = source->midpoint;
        self->phaseIncrement = source->phaseIncrement;
    }
    return self;
}

/* Bind an actor and set motion mode 1; returns no value. */
void ActorMotion_BindActor(ActorMotion *self, void *actor)
{
    self->actor = actor;
    self->mode = 1;
}

/* Return the currently bound actor without changing state. */
void *ActorMotion_GetActor(const ActorMotion *self)
{
    return self->actor;
}

/* Copy a supplied vector payload into the current position and return it. */
VecFx32Object *ActorMotion_SetPosition(ActorMotion *self,
                             const VecFx32Object *position)
{
    return VecFx32Object_Assign(&self->position, position);
}

/* Select motion mode 2 without modifying any other state. */
void ActorMotion_SetMode2(ActorMotion *self)
{
    self->mode = 2;
}

/* Select motion mode 1 and clear the two leading motion-result words. */
void ActorMotion_SetMode1AndClearOutputs(ActorMotion *self)
{
    self->mode = 1;
    self->velocityX = 0;
    self->velocityY = 0;
}
