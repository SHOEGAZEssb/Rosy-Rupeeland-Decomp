#include "tingle/types.h"

/*
 * Overlay 2 presentation destruction. This recovered helper releases the two
 * owner resource contexts, stops the presentation sound, and tears down data.
 */

typedef struct Overlay002PresentationDestroyState {
    u8 field_000[0x04];
    u8 resource_004[0x0c];
    void *resourceA_010;
    void *resourceB_014;
} Overlay002PresentationDestroyState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern void GraphicsSpriteGroup_Destroy(void *resource);
extern void Sound_ReleaseGroup(void *context, s32 value);
extern void AnimationResourceState_Destroy(void *resource);
#ifdef __cplusplus
}
#endif

/*
 * Release resourceA_010 and resourceB_014, send sound command 0x79 to the
 * global sound context, and destroy resource_004. Return state. Resource and
 * sound effects are delegated to the callees; no hardware is touched directly.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay002PresentationDestroyState *func_ov002_021fb9c4(
    Overlay002PresentationDestroyState *state)
{
    GraphicsSpriteGroup_Destroy(state->resourceA_010);
    GraphicsSpriteGroup_Destroy(state->resourceB_014);
    Sound_ReleaseGroup(gSoundContext, 0x79);
    AnimationResourceState_Destroy(state->resource_004);
    return state;
}
