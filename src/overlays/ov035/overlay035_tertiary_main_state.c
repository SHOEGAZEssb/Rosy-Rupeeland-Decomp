#include "tingle/types.h"

/* Overlay 35 tertiary scene four-stage animation and spawn state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern const u8 data_ov035_02202f70[];
extern const u8 data_ov035_02203770[];
extern const u8 data_ov035_02202bfc[];
extern const u8 data_ov035_02202ba8[];
extern const u8 data_ov035_02202ce4[];
extern const u8 data_ov035_02202d2c[];
extern const u8 data_ov035_022031c8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02059278(void *sound, s32 id, s32 value);
extern void func_0205929c(void *sound, s32 id, s32 value);
extern void Sound_Play(void *sound, s32 id, s32 parameter);
extern void Presentation_SetScript(void *object, const void *motion, s32 enabled);
extern s32 Presentation_IsScriptSuspended(void *object);
extern s32 Presentation_IsScriptComplete(void *object);
extern void GraphicsAnimationInstance_SetAnimation(void *object, u8 identifier);
extern s32 func_02091c7c(void *state, s32 mode);
extern void func_02091dac(void *state);
extern void func_ov035_021ffb74(void *scene, s32 direction);
extern void func_02091b98(void *state, s32 value);
extern void PresentationList_UpdateAndDeleteCompleted(void *collection);
extern void GraphicsAnimationInstanceManager_Update(void *resourceSet);
#ifdef __cplusplus
}
#endif

/* Updates both tertiary collections and their resource set. */
static void update_tertiary_scene(void *scene)
{
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x174);
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x184);
    GraphicsAnimationInstanceManager_Update(FIELD(void *, scene, 0x124));
}

/*
 * Runs the tertiary scene's four-stage sequence using state +0xA0. Stage 0
 * starts sound 0xB6 and installs motions on all seven sprites. During stage 1,
 * timer +0x140 repeatedly advances direction generator +0x15C and spawns kind-3
 * objects until sprite +0x12C completes; it then clears animation fields,
 * switches the +0x134 record identifier to 2, and plays sound 0x1B6. Stage 2
 * waits for +0x12C's secondary completion and fades sound 0xB6. Stage 3 is
 * terminal. Both collections and resource set update every call. Returns one
 * only in stage 3; sound, animation, heap/collection, and resource state change.
 */
extern "C" s32 func_ov035_021ffc60(void *scene)
{
    switch (FIELD(s32, scene, 0xa0)) {
    case 0:
        func_02059278(gSoundContext, 0xb6, 0x7f);
        Presentation_SetScript(FIELD(void *, scene, 0x128),
                      data_ov035_02202f70, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x12c),
                      data_ov035_02203770, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x130),
                      data_ov035_02202bfc, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x134),
                      data_ov035_02202ba8, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x138),
                      data_ov035_02202ce4, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x13c),
                      data_ov035_02202d2c, 1);
        Presentation_SetScript(FIELD(void *, scene, 0xd8),
                      data_ov035_022031c8, 1);
        FIELD(s32, scene, 0xa0)++;
        /* The recovered switch intentionally continues into stage 1. */
    case 1:
        if (Presentation_IsScriptSuspended(FIELD(void *, scene, 0x12c))) {
            FIELD(s32, FIELD(void *, scene, 0x130), 0x90) = 0;
            GraphicsAnimationInstance_SetAnimation(
                FIELD(void *, FIELD(void *, scene, 0x134), 0x9c), 2);
            Sound_Play(gSoundContext, 0x1b6, 0);
            FIELD(s32, FIELD(void *, scene, 0x12c), 0x90) = 0;
            FIELD(s32, scene, 0xa0)++;
            break;
        }
        if (func_02091c7c((u8 *)scene + 0x140, 2)) {
            func_02091dac((u8 *)scene + 0x15c);
            func_ov035_021ffb74(scene, FIELD(s32, scene, 0x15c));
            func_02091b98((u8 *)scene + 0x140, 0x0a);
        }
        break;
    case 2:
        if (Presentation_IsScriptComplete(FIELD(void *, scene, 0x12c))) {
            func_0205929c(gSoundContext, 0xb6, 0x10);
            FIELD(s32, scene, 0xa0)++;
        }
        break;
    case 3:
        update_tertiary_scene(scene);
        return 1;
    }
    update_tertiary_scene(scene);
    return 0;
}
