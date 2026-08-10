#include "tingle/game_phase_script_vm.h"

/* Query readiness and three signed fields of the active runtime manager. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *gSceneManager;
extern void *SceneManager_GetCurrent(void *manager);
extern s32 ActorDerivedType1_IsIdleEligible(void *manager);
#ifdef __cplusplus
}
#endif

/*
 * Pop query mode.  Modes 0/1 test recovered manager flags/activity, mode 2
 * evaluates the confirmed multi-field readiness predicate (unless scene type
 * 2 is active), and modes 3..5 return signed manager fields 0x294..0x298.
 * Unsupported modes push zero.  Return zero.
 */
s32 func_02019c60(GamePhaseActorScriptVm *self)
{
    s32 mode = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *manager = *(u8 **)((u8 *)data_021052fc + 0x2ea4);
    s32 result = 0;
    switch (mode) {
    case 0:
        result = (*(u32 *)(manager + 0x230) & 0x800) != 0;
        break;
    case 1:
        if (*(s32 *)((u8 *)SceneManager_GetCurrent(gSceneManager) + 4) != 2)
            result = ActorDerivedType1_IsIdleEligible(manager) != 0;
        break;
    case 2:
        if (*(s32 *)((u8 *)SceneManager_GetCurrent(gSceneManager) + 4) != 2) {
            u32 flags = *(u32 *)(manager + 0xd0);
            s32 baseReady = !(flags & 0x100)
                && !(flags & 0x10000)
                && !(*(u32 *)(manager + 0x230) & 0x980000);
            result = baseReady
                && *(s32 *)(manager + 0x270) == 0
                && !(flags & 0x10)
                && *(s32 *)(manager + 0x24) == *(s32 *)(manager + 0x1dc)
                && *(s16 *)(manager + 0x268) == 0
                && !(flags & 0x4000);
        }
        break;
    case 3:
        result = *(s16 *)(manager + 0x294);
        break;
    case 4:
        result = *(s16 *)(manager + 0x296);
        break;
    case 5:
        result = *(s16 *)(manager + 0x298);
        break;
    }
    GamePhaseScriptVm_SetResult(&self->base, (u32)result);
    return 0;
}
