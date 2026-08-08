#include "tingle/types.h"

/* Overlay 26 numeric particle-string generation for the scene's secondary pool. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const char data_ov026_02204ac0[];
extern const char data_ov026_02204ac4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02077308(void *, void *);
extern void func_0207735c(void *);
extern s32 func_020b35b0(char *, const char *, s32);
extern s32 func_020befec(s32, s32);
extern void func_ov026_021ff830(void *, u32, s32, s32, s32, u8, u32);
extern void func_ov026_02200880(void *, s32);
#ifdef __cplusplus
}
#endif

/* Acquires one record from pool +0x78 using descriptor +0xA0. */
static void *acquire_digit(void *scene)
{
    return func_02077308(FIELD(void *, scene, 0x78), (u8 *)scene + 0xa0);
}

/* Configures one numeric particle with fixed depth, byte value, and flags. */
static void setup_digit(void *record, s32 kind, s32 x, s32 y)
{
    func_ov026_021ff830(record, (u32)kind, x, y, 0, 0x1b, 0x40);
}

/*
 * Clears pool +0x78 and formats `value`. Values below 100 delegate to
 * 0x02200880; larger values are divided/formatted with the address-derived
 * format at 0x02204AC0. It emits boundary records of kinds 11/12, one record
 * per ASCII digit, and inserts kind 10 four positions from the end. Horizontal
 * placement is centered from the formatted length. Returns void.
 */
extern "C" void func_ov026_022006f8(void *scene, s32 value)
{
    func_0207735c(FIELD(void *, scene, 0x78));
    if (value < 100) {
        func_ov026_02200880(scene, value);
        return;
    }

    char text[32];
    s32 converted = func_020befec(value, 10);
    s32 count = func_020b35b0(text, data_ov026_02204ac0, converted);
    s32 width = count * 16 + 100 + (count >= 4 ? 8 : 0);
    s32 x = -(width / 2) + 42;
    setup_digit(acquire_digit(scene), 11, x << 4, -0x510);
    x += 50;
    for (s32 i = 0; i < count; ++i) {
        setup_digit(acquire_digit(scene), text[i] - '0', x << 4, -0x500);
        if (count - i == 4) {
            setup_digit(acquire_digit(scene), 10, (x + 12) << 4, -0x500);
            x += 24;
        } else {
            x += 16;
        }
    }
    setup_digit(acquire_digit(scene), 12, x << 4, -0x500);
}

/*
 * Formats the below-100 `value` with the address-derived format at 0x02204AC4.
 * It emits boundary kinds 11/12, digit records, and inserts kind 13 two
 * positions from the end. Returns void; the caller has already cleared pool
 * +0x78.
 */
extern "C" void func_ov026_02200880(void *scene, s32 value)
{
    func_0207735c(FIELD(void *, scene, 0x78));
    char text[16];
    s32 count = func_020b35b0(text, data_ov026_02204ac4, value);
    s32 x = -((count * 16 + 108) / 2) + 42;
    setup_digit(acquire_digit(scene), 11, x << 4, -0x510);
    x += 50;
    for (s32 i = 0; i < count; ++i) {
        setup_digit(acquire_digit(scene), text[i] - '0', x << 4, -0x500);
        if (count - i == 2) {
            setup_digit(acquire_digit(scene), 13, (x + 12) << 4, -0x500);
            x += 24;
        } else {
            x += 16;
        }
    }
    setup_digit(acquire_digit(scene), 12, x << 4, -0x500);
}
