#include "tingle/game_phase_script_vm.h"
#include "tingle/game_phase_load_scene.h"
#include "tingle/heap.h"
#include "tingle/vec_fx32.h"

/* Dispatch the second large actor-script command family for runtime scenes, effects, flags, and queries. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern u8 data_021f3d68[];
extern const char data_020d5b3c[], data_020d5b44[], data_020d5b4c[];
extern const char data_020d5b54[], data_020d5b5c[], data_020d5b64[];
extern const char data_020d5b6c[], data_020d5b74[], data_020d5b7c[];
extern const char data_020d5b84[], data_020d5b8c[];
extern void OS_Halt(void);
extern void *ActorMotionAreaFollower_GetPosition(...);
extern void *ActorCollection_FindActorByRuntimeId(...);
extern void *Actor_GetOwningCollection(...);
extern void *Overlay032Scene_Init(...);
extern void *func_0209d774(...);
extern void *func_0209f2f8(...);
extern void *func_0209fd50(...);
extern void *func_020a042c(...);
extern void *OverlayWorkerPresentation_Init(...);
extern void *Overlay52Scene_Init(...);
extern void *Overlay34RuntimeScene_Init(...);
extern void RuntimePresentationManager_AppendFirstListEffect(...);
extern u8 *RuntimeRecordTable_FindByKey(...);
#ifdef __cplusplus
}
#endif

static void *allocCommandObject(u32 size, const char *tag)
{
    return Heap_Alloc(size, tag, 4, &gHeapContext);
}

/*
 * Pop a parameter and selector, dispatch selectors 0..82, and return zero.
 * Confirmed paths create runtime scenes/effects, register an effect relative
 * to the active actor, modify actor presentation flags, or store queried data as the VM result.
 * Unsupported selectors halt. Most simple selectors map to a kind passed with
 * the parameter to a 0x9c-byte GamePhaseLoadScene object. Selector 18 reaches that
 * path with the incoming r7 value in retail; portable C uses zero while the
 * matching assembly preserves the register-dependent behavior. The confirmed
 * phase-90 bootstrap bytecode uses selector 5 with parameter zero: it maps to
 * load-scene kind 16, the retail overlay-25 title/menu scene request.
 */
s32 GamePhaseActorScriptVm_DispatchRuntimeCommand(GamePhaseActorScriptVm *self)
{
    u32 parameter = GamePhaseScriptVm_Pop(&self->base);
    u32 selector = GamePhaseScriptVm_Pop(&self->base);
    u32 kind = 0;
    void *commandObject;

    switch (selector) {
    case 1: kind = 2; break;
    case 3: kind = 5; break;
    case 4: kind = 6; break;
    case 5: kind = 16; break; /* Phase 90 actor bytecode -> overlay 25. */
    case 8: kind = 1; break;
    case 10: kind = 8; break;
    case 12: kind = 13; break;
    case 13: kind = 10; break;
    case 14: kind = 11; break;
    case 17: kind = 12; break;
    case 18: break; /* Retail forwards the incoming r7 register. */
    case 20: kind = 15; break;
    case 22: kind = 17; break;
    case 23: kind = 19; break;
    case 24: kind = 18; break;
    case 25: kind = 20; break;
    case 29: kind = 21; break;
    case 30: kind = 22; break;
    case 38: kind = 23; break;
    case 39: kind = 24; break;
    case 40: kind = 25; break;

    case 21:
        commandObject = allocCommandObject(0x30, data_020d5b3c);
        if (commandObject != 0)
            Overlay032Scene_Init(commandObject);
        return 0;
    case 60:
    case 64:
        commandObject = allocCommandObject(0x38,
            selector == 60 ? data_020d5b44 : data_020d5b4c);
        if (commandObject != 0)
            func_0209d774(commandObject, selector == 60 ? 1 : 2);
        return 0;
    case 61:
    case 65:
        commandObject = allocCommandObject(0x38, data_020d5b54);
        if (commandObject != 0)
            func_0209f2f8(commandObject, 1);
        return 0;
    case 62:
    case 66:
        commandObject = allocCommandObject(0x5c,
            selector == 62 ? data_020d5b5c : data_020d5b64);
        if (commandObject != 0)
            func_0209fd50(commandObject, selector == 62 ? 1 : 2);
        return 0;
    case 80:
    case 81:
    case 82:
        commandObject = allocCommandObject(0x58, data_020d5b6c);
        if (commandObject != 0)
            func_020a042c(commandObject, 1);
        return 0;

    case 11: {
        u8 *runtime = (u8 *)gGamePhaseRuntime;
        u8 *actor = *(u8 **)(runtime + 0x2ea4);
        VecFx32Object position;
        s32 effectX, effectY;
        VecFx32Object_InitCopy(&position,
                      (const VecFx32Object *)ActorMotionAreaFollower_GetPosition(runtime + 0x2fbc));
        effectX = (*(s32 *)(actor + 0x1c) >> 12) - (position.value.y >> 12);
        effectY = (*(s32 *)(actor + 0x20) >> 12) - (*(s32 *)(actor + 0x24) >> 12)
            - (position.value.z >> 12) - 16;
        commandObject = allocCommandObject(0x1c, data_020d5b74);
        if (commandObject != 0)
            commandObject = OverlayWorkerPresentation_Init(
                commandObject, parameter, effectX, effectY, 30);
        RuntimePresentationManager_AppendFirstListEffect(runtime + 0x2f7c, commandObject);
        VecFx32Object_Destroy(&position);
        return 0;
    }
    case 15:
        commandObject = allocCommandObject(0x2c, data_020d5b7c);
        if (commandObject != 0)
            Overlay52Scene_Init(commandObject, parameter);
        return 0;
    case 26:
        *(u16 *)((u8 *)*(void **)((u8 *)self->actor + 0x54) + 0x24)
            |= (u16)parameter;
        return 0;
    case 27:
        *(u16 *)((u8 *)*(void **)((u8 *)self->actor + 0x54) + 0x24)
            &= (u16)~parameter;
        return 0;
    case 31:
    case 32:
    case 33: {
        u8 *actor = (u8 *)ActorCollection_FindActorByRuntimeId(Actor_GetOwningCollection(self->actor),
                                        parameter);
        u8 *presentation = actor != 0 ? *(u8 **)(actor + 0x54) : 0;
        if (presentation != 0) {
            u32 offset = selector == 31 ? 0x14 : selector == 32 ? 0x18 : 0x1c;
            GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
                          *(u32 *)(*(u8 **)(presentation + offset) + 0x10));
        }
        return 0;
    }
    case 34:
        commandObject = allocCommandObject(0x38, data_020d5b84);
        if (commandObject != 0)
            Overlay34RuntimeScene_Init(commandObject);
        return 0;
    case 35:
    case 36:
    case 37: {
        u8 *record = RuntimeRecordTable_FindByKey(data_021f3d68, parameter);
        if (selector == 35)
            GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, *(u16 *)(record + 0x12));
        else if (selector == 36)
            GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, *(u16 *)(record + 0x14));
        else
            GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, *(u16 *)(record + 0x10) & 0xff);
        return 0;
    }
    default:
        OS_Halt();
        return 0;
    }

    commandObject = allocCommandObject(0x9c, data_020d5b8c);
    if (commandObject != 0)
        GamePhaseLoadScene_Init((GamePhaseLoadScene *)commandObject, kind, parameter);
    return 0;
}
