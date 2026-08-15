#include "tingle/types.h"

/* Overlay 94 non-deleting destructor for the paired title sprite effect. */

extern const u8 data_ov094_02219e9c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_ReleaseFromGroup(void *state);
extern void SpritePresentation_Destroy(void *effect);
#ifdef __cplusplus
}
#endif

/*
 * Restores the overlay dispatch record, releases the second sprite state at
 * +0xA4, runs the inherited paired-effect destructor, and returns the object.
 */
extern "C" void *func_ov094_02219434(void *effect)
{
    *(const void **)effect = data_ov094_02219e9c;
    GraphicsSpriteState_ReleaseFromGroup(*(void **)((u8 *)effect + 0xa4));
    SpritePresentation_Destroy(effect);
    return effect;
}
