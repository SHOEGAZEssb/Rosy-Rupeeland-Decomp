#include "tingle/types.h"

/* Overlay 21 dialog content setup and interactive prompt processing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void **data_021f5128;
extern const u16 data_021f5ed0[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern const void *RecordMode_GetMessage(void *, s32);
extern void func_02092e9c(void *, const void *, s32);
extern s32 func_02093360(void *, const void *);
extern void func_020939d8(void *);
extern void func_ov045_0220c028(void *);
extern void func_ov045_0220c068(void *);
extern void func_ov045_0220c128(void *, s32);
extern void func_ov045_0220c174(void *);
extern s32 func_ov045_0220c280(void *);
extern void func_ov045_0220d2f8(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Reset dialog +0x388, set layout words +0xD0=13/+0xD4=0, resolve caller
 * message ID from the mode record selected by +0x54, install it with mode 4,
 * and render using data_021F5ED0. When render result bit 9 is set, configure
 * external dialog +0x38C with selector 3 for message 10 or dialog result +0xE8
 * otherwise; when clear, message 10 still selects 3 while other messages invoke
 * the default external setup. Select debug-font context +0x58 and notify mode
 * +0x54 with argument zero. Dialog/font/external UI state changes; returns void.
 */
extern "C" void func_ov021_021ff0e0(void *state, s32 messageId)
{
    void *modeRecord = data_021f5128[FIELD(s32, state, 0x54)];
    void *dialog = FIELD(void *, state, 0x388);
    func_020939d8(dialog);
    FIELD(s32, dialog, 0xd0) = 0xd;
    FIELD(s32, dialog, 0xd4) = 0;
    func_02092e9c(dialog, RecordMode_GetMessage(modeRecord, messageId), 4);
    s32 result = func_02093360(dialog, data_021f5ed0);
    void *external = FIELD(void *, state, 0x38c);
    if ((result & 0x200) != 0) {
        func_ov045_0220c128(external,
                            messageId == 10 ? 3 :
                            FIELD(s32, dialog, 0xe8));
    } else if (messageId == 10) {
        func_ov045_0220c128(external, 3);
    } else {
        func_ov045_0220c028(external);
    }
    GraphicsSpriteRenderer_SetFontResource(
        gDebugFont, FIELD(void *, state, 0x58));
    func_ov045_0220d2f8(FIELD(s32, state, 0x54), 0);
}

/*
 * Reset dialog +0x388, set +0xD0=13/+0xD4=0, install the caller text/resource
 * with mode 4, and render through data_021F5ED0. Render-result bit 9 selects
 * external dialog +0x38C using dialog result +0xE8; otherwise invoke its
 * default setup. Select debug-font context +0x58 and notify mode +0x54 with
 * zero. Dialog/font/external UI state changes; returns void and no MMIO occurs.
 */
extern "C" void func_ov021_021ff1d0(void *state, const void *content)
{
    void *dialog = FIELD(void *, state, 0x388);
    func_020939d8(dialog);
    FIELD(s32, dialog, 0xd0) = 0xd;
    FIELD(s32, dialog, 0xd4) = 0;
    func_02092e9c(dialog, content, 4);
    s32 result = func_02093360(dialog, data_021f5ed0);
    void *external = FIELD(void *, state, 0x38c);
    if ((result & 0x200) != 0)
        func_ov045_0220c128(external, FIELD(s32, dialog, 0xe8));
    else
        func_ov045_0220c028(external);
    GraphicsSpriteRenderer_SetFontResource(
        gDebugFont, FIELD(void *, state, 0x58));
    func_ov045_0220d2f8(FIELD(s32, state, 0x54), 0);
}

/*
 * Process the active prompt using an 11-halfword copy of template +0x2C.
 * Return one immediately when dialog +0x388 flags +0x38 bit zero is already
 * set. Otherwise adjust template halfword one according to scene flag bit 5
 * and dialog flag bit 1, coordinating external object +0x38C through its
 * probe/default/alternate operations. Render the adjusted template; result bit
 * 9 selects external value dialog+0xE8, and result bit zero completes by
 * invoking the external accept operation and returning one. Return zero while
 * incomplete. Dialog/external UI state changes; no direct MMIO occurs.
 */
extern "C" s32 func_ov021_021ff274(void *state)
{
    u16 templateCopy[11];
    const u16 *source = FIELD(const u16 *, state, 0x2c);
    s32 i;
    for (i = 0; i < 11; i++)
        templateCopy[i] = source[i];

    void *dialog = FIELD(void *, state, 0x388);
    u32 flags = FIELD(u32, dialog, 0x38);
    if ((flags & 1) != 0)
        return 1;
    void *external = FIELD(void *, state, 0x38c);
    if ((FIELD(u32, state, 0x20) & 0x20) != 0) {
        if ((flags & 2) != 0) {
            if (func_ov045_0220c280(external) != 0)
                func_ov045_0220c028(external);
            templateCopy[1] |= 1;
        } else {
            templateCopy[1] |= 2;
        }
    } else if ((flags & 2) != 0) {
        func_ov045_0220c174(external);
    }

    s32 result = func_02093360(dialog, templateCopy);
    if ((result & 0x200) != 0)
        func_ov045_0220c128(external, FIELD(s32, dialog, 0xe8));
    if ((result & 1) == 0)
        return 0;
    func_ov045_0220c068(external);
    return 1;
}
