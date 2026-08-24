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
extern void *func_0201da20(u32 mode, u32 value);
extern void *DisplayRouting_MatchesRequest(u32 value);
extern void func_0201da34(GamePhaseActorScriptVm *self);
extern void *LanguageLookupDatabase_GetResourceById(void *state, u16 value);
extern void *DebugHudState_GetGlobal(void *value);
extern void *DebugHudState_RefreshRectangle(void *value);
extern void DebugHudState_Open(void *state, void *first, void *second, u32 enabled);
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
    u32 third = GamePhaseScriptVm_Pop(&self->base);
    u32 secondValue = GamePhaseScriptVm_Pop(&self->base);
    u32 firstValue = GamePhaseScriptVm_Pop(&self->base);
    u8 *collection = (u8 *)Actor_GetOwningCollection(self->actor);
    void *second = func_0201da20(*(u32 *)(collection + 0x2e84), firstValue);
    void *first = DisplayRouting_MatchesRequest(secondValue);
    void *allocation;
    OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3d);
    allocation = Heap_Alloc(0x3c, data_020d5b2c, 4, &gHeapContext);
    if (allocation != 0)
        func_ov061_0220fd20(allocation, first, second, third);
    return 0;
}

/*
 * Pop and discard two operands, pop lookup and table operands, update VM-side
 * state through func_0201da34, resolve the table operand through
 * data_021f3ecc/LanguageLookupDatabase_GetResourceById and the lookup through DisplayRouting_MatchesRequest, then feed
 * both to the recovered debug-state chain with enabled=1. Returns zero.
 */
s32 GamePhaseActorScriptVm_OpenDebugHudFromLookupTables(GamePhaseActorScriptVm *self)
{
    void *first;
    void *second;
    void *state;
    (void)GamePhaseScriptVm_Pop(&self->base);
    (void)GamePhaseScriptVm_Pop(&self->base);
    {
        u32 lookup = GamePhaseScriptVm_Pop(&self->base);
        u32 tableValue = GamePhaseScriptVm_Pop(&self->base);
        func_0201da34(self);
        second = LanguageLookupDatabase_GetResourceById(data_021f3ecc, (u16)tableValue);
        first = DisplayRouting_MatchesRequest(lookup);
    }
    state = DebugHudState_GetGlobal(first);
    state = DebugHudState_RefreshRectangle(state);
    state = DebugHudState_GetGlobal(state);
    DebugHudState_Open(state, first, second, 1);
    return 0;
}
