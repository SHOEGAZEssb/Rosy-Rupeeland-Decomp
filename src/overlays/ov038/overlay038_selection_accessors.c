#include "tingle/types.h"

/*
 * Overlay 38 selected-record access and presentation synchronization. These
 * recovered helpers translate the filtered selection index into record fields
 * and refresh the panel, label, list window, and transition timer.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_020d7a48[];
extern const u8 data_020d7a64[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov038_021fd40c(void *presentation);
extern void func_ov038_021fd624(void *presentation);
extern s32 func_ov046_0220c3bc(void *panel, s32 recordValue);
extern s32 func_ov046_0220c410(void *panel, s32 recordValue);
extern void func_ov046_0220c46c(void *panel, s32 first, s32 second);
extern void func_ov046_0220bffc(void *panel, s32 recordValue, s32 enabled,
                                u16 secondaryValue);
extern void func_02028100(void *label, s32 value);
extern void func_02091b98(void *timer, s32 ticks);
#ifdef __cplusplus
}
#endif

static s32 selectedFilteredRecord(void *presentation)
{
    void *model = FIELD(void *, presentation, 0x314);
    s32 selection = FIELD(s32, model, 0x14);
    return FIELD(s32, presentation, 0x114 + selection * 4);
}

/*
 * Return zero when the filtered list is empty. Otherwise use model field
 * +0x14 to index presentation +0x114 and return the selected 0x24-byte
 * record's signed halfword at +0. No state changes occur.
 */
extern "C" s32 func_ov038_021fd508(void *presentation)
{
    if (FIELD(s32, presentation, 0x110) == 0) {
        return 0;
    }
    s32 record = selectedFilteredRecord(presentation);
    return *(const s16 *)(data_020d7a48 + record * 0x24);
}

/*
 * Return zero when the filtered list is empty. Otherwise resolve the same
 * selected record as func_ov038_021fd508 and return its unsigned halfword at
 * +0x1C (expressed through the address-derived data_020d7a64 base). No state
 * changes occur; the semantic meaning of this field remains unconfirmed.
 */
extern "C" u32 func_ov038_021fd540(void *presentation)
{
    if (FIELD(s32, presentation, 0x110) == 0) {
        return 0;
    }
    s32 record = selectedFilteredRecord(presentation);
    return *(const u16 *)(data_020d7a64 + record * 0x24);
}

/*
 * Refresh selected-record presentation only when model +0x30 equals half of
 * +0x2C (with signed rounding matching the original). Redraw the five-row
 * window if +0x0C differs from +0x10, derive two panel values from the primary
 * record halfword, install them, apply the secondary record halfword, update
 * the label, and reset transition state through func_ov038_021fd624. Returns
 * no value; panel, renderer, label, timer, and presentation state may change.
 */
extern "C" void func_ov038_021fd578(void *presentation)
{
    s32 primary = func_ov038_021fd508(presentation);
    void *model = FIELD(void *, presentation, 0x314);
    s32 duration = FIELD(s32, model, 0x2c);
    if (FIELD(s32, model, 0x30) != (duration + ((u32)duration >> 31)) / 2) {
        return;
    }
    if (FIELD(s32, model, 0x0c) != FIELD(s32, model, 0x10)) {
        func_ov038_021fd40c(presentation);
    }

    void *panel = FIELD(void *, presentation, 0x340);
    s32 first = func_ov046_0220c3bc(panel, primary);
    s32 second = func_ov046_0220c410(panel, primary);
    func_ov046_0220c46c(panel, first, second);
    func_ov046_0220bffc(panel, primary, 1,
                        (u16)func_ov038_021fd540(presentation));
    func_02028100(FIELD(void *, presentation, 0x344), primary);
    func_ov038_021fd624(presentation);
}

/*
 * Mark transition bits 0 and 1 in presentation +0x48. Set +0x33C to the
 * negative 24-pixel displacement between model selection +0x14 and window
 * origin +0x0C, reload the +0x348 timer with 120 ticks, and set blink flag
 * +0x364. Returns no value and changes presentation/timer state.
 */
extern "C" void func_ov038_021fd624(void *presentation)
{
    FIELD(u32, presentation, 0x48) |= 3;
    void *model = FIELD(void *, presentation, 0x314);
    FIELD(s32, presentation, 0x33c) =
        -(FIELD(s32, model, 0x14) - FIELD(s32, model, 0x0c)) * 24;
    func_02091b98((u8 *)presentation + 0x348, 120);
    FIELD(s32, presentation, 0x364) = 1;
}
