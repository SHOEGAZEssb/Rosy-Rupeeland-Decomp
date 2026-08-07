#include "tingle/types.h"

/* Overlay 16 panel indicator animation update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020740a4(void *);
extern void func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * When controller +0xF8 reaches event 2, toggle each visible slot's indicator
 * between sprite arrays +0xA4 and +0xBC by flipping hidden bit 2 at sprite +0x24,
 * then restart the controller with duration 0x3C. Slots whose +0x8C sprite is
 * hidden are skipped. Always update owner children +4/+8 and return void. SDK
 * sprite/control state changes; there is no direct hardware access.
 */
extern "C" void func_ov016_021fdf50(void *state)
{
    s32 i;

    if (func_02091c7c((u8 *)state + 0xf8, 2) != 0) {
        for (i = 0; i < 6; i++) {
            void *baseSprite = FIELD(void *, state, 0x8c + i * 4);
            void *first;
            void *second;

            if ((FIELD(u16, baseSprite, 0x24) & 4) != 0) {
                continue;
            }
            first = FIELD(void *, state, 0xa4 + i * 4);
            second = FIELD(void *, state, 0xbc + i * 4);
            if ((FIELD(u16, first, 0x24) & 4) != 0) {
                FIELD(u16, first, 0x24) &= (u16)~4;
                FIELD(u16, second, 0x24) |= 4;
            } else {
                FIELD(u16, first, 0x24) |= 4;
                FIELD(u16, second, 0x24) &= (u16)~4;
            }
        }
        func_02091b98((u8 *)state + 0xf8, 0x3c);
    }
    func_020740a4(FIELD(void *, state, 4));
    func_020740a4(FIELD(void *, state, 8));
}
