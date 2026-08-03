#include "tingle/graphics_sprite_renderer.h"

/*
 * Character-code to sprite-font glyph mapping. Direct Latin ranges are mixed
 * with three retail lookup tables for punctuation, symbols, and the first
 * Japanese block; unsupported codes return the shared 0xffff sentinel.
 */

enum {
    GRAPHICS_SPRITE_MISSING_GLYPH = 0xffff,
    GRAPHICS_SPRITE_SYMBOL_COUNT = 0x29
};

#ifdef __cplusplus
extern "C" {
#endif

extern const u16 data_020e6918[];
extern const u16 data_020e6952[];
extern const u16 data_020e6992[];

#ifdef __cplusplus
}
#endif

/*
 * Translate one unsigned character code to the font's 16-bit glyph index.
 * Codes 0x20..0x7d and 0xc0..0xfd map arithmetically; 0xa0..0xbf maps through
 * data_020e6952; 0x152/0x153 map to 0xae/0xaf; codes at or above 0x2c6 are
 * searched in the 41-entry data_020e6992 symbol list and map to 0xb0 onward.
 * The 0x3000..0x301c range maps through data_020e6918, while 0x3041..0x30fc
 * maps contiguously from glyph 0xf1. Return 0xffff for every unsupported code.
 * No state or hardware changes occur.
 */
u16 func_02075ecc(u32 characterCode)
{
    u16 result = GRAPHICS_SPRITE_MISSING_GLYPH;

    if (characterCode >= 0x3000) {
        if (characterCode >= 0x3000 && characterCode <= 0x301c) {
            result = data_020e6918[characterCode - 0x3000];
        } else if (characterCode >= 0x3041 && characterCode <= 0x30fc) {
            result = (u16)(characterCode + (0xf1 - 0x3041));
        }
    } else if (characterCode >= 0x2c6) {
        s32 index;

        for (index = 0; index < GRAPHICS_SPRITE_SYMBOL_COUNT; index++) {
            if (characterCode == data_020e6992[index]) {
                result = (u16)(index + 0xb0);
                break;
            }
        }
    } else if (characterCode < 0x7e) {
        if (characterCode >= 0x20) {
            result = (u16)(characterCode - 0x20);
        }
    } else if (characterCode >= 0xa0 && characterCode <= 0xbf) {
        result = data_020e6952[characterCode - 0xa0];
    } else if (characterCode == 0x152) {
        result = 0xae;
    } else if (characterCode == 0x153) {
        result = 0xaf;
    } else if (characterCode >= 0xc0 && characterCode <= 0xfd) {
        result = (u16)(characterCode - 0x50);
    }
    return result;
}
