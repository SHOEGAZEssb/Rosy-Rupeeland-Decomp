#include "tingle/types.h"

/* Overlay 15 record placement, replacement, shutdown, and lookup helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_ov015_021feb84[];
extern const s16 data_ov015_021feb88[];

#ifdef __cplusplus
extern "C" {
#endif
extern void SpriteMotionController_SetPosition(void *, s32, s32);
extern s32 SpriteMotionController_BeginHitResponse(void *, s32, s32, s32);
extern void SpriteMotionController_Show(void *);
extern void SpriteMotionController_Hide(void *);
extern void func_ov015_021fd8a8(void *, s32);
extern s32 Overlay015_LayoutRecords(void *);
extern void Overlay015_StopRecords(void *);
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
extern "C" s32 Overlay015_LayoutRecords(void *state)
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
        SpriteMotionController_SetPosition(record, 0x80, 0xaa);
        SpriteMotionController_Show(record);
        return 1;
    }

    positions = count == 2 ? data_ov015_021feb84 : data_ov015_021feb88;
    for (i = 0; i < count && i < 3; i++) {
        void *record = (u8 *)state + 0xfc + i * 0xac;
        FIELD(u16, FIELD(void *, record, 0x9c), 0x2c) = positions[i];
        SpriteMotionController_SetPosition(record, positions[i], 0xaa);
        SpriteMotionController_Show(record);
    }
    return 1;
}

/*
 * Replace the active record set with one required value and up to two optional
 * nonnegative values. Stop all existing records, append in argument order,
 * lay out the resulting set, and return the layout helper's zero/one result.
 */
extern "C" s32 Overlay015_ReplaceRecords(void *state, s32 first, s32 second, s32 third)
{
    FIELD(s32, state, 0x300) = 0;
    Overlay015_StopRecords(state);
    func_ov015_021fd8a8(state, first);
    if (second >= 0) {
        func_ov015_021fd8a8(state, second);
        if (third >= 0) {
            func_ov015_021fd8a8(state, third);
        }
    }
    return Overlay015_LayoutRecords(state);
}

/*
 * Stop each of the three allocated record slots, regardless of the active
 * count at +0x300. The record shutdown calls mutate their objects; return void
 * and perform no direct hardware access.
 */
extern "C" void Overlay015_StopRecords(void *state)
{
    s32 i;

    for (i = 0; i < 3; i++) {
        SpriteMotionController_Hide((u8 *)state + 0xfc + i * 0xac);
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
        if (SpriteMotionController_BeginHitResponse((u8 *)state + 0xfc + i * 0xac, value, 0, 4) != 0) {
            return i;
        }
    }
    return -1;
}
