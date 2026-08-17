#include "tingle/types.h"

/*
 * Overlay 39 six-object renderer-mode control and three-object spatial scoring.
 * These recovered helpers configure the coordinate-table object group and
 * compute the strongest fixed-point proximity weight to objects +0x74..+0x7C.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039Vector {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} Overlay039Vector;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *renderObject, u8 mode);
extern void GraphicsSpriteState_SetFrameIndex(void *renderObject, s32 value);
extern void Memory_ClearBytes(void *destination, s32 size);
extern void VecFx32Object_Init(void *object);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *object);
extern s32 SignedAbsoluteValue(s32 value);
extern s32 func_020adc90(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/*
 * Apply the low byte of mode to renderer objects belonging to scene slots
 * +0x80..+0x94. Additionally apply value 2 through GraphicsSpriteState_SetFrameIndex to +0x88/
 * +0x8C and value 4 to +0x90/+0x94. Clear renderer flag bit zero for those
 * latter four slots, then clear flag bit one for all six. Returns no value;
 * renderer mode, auxiliary parameter, and +0x24 flag state change.
 */
extern "C" void func_ov039_021ff330(void *scene, s32 mode)
{
    for (s32 i = 0; i < 6; i++) {
        void *renderObject = FIELD(void *, FIELD(void *, scene, 0x80 + i * 4),
                                   0x0c);
        GraphicsSpriteState_SetAnimationIndex(renderObject, (u8)mode);
    }
    for (s32 i = 2; i < 4; i++) {
        void *renderObject = FIELD(void *, FIELD(void *, scene, 0x80 + i * 4),
                                   0x0c);
        GraphicsSpriteState_SetFrameIndex(renderObject, 2);
        FIELD(u16, renderObject, 0x24) &= (u16)~1;
    }
    for (s32 i = 4; i < 6; i++) {
        void *renderObject = FIELD(void *, FIELD(void *, scene, 0x80 + i * 4),
                                   0x0c);
        GraphicsSpriteState_SetFrameIndex(renderObject, 4);
        FIELD(u16, renderObject, 0x24) &= (u16)~1;
    }
    for (s32 i = 5; i >= 0; i--) {
        void *renderObject = FIELD(void *, FIELD(void *, scene, 0x80 + i * 4),
                                   0x0c);
        FIELD(u16, renderObject, 0x24) &= (u16)~2;
    }
}

static s32 fixedMultiply(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/* Compute one separable fixed-point proximity weight with confirmed radii. */
static s32 objectScore(void *object, const void *point, s32 verticalRadius)
{
    Overlay039Vector position;
    VecFx32Object_Init(&position);
    VecFx32Object_Assign(&position, (u8 *)object + 0x1c);
    s32 dx = FIELD(s32, point, 4) - position.x_04;
    s32 dy = FIELD(s32, point, 8) - position.y_08;
    s32 horizontal = func_020adc90(0x48000 - SignedAbsoluteValue(dx), 0x48000);
    s32 vertical = func_020adc90(verticalRadius - SignedAbsoluteValue(dy),
                                  verticalRadius);
    if (horizontal < 0) horizontal = 0;
    if (vertical < 0) vertical = 0;
    s32 result = fixedMultiply(fixedMultiply(horizontal, vertical), 0xe000);
    VecFx32Object_Destroy(&position);
    return result;
}

/*
 * Compute weights from input point +4/+8 to scene objects +0x74, +0x78, and
 * +0x7C. All use horizontal radius 0x48000 and output magnitude 0xE000; the
 * first two use vertical radius 0x30000 and the third uses 0x50000. Each axis
 * factor is (radius-abs(delta))/radius in 20.12 fixed point, clamped at zero,
 * and the two factors are multiplied. Return the maximum of the three weights.
 * Temporary vector/SDK state changes only during position copies.
 */
extern "C" s32 func_ov039_021ff458(void *scene, const void *point)
{
    s32 scores[3];
    Memory_ClearBytes(scores, sizeof(scores));
    scores[0] = objectScore(FIELD(void *, scene, 0x74), point, 0x30000);
    scores[1] = objectScore(FIELD(void *, scene, 0x78), point, 0x30000);
    scores[2] = objectScore(FIELD(void *, scene, 0x7c), point, 0x50000);
    s32 result = scores[0];
    if (result < scores[1]) result = scores[1];
    if (result < scores[2]) result = scores[2];
    return result;
}
