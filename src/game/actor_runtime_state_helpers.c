#include "tingle/types.h"

/* Save actor flags, cache runtime values, and apply bounded motion impulses. */
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_RefreshTerrainHeight(void *actor);
extern void func_0204cff4(s32 *x, s32 *y, s32 maximum);
extern void func_0200b2c0(void *state, s32 first, s32 second, s32 third);
#ifdef __cplusplus
}
#endif

/*
 * On the first call, set marker 0x400 at actor+0xd0, save actor flags +0x14
 * into +0x0c, and force flag bits 1..3. Calls while marked are no-ops. Returns
 * no value and touches no hardware or SDK state.
 */
void func_02033ed0(void *self)
{
    u8 *actor = (u8 *)self;

    if ((*(u32 *)(actor + 0xd0) & 0x400) != 0) return;
    *(u32 *)(actor + 0xd0) |= 0x400;
    *(u32 *)(actor + 0x0c) = *(u32 *)(actor + 0x14);
    *(u32 *)(actor + 0x14) |= 0x0e;
}

/*
 * If marker 0x400 at actor+0xd0 is set, clear it and restore flags +0x14 from
 * saved word +0x0c. Otherwise do nothing. Returns no value.
 */
void func_02033efc(void *self)
{
    u8 *actor = (u8 *)self;

    if ((*(u32 *)(actor + 0xd0) & 0x400) != 0) {
        *(u32 *)(actor + 0xd0) &= ~0x400;
        *(u32 *)(actor + 0x14) = *(u32 *)(actor + 0x0c);
    }
}

/* Store value at actor+0x1d0 and return no value. */
void func_02033f18(void *self, s32 value)
{
    *(s32 *)((u8 *)self + 0x1d0) = value;
}

/* Store first/second at actor+0x1d4/+0x1d8 and return no value. */
void func_02033f20(void *self, s32 first, s32 second)
{
    *(s32 *)((u8 *)self + 0x1d4) = first;
    *(s32 *)((u8 *)self + 0x1d8) = second;
}

/*
 * Refresh cached terrain state through Actor_RefreshTerrainHeight unless actor flag
 * 0x01000000 at +0x14 is set. Returns no value; the helper reads map state.
 */
void func_02033f2c(void *self)
{
    if ((*(u32 *)((u8 *)self + 0x14) & 0x01000000) == 0)
        Actor_RefreshTerrainHeight(self);
}

/* Return the cached terrain-height word at actor+0x1dc. */
s32 func_02033f44(void *self)
{
    return *(s32 *)((u8 *)self + 0x1dc);
}

/*
 * Return GameWork signed halfword 0x212 when actor flag 0x20000000 is set,
 * otherwise halfword 0x210. No state is changed and no hardware is touched.
 */
s32 func_02033f4c(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *work = (u8 *)gGameWork;

    return *(s16 *)(work +
        ((*(u32 *)(actor + 0x14) & 0x20000000) != 0 ? 0x212 : 0x210));
}

/*
 * Add impulse words +4/+8 to actor motion +0x8c/+0x90, clamp that pair to
 * magnitude 0x6000, and pass impulse word +0x0c to state object actor+0x38
 * with two zero arguments. If mark is nonzero, set flag 0x4000 at +0xd0.
 * Returns no value; the state and clamp helpers may update SDK-managed values.
 */
void func_02033f7c(void *self, const void *impulse, s32 mark)
{
    u8 *actor = (u8 *)self;
    const u8 *values = (const u8 *)impulse;

    *(s32 *)(actor + 0x8c) += *(s32 *)(values + 4);
    *(s32 *)(actor + 0x90) += *(s32 *)(values + 8);
    func_0204cff4((s32 *)(actor + 0x8c), (s32 *)(actor + 0x90), 0x6000);
    func_0200b2c0(actor + 0x38, 0, 0, *(s32 *)(values + 0x0c));
    if (mark != 0) *(u32 *)(actor + 0xd0) |= 0x4000;
}
