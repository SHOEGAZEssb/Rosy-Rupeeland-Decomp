#include "tingle/types.h"

/*
 * Overlay 4 main presentation-phase update. This recovered state machine
 * coordinates paired animations, display blending, renderer objects, a timed
 * resource fade, sound playback, and the overlay's affine/context updates.
 */

typedef struct Overlay004MainPhaseState {
    u8 bytes[0x15c];
} Overlay004MainPhaseState;

typedef void (*Overlay004VirtualStep)(void *object);

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern void *data_020f4e14;
extern void *gDebugFont;
extern const s32 data_ov004_021fcd50[2];
extern void func_02091c7c(void *animation, s32 channel);
extern void func_020afce8(volatile void *registers, s32 first, s32 second);
extern void SceneSound_PlayPackedEffect(void *state, s32 soundId);
extern s32 TitleInterpolatedValue_Evaluate(void *animation, s32 first, s32 second, s32 channel);
extern void func_020afca0(volatile void *registers, s32 value);
extern s32 func_02091cf0(void *animation);
extern void TitleInterpolatedValue_Configure(void *animation, s32 mode, s32 value, s32 scale,
                          s32 duration);
extern void SpritePresentation_Show(void *object);
extern void PresentationScalar_TransitionTo(void *object, s32 mode, s32 value);
extern s32 Presentation_InterpolateQuadraticPulse(s32 start, s32 end, s32 duration);
extern void func_02070958(void *resource, s32 red, s32 green, s32 blue);
extern void GraphicsSpriteRenderer_QueueStatePaletteUploads(void *resource, void *context);
extern s32 Sound_IsEffectPlaying(void *context, s32 group, s32 index);
extern void func_ov004_021fb6e4(void *state, s32 first, s32 second);
extern void func_ov004_021fc24c(void *state);
extern void func_ov004_021fbf10(void *state);
#ifdef __cplusplus
}
#endif

/* Invoke the confirmed vtable slot at +0x08 for an otherwise unknown object. */
static void overlay004_step_object(void *object)
{
    void *vtable = FIELD(void *, object, 0x00);
    Overlay004VirtualStep step = FIELD(Overlay004VirtualStep, vtable, 0x08);

    step(object);
}

/* Advance phase_004 and reset the phase timer stored at +0x08. */
static void overlay004_advance_phase(Overlay004MainPhaseState *state)
{
    FIELD(s32, state, 0x004)++;
    FIELD(s32, state, 0x008) = 0;
}

/*
 * Execute one frame of the five-phase sequence and return zero. Phase zero
 * waits for the +0x12C animation value to exceed two thirds of +0x128, enables
 * blend mode 4 with EVA=-16 on both DS engines, sets bit 2 in +0x48/+0x4C,
 * and plays sound 0x7B81. Phase one drives both animations and both blend
 * registers; once complete it clears blending, restarts the animations with
 * confirmed constants, initializes child/embedded motion fields, and marks
 * the +0x60 context active. Phase two steps the child and embedded controller
 * through vtable slot +0x08 and plays sound 0x7B82 on completion. Phase three
 * fades +0x58 from 0x100 to 0x200 for 60 frames and submits the two shared
 * resources to the contexts at +0x60/+0x64, then plays the sound ID at +0x158.
 * After 90 phase-four frames, +0x158 is treated as a packed 9-bit group and
 * 7-bit index; when Sound_IsEffectPlaying reports zero, the coordinate pair at
 * data_ov004_021fcd50 is applied. Every call also refreshes affine hardware
 * and the overlay contexts through the two recovered helpers. Object types and
 * most offset fields remain unidentified; hardware writes above are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov004_021fc57c(Overlay004MainPhaseState *state)
{
    void *animationA = (u8 *)state + 0x114;
    void *animationB = (u8 *)state + 0x130;

    switch (FIELD(s32, state, 0x004)) {
    case 0:
        func_02091c7c(animationA, 0);
        if (FIELD(s32, state, 0x12c) >
            (FIELD(s32, state, 0x128) * 2) / 3) {
            func_020afce8((volatile void *)0x04000050, 4, -16);
            func_020afce8((volatile void *)0x04001050, 4, -16);
            FIELD(u32, state, 0x048) |= 4;
            FIELD(u32, state, 0x04c) |= 4;
            SceneSound_PlayPackedEffect(state, 0x7b81);
            overlay004_advance_phase(state);
        }
        break;

    case 1:
        func_02091c7c(animationA, 0);
        func_02091c7c(animationB, 0);
        func_020afca0((volatile void *)0x04000050,
                      TitleInterpolatedValue_Evaluate(animationB, 4, -16, 0));
        func_020afca0((volatile void *)0x04001050,
                      TitleInterpolatedValue_Evaluate(animationB, 4, -16, 0));
        if (func_02091cf0(animationA) && func_02091cf0(animationB)) {
            void *child = FIELD(void *, state, 0x068);

            *(volatile u16 *)0x04000050 = 0;
            *(volatile u16 *)0x04001050 = 0;
            TitleInterpolatedValue_Configure(animationA, 1, 0x119a, 0x1000, 0x78);
            TitleInterpolatedValue_Configure(animationB, 1, 0x0466, 0x0400, 0x78);
            SpritePresentation_Show(child);
            PresentationScalar_TransitionTo((u8 *)child + 0x1c, 2, 0x68000);
            FIELD(s32, child, 0x7c) = 60;
            FIELD(s32, child, 0x80) = 0;
            FIELD(s32, FIELD(void *, state, 0x060), 0x20) = 1;
            PresentationScalar_TransitionTo((u8 *)state + 0x88, 2, 0x68000);
            FIELD(s32, state, 0x0e8) = 60;
            FIELD(s32, state, 0x0ec) = 0;
            overlay004_advance_phase(state);
        }
        break;

    case 2:
        func_02091c7c(animationA, 0);
        func_02091c7c(animationB, 0);
        overlay004_step_object(FIELD(void *, state, 0x068));
        overlay004_step_object((u8 *)state + 0x6c);
        if (func_02091cf0(animationA) && func_02091cf0(animationB)) {
            SceneSound_PlayPackedEffect(state, 0x7b82);
            overlay004_advance_phase(state);
        }
        break;

    case 3:
        if (++FIELD(s32, state, 0x008) > 60) {
            SceneSound_PlayPackedEffect(state, FIELD(s32, state, 0x158));
            overlay004_advance_phase(state);
        } else {
            s32 value = Presentation_InterpolateQuadraticPulse(0x100, 0x200, 60);

            func_02070958(FIELD(void *, state, 0x058), value, value, value);
            GraphicsSpriteRenderer_QueueStatePaletteUploads(data_020f4e14,
                          FIELD(void *, FIELD(void *, state, 0x060), 0x0c));
            GraphicsSpriteRenderer_QueueStatePaletteUploads(gDebugFont,
                          FIELD(void *, FIELD(void *, state, 0x064), 0x0c));
        }
        break;

    case 4:
        if (++FIELD(s32, state, 0x008) > 90) {
            u16 packed = (u16)FIELD(s32, state, 0x158);

            if (Sound_IsEffectPlaying(gSoundContext, packed >> 7, packed & 0x7f) ==
                0) {
                func_ov004_021fb6e4(state, data_ov004_021fcd50[0],
                                    data_ov004_021fcd50[1]);
            }
        }
        break;
    }

    func_ov004_021fc24c(state);
    func_ov004_021fbf10(state);
    return 0;
}

#undef FIELD
