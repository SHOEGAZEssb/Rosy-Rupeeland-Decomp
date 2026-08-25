#include "tingle/types.h"

/* Overlay 36 oscillating object's vector setup, construction, and teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_0220600c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov036_021fcec4(void *object, void *argument,
                                 s32 mode, s32 type);
extern void TitleInterpolatedValue_Init(void *timer);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern void GraphicsAnimationInstance_Destroy(void *resource);
extern void func_ov036_021fcf30(void *object);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Stores value into all three recovered vector components +0xAC/+0xB0/+0xB4.
 * Returns nothing and changes only those fields.
 */
extern "C" void func_ov036_02201d60(void *object, s32 value)
{
    FIELD(s32, object, 0xac) = value;
    FIELD(s32, object, 0xb0) = value;
    FIELD(s32, object, 0xb4) = value;
}

/*
 * Constructs an oscillating object through common type 0x16 setup. resource is
 * retained at +0xD4, variant at +0xCC, and the fifth ABI argument at +0xC8.
 * Timer +0xD8 is initialized; state +0xD0 and phase +0xF4 start at zero; scale
 * +0x6C becomes 0x666, active +0x88 is set, +0xA4 becomes 15, and vector
 * +0xAC..+0xB4 becomes 0x10. Returns object; base, timer, and field state
 * change, with no direct hardware effect.
 */
extern "C" void *func_ov036_02201d70(void *object, void *argument,
                                      void *resource, s32 variant,
                                      s32 valueC8)
{
    func_ov036_021fcec4(object, argument, 0, 0x16);
    FIELD(const void *, object, 0) = data_ov036_0220600c;
    TitleInterpolatedValue_Init((u8 *)object + 0xd8);
    FIELD(s32, object, 0xc8) = valueC8;
    FIELD(s32, object, 0xcc) = variant;
    FIELD(void *, object, 0xd4) = resource;
    FIELD(s32, object, 0xd0) = 0;
    FIELD(s32, object, 0xf4) = 0;
    FIELD(s32, object, 0x88) = 1;
    PresentationScalar_SetImmediate((u8 *)object + 0x6c, 0x666);
    FIELD(s32, object, 0xa4) = 0xf;
    func_ov036_02201d60(object, 0x10);
    return object;
}

/*
 * Destroys an oscillating object without freeing it. It restores the recovered
 * vtable, releases resource +0xD4 through the manager helper, and runs common
 * object teardown. Returns object; resource ownership and base state change.
 */
extern "C" void *func_ov036_02201df0(void *object)
{
    FIELD(const void *, object, 0) = data_ov036_0220600c;
    GraphicsAnimationInstance_Destroy(FIELD(void *, object, 0xd4));
    func_ov036_021fcf30(object);
    return object;
}

/*
 * Fully deletes an oscillating object by performing the same resource and
 * common teardown as func_ov036_02201df0, then freeing it. Returns the now-
 * invalid original pointer, matching the recovered ABI.
 */
extern "C" void *func_ov036_02201e1c(void *object)
{
    FIELD(const void *, object, 0) = data_ov036_0220600c;
    GraphicsAnimationInstance_Destroy(FIELD(void *, object, 0xd4));
    func_ov036_021fcf30(object);
    Heap_Free(object);
    return object;
}
