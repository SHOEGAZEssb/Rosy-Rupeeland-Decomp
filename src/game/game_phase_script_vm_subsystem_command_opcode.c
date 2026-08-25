#include "tingle/game_phase_script_vm.h"

/* Dispatch commands and queries against the singleton returned by GamePhaseProgress_GetOrCreateGlobal. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseProgress_GetOrCreateGlobal(void);
extern s32 func_02027818(void *state, s32 value);
extern s32 func_02027828(void *state, s32 value);
extern void func_02027864(void *state, s32 value);
extern void func_020278b4(void *state, s32 value);
extern void func_02027c34(void *state);
extern s32 func_02027d14(void *state);
extern s32 func_02027df0(void *state);
extern void func_02027e08(void *state, s32 value);
extern s32 func_02027e8c(void *state);
extern void func_02027e94(void *state, s32 value);
extern void func_02027ea4(void *state, s32 value);
extern s32 func_02027eac(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Pop value and command.  Commands 1..13 route to recovered singleton
 * operations; query commands store their integer or normalized Boolean value
 * as the VM result, while command 5 stores singleton word 0 directly.  Unsupported commands do
 * nothing.  Return zero.
 */
s32 GamePhaseActorScriptVm_DispatchGamePhaseProgressCommand(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *progress;
    switch (command) {
    case 1:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)func_02027818(GamePhaseProgress_GetOrCreateGlobal(), value));
        break;
    case 2:
        func_02027864(GamePhaseProgress_GetOrCreateGlobal(), value);
        break;
    case 3:
        func_020278b4(GamePhaseProgress_GetOrCreateGlobal(), value);
        break;
    case 4:
        func_02027e94(GamePhaseProgress_GetOrCreateGlobal(), value);
        break;
    case 5:
        progress = GamePhaseProgress_GetOrCreateGlobal();
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
                                                         *(u32 *)progress);
        break;
    case 6:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)func_02027828(GamePhaseProgress_GetOrCreateGlobal(), value));
        break;
    case 7:
        func_02027e08(GamePhaseProgress_GetOrCreateGlobal(), value);
        break;
    case 8:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, func_02027d14(GamePhaseProgress_GetOrCreateGlobal()) != 0);
        break;
    case 9:
        func_02027c34(GamePhaseProgress_GetOrCreateGlobal());
        break;
    case 10:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)func_02027e8c(GamePhaseProgress_GetOrCreateGlobal()));
        break;
    case 11:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)func_02027eac(GamePhaseProgress_GetOrCreateGlobal()));
        break;
    case 12:
        func_02027ea4(GamePhaseProgress_GetOrCreateGlobal(), value);
        break;
    case 13:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, func_02027df0(GamePhaseProgress_GetOrCreateGlobal()) != 0);
        break;
    }
    return 0;
}
