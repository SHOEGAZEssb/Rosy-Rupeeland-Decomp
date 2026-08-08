#include "tingle/types.h"

/* Overlay 34 sector-selection initialization, lookup, and input dispatch. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov034_021fe788[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov034_021fd330(void *state, s32 baseSector, s32 distance);
extern void func_ov034_021fd3a0(void *state, s32 target, s32 baseSector);
#ifdef __cplusplus
}
#endif

/*
 * Starts a recovered sector movement. `baseSector + distance` wraps across the
 * sixteen-entry ring; +0x1C/+0x14 retain the current 16-bit phase, +0x18 stores
 * the wrapped destination sector in 0x1000 units plus 0x800 (and adds 0x10000
 * when the target wrapped behind the base), +0x24 stores distance*6, counters
 * +0x28/+0x10 clear, and state +0x20 becomes 3. Returns no value and has no SDK
 * or hardware effects.
 */
extern "C" void func_ov034_021fd330(void *state, s32 baseSector, s32 distance)
{
    s32 target = baseSector + distance;
    if (target >= 16)
        target -= 16;
    u16 phase = (u16)FIELD(s32, state, 0x1c);
    FIELD(u32, state, 0x1c) = phase;
    FIELD(u32, state, 0x14) = phase;
    FIELD(s32, state, 0x18) = target * 0x1000 + 0x800;
    if (target < baseSector)
        FIELD(s32, state, 0x18) += 0x10000;
    FIELD(s32, state, 0x24) = distance * 6;
    FIELD(s32, state, 0x28) = 0;
    FIELD(s32, state, 0x10) = 0;
    FIELD(s32, state, 0x20) = 3;
}

/*
 * Searches forward distances 2..17 from `baseSector` in the state's selected
 * sixteen-entry table bank (+0) for `target`. On the first match it starts the
 * movement with func_ov034_021fd330; if no value matches, state is unchanged.
 * Returns no value and performs no SDK or hardware operation.
 */
extern "C" void func_ov034_021fd3a0(void *state, s32 target, s32 baseSector)
{
    s32 bank = FIELD(s32, state, 0);
    for (s32 distance = 2; distance < 18; ++distance) {
        s32 sector = baseSector + distance;
        if (sector >= 16)
            sector -= 16;
        if (data_ov034_021fe788[bank * 16 + sector] == target) {
            func_ov034_021fd330(state, baseSector, distance);
            return;
        }
    }
}

/*
 * Dispatches selection `input` according to state +0x20. States 0/3 report
 * handled (1), state 1 reports busy (0), and the remaining active state derives
 * the current sector from +0x1C then searches the bank table. Inputs below two
 * are direct targets; inputs 2/3 map to targets 0/1 for banks below two, while
 * banks two and above map either such input to target 2. Returns 1 after active
 * dispatch. It may start sector motion but performs no direct hardware access.
 */
extern "C" s32 func_ov034_021fd3f4(void *state, s32 input)
{
    s32 mode = FIELD(s32, state, 0x20);
    if (mode == 0 || mode == 3)
        return 1;
    if (mode == 1)
        return 0;

    s32 sector = (u16)FIELD(s32, state, 0x1c) >> 12;
    if (input < 2) {
        func_ov034_021fd3a0(state, input, sector);
    } else if (FIELD(s32, state, 0) < 2) {
        if (input == 2)
            func_ov034_021fd3a0(state, 0, sector);
        else if (input == 3)
            func_ov034_021fd3a0(state, 1, sector);
    } else {
        func_ov034_021fd3a0(state, 2, sector);
    }
    return 1;
}
