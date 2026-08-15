#include "tingle/types.h"

/* Overlay 37 command decoding and deferred-animation state for render objects. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_InterpolateScalar(void *object, s32 enabled, s32 resource, s32 animation);
#ifdef __cplusplus
}
#endif

/*
 * Decodes a word-based command. Opcode 0 writes command+4 to +0xA0 and
 * returns 2; opcode 1 writes command+4/+8 to +0xB0/+0xB4, sets pending bit 3
 * at +0x98, and returns 3. Other opcodes return 1 without changing the object.
 */
extern "C" s32 func_ov037_021fd11c(void *object, const s32 *command)
{
    switch (command[0]) {
    case 0:
        FIELD(s32, object, 0xa0) = command[1];
        return 2;
    case 1:
        FIELD(s32, object, 0xb0) = command[1];
        FIELD(s32, object, 0xb4) = command[2];
        FIELD(u16, object, 0x98) |= 8;
        return 3;
    default:
        return 1;
    }
}

/*
 * Returns whether the object's progress value at +0x80 has reached or passed
 * the limit at +0x7C. It changes no state and performs no SDK/hardware work.
 */
extern "C" s32 func_ov037_021fd1b4(void *object)
{
    return FIELD(s32, object, 0x80) >= FIELD(s32, object, 0x7c);
}

/*
 * If pending bit 3 is set, starts the retained animation using +0xB0/+0xB4,
 * stores the returned handle at +0xAC, and clears the bit once progress has
 * reached its limit. Returns nothing; the SDK animation call and object state
 * may change, but no hardware register is accessed directly.
 */
extern "C" void func_ov037_021fd170(void *object)
{
    if ((FIELD(u16, object, 0x98) & 8) == 0)
        return;
    FIELD(s32, object, 0xac) =
        Presentation_InterpolateScalar(object, 1, FIELD(s32, object, 0xb0),
                      FIELD(s32, object, 0xb4));
    if (func_ov037_021fd1b4(object))
        FIELD(u16, object, 0x98) &= (u16)~8;
}
