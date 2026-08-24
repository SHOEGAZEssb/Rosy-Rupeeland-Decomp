#include "tingle/types.h"

/* Overlay 34 five-stage introductory animation and timer completion helper. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 gFx32CosSinTable[];
extern const s32 data_ov034_021fe740[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_ov034_021fe2c4(void *object);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern void func_ov034_021fda1c(void *object, s32 value);
extern s32 Presentation_InterpolateScalar(void *object, s32 mode, s32 start, s32 end);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern void func_ov034_021fdac0(void *scene, s32 firstWord,
                               s32 secondWord, s32 thirdWord);
extern void func_ov034_021fdf98(void *scene);
#ifdef __cplusplus
}
#endif

/*
 * Runs the five-stage intro at +0x1B8. State 0 waits for item zero's timer then
 * starts a 60-frame delay. State 1 waits again; during the delay it derives a
 * sine value from item zero and applies it to every item's +0x4C field, then on
 * completion configures item +0x6C fields with mode 3/value 0x266 and assigns
 * staggered 16+2*i timers. State 2 fades every item's packed grayscale field
 * +0xA6 from an interpolated/clamped 0..31 value; when the last item completes,
 * it configures owner and item transforms/timers and advances. State 3 waits for
 * the owner, starts its final transform/timer, and advances. State 4 installs
 * callback 0x021FE740 with third word 2 once the owner completes. Every call
 * ticks all virtual objects and returns 0. Render/animation/callback state
 * changes; no direct MMIO occurs.
 */
extern "C" s32 func_ov034_021fdfe0(void *scene)
{
    s32 state = FIELD(s32, scene, 0x1b8);
    s32 count = FIELD(s32, scene, 0x1b0);
    void *owner = FIELD(void *, scene, 0);

    if (state == 0) {
        void *item = FIELD(void *, scene, 8);
        if (func_ov034_021fe2c4(item)) {
            FIELD(s32, item, 0x7c) = 0x3c;
            FIELD(s32, item, 0x80) = 0;
            FIELD(s32, scene, 0x1b8) = 1;
        }
    } else if (state == 1) {
        void *item0 = FIELD(void *, scene, 8);
        if (func_ov034_021fe2c4(item0)) {
            for (s32 i = 0; i < count; ++i) {
                void *item = FIELD(void *, scene, 8 + i * 4);
                PresentationScalar_TransitionTo((u8 *)item + 0x6c, 3, 0x266);
                func_ov034_021fda1c(item, 0x10 + i * 2);
            }
            FIELD(s32, scene, 0x1b8) = 2;
        } else {
            u16 angle = (u16)Presentation_InterpolateScalar(item0, 1, 0, 0x20000);
            s32 wave = gFx32CosSinTable[(angle >> 4) * 2] * 2;
            for (s32 i = 0; i < count; ++i)
                PresentationScalar_SetImmediate((u8 *)FIELD(void *, scene, 8 + i * 4) + 0x4c,
                              wave);
        }
    } else if (state == 2) {
        void *last = FIELD(void *, scene, 8 + (count - 1) * 4);
        if (func_ov034_021fe2c4(last)) {
            PresentationScalar_TransitionTo((u8 *)owner + 0x6c, 2, 0x1800);
            FIELD(s32, owner, 0x7c) = 0x10;
            FIELD(s32, owner, 0x80) = 0;
            for (s32 i = 0; i < count; ++i) {
                void *item = FIELD(void *, scene, 8 + i * 4);
                PresentationScalar_TransitionTo((u8 *)item + 0x3c, 1, -0x4000);
                PresentationScalar_TransitionTo((u8 *)item + 0x6c, 1, 0);
                FIELD(s32, item, 0x7c) = 0xc;
                FIELD(s32, item, 0x80) = 0;
            }
            FIELD(s32, scene, 0x1b8) = 3;
        } else {
            for (s32 i = 0; i < count; ++i) {
                void *item = FIELD(void *, scene, 8 + i * 4);
                s32 value = Presentation_InterpolateScalar(item, 3, 0, 0x1f);
                if (value < 0) value = 0;
                if (value > 0x1f) value = 0x1f;
                FIELD(u16, item, 0xa6) =
                    (u16)(value | (value << 5) | (value << 10));
            }
        }
    } else if (state == 3) {
        if (func_ov034_021fe2c4(owner)) {
            PresentationScalar_TransitionTo((u8 *)owner + 0x6c, 2, 0x1000);
            FIELD(s32, owner, 0x7c) = 8;
            FIELD(s32, owner, 0x80) = 0;
            FIELD(s32, scene, 0x1b8) = 4;
        }
    } else if (state == 4 && func_ov034_021fe2c4(owner)) {
        func_ov034_021fdac0(scene, data_ov034_021fe740[0],
                           data_ov034_021fe740[1], 2);
    }

    func_ov034_021fdf98(scene);
    return 0;
}

/*
 * Returns 1 when object's elapsed counter +0x80 is at least duration +0x7C,
 * otherwise 0. It changes no state and performs no SDK or hardware operation.
 */
extern "C" s32 func_ov034_021fe2c4(void *object)
{
    return FIELD(s32, object, 0x80) >= FIELD(s32, object, 0x7c);
}
