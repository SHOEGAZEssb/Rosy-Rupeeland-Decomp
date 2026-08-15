#include "tingle/types.h"

/* Overlay 35 senary scene's five-stage burst presentation state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern const u8 data_ov035_02203120[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02059278(void *soundContext, s32 id, s32 value);
extern void func_0205929c(void *soundContext, s32 id, s32 value);
extern s32 Presentation_IsScriptComplete(void *object);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern void Presentation_SetScript(void *object, const void *animation, s32 loop);
extern void func_ov035_02201fe4(void *scene);
extern s32 func_02091c7c(void *state, s32 value);
extern void func_02091b98(void *state, s32 duration);
extern void func_ov035_02201df8(void *scene, s32 side);
extern void func_02091dac(void *state);
extern void PresentationList_UpdateAndDeleteCompleted(void *collection);
extern void GraphicsAnimationInstanceManager_Update(void *resourceSet);
#ifdef __cplusplus
}
#endif

/* Updates both scene collections and resource set +0xF4. */
static void update_scene(void *scene)
{
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x10c);
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x11c);
    GraphicsAnimationInstanceManager_Update(FIELD(void *, scene, 0xf4));
}

/*
 * Advances the five-stage senary presentation selected by state +0xA0. Stage
 * 0 starts sound 0xB9 and falls through. Stage 1 waits for sprite +0xD8, makes
 * model +0x104 active, starts its -0x2000 Z transition over 16 frames, and
 * assigns a non-looping animation to model +0x108. Stage 2 emits periodic
 * sprites and, every seven-frame +0x12C interval, alternates burst sides using
 * controller +0x148. After counter +0x164 exceeds 0x2B it starts a 90-frame
 * +0xA4 wait. Stage 3 lowers sound 0xB9 on completion. Every call updates both
 * collections and the resource set. Returns 1 only in terminal stage 4,
 * otherwise 0; sound, animation, RNG, heap, transforms, and scene state change.
 */
extern "C" s32 func_ov035_02202148(void *scene)
{
    switch (FIELD(s32, scene, 0xa0)) {
    case 0:
        func_02059278(gSoundContext, 0xb9, 0x7f);
        ++FIELD(s32, scene, 0xa0);
        /* Fall through to poll the opening sprite immediately. */
    case 1:
        if (Presentation_IsScriptComplete(FIELD(void *, scene, 0xd8)) != 0) {
            void *model = FIELD(void *, scene, 0x104);
            FIELD(u16, model, 0x98) &= (u16)~1;
            PresentationScalar_TransitionTo((u8 *)model + 0x2c, 4, -0x2000);
            FIELD(s32, model, 0x7c) = 16;
            FIELD(s32, model, 0x80) = 0;
            Presentation_SetScript(FIELD(void *, scene, 0x108),
                          data_ov035_02203120, 0);
            ++FIELD(s32, scene, 0xa0);
        }
        break;
    case 2:
        func_ov035_02201fe4(scene);
        if (func_02091c7c((u8 *)scene + 0x12c, 2) != 0) {
            func_02091b98((u8 *)scene + 0x12c, 7);
            func_ov035_02201df8(scene, FIELD(s32, scene, 0x148));
            func_02091dac((u8 *)scene + 0x148);
            if (++FIELD(s32, scene, 0x164) > 0x2b) {
                func_02091b98((u8 *)scene + 0xa4, 0x5a);
                ++FIELD(s32, scene, 0xa0);
            }
        }
        break;
    case 3:
        if (func_02091c7c((u8 *)scene + 0xa4, 2) != 0) {
            func_0205929c(gSoundContext, 0xb9, 0x10);
            ++FIELD(s32, scene, 0xa0);
        }
        break;
    case 4:
        update_scene(scene);
        return 1;
    }
    update_scene(scene);
    return 0;
}
