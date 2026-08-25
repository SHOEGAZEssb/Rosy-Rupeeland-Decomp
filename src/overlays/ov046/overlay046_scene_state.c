#include "tingle/types.h"

/*
 * Overlay 46 scene-state callbacks. These recovered routines enter the active
 * panel state, advance its timed presentation, and perform the final refresh.
 * Matching-only assembly retains switch layout and callback-installation
 * sequences for the NDS build; these definitions provide portable behavior.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef s32 (*Overlay046SceneCallback)(void *scene);

typedef struct Overlay046CallbackBinding {
    Overlay046SceneCallback callback;
    void *argument;
} Overlay046CallbackBinding;

extern "C" Overlay046CallbackBinding data_ov046_0220cce8;
extern "C" Overlay046CallbackBinding data_ov046_0220cd00;
extern "C" void *gDebugFont;
extern "C" void *gGameWork;
extern "C" void GraphicsSpriteRenderer_ClearTextBuffer(void *font);
extern "C" void AreaInfoPanelPresentation_ShowIndex(void *object, s32 selection);
extern "C" void func_ov046_0220c4a0(void *panel);
extern "C" void func_ov046_0220bffc(void *panel, s32 index, s32 enabled,
                                     s32 selectedFlag);
extern "C" void func_ov046_0220c478(void *panel, s32 index);
extern "C" void GameWork_SetFlag(void *work, s32 flag);
extern "C" void func_ov046_0220c7b0(void *scene,
                                     Overlay046SceneCallback callback,
                                     void *argument, void *unused);
extern "C" void func_ov046_0220cb4c(void *scene);

/*
 * Enter the active state for `scene` and return zero. On first entry, invoke
 * the global transition helper, update auxiliary object +0x74, refresh and
 * populate panel +0x70, derive its table position, set the GameWork flag keyed
 * by scene +0x68, install the next callback via func_ov046_0220c7b0, and sync
 * rendering. Scene, GameWork, sprite, and renderer state change.
 */
extern "C" s32 func_ov046_0220cb88(void *scene)
{
    if (FIELD(s32, scene, 0x04) == 0) {
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        AreaInfoPanelPresentation_ShowIndex(FIELD(void *, scene, 0x74), FIELD(s32, scene, 0x6c));
        func_ov046_0220c4a0(FIELD(void *, scene, 0x70));
        func_ov046_0220bffc(FIELD(void *, scene, 0x70),
                            FIELD(s32, scene, 0x6c), 0, 0);
        func_ov046_0220c478(FIELD(void *, scene, 0x70),
                            FIELD(s32, scene, 0x6c));
        GameWork_SetFlag(gGameWork, FIELD(s32, scene, 0x68));
        func_ov046_0220c7b0(
            scene, data_ov046_0220cce8.callback,
            data_ov046_0220cce8.argument, 0);
    }
    func_ov046_0220cb4c(scene);
    return 0;
}

/*
 * Advance the scene's phase at +4 and timer at +8 and return zero until the
 * callback changes. Early phases normalize the counter; after 60 frames the
 * marker sprite +0x64 is revealed and the phase advances; after another 180
 * frames the terminal callback is installed and rendering is synchronized.
 * Scene and sprite visibility change; SDK renderer effects occur indirectly.
 */
extern "C" s32 func_ov046_0220cc18(void *scene)
{
    switch (FIELD(s32, scene, 0x04)) {
    case 0:
        FIELD(s32, scene, 0x04) = 1;
        FIELD(s32, scene, 0x08) = 0;
        /* Retail intentionally advances the first delay on this same frame. */
        /* fall through */
    case 1:
        ++FIELD(s32, scene, 0x08);
        if (FIELD(s32, scene, 0x08) > 60) {
            FIELD(u16, FIELD(void *, scene, 0x64), 0x24) &= (u16)~4;
            ++FIELD(s32, scene, 0x04);
            FIELD(s32, scene, 0x08) = 0;
        }
        break;
    case 2:
        ++FIELD(s32, scene, 0x08);
        if (FIELD(s32, scene, 0x08) > 180) {
            func_ov046_0220c7b0(
                scene, data_ov046_0220cd00.callback,
                data_ov046_0220cd00.argument, 0);
        }
        break;
    default:
        break;
    }
    func_ov046_0220cb4c(scene);
    return 0;
}

/*
 * Perform one final scene/panel refresh through func_ov046_0220cb4c and return
 * one to signal callback completion. Renderer state changes through the
 * callee; the scene is otherwise unchanged and no direct MMIO occurs.
 */
extern "C" s32 func_ov046_0220ccc0(void *scene)
{
    func_ov046_0220cb4c(scene);
    return 1;
}
