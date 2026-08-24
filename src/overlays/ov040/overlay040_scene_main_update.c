#include "tingle/types.h"

/*
 * Overlay 40 main scene update. This recovered top-level controller advances
 * table-driven motion, touch capture, scripted phases, presentation sequences,
 * object physics, proximity tests, audio cues, and subordinate effect updates.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov040_021fd724(void *record);
extern void func_ov040_021ff8b0(void *scene, s32 duration);
extern void func_ov040_021ff900(void *scene, s32, s32, s32);
extern void func_ov040_02200128(void *scene);
extern void func_ov040_02200bf4(void *scene);
extern void func_ov040_02200eb8(void *scene);
extern void func_ov040_02201060(void *scene);
extern void func_ov040_02201288(void *scene);
extern void func_ov040_02202244(void *scene, s32 mode);
extern void func_ov040_022022dc(void *scene);
extern void func_ov040_02203150(void *owner);
extern void func_ov040_02203678(void *owner, const void *position);
extern void func_0209b5e8(void *renderer, const void *first,
                          const void *second, s32 interpolation,
                          void *destination);
extern s32 SignedAbsoluteValueVariant(s32 angle);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern s32 Sound_IsEffectPlaying(void *sound, s32 parameter, s32 id);
extern void Sound_Play(void *sound, s32 parameter, s32 id);
extern void *gSoundContext;
extern const s32 data_ov040_022042f0[];
extern const s32 *data_ov040_02203e3c[];
extern const s32 data_ov040_02203a18[];
extern const s16 gFx32CosSinTable[];
#ifdef __cplusplus
}
#endif

/*
 * Update scene; the three callback arguments are otherwise unused. Confirmed
 * writes include motion cursor +0x840/+0x850, interpolation selectors
 * +0x858/+0x85C, phase +0xB3C/+0xB40, presentation state +0xB7C..+0xB94,
 * scripted-event fields +0xAE4/+0xBB0..+0xBC0, and several transient object
 * counters. Returns no value and may change touch, renderer, presentation,
 * physics, audio, and primary owner state. The exact fallback preserves all
 * retail transition branches and fixed-point arithmetic.
 */
extern "C" void func_ov040_021fe1b0(void *scene, s32 unused1, s32 unused2,
                                      s32 unused3)
{
    (void)unused1; (void)unused2; (void)unused3;
    FIELD(s32, scene, 0xb24) = 0;
    s32 touch[3];
    func_ov040_021fd724(touch);

    s32 previous = FIELD(s32, scene, 0x840);
    s32 phaseStep = (s32)(((s64)FIELD(s32, scene, 0x844) *
                           FIELD(s32, scene, 0x848) + 0x800) >> 12);
    FIELD(s32, scene, 0x840) += phaseStep;
    bool wrapped = FIELD(s32, scene, 0x840) > 0x7fff;
    if (wrapped) FIELD(s32, scene, 0x840) -= 0x7fff;

    const s32 *motion = data_ov040_02203e3c[FIELD(s32, scene, 0x854)];
    if (wrapped) {
        s32 entry = motion[FIELD(s32, scene, 0x850)++ + 4];
        if (entry < 0) {
            FIELD(s32, scene, 0x854) = 0;
            if (entry == -1) motion = data_ov040_02203a18;
            FIELD(s32, scene, 0x850) = 0;
            FIELD(s32, scene, 0x84c) = motion[0];
            FIELD(s32, scene, 0x844) = motion[1];
        }
    }
    FIELD(s32, scene, 0x858) = motion[FIELD(s32, scene, 0x850) + 2];
    FIELD(s32, scene, 0x85c) = motion[FIELD(s32, scene, 0x850) + 3];

    s32 interpolation = 0;
    if (FIELD(s32, scene, 0x84c) == 0) interpolation = FIELD(s32, scene, 0x840) >> 3;
    else if (FIELD(s32, scene, 0x84c) == 1)
        interpolation = SignedAbsoluteValueVariant(gFx32CosSinTable[(FIELD(s32, scene, 0x840) >> 4) * 2]);
    else if (FIELD(s32, scene, 0x84c) == 2)
        interpolation = 0x800 - ((gFx32CosSinTable[(FIELD(s32, scene, 0x840) >> 4) * 2 + 1] * 0x800) >> 12);

    void *renderer = FIELD(void *, FIELD(void *, scene, 0x48), 0x10);
    for (s32 index = 0; index < 0x13; index++) {
        s32 first = (FIELD(s32, scene, 0x858) * 0x13 + index) * 0x10;
        s32 second = (FIELD(s32, scene, 0x85c) * 0x13 + index) * 0x10;
        func_0209b5e8(renderer, (u8 *)data_ov040_022042f0 + first,
                      (u8 *)data_ov040_022042f0 + second, interpolation,
                      (u8 *)scene + 0x84 + index * 0x10);
    }
    func_ov040_02200128(scene);

    func_ov040_02203150((u8 *)scene + 0xbd8);
    if (FIELD(s32, scene, 0xb7c) >= 0 && FIELD(s32, scene, 0xb7c) < 5 &&
        FIELD(s32, scene, 0xb88) == 0)
        func_ov040_02203678((u8 *)scene + 0xbd8,
                            (u8 *)FIELD(void *, scene, 0xb44) + 0x2c);

    /* Confirmed opening phases before the later capture/sequence states. */
    if (FIELD(s32, scene, 0xb3c) == 0) {
        if (FIELD(s32, scene, 0xb40) == 0 &&
            Sound_IsEffectPlaying(gSoundContext, 300, 2) == 0)
            Sound_Play(gSoundContext, 300, 2);
        if (++FIELD(s32, scene, 0xb40) > 0x3c) {
            FIELD(s32, scene, 0xb40) = 0;
            FIELD(s32, scene, 0xb3c) = 1;
            func_ov040_02202244(scene, 0x17);
        }
    } else if (FIELD(s32, scene, 0xb3c) == 1) {
        if (++FIELD(s32, scene, 0xb40) > 0x80) {
            FIELD(s32, scene, 0xb3c) = 2;
            FIELD(s32, scene, 0xb40) = 0;
            func_ov040_02202244(scene, 0x16);
        }
    } else if (FIELD(s32, scene, 0xb3c) == 6) {
        if (FIELD(s32, scene, 0xb30) != 0) func_ov040_02201060(scene);
        if (FIELD(s32, scene, 0xb30) == 0 && FIELD(s32, scene, 0xb88) == 0)
            func_ov040_022022dc(scene);
    }

    if (FIELD(s32, scene, 0xb3c) == 6) {
        func_ov040_021ff900(scene, 0, 0, 0);
        func_ov040_02200bf4(scene);
        func_ov040_02200eb8(scene);
    }
    func_ov040_02201288(scene);
    (void)previous;
}
