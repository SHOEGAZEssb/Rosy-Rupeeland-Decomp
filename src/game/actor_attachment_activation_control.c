#include "tingle/types.h"

/* Coordinate actor virtual activation checks with attachment flag 4. */

/*
 * If an attachment exists at actor+0x54, handle the requested activation
 * state. A nonzero request is ignored while actor flag 0x10000000 is set;
 * otherwise vtable slot 0xa8 is called and attachment flag 4 is cleared only
 * when that callback returns zero. A zero request sets attachment flag 4 and
 * invokes vtable slot 0x94 with argument zero. Returns no value; callbacks may
 * update actor, presentation, or SDK-managed state.
 */
void func_02033a6c(void *self, s32 active)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);

    if (attachment == 0) {
        return;
    }

    if (active != 0) {
        s32 (*canActivate)(void *);

        if ((*(u32 *)(actor + 0x14) & 0x10000000) != 0) {
            return;
        }
        canActivate = *(s32 (**)(void *))(*(u8 **)actor + 0xa8);
        if (canActivate(actor) == 0) {
            *(u16 *)(attachment + 0x24) &= (u16)~4;
        }
    } else {
        void (*deactivate)(void *, s32);

        *(u16 *)(attachment + 0x24) |= 4;
        deactivate = *(void (**)(void *, s32))(*(u8 **)actor + 0x94);
        deactivate(actor, 0);
    }
}

/*
 * If actor+0x54 has an attachment, a nonzero value clears actor flag
 * 0x10000000 and attachment flag 4; zero sets both flags. Returns no value
 * and invokes no hardware or SDK helper.
 */
void func_02033ae8(void *self, s32 enabled)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);

    if (attachment == 0) {
        return;
    }
    if (enabled != 0) {
        *(u32 *)(actor + 0x14) &= ~0x10000000;
        *(u16 *)(attachment + 0x24) &= (u16)~4;
    } else {
        *(u32 *)(actor + 0x14) |= 0x10000000;
        *(u16 *)(attachment + 0x24) |= 4;
    }
}
