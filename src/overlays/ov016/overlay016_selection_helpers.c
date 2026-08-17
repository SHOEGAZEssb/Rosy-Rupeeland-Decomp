#include "tingle/types.h"

/* Overlay 16 cursor, panel synchronization, and record-validity helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021e9ac0;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorDescriptor_IsInvalid(void *);
extern void *Overlay000_GetActiveMetadata(void *);
extern void func_ov000_021fb890(void *, s32);
extern void Overlay000_PopulatePresentation(void *, void *);
extern void func_02095928(void *);
extern void func_02095940(void *);
extern void func_02095988(void *, s32);
extern void *func_ov016_021fd628(void *);
extern void func_ov016_021fd9dc(void *, s32);
extern void func_ov016_021fdaa0(void *, void *, s32);
extern void func_ov016_021ff848(void *, u16);
extern void func_ov016_021ffc2c(void *);
#ifdef __cplusplus
}
#endif

/*
 * If cursor sprite +0xE4 exists, set its signed Y halfword +0x2E to 0x20 plus
 * 0x18 times the difference between the list presentation's indices +0x14 and
 * +0x0C. Input is the scene state; return void. Sprite state changes only.
 */
extern "C" void func_ov016_021ffba4(void *state)
{
    void *sprite = FIELD(void *, state, 0xe4);
    if (sprite != 0) {
        void *presentation = FIELD(void *, FIELD(void *, state, 0x444), 0x58);
        FIELD(u16, sprite, 0x2e) =
            (u16)(0x20 + (FIELD(s32, presentation, 0x14) -
                          FIELD(s32, presentation, 0xc)) * 0x18);
    }
}

/*
 * Synchronize panel +0x448 to the currently selected list descriptor and the
 * presentation index +0x14 when both exist. If either list or selection is
 * absent, switch the panel to fallback index 1. Return void. Panel rendering
 * state changes through overlay helpers; no direct hardware access occurs.
 */
extern "C" void Overlay016_SyncSelectedPanel(void *state)
{
    void *list = FIELD(void *, state, 0x444);

    if (list != 0 && func_ov016_021fd628(list) != 0) {
        void *descriptor = func_ov016_021fd628(list);
        s32 index = FIELD(s32, FIELD(void *, list, 0x58), 0x14);
        func_ov016_021fdaa0(FIELD(void *, state, 0x448), descriptor, index);
    } else {
        func_ov016_021fd9dc(FIELD(void *, state, 0x448), 1);
    }
}

/*
 * For mode +0x54==1 while detail toggle +0x47C is clear, inspect the selected
 * auxiliary entry at +0x44C. A non-null child selects 0x021FB8F0 on object
 * +0x450 and sets state bit 1 at +0x4C; a null child selects 0x021FB890(...,1)
 * and clears that bit. In all modes draw message 0x20 through 0x021FF848.
 * Return void. UI and text state change; no direct MMIO occurs.
 */
extern "C" void func_ov016_021ffc2c(void *state)
{
    if (FIELD(s32, state, 0x54) == 1 && FIELD(s32, state, 0x47c) == 0) {
        void *entry = Overlay000_GetActiveMetadata(FIELD(void *, state, 0x44c));
        void *record = FIELD(void *, entry, 0xc);
        if (record != 0) {
            Overlay000_PopulatePresentation(FIELD(void *, state, 0x450), record);
            FIELD(u32, state, 0x4c) |= 2;
        } else {
            func_ov000_021fb890(FIELD(void *, state, 0x450), 1);
            FIELD(u32, state, 0x4c) &= ~2u;
        }
    }
    func_ov016_021ff848(state, 0x20);
}

/*
 * Clear the caller's six-byte result array, then validate each 0x24-byte entry
 * of the record referenced by slot against the global table at data_021E9AC0.
 * Each output starts at 2, becomes 1 when a global entry accepted by 0x02062B28
 * has the same +0 key and a +4 value at least the record entry's +4 value, and
 * remains 2 otherwise. Return one only when every record entry matched. The
 * scene argument is unused; only the six-byte output is modified.
 */
