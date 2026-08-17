#include "tingle/types.h"

/* Overlay 35 quaternary scene's five-stage presentation state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern const u8 data_ov035_02202eb8[];
extern const u8 data_ov035_02202f14[];
extern const u8 data_ov035_0220352c[];
extern const u8 data_ov035_02202e60[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_PlayDirectSequence(void *soundContext, s32 id, s32 value);
extern void Sound_StopDirectSequence(void *soundContext, s32 id, s32 value);
extern void Sound_Play(void *soundContext, s32 id);
extern void Presentation_SetScript(void *object, const void *animation, s32 loop);
extern s32 Presentation_IsScriptSuspended(void *object);
extern s32 Presentation_IsScriptComplete(void *object);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void GraphicsAnimationInstanceManager_RebindInstance(void *resourceSet, void *spriteRecord,
                         void *resource);
extern void func_ov035_02200574(void *scene);
#ifdef __cplusplus
}
#endif

/*
 * Clears a model's animation, stops its Y-axis tween at zero, and configures a
 * ten-frame timing window at +0x7C/+0x80. The model and renderer state change;
 * there is no return value.
 */
static void reset_model(void *model)
{
    Presentation_SetScript(model, 0, 0);
    PresentationScalar_TransitionTo((u8 *)model + 0x1c, 2, 0);
    FIELD(s32, model, 0x7c) = 10;
    FIELD(s32, model, 0x80) = 0;
}

/*
 * Advances the five-stage quaternary presentation selected by state +0xA0.
 * Stage 0 starts sound 0xB7 and five animations, then deliberately falls
 * through. Stage 1 waits for sprite +0x108, hides it and model +0x114, plays
 * sound 0x1C9, and resets all three models. Stage 2 repositions that sprite at
 * Z=0x400 and swaps its record to resource +0xE8. Stage 3 waits on the sprite
 * and lowers sound 0xB7 to 0x10. Every call performs common scene maintenance.
 * Returns 1 only in terminal stage 4, otherwise 0; sound, animation, resource,
 * object visibility, transform, timing, and scene state may change.
 */
extern "C" s32 func_ov035_022005b0(void *scene)
{
    switch (FIELD(s32, scene, 0xa0)) {
    case 0:
        Sound_PlayDirectSequence(gSoundContext, 0xb7, 0x7f);
        Presentation_SetScript(FIELD(void *, scene, 0x114),
                      data_ov035_02202eb8, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x118),
                      data_ov035_02202eb8, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x11c),
                      data_ov035_02202f14, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x108),
                      data_ov035_0220352c, 1);
        Presentation_SetScript(FIELD(void *, scene, 0xd8),
                      data_ov035_02202e60, 1);
        ++FIELD(s32, scene, 0xa0);
        /* Fall through: the original immediately polls the first animation. */
    case 1:
        if (Presentation_IsScriptSuspended(FIELD(void *, scene, 0x108)) != 0) {
            FIELD(s32, FIELD(void *, scene, 0x108), 0x90) = 0;
            FIELD(s32, FIELD(void *, scene, 0x114), 0x90) = 0;
            Sound_Play(gSoundContext, 0x1c9);
            reset_model(FIELD(void *, scene, 0x114));
            reset_model(FIELD(void *, scene, 0x118));
            reset_model(FIELD(void *, scene, 0x11c));
            ++FIELD(s32, scene, 0xa0);
        }
        break;
    case 2:
        if (Presentation_IsScriptSuspended(FIELD(void *, scene, 0x108)) != 0) {
            void *sprite = FIELD(void *, scene, 0x108);
            Presentation_SetPosition(sprite, FIELD(s32, sprite, 0x10),
                          FIELD(s32, sprite, 0x20), 0x400);
            GraphicsAnimationInstanceManager_RebindInstance(FIELD(void *, scene, 0x104),
                          FIELD(void *, sprite, 0x9c),
                          (u8 *)scene + 0xe8);
            FIELD(s32, sprite, 0x90) = 0;
            ++FIELD(s32, scene, 0xa0);
        }
        break;
    case 3:
        if (Presentation_IsScriptComplete(FIELD(void *, scene, 0x108)) != 0) {
            Sound_StopDirectSequence(gSoundContext, 0xb7, 0x10);
            ++FIELD(s32, scene, 0xa0);
        }
        break;
    case 4:
        func_ov035_02200574(scene);
        return 1;
    }

    func_ov035_02200574(scene);
    return 0;
}
