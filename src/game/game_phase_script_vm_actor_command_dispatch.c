#include "tingle/game_phase_script_vm.h"
#include "tingle/game_work.h"
#include "tingle/graphics_3d_presentation.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/vec_fx32.h"

/* Dispatch the large actor-script command family that creates and controls effects. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern const char data_020d5b34[];
extern const char data_020d5b2c[];
extern void *data_ov054_0220f160;
extern void OS_Halt(void);
extern void *ActorMotionAreaFollower_GetPosition(...);
extern void *GamePhaseRuntime_GetActorCollection(...);
extern void *ActorCollection_FindActorByRuntimeId(...);
extern void *Actor_GetOwningCollection(...);
extern void *ActorCollection_GetSpriteGroup(...);
extern u32 *ActorRuntimeTriple_Assign(void *object, u32 first, u32 second, u32 third);
extern void *TimedSpriteBurstManager_Init(...);
extern void *func_02022cb0(...);
extern void *func_02022ff4(...);
extern void *AuxiliaryTimedSpritePresentation_Init(...);
extern void *func_02025300(...);
extern void *func_02023434(...);
extern void *func_02024b04(...);
extern void *func_0201d240(...);
extern void *func_ov054_0220e9bc(...);
extern void *func_ov054_0220ef80(...);
extern void *RuntimePresentationManager_GetFirstListNodeEffect(...);
extern void *RuntimePresentationManager_GetSecondListNodeEffect(...);
extern void *func_ov054_0220ef78(...);
extern void *func_ov073_02210710(...);
extern void RuntimePresentationManager_AppendFirstListEffect(...);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(...);
extern void func_02028630(...);
extern u32 DirectSpriteTrackPresentation_SpawnAndRegister(...);
extern void func_02023ed4(...);
extern void func_02028814(...);
extern void func_0202906c(...);
extern u32 func_020beb18(s32 value);
extern u32 func_020be8c0(u32 first, u32 second);
extern u32 func_020beb6c(u32 first, u32 second);
extern s32 func_020beae4(u32 value);
extern u32 genrand_int32(void);
extern u32 func_020bf1f8(u32 value, u32 divisor);
extern void func_ov055_0220ef6c(void);
extern void func_ov065_022101bc(...);
extern void func_ov050_0220e1a0(...);
extern void func_ov051_0220daa4(...);
extern void func_ov051_0220dd90(...);
extern void func_ov057_0220e558(void);
extern void func_ov053_0220da0c(u16 value);
#ifdef __cplusplus
}
#endif

/* Return the global runtime's presentation manager at confirmed offset 0x2f7c. */
static void *getScriptPresentationManager(void)
{
    return (u8 *)data_021052fc + 0x2f7c;
}

/* Resolve the global runtime context stored through the object at offset 0x2fbc. */
static void *getScriptEffectContext(void)
{
    return ActorMotionAreaFollower_GetPosition((u8 *)data_021052fc + 0x2fbc);
}

/* Return the presentation manager's borrowed 3D presentation. */
static Graphics3dPresentation *getScriptGraphics3dPresentation(void)
{
    return (Graphics3dPresentation *)
        RuntimePresentationManager_GetGraphics3dPresentation(
            getScriptPresentationManager());
}

/*
 * Mirror the retail integer/fx32/float conversion sequence used by command
 * cases 8-10 and 28. The helpers' exact SDK names are not yet confirmed.
 */
static s32 convertEffectOperand(s32 value)
{
    u32 converted = func_020beb18(value << 12);
    if (value > 0)
        converted = func_020be8c0(0x3f000000, converted);
    else
        converted = func_020beb6c(converted, 0x3f000000);
    return func_020beae4(converted);
}

/* Add an allocated or null field effect to the manager, matching retail behavior. */
static void addScriptFieldEffect(void *effect)
{
    RuntimePresentationManager_AppendFirstListEffect(
        getScriptPresentationManager(), effect);
}

