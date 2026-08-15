#include "tingle/types.h"

/* Overlay 32 localized numeric-string construction and indexed dialog-message selection. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern u8 gSystemState[];
extern const u8 data_020c7ba8[];
extern const u8 data_021f3ecc[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(...);
extern void GraphicsSpriteText_FormatDecimal(...);
extern void func_02092e9c(...);
extern void func_020939c8(void *);
extern void func_020939d8(void *);
extern void func_02093360(...);
extern void *func_020791e0(...);
#ifdef __cplusplus
}
#endif

/*
 * Formats the value at +0xC20 for the dialog at +0x14, inserts the locale's
 * grouping/decimal punctuation when needed, appends character 0x006D, then
 * opens and advances the dialog. Returns void. Locale byte +0x5F is confirmed;
 * the language enumeration names are not yet known.
 */
extern "C" void func_ov032_021fe2f0(void *scene)
{
    u16 text[32];
    u32 value = FIELD(u32, scene, 0xc20);
    s32 digits = 0;
    u32 divisor = 1;
    while (digits < 8 && func_020befec(value, divisor * 10) != 0) {
        divisor *= 10;
        ++digits;
    }
    GraphicsSpriteText_FormatDecimal(text, value, divisor, 0);

    u16 primary = 0x2c;
    u16 secondary = 0x2c;
    switch (gSystemState[0x5f]) {
    case 0:
    case 1:
        secondary = 0x2e;
        break;
    case 2:
    case 3:
        primary = 0x20;
        break;
    case 4:
    case 5:
        primary = 0x2e;
        break;
    }

    s32 length = digits + 1;
    if (divisor == 1) {
        text[1] = secondary;
        text[2] = 0x30;
        length = 3;
    } else if (divisor >= 1000) {
        text[length] = text[length - 1];
        text[length - 1] = text[length - 2];
        text[length - 2] = text[length - 3];
        text[length - 3] = primary;
        ++length;
    }
    text[length] = 0x6d;
    text[length + 1] = 0;

    void *dialog = FIELD(void *, scene, 0x14);
    func_02092e9c(dialog, text, 0);
    func_020939c8(dialog);
    func_02093360(dialog, 0);
}

/*
 * Closes the dialog at +0x18, reads the low 16-bit message ID from the selected
 * 0x208-byte record in table 0x020C7BA8, resolves it through table 0x021F3ECC,
 * installs the text, reopens/advances the dialog, and returns void.
 */
extern "C" void func_ov032_021fe440(void *scene)
{
    u32 index = FIELD(u32, scene, 0xc24);
    u16 messageId = (u16)FIELD(u32, data_020c7ba8, index * 0x208);
    void *dialog = FIELD(void *, scene, 0x18);
    func_020939d8(dialog);
    func_02092e9c(dialog, func_020791e0(data_021f3ecc, messageId), 0);
    func_020939c8(dialog);
    func_02093360(dialog, 0);
}
