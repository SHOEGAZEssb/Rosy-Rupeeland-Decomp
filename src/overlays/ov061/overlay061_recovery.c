#include "tingle/debug_hud_state.h"
#include "tingle/display_controller.h"
#include "tingle/game_phase_currency_hud.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/graphics_sprite_renderer.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"

/*
 * Overlay 61 owns the small modal scene created by actor-script opcode 0x91.
 * It temporarily changes one display engine, hides normal phase presentation,
 * polls the debug-HUD input surface, then restores the phase before teardown.
 */

typedef struct Overlay61Scene {
    Scene base;
    u16 savedDisplayMode;
    u16 padding26;
    s32 screen;
    s32 padding2c;
    s32 restoreCurrencyHud;
    s32 padding34;
    s32 playSound;
} Overlay61Scene;

typedef char Overlay61SceneSizeCheck[sizeof(Overlay61Scene) == 0x3c ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif
extern SceneVTable data_ov061_022102b0;
extern DisplayBrightnessPair gDisplayBrightnessPair;
extern GraphicsSpriteRenderer *data_020f4e14;
extern GraphicsSpriteRenderer *gDebugFont;
extern GamePhaseRuntime *data_021052fc;
extern void *gLupyContext;
extern void *gSoundContext;
extern void Sound_Play(void *context, s32 bank, s32 soundId);
extern void func_0205940c(void *context, s32 bank, s32 soundId);
extern void ActorCollection_SetEnabled(void *collection, s32 enabled);
extern void GamePhaseState_SetEnabled(void *state, s32 enabled);
#ifdef __cplusplus
}
#endif

/* Translate each edge of a saved HUD rectangle by the supplied coordinates. */
void func_ov061_0220fdd0(DebugHudRect *rect, s32 x, s32 y)
{
    rect->left += x;
    rect->top += y;
    rect->right += x;
    rect->bottom += y;
}

/*
 * Construct the modal scene, move the HUD rectangle 64 pixels upward, open it
 * with the script-provided resources, and optionally start retail sound 0x186.
 */
Overlay61Scene *func_ov061_0220fd20(Overlay61Scene *self, s32 screen,
                                    u32 resource, s32 playSound)
{
    DebugHudRect rect;

    Scene_Init(&self->base);
    self->base.vtable = &data_ov061_022102b0;
    self->screen = screen;
    self->padding2c = 0;
    self->restoreCurrencyHud = 0;
    self->playSound = playSound;
    DebugHud_GetCurrentRectangle(&rect);
    func_ov061_0220fdd0(&rect, 0, -64);
    DebugHudState_SetRectangle(DebugHudState_GetGlobal(), &rect);
    DebugHudState_Open(DebugHudState_GetGlobal(), screen, resource, 1);
    if (self->playSound != 0)
        Sound_Play(gSoundContext, 0x186, 0);
    Scene_SetFlags03(&self->base);
    return self;
}

/* Close the HUD, stop its sound, unload overlay slot 2, and destroy the base. */
Overlay61Scene *func_ov061_0220fe04(Overlay61Scene *self)
{
    self->base.vtable = &data_ov061_022102b0;
    DebugHudState_Close(DebugHudState_GetGlobal());
    DebugHudState_RefreshRectangle(DebugHudState_GetGlobal());
    if (self->playSound != 0)
        func_0205940c(gSoundContext, 0x186, 0);
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
    Scene_Destroy(&self->base);
    return self;
}

/* Perform ordinary overlay-61 teardown and release the scene allocation. */
Overlay61Scene *func_ov061_0220fe6c(Overlay61Scene *self)
{
    func_ov061_0220fe04(self);
    Heap_Free(self);
    return self;
}

/*
 * Hide normal phase presentation and select the requested display engine for
 * the modal HUD, preserving the engine mode and currency-HUD visibility.
 */
