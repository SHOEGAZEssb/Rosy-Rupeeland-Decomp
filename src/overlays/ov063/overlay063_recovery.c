#include "tingle/types.h"

/*
 * Recovered overlay 63 graphics-transition scene subsystem.
 *
 * This scene owns an optional scanline presentation controller, coordinates
 * actor and area presentation updates, applies sub-engine horizontal offsets
 * and brightness during HBlank, and commits the actor's requested area when
 * its transition finishes.  Address-derived fields remain offset based until
 * their wider types are established.
 */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void Scene_Init(void *);
extern "C" void Scene_Destroy(void *);
extern "C" void Scene_SetFlags03(void *);
extern "C" void Scene_ClearFlags03(void *);
extern "C" void GX_VBlankIntr(s32);
extern "C" void GX_HBlankIntr(s32);
extern "C" void GXS_SetGraphicsMode(s32);
extern "C" void GXx_SetMasterBrightness_(volatile void *, s32);
extern "C" void *Heap_Alloc(s32, const void *, s32, void *);
extern "C" void Heap_Free(void *);
extern "C" void *OverlayManager_GetGlobal(void);
extern "C" void OverlayManager_UnloadOverlay(void *, s32);
extern "C" void GameWork_SetFlag(void *, s32);
extern "C" void GameWork_ClearFlag(void *, s32);
extern "C" void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void *ActorMotionAreaFollower_GetPosition(void *);
extern "C" void GamePhaseState_UpdateRenderHelpers(void *);
extern "C" void GamePhaseAreaScene_Update(void *);
extern "C" void GamePhaseRuntime_PrepareActorCollections(void *, s32, s32);
extern "C" void GamePhaseRuntime_FinalizeActorCollections(void *, s32, s32);
extern "C" void GamePhaseRuntime_SynchronizeActorPlacement(void *, s32);
extern "C" void RuntimePresentationManager_Update(void *);
extern "C" void GamePhaseCurrencyHud_Update(void *);
extern "C" void *GamePhaseRuntime_GetActorCollection(void *, s32);
extern "C" void GamePhaseRuntime_StageAreaRequest(void *, s32, s32, s32,
                                                   s32, s32);
extern "C" void ActorCollection_UnregisterAndDestroyActor(void *, void *);
extern "C" void Sound_StopAllDirectSequences(void *, s32);
extern "C" void Sound_StopAllArchiveEffects(void *);
extern "C" void *func_020a6320(void *);
extern "C" void func_020a6390(void *);
extern "C" void func_020a681c(void *);
extern "C" void func_020a68dc(void *);
extern "C" void func_020a6940(void *);
extern "C" s32 func_020a6990(void *, s32, s32);
extern "C" void func_020a6aa8(void *, const void *, s32);

extern "C" void *data_021052fc;
extern "C" void *gGameWork;
extern "C" void *gHeapContext;
extern "C" void *gLupyContext;
extern "C" void *gSoundContext;
extern "C" u8 data_ov063_022105cc[];
extern "C" u8 data_ov063_022105dc[];
extern "C" u8 data_ov063_02210608[];

extern "C" void func_ov063_02210414(void *, s32);

typedef s32 (*Overlay63Method)(void *);
typedef void (*Overlay63RouteMethod)(void *, void *);

static s32 call_method(void *object, u32 offset)
{
    void *vtable = FIELD(void *, object, 0);
    Overlay63Method method = *(Overlay63Method *)((u8 *)vtable + offset);
    return method(object);
}

static void call_route_method(void *object, u32 offset, void *route)
{
    void *vtable = FIELD(void *, object, 0);
    Overlay63RouteMethod method =
        *(Overlay63RouteMethod *)((u8 *)vtable + offset);
    method(object, route);
}

/* Configure the sub-engine BG0 control register from the five ABI inputs. */
extern "C" void func_ov063_0220fd20(s32 screenBase, s32 priority,
                                     s32 charBase, s32 mosaic,
                                     s32 colorMode)
{
    volatile u16 *bg0cnt = (volatile u16 *)0x04001008;
    u32 value = *bg0cnt & 0x43;
    value |= (u32)screenBase << 14;
    value |= (u32)priority << 7;
    value |= (u32)charBase << 8;
    value |= (u32)mosaic << 2;
    value |= (u32)colorMode << 13;
    *bg0cnt = (u16)value;
}

