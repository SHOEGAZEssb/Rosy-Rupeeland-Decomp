#include "tingle/types.h"

/* Overlay 30 dialog presentation, input forwarding, and message selection. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_021f3ecc[];
extern const u8 data_021f5ed0[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020791e0(const void *, u16);
extern void func_02092e9c(void *, void *, s32);
extern u32 func_02093360(void *, const void *);
extern void func_ov045_0220c128(void *, void *);
extern void func_ov045_0220c028(void *);
extern s32 func_ov045_0220c280(void *);
extern void func_ov045_0220c174(void *);
extern void func_02075598(void *, void *);
extern void func_ov045_0220d2f8(s32, s32);
extern void func_ov030_021fe954(void *, u16);
#ifdef __cplusplus
}
#endif

/*
 * Opens message `messageId` in dialog +0x2BC: resets dialog fields +0xD0/+0xD4,
 * resolves the message through table 0x021F3ECC, installs it in slot 4, and
 * updates the dialog with template/input data 0x021F5ED0. Result flag bit 9
 * chooses whether auxiliary object +0x2C0 receives dialog payload +0xE8 or is
 * reset. It then refreshes the debug-font surface using config +0x54 and starts
 * overlay-45 handle (8,0x21). Returns void; dialog, auxiliary, font, and overlay
 * SDK state change.
 */
extern "C" void func_ov030_021fe954(void *scene, u16 messageId)
{
    void *dialog = FIELD(void *, scene, 0x2bc);
    FIELD(s32, dialog, 0xd0) = 13;
    FIELD(s32, dialog, 0xd4) = 0;
    void *message = func_020791e0(data_021f3ecc, messageId);
    func_02092e9c(dialog, message, 4);
    u32 result = func_02093360(dialog, data_021f5ed0);
    if ((result & 0x200) != 0)
        func_ov045_0220c128(FIELD(void *, scene, 0x2c0),
                            FIELD(void *, dialog, 0xe8));
    else
        func_ov045_0220c028(FIELD(void *, scene, 0x2c0));
    func_02075598(gDebugFont, FIELD(void *, scene, 0x54));
    func_ov045_0220d2f8(8, 0x21);
}

/*
 * Copies the 11-halfword live input record addressed by scene +0x2C, folds the
 * dialog's status bits into its second halfword, and forwards it to dialog
 * +0x2BC. Scene flag 0x20 changes how dialog status bit 1 resets, pauses, or
 * advances auxiliary object +0x2C0. Dialog result bit 9 forwards payload +0xE8;
 * result bit 0 advances the auxiliary object and returns 1. Otherwise returns
 * 0. Input is copied before modification; dialog and auxiliary SDK state may
 * change, while the original input record does not.
 */
extern "C" s32 func_ov030_021fea00(void *scene)
{
    u16 input[11];
    const u16 *source = FIELD(const u16 *, scene, 0x2c);
    for (s32 i = 0; i < 11; ++i)
        input[i] = source[i];

    void *dialog = FIELD(void *, scene, 0x2bc);
    u32 status = FIELD(u32, dialog, 0x38);
    if ((status & 1) != 0)
        return 1;
    if ((FIELD(u32, scene, 0x20) & 0x20) != 0) {
        if ((status & 2) != 0) {
            if (func_ov045_0220c280(FIELD(void *, scene, 0x2c0)) != 0)
                func_ov045_0220c028(FIELD(void *, scene, 0x2c0));
            input[1] |= 1;
        } else {
            input[1] |= 2;
        }
    } else if ((status & 2) != 0) {
        func_ov045_0220c174(FIELD(void *, scene, 0x2c0));
    }

    u32 result = func_02093360(dialog, input);
    if ((result & 0x200) != 0)
        func_ov045_0220c128(FIELD(void *, scene, 0x2c0),
                            FIELD(void *, dialog, 0xe8));
    if ((result & 1) == 0)
        return 0;
    func_ov045_0220c174(FIELD(void *, scene, 0x2c0));
    return 1;
}

/*
 * Chooses an initial dialog message from the two persistent counts +0x384 and
 * +0x38C: 0x1F6 when both are zero, 0x1F7 when both are nonzero, and 0x1F1 when
 * exactly one is nonzero. Returns void; delegates all observable dialog and SDK
 * changes to 0x021FE954.
 */
extern "C" void func_ov030_021feb0c(void *scene)
{
    s32 first = FIELD(s32, scene, 0x384);
    s32 second = FIELD(s32, scene, 0x38c);
    if (first == 0 && second == 0)
        func_ov030_021fe954(scene, 0x1f6);
    else if (first != 0 && second != 0)
        func_ov030_021fe954(scene, 0x1f7);
    else
        func_ov030_021fe954(scene, 0x1f1);
}
