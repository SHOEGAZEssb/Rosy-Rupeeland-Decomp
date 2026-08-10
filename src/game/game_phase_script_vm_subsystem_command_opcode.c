#include "tingle/game_phase_script_vm.h"

/* Dispatch commands and queries against the singleton returned by func_02027f94. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02027f94(void);
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
 * operations; query commands push their integer or normalized Boolean result,
 * while command 5 pushes singleton word 0 directly.  Unsupported commands do
 * nothing.  Return zero.
 */
s32 func_02019dd4(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *state;
    switch (command) {
    case 1:
        GamePhaseScriptVm_SetResult(&self->base, (u32)func_02027818(func_02027f94(), value));
        break;
    case 2:
        func_02027864(func_02027f94(), value);
        break;
    case 3:
        func_020278b4(func_02027f94(), value);
        break;
    case 4:
        func_02027e94(func_02027f94(), value);
        break;
    case 5:
        state = func_02027f94();
        GamePhaseScriptVm_SetResult(&self->base, *(u32 *)state);
        break;
    case 6:
        GamePhaseScriptVm_SetResult(&self->base, (u32)func_02027828(func_02027f94(), value));
        break;
    case 7:
        func_02027e08(func_02027f94(), value);
        break;
    case 8:
        GamePhaseScriptVm_SetResult(&self->base, func_02027d14(func_02027f94()) != 0);
        break;
    case 9:
        func_02027c34(func_02027f94());
        break;
    case 10:
        GamePhaseScriptVm_SetResult(&self->base, (u32)func_02027e8c(func_02027f94()));
        break;
    case 11:
        GamePhaseScriptVm_SetResult(&self->base, (u32)func_02027eac(func_02027f94()));
        break;
    case 12:
        func_02027ea4(func_02027f94(), value);
        break;
    case 13:
        GamePhaseScriptVm_SetResult(&self->base, func_02027df0(func_02027f94()) != 0);
        break;
    }
    return 0;
}