extern "C" s32 func_ov016_021ffcb0(void *state, void *slot, u8 *result)
{
    void *global = data_021e9ac0;
    void *record = FIELD(void *, slot, 0);
    s32 matches = 0;
    s32 recordIndex;

    (void)state;
    for (recordIndex = 0; recordIndex < 6; recordIndex++) {
        result[recordIndex] = 0;
    }
    for (recordIndex = 0; recordIndex < FIELD(s32, record, 0x100);
         recordIndex++) {
        void *recordEntry = (u8 *)record + 0x28 + recordIndex * 0x24;
        s32 globalIndex;

        result[recordIndex] = 2;
        for (globalIndex = 0; globalIndex < FIELD(s32, global, 0x10);
             globalIndex++) {
            void *globalEntry = (u8 *)FIELD(void *, global, 8) +
                                globalIndex * 0x24;
            if (ActorDescriptor_IsInvalid(globalEntry) == 0 &&
                FIELD(u16, recordEntry, 0) == FIELD(u16, globalEntry, 0) &&
                FIELD(u16, recordEntry, 4) <= FIELD(u16, globalEntry, 4)) {
                result[recordIndex] = 1;
                matches++;
                break;
            }
        }
    }
    return matches == FIELD(s32, record, 0x100);
}

/*
 * Toggle detail state +0x47C. Closing it switches actor +0x240 to value 0,
 * hides +0x2EC/+0x398, selects panel fallback 1, clears bit 2 at +0x4C, and
 * refreshes selection messaging. Opening it switches +0x240 to value 3, shows
 * both actors, selects auxiliary object state 1, clears bit 1/sets bit 2 at
 * +0x4C, and populates the panel from list descriptor index +0x480. Return void.
 */
extern "C" void func_ov016_021ffd84(void *state)
{
    if (FIELD(s32, state, 0x47c) != 0) {
        FIELD(s32, state, 0x47c) = 0;
        func_02095988((u8 *)state + 0x240, 0);
        func_02095940((u8 *)state + 0x2ec);
        func_02095940((u8 *)state + 0x398);
        func_ov016_021fd9dc(FIELD(void *, state, 0x448), 1);
        FIELD(u32, state, 0x4c) &= ~4u;
        func_ov016_021ffc2c(state);
    } else {
        void *descriptor;

        FIELD(s32, state, 0x47c) = 1;
        func_02095988((u8 *)state + 0x240, 3);
        func_02095928((u8 *)state + 0x2ec);
        func_02095928((u8 *)state + 0x398);
        func_ov000_021fb890(FIELD(void *, state, 0x450), 1);
        FIELD(u32, state, 0x4c) =
            (FIELD(u32, state, 0x4c) & ~2u) | 4u;
        descriptor = (u8 *)FIELD(void *, FIELD(void *, state, 0x444), 0x4c) +
                     FIELD(s32, state, 0x480) * 0x14;
        func_ov016_021fdaa0(FIELD(void *, state, 0x448), descriptor,
                            FIELD(s32, state, 0x480));
    }
}

/*
 * Add delta to detail index +0x480, wrapping below zero to list count +0x54-1
 * and at/above that count to zero, then populate panel +0x448 from the matching
 * 0x14-byte descriptor in list storage +0x4C. Return void. UI state changes only.
 */
extern "C" void func_ov016_021ffe3c(void *state, s32 delta)
{
    void *list = FIELD(void *, state, 0x444);
    s32 index = FIELD(s32, state, 0x480) + delta;

    if (index < 0) {
        index = FIELD(s32, list, 0x54) - 1;
    } else if (index >= FIELD(s32, list, 0x54)) {
        index = 0;
    }
    FIELD(s32, state, 0x480) = index;
    func_ov016_021fdaa0(FIELD(void *, state, 0x448),
                        (u8 *)FIELD(void *, list, 0x4c) + index * 0x14,
                        index);
}
