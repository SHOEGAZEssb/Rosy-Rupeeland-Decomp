#include "tingle/types.h"

/*
 * Recovered type-seven debug display. It selects a label for the actor's
 * current descriptor pair and prints either compact or detailed diagnostics.
 */

extern void *gDebugFont;
extern const u8 data_020e16b0[];
extern const void *const data_020e1984[];

#define DECLARE_WORDS(name) extern const u32 name[]
DECLARE_WORDS(data_020e16b8);
DECLARE_WORDS(data_020e16c0);
DECLARE_WORDS(data_020e16c8);
DECLARE_WORDS(data_020e16f0);
DECLARE_WORDS(data_020e16f8);
DECLARE_WORDS(data_020e17a0);
DECLARE_WORDS(data_020e17b0);
DECLARE_WORDS(data_020e17c0);
DECLARE_WORDS(data_020e17d0);
DECLARE_WORDS(data_020e17d8);
DECLARE_WORDS(data_020e17e0);
DECLARE_WORDS(data_020e17f0);
DECLARE_WORDS(data_020e17f8);
DECLARE_WORDS(data_020e1800);
DECLARE_WORDS(data_020e1808);
DECLARE_WORDS(data_020e1818);
DECLARE_WORDS(data_020e1820);
DECLARE_WORDS(data_020e1858);
DECLARE_WORDS(data_020e1880);
DECLARE_WORDS(data_020e1888);
DECLARE_WORDS(data_020e1898);
DECLARE_WORDS(data_020e18d8);
#undef DECLARE_WORDS

#define DECLARE_TEXT(name) extern const char name[]
DECLARE_TEXT(data_020e1d14);
DECLARE_TEXT(data_020e1d24);
DECLARE_TEXT(data_020e1d40);
DECLARE_TEXT(data_020e1d5c);
DECLARE_TEXT(data_020e1d64);
DECLARE_TEXT(data_020e1d6c);
DECLARE_TEXT(data_020e1d74);
DECLARE_TEXT(data_020e1d7c);
DECLARE_TEXT(data_020e1d84);
DECLARE_TEXT(data_020e1d88);
DECLARE_TEXT(data_020e1d90);
DECLARE_TEXT(data_020e1d98);
DECLARE_TEXT(data_020e1d9c);
DECLARE_TEXT(data_020e1da8);
DECLARE_TEXT(data_020e1dac);
DECLARE_TEXT(data_020e1db4);
DECLARE_TEXT(data_020e1dbc);
DECLARE_TEXT(data_020e1dc0);
DECLARE_TEXT(data_020e1dc8);
DECLARE_TEXT(data_020e1dd0);
DECLARE_TEXT(data_020e1ddc);
DECLARE_TEXT(data_020e1de8);
DECLARE_TEXT(data_020e1df0);
DECLARE_TEXT(data_020e1df8);
DECLARE_TEXT(data_020e1e04);
DECLARE_TEXT(data_020e1e0c);
DECLARE_TEXT(data_020e1e18);
DECLARE_TEXT(data_020e1e24);
DECLARE_TEXT(data_020e1e34);
DECLARE_TEXT(data_020e1e48);
#undef DECLARE_TEXT

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02033b38(void *actor, s32 displayArgument);
extern void DebugText_Printf(void *font, s32 column, s32 row,
                             s32 displayArgument, const char *format, ...);
#ifdef __cplusplus
}
#endif

typedef struct Type7DebugDescriptor {
    u16 tableOffset;
    const u32 *descriptor;
    const char *label;
} Type7DebugDescriptor;

/*
 * Input is a type-seven actor plus an opaque value forwarded to every debug
 * text call. First invoke func_02033b38. If actor +0x10 bit 0x01000000 is set,
 * print the three compact strings at rows 8..10. Otherwise compare actor words
 * +0x208/+0x20c, in retail priority order, against 22 recovered descriptor
 * pairs. A match optionally prints its label at row 11; rows 12..15 then show
 * the state-indexed entry from data_020e1984, integerized +0x218/+0x21c, words
 * +0x1fc/+0x200, and global word data_020e16b0+0x2b8.
 *
 * The descriptor test deliberately accepts a matching null first word without
 * requiring the second word to match, mirroring the original control flow.
 * Actor and global state are only read. Debug-font state may change through
 * the printing calls; there are no direct hardware effects and no value is
 * returned.
 */
void Type7Actor_PrintDebugState(void *self, s32 displayArgument)
{
    static const Type7DebugDescriptor descriptors[] = {
        {0x1a8, data_020e1858, data_020e1d5c},
        {0x1d0, data_020e1880, data_020e1d64},
        {0x1d8, data_020e1888, data_020e1d6c},
        {0x1e8, data_020e1898, data_020e1d74},
        {0x228, data_020e18d8, data_020e1d7c},
        {0x170, data_020e1820, data_020e1d84},
        {0x168, data_020e1818, data_020e1d88},
        {0x010, data_020e16c0, data_020e1d90},
        {0x158, data_020e1808, data_020e1d98},
        {0x150, data_020e1800, data_020e1d9c},
        {0x148, data_020e17f8, data_020e1da8},
        {0x140, data_020e17f0, data_020e1dac},
        {0x008, data_020e16b8, data_020e1db4},
        {0x130, data_020e17e0, data_020e1dbc},
        {0x128, data_020e17d8, data_020e1dc0},
        {0x120, data_020e17d0, data_020e1dc8},
        {0x018, data_020e16c8, data_020e1dd0},
        {0x110, data_020e17c0, data_020e1ddc},
        {0x048, data_020e16f8, data_020e1de8},
        {0x100, data_020e17b0, data_020e1df0},
        {0x040, data_020e16f0, data_020e1df8},
        {0x0f0, data_020e17a0, data_020e1e04}
    };
    u8 *actor = (u8 *)self;
    const char *label = 0;
    u32 first;
    u32 second;
    u32 i;

    func_02033b38(actor, displayArgument);
    if ((*(u32 *)(actor + 0x10) & 0x01000000) != 0) {
        DebugText_Printf(gDebugFont, 1, 8, displayArgument, data_020e1d14);
        DebugText_Printf(gDebugFont, 1, 9, displayArgument, data_020e1d24);
        DebugText_Printf(gDebugFont, 1, 10, displayArgument, data_020e1d40);
        return;
    }

    first = *(u32 *)(actor + 0x208);
    second = *(u32 *)(actor + 0x20c);
    for (i = 0; i < sizeof(descriptors) / sizeof(descriptors[0]); ++i) {
        const Type7DebugDescriptor *entry = &descriptors[i];
        if (first == *(const u32 *)(data_020e16b0 + entry->tableOffset)
            && (second == entry->descriptor[1] || first == 0)) {
            label = entry->label;
            break;
        }
    }
    if (label != 0)
        DebugText_Printf(gDebugFont, 1, 11, displayArgument,
                         data_020e1e0c, label);
    DebugText_Printf(gDebugFont, 1, 12, displayArgument, data_020e1e18,
                     data_020e1984[*(s16 *)(actor + 0xd6)]);
    DebugText_Printf(gDebugFont, 1, 13, displayArgument, data_020e1e24,
                     *(s32 *)(actor + 0x218) >> 12,
                     *(s32 *)(actor + 0x21c) >> 12);
    DebugText_Printf(gDebugFont, 1, 14, displayArgument, data_020e1e34,
                     *(u32 *)(actor + 0x1fc), *(u32 *)(actor + 0x200));
    DebugText_Printf(gDebugFont, 1, 15, displayArgument, data_020e1e48,
                     *(u32 *)(data_020e16b0 + 0x2b8));
}
