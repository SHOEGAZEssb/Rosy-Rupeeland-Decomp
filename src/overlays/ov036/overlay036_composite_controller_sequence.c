#include "tingle/types.h"

/* Overlay 36 twelve-state composite presentation and segment-emission sequence. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02204f8c[];
extern const u8 data_ov036_0220506c[];
extern const u8 data_ov036_022058e4[];
extern const u8 data_ov036_02205400[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_PlayDirectSequence(void *sound, s32 id, s32 value);
extern void Sound_StopDirectSequence(void *sound, s32 id, s32 value);
extern void Sound_Play(void *sound, s32 id, s32 mode);
extern void func_02091b98(void *timer, s32 duration);
extern s32 func_02091c7c(void *timer, s32 mode);
extern void Presentation_SetScript(void *object, const void *data, s32 mode);
extern s32 Presentation_IsScriptComplete(void *object);
extern s32 Presentation_IsScriptSuspended(void *object);
extern void GraphicsAnimationInstance_SetAnimation(void *resource, s32 selector);
extern void func_ov036_021fdc1c(void *auxiliary);
extern void func_ov036_02203024(void *controller, s32 colorMode,
                                s32 segmentType);
extern void func_ov036_02202fb8(void *controller);
#ifdef __cplusplus
}
#endif

/*
 * Runs the twelve-state composite presentation at +0xA0. State 0 starts sound
 * 0xB2 and a 60-frame delay. States 1/2 start and await +0xFC/+0xD8 animation
 * data, emitting gray type-1 segments. State 3 plays sound 0x1B2 mode zero,
 * selects +0xFC resource entry zero, starts matching +0x154/+0x158 animation
 * plus +0xF8 animation, sets auxiliary +0x14 to 0x7E00, and emits green/blue
 * type-1 segments. State 4 waits for +0x154, destroys the auxiliary state,
 * and delays 30 frames; emission continues only while +0x98 bit 2 is set.
 *
 * States 5/6 repeat that wait pair with sound mode one, cleared +0x90 fields,
 * auxiliary value 0x401F, and red/blue type-0 segments. States 7/8 use sound
 * mode zero, nested +0xF8 resource halfword +0x4C value 0x8000, auxiliary
 * 0x4000, and blue type-1 segments. States 9/10 use sound mode one, nested
 * value 0x4000, auxiliary 0x3F0, red/green type-0 segments, then lower sound
 * 0xB2 to 0x10 and destroy auxiliary state on completion. State 11 reports
 * completion. Every call services func_ov036_02202fb8. Returns one only in
 * state 11; sound, timers, resource selection, animations, auxiliary state,
 * heap/list emission, and state may change.
 */
