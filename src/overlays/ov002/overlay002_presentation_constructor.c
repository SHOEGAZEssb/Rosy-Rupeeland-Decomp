#include "tingle/types.h"

/*
 * Overlay 2 presentation construction. This recovered subsystem builds a
 * fixed collection of indicator, icon, and control sprites from two resources.
 */

typedef struct Overlay002SpriteTriple {
    u16 value;
    u16 x;
    u16 y;
} Overlay002SpriteTriple;

typedef struct Overlay002PresentationState {
    void *owner_000;
    u8 resource_004[0x0c];
    void *resourceA_010;
    void *resourceB_014;
    void *indicator_018[7];
    void *icon_034[14];
    void *control_06c;
    void *control_070;
    void *control_074;
    void *control_078;
    void *footer_07c[2];
    u32 descriptor_084;
    s32 initialValue_088;
    s32 field_08c;
    s32 field_090;
    s32 field_094;
    u8 animation_098[1];
} Overlay002PresentationState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern const s32 data_ov002_021fbe80[7];
extern const Overlay002SpriteTriple data_ov002_021fbea0[14];
extern void *gSoundContext;
extern void AnimationResourceState_InitEmbedded(void *resource);
extern void func_02091b6c(void *animation);
extern void AnimationResourceState_ReplaceResources(void *resource, void *manager, s32 first, s32 second,
                          s32 third);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *context, void *resource, s32 kind);
extern void GraphicsSpriteState_ApplyRenderConfig(void *sprite, s32 value, s32 x, s32 y, s32 mode,
                          s32 scale, s32 extra);
extern void func_ov002_021fba1c(Overlay002PresentationState *state, s32 value);
extern void Sound_LoadGroup(void *context, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Initialize resource_004 and animation_098, save owner and initialValue, and
 * bind resource IDs 0x21BE..0x21C0 through data_020f4e18. Obtain two owner
 * resource contexts, then allocate/configure seven indicators from the
 * confirmed X-coordinate table and fourteen icons from the confirmed value/X/Y
 * table. Four standalone controls and two footer sprites are also created at
 * their fixed coordinates. func_ov002_021fba1c applies initialValue, and the
 * sound context receives command 0x79. Return state. Exact object semantics
 * and the descriptor constant 0x98967F remain unconfirmed; graphics/resource
 * and sound effects occur through callees rather than direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay002PresentationState *func_ov002_021fb6e0(
    Overlay002PresentationState *state, void *owner, s32 initialValue)
{
    s32 i;

    AnimationResourceState_InitEmbedded(state->resource_004);
    func_02091b6c(state->animation_098);
    state->owner_000 = owner;
    state->descriptor_084 = 0x98967f;
    state->initialValue_088 = initialValue;
    state->field_08c = 0;
    state->field_090 = 0;
    state->field_094 = 0;
    AnimationResourceState_ReplaceResources(state->resource_004, data_020f4e18, 0x21be, 0x21bf,
                  0x21c0);
    state->resourceA_010 = GraphicsSpriteGroupOwner_CreateGroup(owner);
    state->resourceB_014 = GraphicsSpriteGroupOwner_CreateGroup(owner);

    for (i = 0; i < 7; i++) {
        state->indicator_018[i] =
            GraphicsSpriteGroup_CreateStateFromSource(state->resourceA_010, state->resource_004, 1);
        GraphicsSpriteState_ApplyRenderConfig(state->indicator_018[i], 0, data_ov002_021fbe80[i],
                      0x1f, 1, 0x100, 4);
    }
    for (i = 0; i < 14; i++) {
        state->icon_034[i] =
            GraphicsSpriteGroup_CreateStateFromSource(state->resourceB_014, state->resource_004, 1);
        GraphicsSpriteState_ApplyRenderConfig(state->icon_034[i], data_ov002_021fbea0[i].value,
                      data_ov002_021fbea0[i].x,
                      data_ov002_021fbea0[i].y, 0, 0, 0);
    }
    state->control_06c =
        GraphicsSpriteGroup_CreateStateFromSource(state->resourceA_010, state->resource_004, 1);
    GraphicsSpriteState_ApplyRenderConfig(state->control_06c, 0x21, 0x3f, 0x1f, 1, 0x100, 4);
    state->control_070 =
        GraphicsSpriteGroup_CreateStateFromSource(state->resourceA_010, state->resource_004, 1);
    GraphicsSpriteState_ApplyRenderConfig(state->control_070, 0x21, 0x91, 0x1f, 1, 0x100, 4);
    func_ov002_021fba1c(state, initialValue);
    state->control_074 =
        GraphicsSpriteGroup_CreateStateFromSource(state->resourceB_014, state->resource_004, 1);
    GraphicsSpriteState_ApplyRenderConfig(state->control_074, 0x1d, 0xd0, 0x48, 1, 0, 2);
    state->control_078 =
        GraphicsSpriteGroup_CreateStateFromSource(state->resourceB_014, state->resource_004, 1);
    GraphicsSpriteState_ApplyRenderConfig(state->control_078, 0x1e, 0xd4, 0x2f, 1, 0x10, 0);
    for (i = 0; i < 2; i++) {
        state->footer_07c[i] =
            GraphicsSpriteGroup_CreateStateFromSource(state->resourceB_014, state->resource_004, 1);
        GraphicsSpriteState_ApplyRenderConfig(state->footer_07c[i], i + 0x1f,
                      i == 0 ? 0xec : 0x15, 0x20, 1, 0, 2);
    }
    Sound_LoadGroup(gSoundContext, 0x79);
    return state;
}
