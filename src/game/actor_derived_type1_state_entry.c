#include "tingle/types.h"

/* Enter a type-1 actor state while resetting motion and presentation bookkeeping. */
extern void *gLupyContext;
extern u8 data_021056e0;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02032a64(void *actor, const void *position);
extern s32 func_02010b64(void *context, s32 value);
extern void func_0200b2c0(void *value, s32 x, s32 y, s32 z);
extern void func_0200500c(void *value, s32 x, s32 y, s32 z);
extern void func_02005058(void *value);
extern s32 func_02033f44(void *actor);
extern void func_02039bfc(void *actor);
extern void func_02039720(void *actor, s32 kind, s32 first, s32 second,
                          s32 third);
extern void Sound_Play(void *context, s32 channel, s32 sound);
#ifdef __cplusplus
}
#endif

/*
 * Copy position into actor current/previous positions, clear state flag +0x14
 * bit 0x200, and reset cooldown +0x268. If the Lupy query is positive, clear
 * +0xd0 bit 0x200 and zero vectors +0x38/+0x88/+0x98. A nonzero mode then
 * dispatches virtual +0xb8 with a signed X/-0x3000 offset and an incremented
 * global byte; zero mode instead sets +0x230 bit 0x400, vertical velocity
 * +0x44 to 0x4000, height +0x24 to the ground query plus 0x1000, and state 13.
 *
 * Otherwise invoke func_02039bfc, configure effect values 6/0x109d/0x1001/
 * 0x109e through func_02039720, enter state 14 with the same velocity/height,
 * set +0xd0 bit 0x2000, and play sound 0x2d. Finally clear bit four in the
 * halfword at object +0x54/+0x24 and call actor virtual +0x5c. Returns no
 * value; virtual, Lupy, effect, and sound calls have observable engine state.
 */
void func_02038834(void *self, const void *position, s32 mode)
{
    u8 *actor = (u8 *)self;

    func_02032a64(actor, position);
    *(u32 *)(actor + 0x14) &= ~0x200;
    *(u16 *)(actor + 0x268) = 0;

    if (func_02010b64(gLupyContext, 0) > 0) {
        *(u32 *)(actor + 0xd0) &= ~0x200;
        func_0200b2c0(actor + 0x38, 0, 0, 0);
        func_0200b2c0(actor + 0x88, 0, 0, 0);
        func_0200b2c0(actor + 0x98, 0, 0, 0);
        if (mode != 0) {
            s32 offset[4];
            s32 x = (data_021056e0 & 1) ? -0x1800 : 0x1800;
            func_0200500c(offset, x, -0x3000, 0);
            ++data_021056e0;
            (*(void (**)(void *, const void *, s32, s32))
                (*(u8 **)actor + 0xb8))(actor, offset, 1, data_021056e0);
            func_02005058(offset);
        } else {
            *(u32 *)(actor + 0x230) |= 0x400;
            *(s32 *)(actor + 0x44) = 0x4000;
            *(s32 *)(actor + 0x24) = func_02033f44(actor) + 0x1000;
            *(u16 *)(actor + 0xd6) = 13;
        }
    } else {
        func_02039bfc(actor);
        func_02039720(actor, 6, 0x109d, 0x1001, 0x109e);
        *(u16 *)(actor + 0xd6) = 14;
        *(s32 *)(actor + 0x44) = 0x4000;
        *(s32 *)(actor + 0x24) = func_02033f44(actor) + 0x1000;
        *(u32 *)(actor + 0xd0) |= 0x2000;
        Sound_Play(gSoundContext, 0, 0x2d);
    }

    *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) &= ~4;
    (*(void (**)(void *))(*(u8 **)actor + 0x5c))(actor);
}
