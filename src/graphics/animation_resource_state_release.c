/*
 * Release operation for the three-slot animation resource state. Each cached
 * resource is returned to the archive manager recorded in its field at +4.
 */
#include "tingle/types.h"

typedef struct AnimationResourceState {
    void *character;
    void *palette;
    void *cell;
} AnimationResourceState;

extern void func_02071bdc(void *archive, void *resource);
extern void func_02071c38(void *archive, void *resource);
extern void func_02071c94(void *archive, void *resource);

/* Return a live triplet to its three owning archive managers and null every
 * slot. A state with no character resource is treated as wholly empty. */
void AnimationResourceState_ReleaseResources(AnimationResourceState *state)
{
    if (state->character == 0)
        return;
    func_02071bdc(*(void **)((u8 *)state->character + 4), state->character);
    func_02071c38(*(void **)((u8 *)state->palette + 4), state->palette);
    func_02071c94(*(void **)((u8 *)state->cell + 4), state->cell);
    state->character = 0;
    state->palette = 0;
    state->cell = 0;
}
