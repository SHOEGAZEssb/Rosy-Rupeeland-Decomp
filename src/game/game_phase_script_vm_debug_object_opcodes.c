#include "tingle/debug_hud_state.h"
#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"

/* Implement actor-script opcodes that create or bind recovered debug/UI objects. */

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_020d5b2c[];
extern u8 data_021f3ecc[];
extern void *Actor_GetOwningCollection(void *actor);
extern void *LanguageDatabase_GetRecordByIdIgnoringCollectionMode(
    u32 mode, u32 value);
extern void *DisplayRouting_MatchesRequest(u32 value);
extern void GamePhaseActorScriptVm_UpdateOverlay60SpritePresentation(
    GamePhaseActorScriptVm *self);
extern void *LanguageLookupDatabase_GetResourceById(void *state, u16 value);
extern void func_ov061_0220fd20(void *allocation, void *first,
                               void *second, u32 third);
#ifdef __cplusplus
}
#endif

/*
 * Pop third, second, and first operands. Resolve first through the bound
 * collection mode and second through DisplayRouting_MatchesRequest, load overlay 61 (0x3d)
 * in slot 2, allocate 0x3c bytes, and initialize it through the common
 * overlay-59..74 entry point with the third operand. Returns zero.
 */
s32 GamePhaseActorScriptVm_CreateOverlay61DebugObject(GamePhaseActorScriptVm *self)
{
    u32 overlayArgument = GamePhaseScriptVm_Pop(&self->base);
    u32 displayLookup = GamePhaseScriptVm_Pop(&self->base);
    u32 collectionModeValue = GamePhaseScriptVm_Pop(&self->base);
    u8 *collection = (u8 *)Actor_GetOwningCollection(self->actor);
    void *hudResource = LanguageDatabase_GetRecordByIdIgnoringCollectionMode(
        *(u32 *)(collection + 0x2e84), collectionModeValue);
    void *displayRoute = DisplayRouting_MatchesRequest(displayLookup);
    void *debugObjectStorage;
    OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3d);
    debugObjectStorage = Heap_Alloc(0x3c, data_020d5b2c, 4, &gHeapContext);
    if (debugObjectStorage != 0)
        func_ov061_0220fd20(debugObjectStorage, displayRoute, hudResource,
                           overlayArgument);
    return 0;
}

/*
 * Pop and discard two operands, pop lookup and table operands, update VM-side
 * state through the overlay-60 sprite helper, resolve the table operand through
 * data_021f3ecc/LanguageLookupDatabase_GetResourceById and the lookup through DisplayRouting_MatchesRequest, then feed
 * both to the recovered debug-state chain with enabled=1. Returns zero.
 */
s32 GamePhaseActorScriptVm_OpenDebugHudFromLookupTables(GamePhaseActorScriptVm *self)
{
    void *displayRoute;
    void *hudResource;
    DebugHudState *debugHud;
    (void)GamePhaseScriptVm_Pop(&self->base);
    (void)GamePhaseScriptVm_Pop(&self->base);
    {
        u32 lookup = GamePhaseScriptVm_Pop(&self->base);
        u32 tableValue = GamePhaseScriptVm_Pop(&self->base);
        GamePhaseActorScriptVm_UpdateOverlay60SpritePresentation(self);
        hudResource = LanguageLookupDatabase_GetResourceById(
            data_021f3ecc, (u16)tableValue);
        displayRoute = DisplayRouting_MatchesRequest(lookup);
    }
    debugHud = DebugHudState_GetGlobal();
    DebugHudState_RefreshRectangle(debugHud);
    debugHud = DebugHudState_GetGlobal();
    DebugHudState_Open(debugHud, (s32)displayRoute, hudResource, 1);
    return 0;
}
