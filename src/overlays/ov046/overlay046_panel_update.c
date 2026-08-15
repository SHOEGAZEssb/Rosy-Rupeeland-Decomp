#include "tingle/types.h"

/* Overlay 46 live selection-panel update recovered at 0x0220c4a0. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_021052fc[];
extern "C" void *gGameWork;
extern "C" const u8 data_020d780c[];
extern "C" const u8 data_020d7838[];
extern "C" u8 data_ov046_0220cd14[];
extern "C" u8 data_ov046_0220cd18[];
extern "C" u8 data_ov046_0220cd1c[];
extern "C" u8 data_ov046_0220ce08[];
extern "C" u8 data_ov046_0220ce0c[];
extern "C" void *func_0200eb0c(void *state);
extern "C" s32 func_020befec(s32 numerator, s32 denominator);

/*
 * Update `panel` for the current game selection and progress state. It hides
 * the header initially, reads current counters/flags from GameWork, chooses a
 * matching entry among eleven 0x34-byte records, positions and reveals the
 * header as appropriate, then scans the entry's grid or coordinate list to
 * position it. The returned selection is consumed by the caller's indexed
 * controller; the special free-layout match returns the retail value 0x30.
 * The panel owns the sprite state, and no allocation or direct MMIO occurs.
 */
extern "C" s32 func_ov046_0220c4a0(void *panel)
{
    u8 *header = (u8 *)FIELD(void *, panel, 0x38);
    u8 *runtime = *(u8 **)data_021052fc;
    s32 current;
    s32 selection;
    s32 selectorOffset;
    s32 category;
    s32 variantX;
    s32 variantY;
    u8 *actor;
    const u8 *record;
    const u8 *coordinates;
    s32 baseX;
    s32 baseY;

    FIELD(u16, header, 0x24) |= 4;
    current = FIELD(s32, func_0200eb0c(runtime + 0x24), 0);
    selection = FIELD(s8, func_0200eb0c(runtime + 0x24), 0x4d);
    actor = (u8 *)FIELD(void *, runtime, 0x2ea4);

    if (selection == 0x63) {
        s32 wanted = FIELD(s16, gGameWork, 0x1e0);
        s32 i;

        for (i = 0; i < 11; ++i) {
            coordinates = FIELD(const u8 *, data_020d780c, i * 0x34 + 0x30);
            while (FIELD(u16, coordinates, 0) != 0) {
                if (FIELD(u16, coordinates, 0) == wanted) {
                    if (FIELD(s32, panel, 0xe0 + i * 4) == 2)
                        FIELD(u16, header, 0x24) &= (u16)~4;
                    selectorOffset = i * 0x14;
                    category = FIELD(s32, data_ov046_0220cd14, selectorOffset);
                    variantX = FIELD(s32, data_ov046_0220cd18, selectorOffset);
                    variantY = FIELD(s32, data_ov046_0220cd1c, selectorOffset);
                    baseX = FIELD(s32, data_ov046_0220ce08, category * 0x28);
                    baseY = FIELD(s32, data_ov046_0220ce0c, category * 0x28);
                    FIELD(s16, header, 0x2c) = (s16)(
                        FIELD(s16, coordinates, 2) + baseX + variantX * 0x40);
                    FIELD(s16, header, 0x2e) = (s16)(
                        FIELD(s16, coordinates, 4) + baseY + variantY * 0x30);
                    return 0x30;
                }
                coordinates += 8;
            }
        }
        return 0;
    }

    if (selection < 0)
        return 0;

    record = data_020d780c + selection * 0x34;
    selectorOffset = selection * 0x14;
    category = FIELD(s32, data_ov046_0220cd14, selectorOffset);
    variantX = FIELD(s32, data_ov046_0220cd18, selectorOffset);
    variantY = FIELD(s32, data_ov046_0220cd1c, selectorOffset);
    baseX = FIELD(s32, data_ov046_0220ce08, category * 0x28);
    baseY = FIELD(s32, data_ov046_0220ce0c, category * 0x28);

    {
        s32 rows = FIELD(u16, record, 6);
        s32 columns = FIELD(u16, record, 4);
        s32 row;
        s32 column;

        for (row = 0; row < rows; ++row) {
            for (column = 0; column < columns; ++column) {
                if (FIELD(u8, record, 8 + row * columns + column) == current) {
                    s32 actorX = FIELD(s32, actor, 0x1c) >> 12;
                    s32 actorY = FIELD(s32, actor, 0x20) >> 12;

                    if (FIELD(s32, panel, 0xe0 + selection * 4) == 2)
                        FIELD(u16, header, 0x24) &= (u16)~4;
                    FIELD(s16, header, 0x2c) = (s16)(
                        actorX / 16 + column + baseX + variantX * 0x40);
                    FIELD(s16, header, 0x2e) = (s16)(
                        func_020befec(actorY * 0x30, 0x300) +
                        (row + variantY) * 0x30 + baseY);
                    return selection;
                }
            }
        }
    }

    coordinates = FIELD(const u8 *, data_020d7838, selection * 0x34);
    while (FIELD(u16, coordinates, 0) != 0) {
        if (FIELD(u16, coordinates, 0) == current) {
            if (FIELD(s32, panel, 0xe0 + selection * 4) == 2)
                FIELD(u16, header, 0x24) &= (u16)~4;
            FIELD(s16, header, 0x2c) = (s16)(
                FIELD(s16, coordinates, 2) + baseX + variantX * 0x40);
            FIELD(s16, header, 0x2e) = (s16)(
                FIELD(s16, coordinates, 4) + baseY + variantY * 0x30);
            return selection;
        }
        coordinates += 8;
    }
    return 0;
}

#undef FIELD