extern "C" s32 func_ov036_022032a8(void *controller)
{
    void *primary = FIELD(void *, controller, 0x154);
    switch (FIELD(s32, controller, 0xa0)) {
    case 0:
        Sound_PlayDirectSequence(gSoundContext, 0xb2, 0x7f);
        func_02091b98((u8 *)controller + 0xa4, 0x3c);
        ++FIELD(s32, controller, 0xa0);
        break;
    case 1:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            Presentation_SetScript(FIELD(void *, controller, 0xfc),
                          data_ov036_02204f8c, 1);
            Presentation_SetScript(FIELD(void *, controller, 0xd8),
                          data_ov036_0220506c, 1);
            ++FIELD(s32, controller, 0xa0);
        }
        func_ov036_02203024(controller, 4, 1);
        break;
    case 2:
        if (Presentation_IsScriptComplete(FIELD(void *, controller, 0xfc)) != 0) {
            func_02091b98((u8 *)controller + 0xa4, 0x1e);
            ++FIELD(s32, controller, 0xa0);
        }
        func_ov036_02203024(controller, 4, 1);
        break;
    case 3:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            Sound_Play(gSoundContext, 0x1b2, 0);
            GraphicsAnimationInstance_SetAnimation(FIELD(void *, FIELD(void *, controller, 0xfc), 0x9c),
                          0);
            Presentation_SetScript(FIELD(void *, controller, 0x154),
                          data_ov036_022058e4, 1);
            Presentation_SetScript(FIELD(void *, controller, 0x158),
                          data_ov036_022058e4, 1);
            Presentation_SetScript(FIELD(void *, controller, 0xf8),
                          data_ov036_02205400, 1);
            FIELD(u16, FIELD(void *, controller, 0x1a0), 0x14) = 0x7e00;
            ++FIELD(s32, controller, 0xa0);
        }
        func_ov036_02203024(controller, 1, 1);
        break;
    case 4:
        if (Presentation_IsScriptSuspended(primary) != 0) {
            func_ov036_021fdc1c(FIELD(void *, controller, 0x1a0));
            func_02091b98((u8 *)controller + 0xa4, 0x1e);
            ++FIELD(s32, controller, 0xa0);
        }
        if ((FIELD(u16, primary, 0x98) & 4) != 0)
            func_ov036_02203024(controller, 1, 1);
        break;
    case 5:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            Sound_Play(gSoundContext, 0x1b2, 1);
            GraphicsAnimationInstance_SetAnimation(FIELD(void *, FIELD(void *, controller, 0xfc), 0x9c),
                          0);
            FIELD(s32, FIELD(void *, controller, 0x154), 0x90) = 0;
            FIELD(s32, FIELD(void *, controller, 0x158), 0x90) = 0;
            FIELD(s32, FIELD(void *, controller, 0xf8), 0x90) = 0;
            FIELD(u16, FIELD(void *, controller, 0x1a0), 0x14) = 0x401f;
            ++FIELD(s32, controller, 0xa0);
        }
        func_ov036_02203024(controller, 2, 0);
        break;
    case 6:
        if (Presentation_IsScriptSuspended(primary) != 0) {
            func_ov036_021fdc1c(FIELD(void *, controller, 0x1a0));
            func_02091b98((u8 *)controller + 0xa4, 0x1e);
            ++FIELD(s32, controller, 0xa0);
        }
        if ((FIELD(u16, primary, 0x98) & 4) != 0)
            func_ov036_02203024(controller, 2, 0);
        break;
    case 7:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            Sound_Play(gSoundContext, 0x1b2, 0);
            GraphicsAnimationInstance_SetAnimation(FIELD(void *, FIELD(void *, controller, 0xfc), 0x9c),
                          0);
            FIELD(s32, FIELD(void *, controller, 0x154), 0x90) = 0;
            FIELD(s32, FIELD(void *, controller, 0x158), 0x90) = 0;
            FIELD(s32, FIELD(void *, controller, 0xf8), 0x90) = 0;
            FIELD(u16, FIELD(void *,
                            FIELD(void *, controller, 0xf8), 0x9c), 0x4c) =
                0x8000;
            FIELD(u16, FIELD(void *, controller, 0x1a0), 0x14) = 0x4000;
            ++FIELD(s32, controller, 0xa0);
        }
        func_ov036_02203024(controller, 3, 1);
        break;
    case 8:
        if (Presentation_IsScriptSuspended(primary) != 0) {
            func_ov036_021fdc1c(FIELD(void *, controller, 0x1a0));
            func_02091b98((u8 *)controller + 0xa4, 0x1e);
            ++FIELD(s32, controller, 0xa0);
        }
        if ((FIELD(u16, primary, 0x98) & 4) != 0)
            func_ov036_02203024(controller, 3, 1);
        break;
    case 9:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            Sound_Play(gSoundContext, 0x1b2, 1);
            GraphicsAnimationInstance_SetAnimation(FIELD(void *, FIELD(void *, controller, 0xfc), 0x9c),
                          0);
            FIELD(s32, FIELD(void *, controller, 0x154), 0x90) = 0;
            FIELD(s32, FIELD(void *, controller, 0x158), 0x90) = 0;
            FIELD(s32, FIELD(void *, controller, 0xf8), 0x90) = 0;
            FIELD(u16, FIELD(void *,
                            FIELD(void *, controller, 0xf8), 0x9c), 0x4c) =
                0x4000;
            FIELD(u16, FIELD(void *, controller, 0x1a0), 0x14) = 0x3f0;
            ++FIELD(s32, controller, 0xa0);
        }
        func_ov036_02203024(controller, 0, 0);
        break;
    case 10:
        if (Presentation_IsScriptSuspended(primary) != 0) {
            Sound_StopDirectSequence(gSoundContext, 0xb2, 0x10);
            func_ov036_021fdc1c(FIELD(void *, controller, 0x1a0));
            ++FIELD(s32, controller, 0xa0);
        }
        if ((FIELD(u16, primary, 0x98) & 4) != 0)
            func_ov036_02203024(controller, 0, 0);
        break;
    case 11:
        func_ov036_02202fb8(controller);
        return 1;
    }
    func_ov036_02202fb8(controller);
    return 0;
}
