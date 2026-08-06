#include "tingle/types.h"

/*
 * Recovered constructor for the type-seven actor registered by func_020454f8.
 * It initializes class transforms, limits, helper objects, and presentation state.
 */
extern u8 data_020e1c38[];
extern u32 data_020e1740[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203b514(void *actor, const void *configuration);
extern void func_02004fe0(void *value);
extern void func_0200500c(void *value, s32 x, s32 y, s32 z);
extern void *func_020050a4(void *destination, const void *source);
extern void func_0204cca8(void *helper, void *actor);
extern u32 func_020481dc(void *actor, u32 first, u32 second, s32 third);
extern void func_020464f4(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the base actor from configuration and install vtable
 * data_020e1c38. Construct value +0x214, initialize transform-like +0x224 to
 * (-1,-1,-1), and set the confirmed class fields: +0x234 zero; bounds +0x238/
 * +0x23c to 0xccd/0x14cd; +0x240 zero; halfwords +0x246=0, +0x24e=0,
 * +0x250=-30, +0x252=71, +0x254/+0x256=0, +0x258=-1, +0x25a=0;
 * words +0x25c/+0x260 to 0x30000/0x50000; halfwords +0x264/+0x266 zero;
 * +0x268 zero; constructed value +0x26c; +0x27c=0, +0x27e=-1, +0x280=0;
 * constructed value +0x284; and +0x294 through +0x2a6 zero. Initialize helper
 * +0x2a8 with self, copy actor transform +0x18 into +0x214 and then +0x26c,
 * and set actor +0xd0 bit two when +0x14 bit 0x400 is present. Invoke
 * func_020481dc with data_020e1740 words and 0x78, clear +0x210, invoke
 * func_020464f4, clear the low 16 bits of +0x5c, and return self. Actor, helper,
 * resource/presentation, and base state may change; no direct hardware access.
 */
void *func_020455bc(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    void *copied;
    func_0203b514(actor, configuration);
    *(void **)actor = data_020e1c38;
    func_02004fe0(actor + 0x214);
    func_0200500c(actor + 0x224, -1, -1, -1);
    *(u32 *)(actor + 0x234) = 0;
    *(u32 *)(actor + 0x238) = 0xccd;
    *(u32 *)(actor + 0x23c) = 0x14cd;
    *(u32 *)(actor + 0x240) = 0;
    *(u16 *)(actor + 0x246) = 0;
    *(u16 *)(actor + 0x24e) = 0;
    *(u16 *)(actor + 0x250) = (u16)-30;
    *(u16 *)(actor + 0x252) = 71;
    *(u16 *)(actor + 0x254) = 0;
    *(u16 *)(actor + 0x256) = 0;
    *(u16 *)(actor + 0x258) = (u16)-1;
    *(u16 *)(actor + 0x25a) = 0;
    *(u32 *)(actor + 0x25c) = 0x30000;
    *(u32 *)(actor + 0x260) = 0x50000;
    *(u16 *)(actor + 0x264) = 0;
    *(u16 *)(actor + 0x266) = 0;
    *(u32 *)(actor + 0x268) = 0;
    func_02004fe0(actor + 0x26c);
    *(u16 *)(actor + 0x27c) = 0;
    *(u16 *)(actor + 0x27e) = (u16)-1;
    *(u32 *)(actor + 0x280) = 0;
    func_02004fe0(actor + 0x284);
    *(u32 *)(actor + 0x294) = 0;
    *(u32 *)(actor + 0x298) = 0;
    *(u32 *)(actor + 0x29c) = 0;
    *(u16 *)(actor + 0x2a0) = 0;
    *(u16 *)(actor + 0x2a2) = 0;
    *(u16 *)(actor + 0x2a4) = 0;
    *(u16 *)(actor + 0x2a6) = 0;
    func_0204cca8(actor + 0x2a8, actor);
    copied = func_020050a4(actor + 0x214, actor + 0x18);
    func_020050a4(actor + 0x26c, copied);
    if ((*(u32 *)(actor + 0x14) & 0x400) != 0)
        *(u32 *)(actor + 0xd0) |= 4;
    func_020481dc(actor, data_020e1740[0], data_020e1740[1], 0x78);
    *(u32 *)(actor + 0x210) = 0;
    func_020464f4(actor);
    *(u32 *)(actor + 0x5c) &= 0xffff0000u;
    return actor;
}
