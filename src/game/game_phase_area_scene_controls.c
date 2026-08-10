#include "tingle/game_phase_area_scene.h"

/* Restore sub-screen graphics state and enable or disable area-scene rendering. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GX_SetBankForSubBG(s32 bank);
extern void GXS_SetGraphicsMode(s32 mode);
extern void func_020aea7c(s32 value);
extern void ActorCollection_SetEnabled(void *renderer, s32 enabled);
extern s32 func_0202844c(GamePhaseAreaSceneConfig *config);
extern void func_ov056_0220ee78(void *object);
extern void func_ov056_0220ee20(void *object, s32 enabled);
#ifdef __cplusplus
}
#endif

typedef void (*AreaControlVirtual)(void *self, s32 value);
typedef void (*AreaControlNoArgs)(void *self);

static void callVirtual(void *object, u32 offset, s32 value)
{
    AreaControlVirtual method =
        *(AreaControlVirtual *)(*(u8 **)object + offset);
    method(object, value);
}

/*
 * Restore sub-BG bank 4 and graphics mode 0, enable/update/draw the optional
 * sub-renderer through virtual methods 0x20/0x08/0x1c, restore the optional
 * overlay object and BG priorities 3/2, then enable the whole area scene via
 * GamePhaseAreaScene_SetEnabled. Directly changes sub-engine VRAM and BG
 * control hardware.
 */
void GamePhaseAreaScene_RestoreSubDisplay(GamePhaseAreaScene *self)
{
    GX_SetBankForSubBG(4);
    func_020aea7c(0x80);
    GXS_SetGraphicsMode(0);
    if (self->subRenderer) {
        callVirtual(self->subRenderer, 0x20, 1);
        (*(AreaControlNoArgs *)(*(u8 **)self->subRenderer + 8))(
            self->subRenderer);
        (*(AreaControlNoArgs *)(*(u8 **)self->subRenderer + 0x1c))(
            self->subRenderer);
    }
    if (self->overlayObject) {
        volatile u16 *subBg0 = (volatile u16 *)0x0400100c;
        func_ov056_0220ee78(self->overlayObject);
        *subBg0 = (u16)((*subBg0 & ~3) | 3);
        subBg0[1] = (u16)((subBg0[1] & ~3) | 2);
    }
    GamePhaseAreaScene_SetEnabled(self, 1);
}

/*
 * Propagate enabled to the embedded renderer, sub-renderer virtual method
 * 0x24, optional overlay, and secondaryActor virtual method 0x54. Config modes
 * 0/3 use the caller value but pass zero to secondaryActor; other modes only
 * force an enabled state when config flags bit 17 and func_0202844c both permit
 * it, otherwise all consumers receive zero. StateFlags bit 5 records the final
 * state. No value is returned; renderer/overlay state changes.
 */
void GamePhaseAreaScene_SetEnabled(GamePhaseAreaScene *self, s32 enabled)
{
    u32 mode = (self->config->flags >> 18) & 3;
    s32 finalEnabled;
    s32 secondaryActorValue;
    if (mode == 0 || mode == 3) {
        finalEnabled = enabled;
        secondaryActorValue = 0;
    } else if (enabled && (self->config->flags & 0x20000) &&
               func_0202844c(self->config)) {
        finalEnabled = 1;
        secondaryActorValue = 1;
    } else {
        finalEnabled = 0;
        secondaryActorValue = 0;
    }
    ActorCollection_SetEnabled(self->actorCollectionStorage, finalEnabled);
    if (self->subRenderer)
        callVirtual(self->subRenderer, 0x24, finalEnabled);
    if (self->overlayObject)
        func_ov056_0220ee20(self->overlayObject, finalEnabled);
    callVirtual(self->secondaryActor, 0x54, secondaryActorValue);
    self->stateFlags =
        (self->stateFlags & ~0x20) |
        ((finalEnabled & 1) << 5);
}

/* Return the retained address-derived area-scene config pointer. */
GamePhaseAreaSceneConfig *GamePhaseAreaScene_GetConfig(GamePhaseAreaScene *self)
{
    return self->config;
}
