#include "tingle/types.h"

/*
 * Overlay 6 auxiliary-toggle update. This recovered callback advances the
 * overlay-46 helper and periodically toggles a font-backed auxiliary object.
 */

typedef struct Overlay006AuxiliaryToggleState {
    u8 field_000[0x64];
    void *controllerMember_064;
    u8 field_068[0x28];
    void *overlay46Helper_090;
    void *auxiliary_094;
    u8 animation_098[0x1c];
    s32 enabled_0b4;
} Overlay006AuxiliaryToggleState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov046_0220c1a4(void *helper);
extern s32 func_02091c7c(void *animation, s32 channel);
extern void func_02091b98(void *animation, s32 value);
extern s32 func_02028100(void *auxiliary, void *controllerMember);
extern s32 func_0202836c(void *auxiliary);
#ifdef __cplusplus
}
#endif

/*
 * Advance overlay46Helper_090 through func_ov046_0220c1a4, then advance
 * animation_098 channel 2. Return zero immediately if the animation is not
 * complete. Otherwise submit value 0x3C, toggle enabled_0b4 between zero and
 * one, and return func_02028100(auxiliary_094,controllerMember_064) when newly
 * enabled or func_0202836c(auxiliary_094) when disabled. Observable helper and
 * renderer changes are delegated; no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov006_021fb950(Overlay006AuxiliaryToggleState *state)
{
    func_ov046_0220c1a4(state->overlay46Helper_090);
    if (!func_02091c7c(state->animation_098, 2)) {
        return 0;
    }
    func_02091b98(state->animation_098, 0x3c);
    state->enabled_0b4 = !state->enabled_0b4;
    if (state->enabled_0b4) {
        return func_02028100(state->auxiliary_094,
                             state->controllerMember_064);
    }
    return func_0202836c(state->auxiliary_094);
}
