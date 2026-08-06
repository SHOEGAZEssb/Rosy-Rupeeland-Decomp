#include "tingle/types.h"

/* Copy actor interaction bounds and synchronize direction-dependent animation. */
#ifdef __cplusplus
extern "C" {
#endif
extern u32 func_020ae024(s32 y, s32 x);
extern void func_0200b2c0(void *state, s32 first, s32 second, s32 third);
extern void func_02072b68(void *attachment, u32 animation);
#ifdef __cplusplus
}
#endif

/*
 * Copy four signed halfwords from source into actor+0x70..+0x76. Returns no
 * value and touches no hardware or SDK-managed state.
 */
void func_02034b3c(void *self, const s16 source[4])
{
    u8 *actor = (u8 *)self;

    *(s16 *)(actor + 0x70) = source[0];
    *(s16 *)(actor + 0x72) = source[1];
    *(s16 *)(actor + 0x74) = source[2];
    *(s16 *)(actor + 0x76) = source[3];
}

/*
 * Ignore a zero x/y vector. Otherwise obtain its angle, rotate by -0x4000,
 * retain 16 bits at actor+0xc8/+0xcc, set byte 0xd5 to 0xff, and derive the
 * eight-way direction byte +0xd4 after a +0x1000 half-sector bias. Clear
 * halfword +0x1ea and reset state objects +0x38 and +0x88 with zero arguments.
 * Returns no value; angle/state helpers may use SDK math or value-object state.
 */
void func_02034b60(void *self, s32 x, s32 y)
{
    u8 *actor = (u8 *)self;
    u32 angle;

    if (x == 0 && y == 0) return;
    angle = (func_020ae024(y, x) - 0x4000) & 0xffff;
    *(u32 *)(actor + 0xc8) = angle;
    *(u32 *)(actor + 0xcc) = angle;
    actor[0xd5] = 0xff;
    actor[0xd4] = (u8)(((angle + 0x1000) & 0xffff) >> 13);
    *(u16 *)(actor + 0x1ea) = 0;
    func_0200b2c0(actor + 0x38, 0, 0, 0);
    func_0200b2c0(actor + 0x88, 0, 0, 0);
}

/* Set or clear attachment flag 0x40. */
static void setAttachmentFlip(u8 *attachment, s32 enabled)
{
    if (enabled != 0)
        *(u16 *)(attachment + 0x24) |= 0x40;
    else
        *(u16 *)(attachment + 0x24) &= (u16)~0x40;
}

/*
 * Clear attachment flags 2, 0x20, and 1 on the required primary attachment
 * +0x54 and optional secondary +0x58, then select abs(animation)&0xff on each.
 * For negative animation, flag 0x40 is set when actor flag 0x10 at +0x10 is
 * clear; for nonnegative animation the relationship is reversed. Returns no
 * value; func_02072b68 updates attachment presentation/animation state.
 */
void func_02034be4(void *self, s32 animation)
{
    u8 *actor = (u8 *)self;
    u8 *primary = *(u8 **)(actor + 0x54);
    u8 *secondary = *(u8 **)(actor + 0x58);
    s32 negative = animation < 0;
    u32 index;
    s32 actorFlip = (*(u32 *)(actor + 0x10) & 0x10) != 0;

    *(u16 *)(primary + 0x24) &= (u16)~2;
    *(u16 *)(primary + 0x24) &= (u16)~0x20;
    *(u16 *)(primary + 0x24) &= (u16)~1;
    if (secondary != 0) {
        *(u16 *)(secondary + 0x24) &= (u16)~2;
        *(u16 *)(secondary + 0x24) &= (u16)~0x20;
        *(u16 *)(secondary + 0x24) &= (u16)~1;
    }

    if (negative) animation = -animation;
    index = (u32)animation & 0xff;
    func_02072b68(primary, index);
    setAttachmentFlip(primary, negative ? !actorFlip : actorFlip);
    if (secondary != 0) {
        func_02072b68(secondary, index);
        setAttachmentFlip(secondary, negative ? !actorFlip : actorFlip);
    }
}