/* Construct the scene and optionally allocate/configure its scanline state. */
extern "C" void *func_ov063_0220fd54(void *scene, void *actor, s32 enabled)
{
    u32 flags;
    void *controller;

    Scene_Init(scene);
    FIELD(void *, scene, 0) = data_ov063_022105dc;
    func_020a6940((u8 *)scene + 0x28);
    FIELD(void *, scene, 0x4c) = actor;

    flags = FIELD(u32, scene, 0x50) & 0xffff8001;
    FIELD(u32, scene, 0x50) = (flags | 0x8000) & 0xc000ffff;
    FIELD(u8, scene, 0x54) &= (u8)~3;
    FIELD(s32, scene, 4) = 0x16;

    GX_VBlankIntr(0);
    GX_HBlankIntr(0);
    FIELD(u32, scene, 0x50) &= ~1U;
    if (enabled) {
        controller = Heap_Alloc(0x4bc, data_ov063_02210608, 4,
                                gHeapContext);
        if (controller != 0) {
            controller = func_020a6320(controller);
        }
        FIELD(void *, scene, 0x24) = controller;
        func_020a68dc(controller);

        GXS_SetGraphicsMode(0);
        *(volatile u32 *)0x04001000 =
            (*(volatile u32 *)0x04001000 & ~0x1f00U) | 0x1100;
        func_ov063_0220fd20(0, 0, 0x1c, 0, 1);
        *(volatile u16 *)0x04001008 =
            (*(volatile u16 *)0x04001008 & (u16)~3) | 3;
        *(volatile u32 *)0x04001010 = 0;
    } else {
        FIELD(void *, scene, 0x24) = 0;
    }

    FIELD(u16, gGameWork, 0xf6) = 0;
    GameWork_SetFlag(gGameWork, 0x3f5);
    GX_VBlankIntr(1);
    GX_HBlankIntr(1);
    Scene_SetFlags03(scene);
    return scene;
}

static void destroy_scene(void *scene)
{
    void *controller;

    FIELD(void *, scene, 0) = data_ov063_022105dc;
    Scene_ClearFlags03(scene);
    controller = FIELD(void *, scene, 0x24);
    if (controller != 0) {
        func_020a6390(controller);
        Heap_Free(controller);
    }
    FIELD(void *, scene, 0x24) = 0;
    GameWork_ClearFlag(gGameWork, 0x3f5);
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
    VecFx32Object_Destroy((u8 *)scene + 0x38);
    VecFx32Object_Destroy((u8 *)scene + 0x28);
    Scene_Destroy(scene);
}

/* Destroy the scene and its owned state while retaining the scene allocation. */
extern "C" void *func_ov063_0220fec8(void *scene)
{
    destroy_scene(scene);
    return scene;
}

/* Destroy the scene and release its allocation. */
extern "C" void *func_ov063_0220ff48(void *scene)
{
    destroy_scene(scene);
    Heap_Free(scene);
    return scene;
}

/* Advance actor, collection, HUD, transform, and scanline-controller state. */
extern "C" s32 func_ov063_0220ffd0(void *scene)
{
    void *actor = FIELD(void *, scene, 0x4c);
    void *controller;
    u32 flags;
    u32 count;
    s32 result;

    result = call_method(actor, 0xd0);
    if (result != 0) {
        func_ov063_02210414(scene, result);
        if (scene != 0) {
            call_method(scene, 4);
        }
        return 1;
    }

    flags = FIELD(u32, scene, 0x50);
    count = ((flags >> 16) & 0x3fff) + 1;
    FIELD(u32, scene, 0x50) =
        (flags & 0xc000ffff) | ((count & 0x3fff) << 16);

    if (call_method(actor, 0xd8) != 0) {
        call_method(data_021052fc, 8);
    } else if ((FIELD(u8, scene, 0x54) & 2) == 0 || (count & 1) != 0) {
        GamePhaseRuntime_PrepareActorCollections(data_021052fc, 2, 3);
        call_method(actor, 0xdc);
        GamePhaseRuntime_SynchronizeActorPlacement(data_021052fc, 0);
        GamePhaseRuntime_SynchronizeActorPlacement(data_021052fc, 1);
        RuntimePresentationManager_Update((u8 *)data_021052fc + 0x2f7c);
        GamePhaseRuntime_FinalizeActorCollections(data_021052fc, 2, 3);
    } else {
        call_method(actor, 0xe0);
    }

    if ((FIELD(u16, gLupyContext, 0xb0) & 1) == 0) {
        GamePhaseCurrencyHud_Update(gLupyContext);
    }
    if ((FIELD(u32, scene, 0x50) & 1) != 0) {
        s32 ready = func_020a6990((u8 *)scene + 0x28, 0, 6);
        FIELD(u8, scene, 0x54) =
            (FIELD(u8, scene, 0x54) & (u8)~1) | (ready != 0);
    }
    controller = FIELD(void *, scene, 0x24);
    if (controller != 0) {
        func_020a681c(controller);
        if (FIELD(s32, controller, 8) == 1 ||
            FIELD(s32, controller, 8) == 2) {
            FIELD(s32, controller, 8) = 0;
        }
    }
    return 0;
}

