#include "tingle/types.h"

/* Forward an optional descriptor payload through the actor callback interface. */

/*
 * If descriptor+0x2c is null, return without changes. Otherwise, when the actor
 * has an attachment at +0x54, clear attachment flag 2 and set flag 1 in its
 * halfword +0x24, then invoke actor vtable slot 0x74 with the descriptor payload.
 * Returns no value; the virtual callback may update actor or presentation state.
 */
void func_02034260(void *self, const void *descriptor)
{
    u8 *actor = (u8 *)self;
    const u8 *record = (const u8 *)descriptor;
    void *payload = *(void **)(record + 0x2c);
    u8 *attachment;
    void (*callback)(void *, void *);

    if (payload == 0) return;
    attachment = *(u8 **)(actor + 0x54);
    if (attachment != 0) {
        *(u16 *)(attachment + 0x24) &= (u16)~2;
        *(u16 *)(attachment + 0x24) |= 1;
    }
    callback = *(void (**)(void *, void *))(*(u8 **)actor + 0x74);
    callback(actor, payload);
}
