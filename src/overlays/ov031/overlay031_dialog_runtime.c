#include "tingle/types.h"

/* Overlay 31 dialog messaging, copied-input processing, and status-sprite control. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_021f4020[];
extern const u8 data_021f5ed0[];
extern const u8 data_ov031_021fe6e4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020939d8(void *);
extern void func_02093998(void *);
extern void *func_02079408(const void *, u16);
extern void func_02092e9c(void *, void *, s32);
extern u32 func_02093360(void *, const void *);
extern void func_02072b68(void *, s32);
extern void func_ov031_021fdf20(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * For nonnegative `messageId`, closes/resets dialog +0x98, resolves the message
 * through table 0x021F4020, installs it in slot 0, and updates with template
 * 0x021F5ED0. Result bit 9 selects dialog payload +0xE8 (otherwise zero), stores
 * it at +0x9C, maps it through byte table 0x021FE6E4 into sprite +0x68, sets that
 * sprite's flag bit 1 while clearing bit 0, and starts helper 0x021FDF20 in mode
 * 1. A negative ID only invokes dialog close helper 0x02093998. Returns void;
 * dialog, sprite, and helper animation state may change.
 */
extern "C" void func_ov031_021fdd04(void *scene, s32 messageId)
{
    void *dialog = FIELD(void *, scene, 0x98);
    if (messageId < 0) {
        func_02093998(dialog);
        return;
    }
    func_020939d8(dialog);
    void *message = func_02079408(data_021f4020, (u16)messageId);
    func_02092e9c(dialog, message, 0);
    u32 result = func_02093360(dialog, data_021f5ed0);
    s32 selection = (result & 0x200) != 0 ? FIELD(s32, dialog, 0xe8) : 0;
    FIELD(s32, scene, 0x9c) = selection;
    void *sprite = FIELD(void *, scene, 0x68);
    func_02072b68(sprite, data_ov031_021fe6e4[selection]);
    FIELD(u16, sprite, 0x24) =
        (FIELD(u16, sprite, 0x24) | 2) & (u16)~1;
    func_ov031_021fdf20(scene, 1);
}

/*
 * Copies the 11-halfword live input record addressed by scene +0x2C, folds
 * dialog status into the copy, and submits it to dialog +0x98. Status bit 0
 * returns 1 immediately. With scene flag 0x20, status bit 1 starts helper mode 1,
 * restores the selected status-sprite frame/visibility, and injects input bit 0;
 * otherwise input bit 1 is injected. Without scene flag 0x20, status bit 1 hides
 * the sprite's bit-1 state. Dialog result bit 9 updates selection +0x9C, sprite
 * frame, and helper animation; result bit 0 hides the sprite and returns 1.
 * Otherwise returns 0. The original input record is unchanged; dialog, sprite,
 * scene selection, and helper state may change.
 */
extern "C" s32 func_ov031_021fddbc(void *scene)
{
    u16 input[11];
    const u16 *source = FIELD(const u16 *, scene, 0x2c);
    for (s32 i = 0; i < 11; ++i)
        input[i] = source[i];
    void *dialog = FIELD(void *, scene, 0x98);
    u32 status = FIELD(u32, dialog, 0x38);
    if ((status & 1) != 0)
        return 1;
    void *sprite = FIELD(void *, scene, 0x68);
    if ((FIELD(u32, scene, 0x20) & 0x20) != 0) {
        if ((status & 2) != 0) {
            func_ov031_021fdf20(scene, 1);
            if ((FIELD(u16, sprite, 0x24) & 2) == 0) {
                func_02072b68(sprite,
                    data_ov031_021fe6e4[FIELD(s32, scene, 0x9c)]);
                FIELD(u16, sprite, 0x24) =
                    (FIELD(u16, sprite, 0x24) | 2) & (u16)~1;
            }
            input[1] |= 1;
        } else {
            input[1] |= 2;
        }
    } else if ((status & 2) != 0) {
        FIELD(u16, sprite, 0x24) &= (u16)~2;
    }
    u32 result = func_02093360(dialog, input);
    if ((result & 0x200) != 0) {
        s32 selection = FIELD(s32, dialog, 0xe8);
        FIELD(s32, scene, 0x9c) = selection;
        func_02072b68(sprite, data_ov031_021fe6e4[selection]);
        func_ov031_021fdf20(scene, 1);
    }
    if ((result & 1) == 0)
        return 0;
    FIELD(u16, sprite, 0x24) &= (u16)~2;
    return 1;
}
