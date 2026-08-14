/*
 * Replacement operation for the three-slot animation resource state. It
 * borrows one character, palette, and screen resource from an archive.
 */
#include "tingle/types.h"

typedef struct AnimationResourceState {
    void *character;
    void *palette;
    void *screen;
} AnimationResourceState;

extern void *func_02071568(void *archive, u32 resourceId);
extern void *func_020716bc(void *archive, u32 resourceId);
extern void *func_02071800(void *archive, u32 resourceId);
extern void func_02071f38(AnimationResourceState *state);

/* Release any live triplet, then acquire all three requested archive entries.
 * The state owns no allocation and receives borrowed resource pointers. */
void func_02071ee0(AnimationResourceState *state, void *archive,
                   u32 characterId, u32 paletteId, u32 screenId)
{
    if (state->character != 0)
        func_02071f38(state);
    state->character = func_02071568(archive, characterId);
    state->palette = func_020716bc(archive, paletteId);
    state->screen = func_02071800(archive, screenId);
}
