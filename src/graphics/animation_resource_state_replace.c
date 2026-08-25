/*
 * Replacement operation for the three-slot animation resource state. It
 * borrows one character, palette, and cell resource from an archive.
 */
#include "tingle/types.h"

typedef struct AnimationResourceState {
    void *character;
    void *palette;
    void *cell;
} AnimationResourceState;

extern void *GraphicsArchive_AcquireCharacterResource(void *archive, u32 resourceId);
extern void *GraphicsArchive_AcquirePaletteResource(void *archive, u32 resourceId);
extern void *GraphicsArchive_AcquireCellResource(void *archive, u32 resourceId);
extern void AnimationResourceState_ReleaseResources(AnimationResourceState *state);

/* Release any live triplet, then acquire all three requested archive entries.
 * The state owns no allocation and receives borrowed resource pointers. */
void AnimationResourceState_ReplaceResources(AnimationResourceState *state, void *archive,
                   u32 characterId, u32 paletteId, u32 cellId)
{
    if (state->character != 0)
        AnimationResourceState_ReleaseResources(state);
    state->character = GraphicsArchive_AcquireCharacterResource(archive, characterId);
    state->palette = GraphicsArchive_AcquirePaletteResource(archive, paletteId);
    state->cell = GraphicsArchive_AcquireCellResource(archive, cellId);
}
