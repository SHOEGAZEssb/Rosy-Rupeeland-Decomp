#include "tingle/types.h"

/* Overlay 18 animation selection, event gating, facing lookup, and terrain-cell comparison helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020d4a60[];
extern const s8 data_ov018_021ffd08[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02028388(s32);
extern void func_02072b68(void *, s32);
extern void func_02092260(void *, s32);
extern void func_02092288(void *, s32);
extern u32 func_020ae024(s32, s32);
extern s32 func_020befec(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Select animation state +0x188 plus 10, or plus 25 when alternate is nonzero,
 * for sprite +0xD0. Skip the SDK call when its current byte +0x38 already
 * matches. Returns void; sprite animation state may change, with no MMIO.
 */
extern "C" void func_ov018_021fdb7c(void *state, s32 alternate)
{
    void *sprite = FIELD(void *, state, 0xd0);
    s32 animation = FIELD(s32, state, 0x188) + (alternate ? 0x19 : 0xa);
    if (FIELD(u8, sprite, 0x38) != (u8)animation)
        func_02072b68(sprite, (u8)animation);
}

/*
 * Emit scene event 0x4C only when latch +0x40C is clear, then set the latch.
 * Returns void. Scene/event and latch state may change; no direct MMIO occurs.
 */
extern "C" void func_ov018_021fdbac(void *state)
{
    if (FIELD(s32, state, 0x40c) == 0) {
        func_02092260(state, 0x4c);
        FIELD(s32, state, 0x40c) = 1;
    }
}

/*
 * Stop scene event 0x4C only when latch +0x40C is set, then clear the latch.
 * Returns void. Scene/event and latch state may change; no direct MMIO occurs.
 */
extern "C" void func_ov018_021fdbd4(void *state)
{
    if (FIELD(s32, state, 0x40c) != 0) {
        func_02092288(state, 0x4c);
        FIELD(s32, state, 0x40c) = 0;
    }
}

/*
 * Derive an angle from actor +0x184 coordinate words +0x1C/+0x20/+0x24 and
 * scene offsets +0x34/+0x38/+0x5C/+0x60. Fixed-point values are shifted by 12,
 * two components are halved with truncation toward zero, and the resulting
 * angle shifted right 12 indexes signed-byte table data_ov018_021FFD08. Store
 * the selected value at +0x188 and return void. State/math SDK changes only.
 */
extern "C" void func_ov018_021fdbfc(void *state)
{
    void *actor = FIELD(void *, state, 0x184);
    s32 component0 = ((FIELD(s32, actor, 0x20) >> 12) -
                      (FIELD(s32, actor, 0x24) >> 12)) / 2;
    s32 component1 = (FIELD(s32, actor, 0x1c) >> 12) / 2;
    s32 x = component0 -
            (FIELD(s32, state, 0x38) + FIELD(s32, state, 0x60));
    s32 y = component1 -
            (FIELD(s32, state, 0x34) + FIELD(s32, state, 0x5c));
    FIELD(s32, state, 0x188) = data_ov018_021ffd08[
        (s32)func_020ae024(x, y) >> 12];
}

/*
 * Convert coordinate-like state fields +0x34/+0x38, offsets +0x5C/+0x60, and
 * signed selectors +0x1A0/+0x1A4 into a table index. Resolve the corresponding
 * data_020D4A60 entry through 0x02028388 when nonzero, using signed byte +0x4D,
 * otherwise value -1. Return one when that value equals cached +0x19C, else
 * zero. Global table/SDK state is read only and no MMIO occurs.
 */
extern "C" s32 func_ov018_021fdc64(void *state)
{
    s32 vertical = FIELD(s32, state, 0x38) +
                   FIELD(s32, state, 0x1a4) * 0x180 +
                   FIELD(s32, state, 0x60);
    s32 horizontal = FIELD(s32, state, 0x34) +
                     (FIELD(s32, state, 0x1a0) << 9) +
                     FIELD(s32, state, 0x5c);
    s32 index = (horizontal / 0x200) +
                (func_020befec(vertical, 0x180) << 4);
    void *entry = data_020d4a60[index];
    s32 value = -1;

    if (entry != 0)
        value = FIELD(s8, func_02028388((s32)entry - 1), 0x4d);
    return value == FIELD(s32, state, 0x19c);
}
