/*
 * Lifecycle wrappers for a three-slot graphics animation resource state. The
 * replacement and release operations live in adjacent recovered source units.
 */
#include "tingle/types.h"

typedef struct AnimationResourceState {
    void *character;
    void *palette;
    void *screen;
} AnimationResourceState;

void AnimationResourceState_ReleaseResources(AnimationResourceState *state);

/* Initialize all three borrowed-resource slots to null and return state. */
void *func_02071e90(AnimationResourceState *state)
{
    state->character = 0;
    state->palette = 0;
    state->screen = 0;
    return state;
}

/* Initialize the equivalent embedded-state variant and return state. */
void *AnimationResourceState_InitEmbedded(AnimationResourceState *state)
{
    state->character = 0;
    state->palette = 0;
    state->screen = 0;
    return state;
}

/* Release a resource triplet without freeing caller-owned state storage. */
void *AnimationResourceState_Destroy(AnimationResourceState *state)
{
    AnimationResourceState_ReleaseResources(state);
    return state;
}

/* Release the equivalent embedded-state variant and return its storage. */
void *func_02071ecc(AnimationResourceState *state)
{
    AnimationResourceState_ReleaseResources(state);
    return state;
}
