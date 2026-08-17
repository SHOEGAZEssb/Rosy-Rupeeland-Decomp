#include "tingle/types.h"

/*
 * Overlay 45 transient-effect lifecycle. These recovered routines construct
 * and release a derived runtime object, then mirror its fixed-point position
 * into an associated display record while testing its lifetime counters.
 * The matching assembly preserves the compiler-sensitive register allocation
 * and redundant Boolean normalization in the update; this is its documented
 * portable C equivalent.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_ov045_0220d5c4[];
extern "C" void SpritePresentation_InitVariant(void *object, void *argument);
extern "C" void SpritePresentation_Destroy(void *object);
extern "C" void Heap_Free(void *allocation);
extern "C" void Presentation_AdvanceTransitions(void *object);

/*
 * Construct a derived transient effect in caller-provided storage and return
 * that storage. The second argument is forwarded to the base constructor; the
 * third is retained at +0xA0. Install the overlay vtable and set +0x88 to one.
 */
extern "C" void *func_ov045_0220b740(void *object, void *argument,
                                      void *fieldA0)
{
    SpritePresentation_InitVariant(object, argument);
    FIELD(void *, object, 0) = data_ov045_0220d5c4;
    FIELD(void *, object, 0xa0) = fieldA0;
    FIELD(s32, object, 0x88) = 1;
    return object;
}

/*
 * Run the base teardown for an effect and return the unchanged object pointer.
 * Object-owned base state changes; the storage itself remains allocated.
 */
extern "C" void *func_ov045_0220b770(void *object)
{
    SpritePresentation_Destroy(object);
    return object;
}

/*
 * Run the base teardown, free the effect storage, and return its former
 * address. The returned value is only an address identity and is no longer
 * safe to dereference after Heap_Free.
 */
extern "C" void *Overlay045TransientEffect_Delete(void *object)
{
    SpritePresentation_Destroy(object);
    Heap_Free(object);
    return object;
}

/*
 * Advance an effect through the shared runtime update and return whether its
 * +0x80 counter has reached +0x7C. Convert signed 20.12 coordinates at +0x10
 * and +0x20 toward zero, then write them to halfwords +0x2C/+0x2E in the
 * associated record at +0x9C. Rendering/runtime state changes in the callee.
 * The matching fallback is authoritative for the original register sequence.
 */
extern "C" bool func_ov045_0220b7a0(void *object)
{
    Presentation_AdvanceTransitions(object);

    s32 x = FIELD(s32, object, 0x10);
    s32 y = FIELD(s32, object, 0x20);
    s32 roundedX = x + ((u32)(x >> 11) >> 20);
    s32 roundedY = y + ((u32)(y >> 11) >> 20);
    void *record = FIELD(void *, object, 0x9c);
    FIELD(s16, record, 0x2c) = (s16)(roundedX >> 12);
    FIELD(s16, record, 0x2e) = (s16)(roundedY >> 12);

    return FIELD(s32, object, 0x80) >= FIELD(s32, object, 0x7c);
}
