#include "tingle/game_phase_script_vm.h"

/* Toggle a runtime scene mode and perform the recovered disable-side synchronization. */

typedef void (*RuntimeObjectToggleMethod)(void *self, s32 enabled);

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void GamePhaseRuntime_SetPlacementMode(void *runtime, s32 mode, s32 synchronize);
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void func_0202d68c(void *object, s32 enabled);
#ifdef __cplusplus
}
#endif

/*
 * Pop a mode flag and configure the runtime.  Nonzero selects mode 1.  Zero
 * selects mode 0, enables collection 2, and invokes virtual slot 0x54 with
 * zero on the object reached through runtime offsets 0x2fb8 and 0x2ebc.
 * Return zero.
 */
s32 func_0201af00(GamePhaseActorScriptVm *self)
{
    s32 enabled = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *runtime = (u8 *)data_021052fc;

    if (enabled != 0) {
        GamePhaseRuntime_SetPlacementMode(runtime, 1, 1);
    } else {
        u8 *owner;
        void *object;
        void **vtable;

        GamePhaseRuntime_SetPlacementMode(runtime, 0, 1);
        func_0202d68c(GamePhaseRuntime_GetActorCollection(runtime, 2), 1);
        owner = *(u8 **)(runtime + 0x2fb8);
        object = *(void **)(owner + 0x2ebc);
        vtable = *(void ***)object;
        ((RuntimeObjectToggleMethod)vtable[0x54 / 4])(object, 0);
    }
    return 0;
}
