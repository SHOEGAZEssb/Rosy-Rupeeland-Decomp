#include "tingle/types.h"

/*
 * Recovered extended type-two actor terminal-state updates. These helpers
 * reset attachment visibility and emit state-18 objects around a transform.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020695f4(void *actor, s32 *count);
extern void func_02005030(void *temporary, const void *source);
extern void func_02005058(void *temporary);
extern void func_02062864(void *object, s32 enabled);
extern void func_0204f7e4(void *temporary, void *object, s32 kind);
extern void func_0204e3f4(s32 kind, s32 count, void *temporary);
extern void func_0204e628(s32 kind, s32 count, void *temporary);
extern void func_02033efc(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Clear actor +0x260 bits zero and one, clear mode byte +0x24c, set attachment
 * +0x24 bit two, and return zero. Only actor/attachment state changes; no SDK
 * or hardware operation occurs.
 */
s32 func_0204157c(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);
    *(u32 *)(actor + 0x260) &= ~3;
    actor[0x24c] = 0;
    *(u16 *)(attachment + 0x24) |= 4;
    return 0;
}

/*
 * Enter state 18 and clear actor +0x260 bits zero and one. If +0x44 is nonnull
 * or +0x24 differs from +0x1dc, attachment +0x24 bit two is toggled according
 * to counter +0x25a bit two and that signed counter increments. Otherwise,
 * unless +0x260 bit 0x2000 is set, func_020695f4 selects an object or count and
 * a temporary transform copied from +0x18 is raised by 0x14000. A selected
 * object is enabled and submitted once per halfword +4 entry with kind 300;
 * without one, positive counts choose func_0204e3f4 through 1000 and
 * func_0204e628 above it. The transform is finalized, then virtual +0x54 is
 * called with zero, func_02033efc runs, and virtual +0x100 completes the state.
 * The routine always returns zero and may change actor, attachment, virtual,
 * selected-object, and emitted-object state; no direct hardware access occurs.
 */
s32 func_020415a8(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *vtable = *(u8 **)actor;

    *(u16 *)(actor + 0xd6) = 18;
    *(u32 *)(actor + 0x260) &= ~3;
    if (*(void **)(actor + 0x44) == 0 &&
        *(u32 *)(actor + 0x24) == *(u32 *)(actor + 0x1dc)) {
        if ((*(u32 *)(actor + 0x260) & 0x2000) == 0) {
            s32 count;
            void *object = func_020695f4(actor, &count);
            u32 temporary[4];
            func_02005030(temporary, actor + 0x18);
            temporary[3] += 0x14000;
            if (object != 0) {
                s32 i;
                u16 entries = *(u16 *)((u8 *)object + 4);
                func_02062864(object, 1);
                for (i = 0; i < entries; ++i)
                    func_0204f7e4(temporary, object, 300);
            } else if (count > 0) {
                s16 shortCount = (s16)count;
                if (count <= 1000)
                    func_0204e3f4(300, shortCount, temporary);
                else
                    func_0204e628(300, shortCount, temporary);
            }
            func_02005058(temporary);
        }
        (*(void (**)(void *, s32))(vtable + 0x54))(actor, 0);
        func_02033efc(actor);
        (*(void (**)(void *))(vtable + 0x100))(actor);
    } else {
        u8 *attachment = *(u8 **)(actor + 0x54);
        if ((*(s16 *)(actor + 0x25a) & 4) != 0)
            *(u16 *)(attachment + 0x24) &= (u16)~4;
        else
            *(u16 *)(attachment + 0x24) |= 4;
        ++*(s16 *)(actor + 0x25a);
    }
    return 0;
}
