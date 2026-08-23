#include "tingle/graphics_3d_presentation.h"
#include "tingle/types.h"

/*
 * Overlay 40 motion-state updates. This recovered routine advances a vertical
 * offset, applies a small oscillation, and synchronizes an optional renderer.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 numerator, s32 denominator);
extern void func_020afce8(volatile void *reg, s32 layer, s32 value);
extern void func_02070958(void *object, s32 x, s32 y, s32 z);
extern void func_02074dc8(void *context, void *renderer);
extern void *data_020f4e14;
extern s32 func_020adc40(s32 squaredDistance);
extern void Sound_Play(void *sound, s32 parameter, s32 id);
extern const s32 data_ov040_0220386c[];
extern const s32 data_ov040_02207d2c[];
extern void *gSoundContext;
extern s32 func_020adc90(s32 component, s32 magnitude);
extern void func_ov040_021fd724(void *record);
extern void func_ov040_021fd740(void *record);
extern void __register_global_object(void *object, void (*destructor)(void *),
                                     void *chain);
extern u32 data_ov040_02207dc0[];
extern u8 data_ov040_02207e10[];
extern u8 data_ov040_02207dd4[];
#ifdef __cplusplus
}

/*
 * Update the scene's camera-like fixed-point motion. Normalize input +0x98/
 * +0x9C, lazily construct and register the overlay-global 12-byte record,
 * subtract one sixteenth of input delta from +0x8BC/+0x8C0, apply vertical
 * acceleration 0x385, and clamp the combined +0x88C/+0x890 vector to magnitude
 * 0x2F000. Derive smoothed deltas from +0x1F8/+0x1FC using multiplier 0xFD7,
 * copy the new position back, and force Z +0x200 to 0xA000. Returns no value;
 * scene motion and one lazily initialized overlay-global record change.
 */
extern "C" void func_ov040_022009e8(void *scene)
{
    s32 inputX = FIELD(s32, scene, 0x98);
    s32 inputY = FIELD(s32, scene, 0x9c);
    s32 magnitude = func_020adc40((s32)(((s64)inputX * inputX + 0x800) >> 12) +
                                      (s32)(((s64)inputY * inputY + 0x800) >> 12));
    (void)func_020adc90(inputX, magnitude);
    (void)func_020adc90(inputY, magnitude);

    if ((data_ov040_02207dc0[0] & 1) == 0) {
        func_ov040_021fd724(data_ov040_02207e10);
        __register_global_object(data_ov040_02207e10, func_ov040_021fd740,
                                 data_ov040_02207dd4);
        data_ov040_02207dc0[0] |= 1;
    }
    FIELD(s32, scene, 0x8bc) -= (inputX - (s32)data_ov040_02207dc0[0x15]) >> 4;
    FIELD(s32, scene, 0x8c0) -= (inputY - (s32)data_ov040_02207dc0[0x16]) >> 4;
    data_ov040_02207dc0[0x15] = (u32)inputX;
    data_ov040_02207dc0[0x16] = (u32)inputY;
    FIELD(s32, scene, 0x8c0) += 0x385;

    s32 x = FIELD(s32, scene, 0x88c) + FIELD(s32, scene, 0x8bc);
    s32 y = FIELD(s32, scene, 0x890) + FIELD(s32, scene, 0x8c0);
    magnitude = func_020adc40((s32)(((s64)x * x + 0x800) >> 12) +
                                (s32)(((s64)y * y + 0x800) >> 12));
    s32 normalizedX = func_020adc90(x, magnitude);
    s32 normalizedY = func_020adc90(y, magnitude);
    if (magnitude > 0x2efff) {
        x = normalizedX * 0x2f;
        y = normalizedY * 0x2f;
    }
    FIELD(s32, scene, 0x88c) = x;
    FIELD(s32, scene, 0x890) = y;
    FIELD(s32, scene, 0x8bc) =
        (s32)(((s64)0xfd7 * (x - FIELD(s32, scene, 0x1f8)) + 0x800) >> 12);
    FIELD(s32, scene, 0x8c0) =
        (s32)(((s64)0xfd7 * (y - FIELD(s32, scene, 0x1fc)) + 0x800) >> 12);
    FIELD(s32, scene, 0x1f8) = x;
    FIELD(s32, scene, 0x1fc) = y;
    FIELD(s32, scene, 0x200) = 0xa000;
}

/*
 * Scan the 80 slots from high to low for an active state in 1..6 whose +0x6E4
 * timer is positive and whose fixed-point position is within its state-specific
 * radius of target. On a hit, add the state-specific reward to the owner at
 * +0/+0x48, clear the slot state, optionally stop its indexed effect, spawn a
 * 28x28 marker near the slot, play sound 15, and return one. Returns zero when
 * no slot qualifies. The squared-distance calculation uses 64-bit products,
 * 12-bit fixed-point rounding, and the SDK square-root helper.
 */
