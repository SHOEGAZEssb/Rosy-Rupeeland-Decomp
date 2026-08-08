#include "tingle/types.h"

/* Overlay 34 owner per-frame updates, state queries, and transform setters. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov034_021fd494(void *state);
extern void func_ov034_021fd31c(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Advances all three sector states at +0xA0..+0xA8 and decrements positive
 * owner countdowns +0xC0/+0xC4 by one. Returns no value; sector/timer state may
 * change, with no direct hardware access.
 */
extern "C" void func_ov034_021fd978(void *owner)
{
    for (s32 i = 0; i < 3; ++i)
        func_ov034_021fd494(FIELD(void *, owner, 0xa0 + i * 4));
    if (FIELD(s32, owner, 0xc0) > 0)
        FIELD(s32, owner, 0xc0)--;
    if (FIELD(s32, owner, 0xc4) > 0)
        FIELD(s32, owner, 0xc4)--;
}

/* Activates each of the owner's three sector states; returns no value. */
extern "C" void func_ov034_021fd9c0(void *owner)
{
    for (s32 i = 0; i < 3; ++i)
        func_ov034_021fd31c(FIELD(void *, owner, 0xa0 + i * 4));
}

/* Returns 1 exactly when the first sector state's +0x20 mode is one. */
extern "C" s32 func_ov034_021fd9e8(void *owner)
{
    return FIELD(s32, FIELD(void *, owner, 0xa0), 0x20) == 1;
}

/* Returns 1 exactly when indexed sector state's +0x20 mode is zero. */
extern "C" s32 func_ov034_021fda00(void *owner, s32 index)
{
    return FIELD(s32, FIELD(void *, owner, 0xa0 + index * 4), 0x20) == 0;
}

/*
 * Sign-extends the low 16 bits of `value` into object +0x7C and clears +0x80.
 * Returns no value and has no SDK or hardware effects.
 */
extern "C" void func_ov034_021fda1c(void *object, s32 value)
{
    FIELD(s32, object, 0x7c) = (s16)value;
    FIELD(s32, object, 0x80) = 0;
}

/* Stores the three input transform words at object +4/+8/+0xC. */
extern "C" void func_ov034_021fda34(void *object, s32 x, s32 y, s32 z)
{
    FIELD(s32, object, 4) = x;
    FIELD(s32, object, 8) = y;
    FIELD(s32, object, 0xc) = z;
}

/* Stores the three input transform words at object +0x10/+0x14/+0x18. */
extern "C" void func_ov034_021fda3c(void *object, s32 x, s32 y, s32 z)
{
    FIELD(s32, object, 0x10) = x;
    FIELD(s32, object, 0x14) = y;
    FIELD(s32, object, 0x18) = z;
}
