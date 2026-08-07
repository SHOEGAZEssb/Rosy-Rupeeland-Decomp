#include "tingle/types.h"

/* Overlay 15 record placement, replacement, shutdown, and lookup helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_ov015_021feb84[];
extern const s16 data_ov015_021feb88[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095820(void *, s32, s32);
extern s32 func_02095860(void *, s32, s32, s32);
extern void func_02095928(void *);
extern void func_02095940(void *);
extern void func_ov015_021fd8a8(void *, s32);
extern s32 func_ov015_021fd8ec(void *);
extern void func_ov015_021fda50(void *);
#ifdef __cplusplus
}
#endif

/*
 * Position and activate the populated 0xAC-byte records beginning at +0xFC.
 * Counts of one, two, and three use the confirmed center coordinate 0x80 or
 * the signed coordinate tables at 0x021FEB84/0x021FEB88. Each record's linked
 * object halfword +0x2C and animation state are changed. Return zero only when
 * no records are populated, otherwise return one; no direct hardware effects.
 */
extern "C" s32 func_ov015_021fd8ec(void *state)
{
    s32 count = FIELD(s32, state, 0x300);
    s32 i;
    const s16 *positions;

    if (count == 0) {
        return 0;
    }
    if (count == 1) {
        void *record = (u8 *)state + 0xfc;
        FIELD(u16, FIELD(void *, record, 0x9c), 0x2c) = 0x80;
        func_02095820(record, 0x80, 0xaa);
        func_02095928(record);
        return 1;
    }

    positions = count == 2 ? data_ov015_021feb84 : data_ov015_021feb88;
    for (i = 0; i < count && i < 3; i++) {
        void *record = (u8 *)state + 0xfc + i * 0xac;
        FIELD(u16, FIELD(void *, record, 0x9c), 0x2c) = positions[i];
        func_02095820(record, positions[i], 0xaa);
        func_02095928(record);
    }
    return 1;
}

/*
 * Replace the active record set with one required value and up to two optional
 * nonnegative values. Stop all existing records, append in argument order,
 * lay out the resulting set, and return the layout helper's zero/one result.
 */
extern "C" s32 func_ov015_021fd9f0(void *state, s32 first, s32 second, s32 third)
{
    FIELD(s32, state, 0x300) = 0;
    func_ov015_021fda50(state);
    func_ov015_021fd8a8(state, first);
    if (second >= 0) {
        func_ov015_021fd8a8(state, second);
        if (third >= 0) {
            func_ov015_021fd8a8(state, third);
        }
    }
    return func_ov015_021fd8ec(state);
}

/*
 * Stop each of the three allocated record slots, regardless of the active
 * count at +0x300. The record shutdown calls mutate their objects; return void
 * and perform no direct hardware access.
 */
extern "C" void func_ov015_021fda50(void *state)
{
    s32 i;

    for (i = 0; i < 3; i++) {
        func_02095940((u8 *)state + 0xfc + i * 0xac);
    }
}

/*
 * Search active records in ascending index order with comparison mode 0/4.
 * Return the first matching record index, or -1 if none match. The comparison
 * helper may inspect record animation state; this function has no hardware
 * effects and does not directly mutate the overlay state.
 */
extern "C" s32 func_ov015_021fda78(void *state, s32 value)
{
    s32 i;

    for (i = 0; i < FIELD(s32, state, 0x300); i++) {
        if (func_02095860((u8 *)state + 0xfc + i * 0xac, value, 0, 4) != 0) {
            return i;
        }
    }
    return -1;
}
