#include "tingle/types.h"

/* Provide compact type-1 actor state predicates, visibility control, and singleton access. */
extern u8 data_021056e4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void AttachmentController_SetEnabled(void *owner, s32 enabled);
#ifdef __cplusplus
}
#endif

/*
 * Return one when actor +0xd0 bit 0x40 is set or, with that bit clear,
 * halfword +0x2a2 is nonzero. Return zero otherwise; no state changes.
 */
s32 func_02039de0(void *self)
{
    u8 *actor = (u8 *)self;
    return (*(u32 *)(actor + 0xd0) & 0x40) != 0 ||
           *(u16 *)(actor + 0x2a2) != 0;
}

/* Return one when current signed state +0xd6 is five or six, else zero. */
s32 func_02039e00(void *self)
{
    s16 state = *(s16 *)((u8 *)self + 0xd6);
    return state == 5 || state == 6;
}

/* Return one when previous signed state +0xd8 is nine or ten, else zero. */
s32 func_02039e18(void *self)
{
    s16 state = *(s16 *)((u8 *)self + 0xd8);
    return state == 9 || state == 10;
}

/* Return one when current signed state +0xd6 is nine or ten, else zero. */
s32 func_02039e30(void *self)
{
    s16 state = *(s16 *)((u8 *)self + 0xd6);
    return state == 9 || state == 10;
}

/*
 * Forward actor subobject +0x2a8 and enabled to AttachmentController_SetEnabled. Returns no
 * value; the helper toggles attachment halfword flag four.
 */
void func_02039e48(void *self, s32 enabled)
{
    AttachmentController_SetEnabled((u8 *)self + 0x2a8, enabled);
}

/* Clear actor halfword +0x2a4. Returns no value and calls no helpers. */
void func_02039e58(void *self)
{
    *(u16 *)((u8 *)self + 0x2a4) = 0;
}

/* Ignore all inputs, change no state, and return fixed-point constant 0x10000. */
s32 func_02039e68(void)
{
    return 0x10000;
}

/* Return the pointer stored at recovered singleton data_021056e4 +0x0c. */
void *func_02039e70(void)
{
    return *(void **)(data_021056e4 + 0x0c);
}

/*
 * If singleton pointer data_021056e4 +0x0c is nonnull, write halfword 0x20e
 * at its +0xe4 field. Returns no value and invokes no helpers.
 */
void func_02039e80(void)
{
    u8 *object = *(u8 **)(data_021056e4 + 0x0c);
    if (object != 0)
        *(u16 *)(object + 0xe4) = 0x20e;
}
