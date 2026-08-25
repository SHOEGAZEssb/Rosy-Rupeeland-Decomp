#include "tingle/types.h"

/* Overlay 37 six-stage main scene progression and child/resource updates. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021febb0[];
extern const u8 data_ov037_021feb5c[];
extern const u8 data_ov037_021feac8[];
extern const u8 data_ov037_021feb08[];
extern const u8 data_ov037_021feab0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_SetScript(void *object, const void *command, s32 enabled);
extern s32 Presentation_IsScriptSuspended(void *object);
extern void func_ov037_021fdd08(void *scene);
extern s32 func_ov037_021fd1b4(void *object);
extern void DisplayBrightness_StartMaskedTransitions(s32 effect, s32 duration);
extern void func_ov037_021fe1f0(void *scene);
extern void func_ov037_021fdf68(void *scene);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void PresentationList_UpdateAndDeleteCompleted(void *container);
extern void GraphicsAnimationInstanceManager_Update(void *resourceOwner);
#ifdef __cplusplus
}
#endif

static void updateOwnedSceneObjects(void *scene)
{
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x12c);
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x13c);
    GraphicsAnimationInstanceManager_Update(FIELD(void *, scene, 0x114));
}

/*
 * Advances the six-stage scene state stored at +0x9C. Stage 0 issues retained
 * command streams to five permanent children and falls through to stage 1;
 * stages 1/2 wait for +0x118, stage 3 waits for +0x120, stage 4 waits for the
 * global transition, and stage 5 reports completion. While waiting it drives
 * timed sound and transient spawners as appropriate. Both child containers and
 * the retained resource owner are updated every call. Returns 1 only in stage
 * 5, otherwise 0; child, timer, heap, sound, transition, and resource state may
 * change. The repeated +0x118 wait in stages 1 and 2 is confirmed behavior.
 */
extern "C" s32 func_ov037_021fe284(void *scene)
{
    switch (FIELD(s32, scene, 0x9c)) {
    case 0:
        Presentation_SetScript(FIELD(void *, scene, 0x118), data_ov037_021febb0, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x11c), data_ov037_021feb5c, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x124), data_ov037_021feac8, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x120), data_ov037_021feb08, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x128), data_ov037_021feab0, 0);
        ++FIELD(s32, scene, 0x9c);
        /* Intentional fallthrough: stage 1 is tested immediately. */
    case 1:
        if (Presentation_IsScriptSuspended(FIELD(void *, scene, 0x118))) {
            FIELD(s32, FIELD(void *, scene, 0x118), 0x90) = 0;
            ++FIELD(s32, scene, 0x9c);
        }
        break;
    case 2:
        if (Presentation_IsScriptSuspended(FIELD(void *, scene, 0x118))) {
            FIELD(s32, FIELD(void *, scene, 0x118), 0x90) = 0;
            ++FIELD(s32, scene, 0x9c);
        } else {
            func_ov037_021fdd08(scene);
        }
        break;
    case 3:
        if (func_ov037_021fd1b4(FIELD(void *, scene, 0x120))) {
            DisplayBrightness_StartMaskedTransitions(3, 0x10);
            ++FIELD(s32, scene, 0x9c);
        } else {
            func_ov037_021fe1f0(scene);
            func_ov037_021fdf68(scene);
            func_ov037_021fdd08(scene);
        }
        break;
    case 4:
        func_ov037_021fe1f0(scene);
        func_ov037_021fdf68(scene);
        func_ov037_021fdd08(scene);
        if (DisplayBrightness_IsMainTransitionComplete())
            ++FIELD(s32, scene, 0x9c);
        break;
    case 5:
        func_ov037_021fe1f0(scene);
        updateOwnedSceneObjects(scene);
        return 1;
    default:
        break;
    }

    updateOwnedSceneObjects(scene);
    return 0;
}
