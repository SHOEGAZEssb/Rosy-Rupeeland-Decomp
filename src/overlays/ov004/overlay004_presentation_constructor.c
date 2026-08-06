#include "tingle/types.h"

/*
 * Overlay 4 presentation construction. This recovered helper initializes the
 * overlay's main UI/gameplay object, its resources, controllers, and animations.
 */

typedef struct Overlay004PresentationState {
    u32 descriptor_000;
    u8 field_004[0x1c];
    u32 flags_020;
    s32 field_024;
    s32 field_028;
    u8 field_02c[0x28];
    u8 resource_054[0x0c];
    void *context_060;
    void *fontContext_064;
    s32 field_068;
    u8 controller_06c[0x94];
    u8 field_100[0x08];
    s32 width_108;
    s32 height_10c;
    u16 field_110;
    u8 field_112[0x02];
    u8 animation_114[0x1c];
    u8 animation_130[0x1c];
    s32 argument2_14c;
    s32 argument1_150;
    s32 field_154;
} Overlay004PresentationState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void *data_020f4e14;
extern void *gDebugFont;
extern const s32 data_ov004_021fcd30[2];
extern void func_02091e28(void *state);
extern void func_02071ea4(void *resource);
extern void func_02094ad4(void *controller);
extern void func_02091b6c(void *animation);
extern void func_02071ee0(void *resource, void *manager, s32 first, s32 second,
                          s32 third);
extern void func_020708c4(void *resourceMember);
extern void *func_020742cc(void *owner);
extern void func_02091bac(void *animation, s32 mode, s32 value, s32 target,
                          s32 duration);
extern void func_ov004_021fbf40(Overlay004PresentationState *state);
extern void func_ov004_021fb968(Overlay004PresentationState *state);
extern void func_ov004_021fba28(Overlay004PresentationState *state);
extern void func_ov004_021fc24c(Overlay004PresentationState *state);
extern void func_ov004_021fb6e4(Overlay004PresentationState *state, s32 first,
                                s32 second);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are state and two retained caller arguments stored at +0x150/+0x14C.
 * Initialize the inherited base, install descriptor data_ov004_021fcda0,
 * construct resource_054, controller_06c, and animation tracks at +0x114 and
 * +0x130. Bind confirmed resource IDs 0x23B1..0x23B3, prepare the resource
 * member at +0x58, acquire contexts through data_020f4e14 and gDebugFont, and
 * invoke the four recovered subordinate setup routines. Initialize dimensions
 * 256x224, field_154 to -1, set flag 0x400, and apply the two-word defaults at
 * data_ov004_021fcd30. Return state. Resource, animation, and renderer effects
 * are delegated to callees; several object field semantics remain unconfirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay004PresentationState *func_ov004_021fb70c(
    Overlay004PresentationState *state, s32 argument1, s32 argument2)
{
    func_02091e28(state);
    state->descriptor_000 = 0x021fcda0;
    func_02071ea4(state->resource_054);
    func_02094ad4(state->controller_06c);
    func_02091b6c(state->animation_114);
    func_02091b6c(state->animation_130);
    state->argument1_150 = argument1;
    state->argument2_14c = argument2;
    state->field_068 = 0;
    func_02071ee0(state->resource_054, data_020f4e18, 0x23b1, 0x23b2,
                  0x23b3);
    func_020708c4(state->resource_054 + 4);
    state->context_060 = func_020742cc(data_020f4e14);
    state->fontContext_064 = func_020742cc(gDebugFont);
    func_ov004_021fbf40(state);
    state->field_110 = 0;
    state->width_108 = 0x100;
    state->height_10c = 0xe0;
    state->field_154 = -1;
    func_02091bac(state->animation_114, 2, 0x6000, 0x119a, 0xf0);
    func_02091bac(state->animation_130, 4, 0x4000, 0x466, 0x50);
    func_ov004_021fb968(state);
    func_ov004_021fba28(state);
    func_ov004_021fc24c(state);
    state->flags_020 |= 0x400;
    func_ov004_021fb6e4(state, data_ov004_021fcd30[0],
                        data_ov004_021fcd30[1]);
    return state;
}
