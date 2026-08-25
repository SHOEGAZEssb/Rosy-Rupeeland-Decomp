#include "tingle/debug_hud_state.h"
#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes that feed the recovered debug/UI subsystem. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GamePhaseActorScriptVm_UpdateOverlay60SpritePresentation(
    GamePhaseActorScriptVm *self);
extern void *Actor_GetOwningCollection(void *actor);
extern void *LanguageDatabase_GetRecordByIdIgnoringCollectionMode(
    u32 mode, u32 value);
extern void *DisplayRouting_MatchesRequest(u32 value);
extern void GamePhaseActorScriptVm_CreateOverlay60PresentationObject(
    GamePhaseActorScriptVm *self, u32 first, u32 second, u32 third,
    s32 fourth, s32 fifth);
#ifdef __cplusplus
}
#endif

/*
 * Pop and discard two operands, then pop lookup and value operands. Let
 * the overlay-60 sprite helper consume/update VM-side state, resolve the value through the
 * bound collection's mode at 0x2e84 and the lookup through DisplayRouting_MatchesRequest,
 * refresh the global debug-HUD rectangle, and open the HUD with font reset
 * enabled. Returns one to stop the VM loop.
 */
s32 GamePhaseActorScriptVm_OpenDebugHudFromCollectionMode(GamePhaseActorScriptVm *self)
{
    void *displayRoute;
    void *hudResource;
    DebugHudState *debugHud;
    (void)GamePhaseScriptVm_Pop(&self->base);
    (void)GamePhaseScriptVm_Pop(&self->base);
    {
        u32 lookup = GamePhaseScriptVm_Pop(&self->base);
        u32 value = GamePhaseScriptVm_Pop(&self->base);
        u8 *collection;
        GamePhaseActorScriptVm_UpdateOverlay60SpritePresentation(self);
        collection = (u8 *)Actor_GetOwningCollection(self->actor);
        hudResource = LanguageDatabase_GetRecordByIdIgnoringCollectionMode(
            *(u32 *)(collection + 0x2e84), value);
        displayRoute = DisplayRouting_MatchesRequest(lookup);
    }
    debugHud = DebugHudState_GetGlobal();
    DebugHudState_RefreshRectangle(debugHud);
    debugHud = DebugHudState_GetGlobal();
    DebugHudState_Open(debugHud, (s32)displayRoute, hudResource, 1);
    return 1;
}

/*
 * Submit the fixed ID tuple 0x136f/0x1370/0x1371 and values 0x79/0x7a to
 * the overlay-60 presentation factory for this VM, then return zero.
 */
s32 GamePhaseActorScriptVm_CreateOverlay60PresentationPreset136f(GamePhaseActorScriptVm *self)
{
    GamePhaseActorScriptVm_CreateOverlay60PresentationObject(
        self, 0x136f, 0x1370, 0x1371, 0x79, 0x7a);
    return 0;
}

/*
 * Submit the fixed ID tuple 0x1372/0x1373/0x1374 and two -1 values to
 * the overlay-60 presentation factory for this VM, then return zero.
 */
s32 GamePhaseActorScriptVm_CreateOverlay60PresentationPreset1372(GamePhaseActorScriptVm *self)
{
    GamePhaseActorScriptVm_CreateOverlay60PresentationObject(
        self, 0x1372, 0x1373, 0x1374, -1, -1);
    return 0;
}