void func_ov061_022100e4(Overlay61Scene *self)
{
    volatile u32 *displayControl;
    volatile u16 *palette;
    u16 lupyFlags;

    if (self->screen == 0) {
        displayControl = (volatile u32 *)0x04000000;
        palette = (volatile u16 *)0x05000000;
        self->savedDisplayMode = (u16)((*displayControl & 0x1f00) >> 8);
        *displayControl = (*displayControl & ~0x1f00u) | 0x1000;
        *palette = 0x7fff;
        GamePhaseState_SetEnabled((u8 *)data_021052fc + 0x24, 0);
        ActorCollection_SetEnabled(
            GamePhaseRuntime_GetActorCollection(data_021052fc, 1), 0);
    } else {
        displayControl = (volatile u32 *)0x04001000;
        palette = (volatile u16 *)0x05000400;
        self->savedDisplayMode = (u16)((*displayControl & 0x1f00) >> 8);
        *displayControl = (*displayControl & ~0x1f00u) | 0x1000;
        *palette = 0x7fff;
        GamePhaseRuntime_SetPlacementMode(data_021052fc, 0, 1);
    }

    lupyFlags = *(u16 *)((u8 *)gLupyContext + 0xb0);
    self->restoreCurrencyHud = (lupyFlags & 1) == 0;
    GamePhaseCurrencyHud_SetVisible((GamePhaseCurrencyHud *)gLupyContext, 0);
}

/* Restore the display mode and phase presentation hidden by the modal scene. */
void func_ov061_022101dc(Overlay61Scene *self)
{
    if (self->screen == 0) {
        volatile u32 *displayControl = (volatile u32 *)0x04000000;
        GamePhaseState_SetEnabled((u8 *)data_021052fc + 0x24, 1);
        *displayControl = (*displayControl & ~0x1f00u) |
                          ((u32)self->savedDisplayMode << 8);
    } else {
        GamePhaseRuntime_ApplyScreenMode(data_021052fc, 1, 1);
        GamePhaseRuntime_SetPlacementMode(data_021052fc, 1, 1);
    }
    GamePhaseCurrencyHud_SetVisible((GamePhaseCurrencyHud *)gLupyContext,
                                    self->restoreCurrencyHud);
}

/*
 * Invoke the runtime's routed transition callback and whiten the palette entry
 * for the display engine selected by the script.
 */
s32 func_ov061_0221009c(Overlay61Scene *self)
{
    Scene *runtimeScene = (Scene *)data_021052fc;
    runtimeScene->vtable->method0C(runtimeScene);
    if (self->screen == 0)
        *(volatile u16 *)0x05000000 = 0x7fff;
    else
        *(volatile u16 *)0x05000400 = 0x7fff;
    return 0;
}

/* Run the exact 15-state fade, input, presentation, and teardown sequence. */
s32 func_ov061_0220fedc(Overlay61Scene *self)
{
    DisplayBrightness *brightness;

    GamePhaseRuntime_FinalizeActorCollections(data_021052fc,
                                              (s32)self->base.value04, 3);
    switch (self->base.value08) {
    case 0:
        brightness = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair,
                                                     (u32)self->screen);
        DisplayBrightness_StartTransition(brightness,
                                          DisplayBrightness_GetCurrent(brightness),
                                          16, 5);
        ++self->base.value08;
        /* fall through */
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        ++self->base.value08;
        break;
    case 6:
        func_ov061_022100e4(self);
        brightness = DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair,
                                                     (u32)self->screen);
        DisplayBrightness_StartTransition(brightness, 16, 0, 0);
        ++self->base.value08;
        /* fall through */
    case 7:
        if ((DebugHudState_PollInput(DebugHudState_GetGlobal(), 0) & 1) != 0) {
            if (self->screen == 0)
                GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
            else
                GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
            brightness = DisplayBrightnessPair_GetScreen(
                &gDisplayBrightnessPair, (u32)self->screen);
            DisplayBrightness_StartTransition(brightness, 16, 0, 5);
            ++self->base.value08;
        }
        break;
    case 8:
        func_ov061_022101dc(self);
        /* fall through */
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
        ++self->base.value08;
        break;
    case 14:
        if (self != 0)
            self->base.vtable->destroyAndFree(&self->base);
        return 1;
    default:
        break;
    }

    GamePhaseRuntime_UpdateActorPresentationState(data_021052fc, 2);
    return 0;
}