extern "C" s32 func_ov040_02203678(void *slots, const void *target)
{
    for (s32 index = 0x4f; index >= 0; index--) {
        s32 state = FIELD(s32, slots, 0x824 + index * 4);
        if (state == 0 || state >= 7 ||
            FIELD(s32, slots, 0x6e4 + index * 4) <= 0)
            continue;

        s32 x = FIELD(s32, slots, 0xaa8 + index * 0x10) -
                FIELD(s32, target, 4);
        s32 y = FIELD(s32, slots, 0xaac + index * 0x10) -
                (FIELD(s32, target, 8) - 0xa000);
        s64 xx = (s64)x * x + 0x800;
        s64 yy = (s64)y * y + 0x800;
        s32 distance = func_020adc40((s32)(xx >> 12) + (s32)(yy >> 12));
        if (distance >= data_ov040_0220386c[state - 1]) continue;

        void *owner = FIELD(void *, slots, 0);
        FIELD(s32, owner, 0x48) += data_ov040_02207d2c[state];
        FIELD(s32, slots, 0x824 + index * 4) = 0;
        if (FIELD(s32, slots, 0x964 + index * 4) != 0xff)
            Graphics3dPresentation_RemoveSpriteEffect(
                (Graphics3dPresentation *)FIELD(void *, owner, 0x10),
                FIELD(s32, slots, 0x964 + index * 4));
        s32 handle = Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds(
            (Graphics3dPresentation *)FIELD(void *, owner, 0x10), 0,
            (FIELD(s32, slots, 0xaa8 + index * 0x10) >> 12) - 14,
            (FIELD(s32, slots, 0xaac + index * 0x10) >> 12) - 19,
            28, 28, 2);
        Graphics3dPresentation_SetSpriteEffectVertexDepth(
            (Graphics3dPresentation *)FIELD(void *, owner, 0x10), handle,
            -20);
        Sound_Play(gSoundContext, 0, 15);
        return 1;
    }
    return 0;
}
#endif

/*
 * Advance the scene motion mode at +0xABC. Mode zero targets -6 and resets
 * +0xAB8; mode one counts down +0xAB4 while adding 3 to +0xAB8, then clears
 * renderer flag bit 1; mode two adds 6 to +0xAB8. Move +0xAAC toward +0xAA8
 * in steps of two. When +0xAAC is zero, add a six-step oscillation derived
 * from +0xAB0. If the resulting value changes, write main BG2 vertical scroll
 * through register 0x04000050 and update the optional +0xB10 renderer scale
 * and shared render context. Returns no value. The exact fallback preserves
 * the SDK division helper's secondary-register result used by the original.
 */
extern "C" void func_ov040_02201288(void *scene)
{
    s32 mode = FIELD(s32, scene, 0xabc);
    if (mode == 0) {
        FIELD(s32, scene, 0xaa8) = -6;
        FIELD(s32, scene, 0xab8) = 0;
    } else if (mode == 1) {
        FIELD(s32, scene, 0xaa8) = 0;
        FIELD(s32, scene, 0xab8) += 3;
        if (--FIELD(s32, scene, 0xab4) < 0) {
            FIELD(s32, scene, 0xab8) = 0;
            FIELD(s32, scene, 0xabc) = 0;
            if (FIELD(void *, scene, 0xb10) != 0) {
                void *renderer = FIELD(void *, FIELD(void *, scene, 0xb10), 0x0c);
                FIELD(u16, renderer, 0x24) &= (u16)~2;
            }
        }
    } else if (mode == 2) {
        FIELD(s32, scene, 0xaa8) = 0;
        FIELD(s32, scene, 0xab8) += 6;
    }

    s32 value = 0;
    s32 changed = 0;
    s32 current = FIELD(s32, scene, 0xaac);
    s32 target = FIELD(s32, scene, 0xaa8);
    if (target != current) {
        current += current < target ? 2 : -2;
        FIELD(s32, scene, 0xaac) = current;
        value = current;
        changed = 1;
    }
    if (current == 0) {
        s32 phase = ++FIELD(s32, scene, 0xab0);
        s32 step = func_020befec(phase / 2, 6);
        if (step > 2) step = 6 - step;
        value = step + FIELD(s32, scene, 0xaac);
        changed = 1;
    }
    if (!changed) return;

    func_020afce8((volatile void *)0x04000050, 0x0e, value);
    void *optional = FIELD(void *, scene, 0xb10);
    if (optional != 0) {
        s32 scale = value * 25 + 0x100;
        func_02070958(FIELD(void *, optional, 0x14), scale, scale, scale);
        func_02074dc8(data_020f4e14, FIELD(void *, optional, 0x0c));
    }
}
