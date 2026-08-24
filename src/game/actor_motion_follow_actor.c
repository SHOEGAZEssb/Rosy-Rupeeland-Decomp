#include "tingle/actor_motion.h"

/*
 * Actor-following position refresh for the GameWork motion subclass. The
 * active phase configuration selects full-size or half-size actor coordinates.
 */

extern void *gGamePhaseRuntime;

static s32 actor_motion_half_toward_zero(s32 value)
{
    return (value + (s32)((u32)value >> 31)) >> 1;
}

/*
 * Rebuild the current position from the bound actor and add the base target.
 * Configuration bits 18..19 at active-runtime config offset 0x40 select mode:
 * 2 halves actor X/Y, 1 halves X and (Y-Z), and other values use X/Y directly.
 * Returns zero. The temporary vector is a retail C++ lifetime artifact; no
 * hardware or global state changes, though the motion position is mutated.
 */
s32 ActorMotion_UpdateFromBoundActor(ActorMotion *self)
{
    VecFx32Object temporary;
    u8 *actor = (u8 *)self->actor;
    u8 *runtime = *(u8 **)&gGamePhaseRuntime;
    u8 *config = *(u8 **)(runtime + 0x30bc);
    u32 mode;

    VecFx32Object_Init(&temporary);
    mode = (*(u32 *)(config + 0x40) << 12) >> 30;
    if (mode == 2) {
        self->position.value.x =
            actor_motion_half_toward_zero(*(s32 *)(actor + 0x1c));
        self->position.value.y =
            actor_motion_half_toward_zero(*(s32 *)(actor + 0x20));
    } else if (mode == 1) {
        self->position.value.x =
            actor_motion_half_toward_zero(*(s32 *)(actor + 0x1c));
        self->position.value.y = actor_motion_half_toward_zero(
            *(s32 *)(actor + 0x20) - *(s32 *)(actor + 0x24));
    } else {
        self->position.value.x = *(s32 *)(actor + 0x1c);
        self->position.value.y = *(s32 *)(actor + 0x20);
    }
    VecFx32Object_Add(&self->position, &self->target);
    VecFx32Object_Destroy(&temporary);
    return 0;
}

/* Return the address of the current position wrapper; changes no state. */
VecFx32Object *ActorMotion_GetPosition(ActorMotion *self)
{
    return &self->position;
}
