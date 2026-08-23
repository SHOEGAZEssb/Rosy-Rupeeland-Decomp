#include "tingle/types.h"

/*
 * Apply the common actor sprite visibility path. Sprite state is borrowed from
 * the actor at +0x54. Enabling consults virtual +0xa8 before clearing the
 * hidden bit; disabling sets it and invokes virtual +0x94 with value zero.
 */
void Actor_ApplyBaseSpriteVisibility(void *self, s32 enabled)
{
    u8 *actor = (u8 *)self;
    u8 *sprite = *(u8 **)(actor + 0x54);
    void **vtable = *(void ***)actor;

    if (sprite == 0)
        return;
    if (enabled != 0) {
        s32 (*canShow)(void *);

        if ((*(u32 *)(actor + 0x14) & 0x10000000u) != 0)
            return;
        canShow = (s32 (*)(void *))vtable[0xa8 / 4];
        if (canShow(actor) == 0)
            *(u16 *)(sprite + 0x24) &= 0xfffbu;
        return;
    }

    *(u16 *)(sprite + 0x24) |= 4;
    ((void (*)(void *, s32))vtable[0x94 / 4])(actor, 0);
}