/* Update render helpers, actor motion routing, and the active scanline buffer. */
extern "C" s32 func_ov063_022101c4(void *scene)
{
    u8 temporary[16];
    void *actor = FIELD(void *, scene, 0x4c);
    void *controller;

    GamePhaseState_UpdateRenderHelpers((u8 *)data_021052fc + 0x24);
    if (actor != 0) {
        call_method(actor, 0xc0);
    }
    if ((FIELD(u32, scene, 0x50) & 1) != 0) {
        s32 mode;
        VecFx32Object_InitComponents(temporary, 0, 0, 0);
        mode = (s32)(FIELD(u32, scene, 0x50) << 17) >> 18;
        func_020a6aa8((u8 *)scene + 0x28,
                     ActorMotionAreaFollower_GetPosition(
                         (u8 *)data_021052fc + 0x2fbc),
                     mode);
        VecFx32Object_Destroy(temporary);
    }

    controller = FIELD(void *, scene, 0x24);
    if (controller != 0) {
        FIELD(s32, controller, 0x20) ^= 1;
    } else {
        GamePhaseAreaScene_Update(FIELD(void *, data_021052fc, 0x2fb8));
    }
    return 0;
}

/* Apply the inactive scanline table's horizontal offset and brightness. */
extern "C" s32 func_ov063_0221028c(void *scene)
{
    void *controller = FIELD(void *, scene, 0x24);
    s32 alternate;
    u16 line;
    s16 *offsets;
    s8 *brightness;

    if (controller == 0 || FIELD(void *, controller, 0) == 0) {
        return 0;
    }
    alternate = FIELD(s32, controller, 0x20) ^ 1;
    line = *(volatile u16 *)0x04000006;
    offsets = (s16 *)((u8 *)controller + 0x24 + alternate * 0x180);
    brightness = (s8 *)controller + 0x324 + alternate * 0xc0;
    if (line < 192) {
        *(volatile u32 *)0x04001014 = (u32)offsets[line] & 0x1ff;
        GXx_SetMasterBrightness_((volatile void *)0x0400106c,
                                 brightness[line]);
    }
    return 0;
}

/* Release and clear the optional scanline presentation controller. */
extern "C" void func_ov063_02210314(void *scene)
{
    void *controller = FIELD(void *, scene, 0x24);
    if (controller != 0) {
        func_020a6390(controller);
        Heap_Free(controller);
        FIELD(void *, scene, 0x24) = 0;
    }
}

/* Copy the two route arguments and attach the overlay route vtable. */
extern "C" void func_ov063_02210380(void *output, const void *input)
{
    FIELD(void *, output, 0) = data_ov063_022105cc;
    FIELD(u32, output, 4) = FIELD(u32, input, 4);
    FIELD(u32, output, 8) = FIELD(u32, input, 8);
}

/* Route an input record through runtime callback slot 0x14. */
extern "C" s32 func_ov063_02210348(void *, const void *input)
{
    u8 route[12];
    func_ov063_02210380(route, input);
    call_route_method(data_021052fc, 0x14, route);
    return 0;
}

/* Confirmed no-op route virtual. */
extern "C" void func_ov063_022103a0(void *)
{
}

/* Route an input record through runtime callback slot 0x18. */
extern "C" s32 func_ov063_022103a4(void *, const void *input)
{
    u8 route[12];
    func_ov063_02210380(route, input);
    call_route_method(data_021052fc, 0x18, route);
    return 0;
}

/* Route an input record through runtime callback slot 0x1c. */
extern "C" s32 func_ov063_022103dc(void *, const void *input)
{
    u8 route[12];
    func_ov063_02210380(route, input);
    call_route_method(data_021052fc, 0x1c, route);
    return 0;
}

/* Finalize the actor's transition request and restore display interrupts. */
extern "C" void func_ov063_02210414(void *scene, s32 mode)
{
    void *actor = FIELD(void *, scene, 0x4c);
    s32 first;
    s32 second;
    s32 third;

    GX_VBlankIntr(0);
    GX_HBlankIntr(0);
    Scene_ClearFlags03(scene);
    first = call_method(actor, 0xe4);
    second = call_method(actor, 0xe8);
    third = call_method(actor, 0xec);

    if (mode == 3 || mode == 1) {
        GamePhaseRuntime_StageAreaRequest(data_021052fc, first, second, third,
                                          0, 0);
        FIELD(s16, gGameWork, 0x1e4) = mode == 3 ? 1 : -1;
    } else if (mode != 5) {
        ActorCollection_UnregisterAndDestroyActor(
            GamePhaseRuntime_GetActorCollection(data_021052fc, 1), actor);
    }

    GX_VBlankIntr(1);
    GX_HBlankIntr(1);
    if ((FIELD(u32, scene, 0x50) & 0x8000) != 0) {
        Sound_StopAllArchiveEffects(gSoundContext);
        Sound_StopAllDirectSequences(gSoundContext, 0);
    }
}

/* Release an owned route object and preserve its identity for deleting ABI. */
extern "C" void *func_ov063_02210568(void *object)
{
    Heap_Free(object);
    return object;
}
