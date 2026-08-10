#include "tingle/types.h"

/* Overlay 28 selection positioning, chosen-entry application, and first state. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay028Row {
    const void *descriptor;
    void *sprite;
    s16 x;
    s16 y;
} Overlay028Row;

extern void *data_020f4e14[];
extern const s32 data_ov028_021ff208[];
extern const s32 data_ov028_021ff238[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void func_020755bc(void *);
extern s32 func_020ae024(s32, s32);
extern void func_020948e4(void *, s32, s32);
extern void func_02094bbc(void *, s32, s32, s32);
extern void func_020954e0(void *);
extern void func_020954f4(void *);
extern void func_ov028_021fd468(void *);
extern void func_ov028_021fdad8(void *, s32, s32);
extern void func_ov028_021fdf94(void *, const void *);
extern void func_ov028_021fe438(void *);
extern void func_ov028_021fe558(void *, s32);
extern void func_ov028_021fe6bc(void *);
#ifdef __cplusplus
}
#endif

/*
 * Stores signed-16 `duration` at child +0x7C and clears elapsed +0x80. Returns
 * void; only child animation state changes.
 */
extern "C" void func_ov028_021fe540(void *child, s32 duration)
{
    FIELD(s32, child, 0x7c) = (s16)duration;
    FIELD(s32, child, 0x80) = 0;
}

/*
 * Applies list row `index` to scene child +0x260. A nonnull descriptor supplies
 * fixed-point target X=(u16+0x12-256)<<12 and Y=(u16+0x14-192-s16+0x16)<<12;
 * the child is reset, moved over mode 2, and timed for eight ticks. When the
 * imported sprite +0x90 exists, the angle from reference coordinates at
 * 0x021FF208 +0x30/+0x34 is quantized, clamped to 1..5, inverted from 15, and
 * installed as its selector when changed. A null descriptor restores default
 * coordinates 0x021FF238, resets the child, and selects imported frame 12.
 * Returns void; child/imported-sprite SDK and scene target state change.
 */
extern "C" void func_ov028_021fe558(void *state, s32 index)
{
    Overlay028Row *rows = FIELD(Overlay028Row *,
                                FIELD(void *, state, 0x220), 0x38);
    const void *descriptor = rows[index].descriptor;
    void *child = FIELD(void *, state, 0x260);
    if (descriptor != 0) {
        FIELD(s32, state, 0x274) =
            ((s32)FIELD(u16, descriptor, 0x12) - 0x100) << 12;
        FIELD(s32, state, 0x278) =
            ((s32)FIELD(u16, descriptor, 0x14) - 0xc0 -
             FIELD(s16, descriptor, 0x16)) << 12;
        func_020954e0(child);
        func_020948e4((u8 *)child + 0xc, 2, FIELD(s32, state, 0x274));
        func_020948e4((u8 *)child + 0x1c, 2, FIELD(s32, state, 0x278));
        func_ov028_021fe540(child, 8);
        void *sprite = FIELD(void *, state, 0x90);
        if (sprite != 0) {
            s32 dx = FIELD(s32, state, 0x274) - data_ov028_021ff208[12];
            s32 dy = FIELD(s32, state, 0x278) - data_ov028_021ff208[13];
            s32 angle = func_020ae024(dx >> 12, dy >> 12) - 0x1000;
            s32 direction = (angle + ((u32)(angle >> 12) >> 19)) >> 13;
            if (direction < 1)
                direction = 1;
            if (direction > 5)
                direction = 5;
            s32 selector = 15 - direction;
            if (selector != FIELD(u8, sprite, 0x38))
                GraphicsSpriteState_SetAnimationIndex(sprite, selector);
        }
    } else {
        func_ov028_021fdf94((u8 *)state + 0x274, data_ov028_021ff238);
        func_020954f4(child);
        func_02094bbc(child, FIELD(s32, state, 0x274),
                      FIELD(s32, state, 0x278), 0);
        void *sprite = FIELD(void *, state, 0x90);
        if (sprite != 0 && FIELD(u8, sprite, 0x38) != 0xc)
            GraphicsSpriteState_SetAnimationIndex(sprite, 0xc);
    }
}

/*
 * Shows cursor sprite +0x8C, placing it at X=0x84 and Y=0x1E plus 24 times
 * (selected +0x14 minus first-visible +0x0C), then applies that selected row.
 * Returns void; cursor and selected child/imported-sprite state change.
 */
extern "C" void func_ov028_021fe6bc(void *state)
{
    void *cursor = FIELD(void *, state, 0x8c);
    FIELD(u16, cursor, 0x24) &= (u16)~4;
    void *controller = FIELD(void *, FIELD(void *, state, 0x220), 0x44);
    s32 selected = FIELD(s32, controller, 0x14);
    FIELD(u16, cursor, 0x2c) = 0x84;
    FIELD(u16, cursor, 0x2e) =
        (u16)(0x1e + (selected - FIELD(s32, controller, 0xc)) * 0x18);
    func_ov028_021fe558(state, selected);
}

/*
 * Initial scene state: while field +4 is zero, commits the primary font,
 * positions/applies the selection, renders list labels, installs callback pair
 * 0x021FF208 at +0x24/+0x28, and sets low state bit 1. It always runs the common
 * scene update, returns zero, and changes graphics/UI state.
 */
extern "C" s32 func_ov028_021fe714(void *state)
{
    if (FIELD(s32, state, 4) == 0) {
        func_020755bc(data_020f4e14[0]);
        func_ov028_021fe6bc(state);
        func_ov028_021fd468(FIELD(void *, state, 0x220));
        func_ov028_021fdad8(state,
                            data_ov028_021ff208[0], data_ov028_021ff208[1]);
        FIELD(u32, state, 0x20) = (FIELD(u32, state, 0x20) & ~1u) | 1;
    }
    func_ov028_021fe438(state);
    return 0;
}
