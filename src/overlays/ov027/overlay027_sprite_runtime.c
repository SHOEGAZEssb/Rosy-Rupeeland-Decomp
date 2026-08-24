#include "tingle/types.h"

/* Overlay 27 descriptor-backed sprite animation state machine and timer helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 gFx32CosSinTable[];
extern const u8 data_ov027_021fe8ac[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsAnimationInstance_SetAnimation(void *, u8);
extern void Presentation_UpdateScript(void *);
extern s32 Presentation_InterpolateScalar(void *, s32, s32, s32);
extern void Presentation_SetScript(void *, const void *, s32);
extern s32 Presentation_IsScriptComplete(void *);
extern void PresentationScalar_SetImmediate(void *, s32);
extern s32 func_020ae024(s32, s32);
#ifdef __cplusplus
}
#endif

/* Sets signed-16-bit duration `ticks` at +0x7C and clears elapsed +0x80. */
extern "C" void func_ov027_021fd3d8(void *object, s32 ticks)
{
    FIELD(s32, object, 0x7c) = (s16)ticks;
    FIELD(s32, object, 0x80) = 0;
}

/* Returns one when elapsed +0x80 has reached duration +0x7C, else zero. */
extern "C" s32 func_ov027_021fd3f0(void *object)
{
    return FIELD(s32, object, 0x80) >= FIELD(s32, object, 0x7c);
}

/*
 * Advances animation state +0xA8 through six phases. It waits for object flag
 * +0x98 bit 0, runs timers based on index*6, 20, and 30 ticks, switches the
 * sprite at +0x9C to descriptor byte +6 and later +12, and coordinates bits
 * 0/1 of sprite +0x50. Field +0xAC is raised at synchronization points; final
 * state sets object +0x98 bit 1. The common object update always runs and the
 * function always returns zero.
 */
extern "C" s32 func_ov027_021fd258(void *object)
{
    void *sprite = FIELD(void *, object, 0x9c);
    const s32 *descriptor = FIELD(const s32 *, object, 0xa0);
    switch (FIELD(s32, object, 0xa8)) {
    case 0:
        if (FIELD(u16, object, 0x98) & 1) {
            func_ov027_021fd3d8(object, FIELD(s32, object, 0xa4));
            ++FIELD(s32, object, 0xa8);
        }
        break;
    case 1:
        if (func_ov027_021fd3f0(object)) {
            FIELD(s32, object, 0xac) = 1;
            FIELD(s32, object, 0x7c) = 0x14;
            FIELD(s32, object, 0x80) = 0;
            ++FIELD(s32, object, 0xa8);
        }
        break;
    case 2:
        if (func_ov027_021fd3f0(object)) {
            GraphicsAnimationInstance_SetAnimation(sprite, (u8)(descriptor[0] + 6));
            FIELD(u16, sprite, 0x50) &= (u16)~2;
            ++FIELD(s32, object, 0xa8);
        }
        break;
    case 3:
        if (FIELD(u16, sprite, 0x50) & 1) {
            FIELD(s32, object, 0xac) = 1;
            GraphicsAnimationInstance_SetAnimation(sprite, (u8)(descriptor[0] + 12));
            FIELD(u16, sprite, 0x50) |= 2;
            FIELD(u16, sprite, 0x50) &= (u16)~1;
            ++FIELD(s32, object, 0xa8);
            FIELD(s32, object, 0x7c) = 0x1e;
            FIELD(s32, object, 0x80) = 0;
        }
        break;
    case 4:
        if (func_ov027_021fd3f0(object)) {
            FIELD(u16, object, 0x98) |= 2;
            FIELD(s32, object, 0xac) = 1;
            ++FIELD(s32, object, 0xa8);
        }
        break;
    }
    Presentation_UpdateScript(object);
    return 0;
}

/*
 * Moves `object` along a rotated descriptor-relative offset. Controller +0xA4
 * selects a 16-entry trig-table angle; a second interpolation between `from`
 * and `to` scales the rotated +0xB0/+0xB4 delta. The result is added to
 * descriptor words 1/2 and written through transform controls +0x0C/+0x1C.
 * For scale below 32 the sprite at +0x9C uses frame 4; otherwise its frame is
 * derived from the delta angle. Frame changes are skipped when unchanged.
 * Returns void. The fixed-point rotation interpretation is inferred from the
 * shared sine/cosine table and arithmetic shifts.
 */
extern "C" void func_ov027_021fd4dc(void *object, s32 from, s32 to)
{
    s32 angle = (u16)Presentation_InterpolateScalar(object, 1, 0,
                                    FIELD(s32, object, 0xa4));
    angle >>= 4;
    s32 trig0 = gFx32CosSinTable[angle * 2];
    s32 trig1 = gFx32CosSinTable[angle * 2 + 1];
    s32 scale = Presentation_InterpolateScalar(object, 1, from, to);
    s32 dx = FIELD(s32, object, 0xb0);
    s32 dy = FIELD(s32, object, 0xb4);
    s32 rotated_x = (trig0 * dy) / 0x1000 + (trig1 * dx) / 0x1000;
    s32 rotated_y = (trig1 * dy) / 0x1000 - (trig0 * dx) / 0x1000;
    s32 result_x = (scale * rotated_x) / 0x100;
    s32 result_y = (scale * rotated_y) / 0x100;
    const s32 *descriptor = FIELD(const s32 *, object, 0xa0);
    PresentationScalar_SetImmediate((u8 *)object + 0xc, descriptor[1] + result_x);
    PresentationScalar_SetImmediate((u8 *)object + 0x1c, descriptor[2] + result_y);

    void *sprite = FIELD(void *, object, 0x9c);
    s32 frame = scale < 0x20 ? 4 : (u32)func_020ae024(result_x, result_y) >> 13;
    if (FIELD(u8, sprite, 0x54) != (u8)frame)
        GraphicsAnimationInstance_SetAnimation(sprite, (u8)frame);
}

/*
 * Drives four runtime states at +0xB8. State 0 moves from scale 0x100 to zero
 * until the constructor's timer expires, selects sprite frame 12, and starts
 * control block 0x021FE8AC. State 1 waits for that control, restores frame 0,
 * and starts 120 ticks. State 2 moves back from zero to 0x100 until the timer
 * expires. State 3 returns one. Earlier states run the common object update
 * and return zero.
 */
extern "C" s32 func_ov027_021fd624(void *object)
{
    switch (FIELD(s32, object, 0xb8)) {
    case 0:
        if (func_ov027_021fd3f0(object)) {
            GraphicsAnimationInstance_SetAnimation(FIELD(void *, object, 0x9c), 0xc);
            Presentation_SetScript(object, data_ov027_021fe8ac, 0);
            ++FIELD(s32, object, 0xb8);
        } else {
            func_ov027_021fd4dc(object, 0x100, 0);
        }
        break;
    case 1:
        if (Presentation_IsScriptComplete(object)) {
            GraphicsAnimationInstance_SetAnimation(FIELD(void *, object, 0x9c), 0);
            FIELD(s32, object, 0x7c) = 0x78;
            FIELD(s32, object, 0x80) = 0;
            ++FIELD(s32, object, 0xb8);
        }
        break;
    case 2:
        if (func_ov027_021fd3f0(object)) {
            ++FIELD(s32, object, 0xb8);
        } else {
            func_ov027_021fd4dc(object, 0, 0x100);
        }
        break;
    case 3:
        return 1;
    }
    Presentation_UpdateScript(object);
    return 0;
}