/*
 * Pop six operands and a selector, first store zero as the default script
 * result, then dispatch selectors 1-38. Cases 0, 2, and out-of-range halt;
 * case 5 is a no-op. The remaining confirmed cases allocate/register gameplay
 * objects, call manager commands, load overlays, query or bind actors, and
 * occasionally replace the default VM result. Every path returns one so
 * the VM stops dispatching after this command. Address-derived helper names
 * and numeric selectors are preserved because semantic command names are not
 * yet proven.
 */
s32 func_020143a8(GamePhaseActorScriptVm *self)
{
    u32 a6 = GamePhaseScriptVm_Pop(&self->base);
    u32 a5 = GamePhaseScriptVm_Pop(&self->base);
    u32 a4 = GamePhaseScriptVm_Pop(&self->base);
    u32 a3 = GamePhaseScriptVm_Pop(&self->base);
    u32 a2 = GamePhaseScriptVm_Pop(&self->base);
    u32 a1 = GamePhaseScriptVm_Pop(&self->base);
    u32 selector = GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor;
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, 0);

    switch (selector) {
    case 1: {
        s32 tileY = (*(s32 *)(actor + 0x20) >> 12) / 16;
        s32 tileX = (*(s32 *)(actor + 0x1c) >> 12) / 16;
        u32 rect[4];
        void *object;
        RectS32_Set(rect, tileX - 4, tileY - 4, tileX + 4, tileY + 4);
        object = Heap_Alloc(0x28, data_020d5b34, 4, &gHeapContext);
        if (object != 0)
            object = TimedSpriteBurstManager_Init(object, rect, a2, a3, a4);
        addScriptFieldEffect(object);
        break;
    }
    case 3: {
        void *object = Heap_Alloc(0x44, data_020d5b34, 4, &gHeapContext);
        if (object != 0)
            object = func_02022cb0(object, getScriptEffectContext(),
                                   *(void **)((u8 *)data_021052fc + 0x2ea4),
                                   a1, 0x2000, -0xc0);
        addScriptFieldEffect(object);
        break;
    }
    case 4: {
        void *object = Heap_Alloc(0x54, data_020d5b34, 4, &gHeapContext);
        if (object != 0)
            object = func_02022ff4(object, getScriptEffectContext(),
                                   *(void **)((u8 *)data_021052fc + 0x2ea4),
                                   a1, a2, a3, 0x2000, -0xc0);
        addScriptFieldEffect(object);
        break;
    }
    case 5:
        break;
    case 6:
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 1, 0x37);
        func_ov055_0220ef6c();
        break;
    case 7: {
        VecFx32Object position;
        void *object;
        VecFx32Object_Init(&position);
        if (a6 != 0)
            ActorRuntimeTriple_Assign(&position, *(s32 *)(actor + 0x10c) << 12,
                          *(s32 *)(actor + 0x110) << 12,
                          *(s32 *)(actor + 0x114) << 12);
        else
            VecFx32Object_Assign(&position, (VecFx32Object *)(actor + 0x18));
        object = Heap_Alloc(0x14, data_020d5b34, 4, &gHeapContext);
        if (object != 0)
            AuxiliaryTimedSpritePresentation_Init(object, &position,
                          ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor)), a1,
                          a2, a3, a4, a5, -1, 1);
        VecFx32Object_Destroy(&position);
        break;
    }
    case 8: {
        VecFx32Object vector;
        void *object;
        VecFx32Object_InitComponents(&vector, convertEffectOperand((s32)a2),
                      convertEffectOperand((s32)a3),
                      convertEffectOperand((s32)a4));
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x41);
        object = Heap_Alloc(0x160, data_020d5b2c, 4, &gHeapContext);
        if (object != 0)
            func_ov065_022101bc(
                object, a1,
                (u8 *)*(void **)((u8 *)data_021052fc + 0x2ea4) + 0x18,
                &vector, convertEffectOperand((s32)a5),
                convertEffectOperand((s32)a6));
        VecFx32Object_Destroy(&vector);
        break;
    }
    case 9: {
        VecFx32Object vector;
        void *object;
        VecFx32Object_InitComponents(&vector, convertEffectOperand((s32)a1),
                      convertEffectOperand((s32)a2),
                      convertEffectOperand((s32)a3));
        object = Heap_Alloc(0x38, data_020d5b34, 4, &gHeapContext);
        if (object != 0)
            object = func_02025300(
                object, &vector, ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor)),
                (s16)a4, 1, 0);
        addScriptFieldEffect(object);
        VecFx32Object_Destroy(&vector);
        break;
    }
    case 10:
    case 28: {
        VecFx32Object firstVector;
        VecFx32Object secondVector;
        void *object;
        VecFx32Object_InitComponents(&firstVector, convertEffectOperand((s32)a1),
                      convertEffectOperand((s32)a2),
                      convertEffectOperand((s32)a3));
        VecFx32Object_InitComponents(&secondVector, convertEffectOperand((s32)a4),
                      convertEffectOperand((s32)a5),
                      convertEffectOperand((s32)a6));
        object = Heap_Alloc(0x24, data_020d5b34, 4, &gHeapContext);
        if (object != 0) {
            s16 variant = (s16)(func_020bf1f8(genrand_int32(), 3) + 0x28);
            object = func_02023434(
                object, ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor)),
                &firstVector, &secondVector, variant, selector == 10);
        }
        addScriptFieldEffect(object);
        VecFx32Object_Destroy(&secondVector);
        VecFx32Object_Destroy(&firstVector);
        break;
    }
    case 11:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
                      Graphics3dPresentation_CreatePreset1To2SpriteEffectInBounds(getScriptGraphics3dPresentation(), a1, a2, a3,
                                    a4, a5, 0x46));
        break;
    case 12:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
                      Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds(getScriptGraphics3dPresentation(), a1, a2, a3,
                                    a4, a5, 0x46));
        break;
    case 13:
        Graphics3dPresentation_SetPairedEntryModeAt(
            getScriptGraphics3dPresentation(), a1, a2, a3);
        break;
    case 14:
        Graphics3dPresentation_CreatePresetSpriteEffectInBounds(getScriptGraphics3dPresentation(), a1, a6, a2, a3, a4, a5);
        break;
    case 15:
        Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt(getScriptGraphics3dPresentation(), a1, a2, a3, a4);
        break;
    case 16:
        Graphics3dPresentation_CreatePreset11To13SpriteEffectAt(getScriptGraphics3dPresentation(), a1, a2, a3);
        break;
    case 17:
        Graphics3dPresentation_SetRupeeVisibleAt(getScriptGraphics3dPresentation(), a1, a2, a3);
        break;
    case 18:
        Graphics3dPresentation_RemoveSpriteEffect(getScriptGraphics3dPresentation(), a1);
        break;
    case 19: {
        void *object = Heap_Alloc(0x58, data_020d5b34, 4, &gHeapContext);
        if (object != 0)
            object = func_02024b04(object, getScriptEffectContext(), actor,
                                   a1, a2, a3);
        addScriptFieldEffect(object);
        break;
    }
    case 20: {
        VecFx32Object position;
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 0, 0x32);
        VecFx32Object_InitComponents(&position, (s32)a1 << 12, (s32)a2 << 12, 0);
        func_ov050_0220e1a0(getScriptEffectContext(), &position, a3);
        VecFx32Object_Destroy(&position);
        break;
    }
    case 21:
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 0, 0x33);
        if (a1 == 0)
            func_ov051_0220daa4(a2, a3, a4);
        else
            func_ov051_0220dd90(a2, a3, a4);
        break;
    case 22:
        if (a1 == 0 || a1 == 1) {
            void *handle;
            u8 *effect;
            void *target;
            GameWork_SetFlag(gGameWork, 0x40a);
            OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 1, 0x36);
            handle = func_ov054_0220e9bc(
                (u8 *)*(void **)((u8 *)data_021052fc + 0x2ea4) + 0x18,
                getScriptEffectContext());
            effect = (u8 *)RuntimePresentationManager_GetSecondListNodeEffect(
                getScriptPresentationManager(), handle);
            target = ActorCollection_FindActorByRuntimeId(GamePhaseRuntime_GetActorCollection(data_021052fc, 1), a2);
            *(void **)(effect + 8) = (u8 *)target + 0x18;
            GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)handle);
        } else if (a1 == 2) {
            u8 *effect = (u8 *)RuntimePresentationManager_GetSecondListNodeEffect(
                getScriptPresentationManager(), a2);
            void *target = ActorCollection_FindActorByRuntimeId(
                GamePhaseRuntime_GetActorCollection(data_021052fc, 1), a3);
            *(void **)(effect + 8) = (u8 *)target + 0x18;
        }
        break;
    case 23:
        if (a1 == 1) {
            void *handle;
            u8 *sourceEffect;
            u8 *targetEffect;
            *(u16 *)((u8 *)gGameWork + 0x1a0) = (u16)a3;
            *(u16 *)((u8 *)gGameWork + 0x1a2) = (u16)a4;
            *(u16 *)((u8 *)gGameWork + 0x1a4) = (u16)a5;
            handle = func_ov054_0220ef80(getScriptEffectContext());
            sourceEffect = (u8 *)RuntimePresentationManager_GetFirstListNodeEffect(
                getScriptPresentationManager(), handle);
            targetEffect = (u8 *)RuntimePresentationManager_GetSecondListNodeEffect(
                getScriptPresentationManager(), a2);
            *(void **)(targetEffect + 8) = func_ov054_0220ef78(sourceEffect);
            GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)handle);
        } else if (a1 == 2) {
            GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, data_ov054_0220f160 != 0);
        }
        break;
    case 24:
        Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt(getScriptGraphics3dPresentation(), a1, a2, a3, a4);
        break;
    case 25:
        Graphics3dPresentation_CreatePreset32CenteredAreaSpriteEffect(getScriptGraphics3dPresentation(), a1, a2, a3, a4, a5);
        break;
    case 26:
        func_02028630(getScriptEffectContext());
        break;
    case 27:
        Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt(getScriptGraphics3dPresentation(), a1, a2, a3, a4);
        break;
    case 29:
        Graphics3dPresentation_CreatePreset22To24TimedPointSpriteEffectWithHorizontalVelocityAt(getScriptGraphics3dPresentation(), a1, a2, a3,
                      a4, a5, a6);
        break;
    case 30:
    case 33:
        GamePhaseScriptVm_StoreResultAndUpdateCondition(
            &self->base,
            DirectSpriteTrackPresentation_SpawnAndRegister(selector == 33, a1, a2, a3, a4, a5, a6,
                          0x100, *(u32 *)(actor + 0x110),
                          *(u32 *)(actor + 0x114)));
        break;
    case 31: {
        void *target = ActorCollection_FindActorByRuntimeId(GamePhaseRuntime_GetActorCollection(data_021052fc, 1), a5);
        void *object;
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x49);
        object = Heap_Alloc(0x1c, data_020d5b34, 4, &gHeapContext);
        if (object != 0)
            object = func_ov073_02210710(
                object, target, (s32)a1 << 12, (s32)a2 << 12,
                (s32)a3 << 12, 0x1642, 0x1640, 0x1643,
                (s16)a4, 1, a6);
        addScriptFieldEffect(object);
        break;
    }
    case 32:
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 1, 0x39);
        func_ov057_0220e558();
        break;
    case 34:
        func_02023ed4(a1, a2, a3, a4);
        break;
    case 35: {
        void *object = Heap_Alloc(0x44, data_020d5b2c, 4, &gHeapContext);
        if (object != 0)
            func_0201d240(object, 0, a1);
        break;
    }
    case 36:
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 0, 0x35);
        func_ov053_0220da0c((u16)a1);
        break;
    case 37:
        func_02028814();
        break;
    case 38:
        func_0202906c(getScriptEffectContext(), a1, a2, a3, a4, a5);
        break;
    case 0:
    case 2:
    default:
        OS_Halt();
        break;
    }
    return 1;
}
