#include "tingle/types.h"

/* Overlay 13 record-position helpers for selecting a render object and assigning randomized coordinates. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern s32 TitleRandom_NextBounded(void *, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern s32 func_0209189c(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Select a render object from manager +0x84 and resource +0x78, assign it the
 * low byte returned by TitleRandom_NextBounded(+0x978,4), and write two randomized signed
 * coordinates at +0x2C/+0x2E. Argument two contributes fixed-point fields
 * +0x10/+0x20 divided toward zero by 0x1000; arguments three/four are symmetric
 * random ranges. Finally set halfword bit 0x100 at +0x24. Return void; callees
 * may change graphics and random-generator state. The coordinate role is
 * inferred from the destination fields and shared rendering calls.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay013_RandomizeRecordPosition(void *state, void *record, s32 horizontalRange,
                         s32 verticalRange)
{
    void *target = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x84),
                                 (u8 *)state + 0x78, 1);
    s32 selector = TitleRandom_NextBounded((u8 *)state + 0x978, 4);
    s32 fixed;

    GraphicsSpriteState_SetAnimationIndex(target, selector & 0xff);
    fixed = FIELD(s32, record, 0x20);
    FIELD(s16, target, 0x2e) = (s16)(
        func_0209189c((u8 *)state + 0x978, -verticalRange, verticalRange) +
        fixed / 0x1000);
    fixed = FIELD(s32, record, 0x10);
    FIELD(s16, target, 0x2c) = (s16)(
        func_0209189c((u8 *)state + 0x978, -horizontalRange, horizontalRange) +
        fixed / 0x1000);
    FIELD(u16, target, 0x24) |= 0x100;
}

/*
 * For each record whose +0x98 bit 0 is set, call Overlay013_RandomizeRecordPosition: the seven
 * records at +0x8C use argument two and its signed half, the five records at
 * +0x540 use argument three for both ranges, and the final +0x89C record uses
 * argument four for both. Return void after any graphics/random-state effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay013_RandomizeActiveRecordPositions(void *state, s32 firstRange, s32 secondRange,
                         s32 finalRange)
{
    s32 i;
    s32 half = firstRange / 2;

    for (i = 0; i < 7; ++i) {
        u8 *record = (u8 *)state + 0x8c + i * 0xac;
        if (FIELD(u16, record, 0x98) & 1)
            Overlay013_RandomizeRecordPosition(state, record, firstRange, half);
    }
    for (i = 0; i < 5; ++i) {
        u8 *record = (u8 *)state + 0x540 + i * 0xac;
        if (FIELD(u16, record, 0x98) & 1)
            Overlay013_RandomizeRecordPosition(state, record, secondRange, secondRange);
    }
    if (FIELD(u16, state, 0x934) & 1)
        Overlay013_RandomizeRecordPosition(state, (u8 *)state + 0x89c,
                            finalRange, finalRange);
}
