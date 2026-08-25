#include "tingle/types.h"

/*
 * Overlay 5 render-effect update. This recovered callback advances the base
 * renderer and conditionally emits one randomized resource-backed draw item.
 */

typedef struct Overlay005RenderEffect {
    u8 field_000[0x10];
    s32 xFixed_010;
    u8 field_014[0x0c];
    s32 yFixed_020;
    u8 field_024[0x78];
    u8 resource_09c[0x0c];
    void *owner_0a8;
    u32 random_0ac;
    u8 animation_0b0[0x1c];
} Overlay005RenderEffect;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_AdvanceTransitions(void *state);
extern s32 func_02091c7c(void *animation, s32 channel);
extern void func_02091b98(void *animation, s32 value);
extern s32 TitleRandom_NextBounded(u32 *randomState, s32 selector);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *owner, void *resource, s32 mode);
extern s32 func_0209189c(u32 *randomState, s32 minimum, s32 maximum);
extern void GraphicsSpriteState_ApplyRenderConfig(void *drawObject, s32 mode, s32 x, s32 y,
                          s32 layer, s32 companionY, u16 scale);
#ifdef __cplusplus
}
#endif

/* Convert confirmed 20.12 fixed-point values with truncation toward zero. */
static s32 overlay005_fixed_to_integer(s32 value)
{
    return value / 0x1000;
}

/*
 * Advance the inherited object through Presentation_AdvanceTransitions and retain its return
 * value. Advance animation_0b0 channel 2; if inactive, return immediately.
 * Otherwise derive integer X/Y from +0x10/+0x20, submit value 8 to the
 * animation, choose scale 0x140 when TitleRandom_NextBounded(random_0ac,2) is nonzero
 * and 0x100 otherwise, acquire a draw object from owner_0a8/resource_09c, and
 * add func_0209189c(random_0ac,-32,32) to X. Submit mode 0, adjusted X, Y,
 * layer 3, companion Y `0x7FFF-Y`, and the 16-bit scale through
 * GraphicsSpriteState_ApplyRenderConfig, then return the inherited update result. Resource and renderer
 * side effects are delegated; the exact visual identity remains unknown.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay005_UpdateRenderEffect(Overlay005RenderEffect *state)
{
    s32 result = Presentation_AdvanceTransitions(state);

    if (func_02091c7c(state->animation_0b0, 2)) {
        s32 y = overlay005_fixed_to_integer(state->yFixed_020);
        s32 x = overlay005_fixed_to_integer(state->xFixed_010);
        u16 scale;
        void *drawObject;

        func_02091b98(state->animation_0b0, 8);
        scale = TitleRandom_NextBounded(&state->random_0ac, 2) ? 0x140 : 0x100;
        drawObject = GraphicsSpriteGroup_CreateStateFromSource(state->owner_0a8, state->resource_09c, 1);
        x += func_0209189c(&state->random_0ac, -32, 32);
        GraphicsSpriteState_ApplyRenderConfig(drawObject, 0, x, y, 3, 0x7fff - y, scale);
    }
    return result;
}
