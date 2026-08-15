#include "tingle/types.h"

/* Overlay 35 render-object commands, deferred resource setup, and timers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_InterpolateScalar(void *object, s32 mode, s32 first, s32 second);
extern s32 func_ov035_021fd25c(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Applies a typed command to the object. Type 0 selects resource index +0xA0
 * and returns 2. Type 1 records setup values +0xB0/+0xB4, sets pending flag
 * 0x8, and returns 3. Type 2 toggles hidden flag bit 0 according to whether
 * command word +4 is zero and returns 2. Unknown types return 1. Only object
 * state changes; there is no direct SDK or hardware effect.
 */
extern "C" s32 func_ov035_021fd19c(void *object, const void *command)
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
    default:
        return 1;
    }
}

/*
 * Processes pending flag 0x8. It asks the shared render base to prepare values
 * +0xB0/+0xB4, stores the returned handle at +0xAC, and clears the flag once
 * elapsed counter +0x80 reaches duration +0x7C. Returns no value; engine
 * resource state and object fields may change, with no direct MMIO.
 */
extern "C" void func_ov035_021fd218(void *object)
{
    if (!(FIELD(u16, object, 0x98) & 8))
        return;
    FIELD(s32, object, 0xac) =
        Presentation_InterpolateScalar(object, 1, FIELD(s32, object, 0xb0),
                      FIELD(s32, object, 0xb4));
    if (func_ov035_021fd25c(object))
        FIELD(u16, object, 0x98) &= (u16)~8;
}

/*
 * Returns one when elapsed counter +0x80 is at least duration +0x7C, otherwise
 * zero. It observes object state only and has no SDK or hardware effects.
 */
extern "C" s32 func_ov035_021fd25c(void *object)
{
    return FIELD(s32, object, 0x80) >= FIELD(s32, object, 0x7c);
}

/*
 * Starts a duration interval by sign-extending the low 16 bits of duration
 * into +0x7C and clearing elapsed counter +0x80. Returns no value; object
 * timing state changes and no SDK or hardware state is touched.
 */
extern "C" void func_ov035_021fd274(void *object, s16 duration)
{
    FIELD(s32, object, 0x7c) = duration;
    FIELD(s32, object, 0x80) = 0;
}

/*
 * Emits two packed texture-coordinate words to GX FIFO register 0x0400048C.
 * The first combines the low 16 bits of s and t; the second emits the low
 * 16 bits of q. Returns no value and directly changes GX command state.
 */
extern "C" void func_ov035_021fd28c(s16 s, u16 t, u16 q)
{
    REG32(0x0400048c) = (u16)s | ((u32)t << 16);
    REG32(0x0400048c) = q;
}
