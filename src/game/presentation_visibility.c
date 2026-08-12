
/* Portable transcription of retail func_020954E0 (0x020954E0..0x020954F3). */
#include "tingle/types.h"

/* Show the presentation's retained sprite by clearing OAM visibility bit 2. */
void func_020954e0(void *presentation)
{
    u8 *sprite = *(u8 **)((u8 *)presentation + 0x9c);
    *(u16 *)(sprite + 0x24) &= (u16)~4;
}

/* Return the bound sprite state's current animation index (0x020954D4). */
s32 func_020954d4(void *presentation)
{
    u8 *sprite = *(u8 **)((u8 *)presentation + 0x9c);
    return sprite[0x38];
}

/* Hide the presentation by setting recovered sprite-state flag bit two. */
void func_020954f4(void *presentation)
{
    u8 *sprite = *(u8 **)((u8 *)presentation + 0x9c);
    *(u16 *)(sprite + 0x24) |= 4;
}

extern void func_02095508(void *presentation);

/* Sprite-backed presentation vtable sync slot; exact 0x02095540 behavior. */
void func_02095540(void *presentation)
{
    func_02095508(presentation);
}

extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, u8 index);

/*
 * Handle the two sprite-specific presentation wordcode extensions. Command
 * zero toggles visibility and command one selects an animation. The return is
 * the number of operand words consumed after opcode 24.
 */
s16 func_0209554c(void *presentation, const u32 *command)
{
    u8 *sprite = *(u8 **)((u8 *)presentation + 0x9c);

    if (command[0] == 0) {
        if (command[1] != 0)
            *(u16 *)(sprite + 0x24) &= 0xfffbU;
        else
            *(u16 *)(sprite + 0x24) |= 4;
        return 2;
    }
    if (command[0] == 1) {
        GraphicsSpriteState_SetAnimationIndex(sprite, (u8)command[1]);
        return 2;
    }
    return 1;
}


