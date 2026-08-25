#include "tingle/types.h"

/*
 * Overlay 5 render-effect construction. This recovered constructor prepares
 * an inherited render object, embedded resource/animation state, and a random
 * seed used by the effect update path.
 */

typedef struct Overlay005RenderEffect {
    const void *vtable_000;
    u8 field_004[0x84];
    s32 enabled_088;
    u8 field_08c[0x10];
    u8 resource_09c[0x0c];
    void *owner_0a8;
    u32 random_0ac;
    u8 animation_0b0[0x1c];
} Overlay005RenderEffect;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern const u8 data_ov005_021fcaf0[];
extern void Presentation_Init(void *state);
extern void AnimationResourceState_InitEmbedded(void *resource);
extern void func_02091b6c(void *animation);
extern u32 genrand_int32(void);
extern void AnimationResourceState_ReplaceResources(void *resource, void *manager, s32 first,
                          s32 second, s32 third);
#ifdef __cplusplus
}
#endif

/*
 * Initialize state through Presentation_Init, install data_ov005_021fcaf0 as its
 * vtable, construct resource_09c and animation_0b0, and seed random_0ac with
 * genrand_int32. Bind resource IDs 0x4003, 0x4004, and 0x4005 through the
 * manager at data_020f4e18, retain owner at +0xA8, set enabled_088 to one, and
 * return state. Resource/animation effects are delegated to their callees and
 * the precise purpose of the retained random value remains unconfirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay005RenderEffect *func_ov005_021fb6e4(Overlay005RenderEffect *state,
                                             void *owner)
{
    Presentation_Init(state);
    state->vtable_000 = data_ov005_021fcaf0;
    AnimationResourceState_InitEmbedded(state->resource_09c);
    state->random_0ac = 0;
    func_02091b6c(state->animation_0b0);
    state->random_0ac = genrand_int32();
    AnimationResourceState_ReplaceResources(state->resource_09c, data_020f4e18, 0x4003, 0x4004,
                  0x4005);
    state->owner_0a8 = owner;
    state->enabled_088 = 1;
    return state;
}
