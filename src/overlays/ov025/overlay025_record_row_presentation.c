#include "tingle/types.h"

/* Overlay 25 selected and deselected record-row sprite presentation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s64 func_020befec(s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
#ifdef __cplusplus
}
#endif

/* Retail duplicates this digit-mode loop in both row presentation functions. */
#define SET_DIGIT_MODES(widget, base, separator)                               \
    do {                                                                       \
        s32 digit_value = FIELD(s32, widget, 0x7c);                            \
        if (digit_value < 10) {                                                \
            void *digit_sprite = FIELD(void *, widget, 0x14);                 \
            if (digit_sprite != 0)                                             \
                GraphicsSpriteState_SetAnimationIndex(                         \
                    digit_sprite,                                              \
                    (u8)((s32)(func_020befec(                                  \
                                   FIELD(u8, digit_sprite, 0x38), 10) >> 32) + \
                         base));                                                \
            digit_sprite = FIELD(void *, widget, 0x18);                       \
            if (digit_sprite != 0)                                             \
                GraphicsSpriteState_SetAnimationIndex(                         \
                    digit_sprite, separator + 0x12);                           \
            digit_sprite = FIELD(void *, widget, 0x1c);                       \
            if (digit_sprite != 0)                                             \
                GraphicsSpriteState_SetAnimationIndex(digit_sprite, base);     \
        } else {                                                               \
            for (s32 digit_index = 0; digit_index < 6; ++digit_index) {        \
                void *digit_sprite =                                           \
                    FIELD(void *, (u32)widget + (digit_index << 2), 0x14);     \
                if (digit_sprite == 0) continue;                               \
                if (digit_index == 2)                                          \
                    GraphicsSpriteState_SetAnimationIndex(                     \
                        digit_sprite, separator);                              \
                else                                                           \
                    GraphicsSpriteState_SetAnimationIndex(                     \
                        digit_sprite,                                          \
                        (u8)((s32)(func_020befec(                               \
                                           FIELD(u8, digit_sprite, 0x38),      \
                                           10) >> 32) +                        \
                             base));                                           \
            }                                                                  \
        }                                                                      \
    } while (0)

/*
 * Select the row, move its sprite owner to `y + 0x58`, select the active
 * main/digit/value animations, and select badge animation 2*index+4. Inactive
 * rows use main animation zero. Sprite positions and animations change.
 */
extern "C" void func_ov025_021fd9e4(void *widget, s32 y)
{
    FIELD(s32, widget, 0x88) = 1;
    FIELD(s32, FIELD(void *, widget, 0xc), 0x18) = y + 0x58;
    if (FIELD(s32, widget, 0x74)) {
        if (FIELD(s32, widget, 0x80))
            GraphicsSpriteState_SetAnimationIndex(
                FIELD(void *, widget, 0x10), 2);
        else
            GraphicsSpriteState_SetAnimationIndex(
                FIELD(void *, widget, 0x10), 0x2e);
        SET_DIGIT_MODES(widget, 10, 30);
        GraphicsSpriteState_SetAnimationIndex(
            FIELD(void *, widget, 0x2c),
            (u8)(FIELD(s32, widget, 0x78) * 2 + 4));
    } else {
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x10), 0);
    }
}

/*
 * Deselect the row, move its sprite owner to `y + 0x58`, select the alternate
 * main/digit/value animations, and select badge animation 2*index+5. Inactive
 * rows use main animation one. Sprite positions and animations change.
 */
extern "C" void func_ov025_021fdb18(void *widget, s32 y)
{
    FIELD(s32, widget, 0x88) = 0;
    FIELD(s32, FIELD(void *, widget, 0xc), 0x18) = y + 0x58;
    if (FIELD(s32, widget, 0x74)) {
        if (FIELD(s32, widget, 0x80))
            GraphicsSpriteState_SetAnimationIndex(
                FIELD(void *, widget, 0x10), 3);
        else
            GraphicsSpriteState_SetAnimationIndex(
                FIELD(void *, widget, 0x10), 0x2f);
        SET_DIGIT_MODES(widget, 20, 31);
        GraphicsSpriteState_SetAnimationIndex(
            FIELD(void *, widget, 0x2c),
            (u8)(FIELD(s32, widget, 0x78) * 2 + 5));
    } else {
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, widget, 0x10), 1);
    }
}
