#include "tingle/types.h"

/* Overlay 36 render-object commands, deferred setup, sound dispatch, and timers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_Play(void *soundContext, s32 id, s32 value);
extern s32 func_02094d28(void *object, s32 mode, s32 first, s32 second);
extern s32 func_ov036_021fd28c(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Applies a typed command. Type 0 selects resource index +0xA0 and returns 2.
 * Type 1 records +0xB0/+0xB4, sets pending flag 0x8, and returns 3. Type 2
 * toggles hidden flag bit 0 from command word +4 and returns 2. Type 3 treats
 * the low 16 bits of command +4 as packed sound data: upper bits after a
 * seven-bit shift become the sound ID and the low seven bits become its value;
 * it plays the sound and returns 2. Unknown types return 1. Object and possibly
 * global sound state change; there is no direct hardware access.
 */
extern "C" s32 func_ov036_021fd19c(void *object, const void *command)
{
    switch (FIELD(s32, command, 0)) {
    case 0:
        FIELD(s32, object, 0xa0) = FIELD(s32, command, 4);
        return 2;
    case 1:
        FIELD(s32, object, 0xb0) = FIELD(s32, command, 4);
        FIELD(s32, object, 0xb4) = FIELD(s32, command, 8);
        FIELD(u16, object, 0x98) |= 8;
        return 3;
    case 2:
        if (FIELD(s32, command, 4) != 0)
            FIELD(u16, object, 0x98) &= (u16)~1;
        else
            FIELD(u16, object, 0x98) |= 1;
        return 2;
    case 3: {
        u16 packed = (u16)FIELD(s32, command, 4);
        Sound_Play(gSoundContext, packed >> 7, packed & 0x7f);
        return 2;
    }
    default:
        return 1;
    }
}

/*
 * Processes pending flag 0x8. It prepares values +0xB0/+0xB4 through the
 * common render base, stores the returned handle at +0xAC, and clears the flag
 * once func_ov036_021fd28c reports completion. It has no return value; engine
 * resource state and object fields may change.
 */
extern "C" void func_ov036_021fd248(void *object)
{
    if (!(FIELD(u16, object, 0x98) & 8))
        return;
    FIELD(s32, object, 0xac) =
        func_02094d28(object, 1, FIELD(s32, object, 0xb0),
                      FIELD(s32, object, 0xb4));
    if (func_ov036_021fd28c(object))
        FIELD(u16, object, 0x98) &= (u16)~8;
}

/*
 * Returns 1 when elapsed counter +0x80 is at least duration +0x7C, otherwise
 * 0. It observes object state only and has no SDK or hardware effects.
 */
extern "C" s32 func_ov036_021fd28c(void *object)
{
    return FIELD(s32, object, 0x80) >= FIELD(s32, object, 0x7c);
}
