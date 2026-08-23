#include "tingle/actor.h"
#include "tingle/graphics_sprite_state.h"

/* Ignore the actor input, change no state, and return no value. */
void Actor_HandleLanding(Actor *self)
{
    (void)self;
}

/*
 * Compare current/previous halfwords 0xd6/0xd8 and 0xda/0xdc plus bytes
 * 0xd4/0xd5. If any differ, or word 0xd0 has flag 0x1000, call vtable offset
 * 0x5c and clear that flag. Otherwise call vtable offset 0x68; when it returns
 * nonzero, copy halfword 0xde to attachment-0x54 halfword 0x36. Returns no
 * value; virtual callbacks may update animation and presentation state.
 */
void Actor_SynchronizeStatePresentation(Actor *self)
{
    ActorVTable *vtable = self->vtable;

    if (self->state != self->previousState ||
        self->substate != self->previousSubstate ||
        self->direction != self->previousDirection ||
        (self->runtimeFlags & ACTOR_FORCE_PRESENTATION_REFRESH_FLAG)) {
        vtable->updatePresentationForState(self);
        self->runtimeFlags &= ~ACTOR_FORCE_PRESENTATION_REFRESH_FLAG;
    } else if (vtable->isCurrentState5Or6(self)) {
        self->primaryAttachment->scaleZ = self->presentationScaleZ;
    }
}

/* Ignore the actor input, change no state, and return no value. */
void Actor_UpdatePresentationForState(Actor *self)
{
    (void)self;
}

/* Ignore the actor input and return zero without changing state. */
s32 Actor_IsCurrentState5Or6(const Actor *self)
{
    (void)self;
    return 0;
}

/* Ignore the actor input and return zero without changing state. */
s32 Actor_IsPreviousState9Or10(const Actor *self)
{
    (void)self;
    return 0;
}
