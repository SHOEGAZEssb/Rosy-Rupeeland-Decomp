#include "tingle/field_effect.h"
#include "tingle/types.h"

/* Overlay 50 field-effect scene lifecycle and four-way particle controller. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *gGameWork;
extern "C" void *gGamePhaseRuntime;
extern "C" void *data_020f4e14[];
extern "C" void *data_020f4e18[];
extern "C" void *gDebugFont;
extern "C" u8 gHeapContext[];
extern "C" const s16 data_020c9670[];
extern "C" u8 data_ov050_0220e3c0[];
extern "C" u8 data_ov050_0220e3e8[];
extern "C" u8 data_ov050_0220e3f0[];
extern "C" void *Heap_Alloc(u32, const void *, s32, void *);
extern "C" void Heap_Free(void *);

extern "C" void RuntimePresentationManager_AppendFirstListEffect(void *, void *);
extern "C" void AnimationResourceState_InitEmbedded(void *);
extern "C" void AnimationResourceState_Destroy(void *);
extern "C" void func_02071ee0(void *, void *, s32, s32, s32);
extern "C" void *VecFx32Object_Init(void *);
extern "C" void *VecFx32Object_InitCopy(void *, const void *);
extern "C" void *VecFx32Object_InitComponents(void *, s32, s32, s32);
extern "C" void *VecFx32Object_Assign(void *, const void *);
extern "C" void *VecFx32Object_Destroy(void *);
extern "C" void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern "C" void GraphicsSpriteGroupOwner_DestroyGroup(void *, void *);
extern "C" void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern "C" void *OverlayManager_GetGlobal(void);
extern "C" void OverlayManager_UnloadOverlay(void *, s32);
extern "C" s32 GameWork_TestFlag(void *, s32);
extern "C" void GameWork_SetFlag(void *, s32);
extern "C" void GameWork_ClearFlag(void *, s32);
extern "C" void func_020adff0(const void *, const void *, void *);
extern "C" void *func_ov050_0220d824(void *, void *, void *, const void *,
                                      const void *);
extern "C" void *Overlay050EffectManager_Destroy(void *);
extern "C" s32 Overlay050EffectManager_Update(void *, const void *);
extern "C" void Overlay050Effect_SetAlpha(void *, u32);
extern "C" void Overlay050Scene_SetChildValue30(void *, s32);
extern "C" bool Overlay050Scene_AreChildrenIdle(void *);
extern "C" void Overlay050Scene_SetChildValue34(void *, s32);
extern "C" void func_ov050_0220e168(void *, const void *, const void *);

/*
 * Construct caller-owned `scene`: initialize its FieldEffect base and owner, create
 * render records/font states, allocate and construct the manager/children,
 * initialize counters/callbacks, and clear the relevant GameWork flag. Return
 * `scene`. Heap, GameWork, sprite/font, resource-owner, and SDK state change.
 */
extern "C" void *func_ov050_0220db84(void *scene, void *argument,
                                      const void *origin,
                                      const void *resources)
{
    s32 index;

    FieldEffect_Init(scene);
    FIELD(void *, scene, 0) = data_ov050_0220e3c0;
    AnimationResourceState_InitEmbedded((u8 *)scene + 8);
    FIELD(void *, scene, 0x2c) = argument;
    VecFx32Object_InitCopy((u8 *)scene + 0x30, origin);
    FIELD(s32, scene, 0x40) = 0;
    FIELD(s32, scene, 0x44) = 0;
    FIELD(s32, scene, 0x48) = 0;
    FIELD(s32, scene, 0x54) = 0;
    FIELD(const void *, scene, 0x58) = resources;
    func_02071ee0((u8 *)scene + 8, data_020f4e18[0],
                  0x1614, 0x1615, 0x1616);
    FIELD(void *, scene, 0x14) =
        GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14[0]);
    FIELD(void *, scene, 0x18) =
        GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    for (index = 0; index < 4; ++index) {
        void *child = Heap_Alloc(0x38, data_ov050_0220e3e8, 4,
                                 gHeapContext);

        if (child != 0)
            child = func_ov050_0220d824(
                child, FIELD(void *, scene, 0x14),
                FIELD(void *, scene, 0x18), (u8 *)scene + 8,
                (u8 *)scene + 0x30);
        FIELD(void *, scene, 0x1c + index * 4) = child;
        FIELD(s32, child, 0x30) = 0;
    }
    FIELD(s32, scene, 0x44) = 0;
    GameWork_ClearFlag(gGameWork, 0x21b);
    return scene;
}

/*
 * Destroy the scene without freeing its own storage: release manager and child
 * effects, font states, task/transition state, render record, owner, and
 * FieldEffect base in reverse order. Return the unchanged scene pointer. Heap and SDK
 * resources change; no direct MMIO occurs.
 */
static void *DestroyScene(void *scene, s32 freeScene)
{
    s32 index;

    FIELD(void *, scene, 0) = data_ov050_0220e3c0;
    for (index = 0; index < 4; ++index) {
        void *child = FIELD(void *, scene, 0x1c + index * 4);
        if (child != 0) {
            Overlay050EffectManager_Destroy(child);
            Heap_Free(child);
        }
    }
    GraphicsSpriteGroupOwner_DestroyGroup(
        data_020f4e14[0], FIELD(void *, scene, 0x14));
    GraphicsSpriteGroupOwner_DestroyGroup(
        gDebugFont, FIELD(void *, scene, 0x18));
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 0);
    VecFx32Object_Destroy((u8 *)scene + 0x30);
    AnimationResourceState_Destroy((u8 *)scene + 8);
    FieldEffect_DestroyBase(scene);
    if (freeScene != 0)
        Heap_Free(scene);
    return scene;
}

extern "C" void *Overlay050Scene_Destroy(void *scene)
{
    return DestroyScene(scene, 0);
}

/*
 * Perform the same recovered scene teardown, then free scene storage and return
 * its former address identity. Heap/SDK state changes and the result is not
 * safe to dereference.
 */
extern "C" void *Overlay050Scene_Delete(void *scene)
{
    return DestroyScene(scene, 1);
}

/*
 * Advance the scene state machine and return its update status. It tests/sets
 * GameWork flags, broadcasts child fields, checks readiness, creates/destroys
 * effect managers, updates alpha/font states and transitions, and synchronizes
 * rendering. Scene, children, heap, GameWork, RNG, and SDK state can change;
 * no direct MMIO is performed. State meanings remain offset-derived.
 */
extern "C" s32 Overlay050Scene_Update(void *scene)
{
    s16 phaseMode;
    s32 index;

    if (Overlay050Scene_AreChildrenIdle(scene))
        GameWork_ClearFlag(gGameWork, 0x245);
    else
        GameWork_SetFlag(gGameWork, 0x245);
    if (GameWork_TestFlag(gGameWork, 0x21b))
        return 1;

    if (GameWork_TestFlag(gGameWork, 0x244)) {
        FIELD(s32, scene, 0x40) = 0;
        Overlay050Scene_SetChildValue34(scene, 0);
    } else {
        Overlay050Scene_SetChildValue34(scene, 1);
        phaseMode = FIELD(s16, gGameWork, 0x78);
        if (phaseMode == 2) {
            if (FIELD(s32, scene, 0x40) == 0) {
                Overlay050Scene_SetChildValue30(scene, 0xc00);
                ++FIELD(s32, scene, 0x40);
            }
        } else if (phaseMode == 3) {
            if (FIELD(s32, scene, 0x40) == 0) {
                FIELD(s32, scene, 0x44) = 0x40;
                Overlay050Scene_SetChildValue30(scene, 0x1400);
                ++FIELD(s32, scene, 0x40);
            }
        } else if (phaseMode == 4) {
            switch (FIELD(s32, scene, 0x40)) {
            case 0:
                Overlay050Scene_SetChildValue30(scene, 0x1000);
                FIELD(s32, scene, 0x44) = 0x100;
                FIELD(s32, scene, 0x5c) = 0;
                FIELD(s32, FIELD(void *, scene, 0x1c), 0x30) = 0x2000;
                FIELD(s32, FIELD(void *, scene, 0x24), 0x30) = 0x2000;
                FIELD(s32, scene, 0x4c) = 150;
                ++FIELD(s32, scene, 0x40);
                break;
            case 1:
                if (--FIELD(s32, scene, 0x4c) <= 0) {
                    Overlay050Scene_SetChildValue30(scene, 0x1000);
                    FIELD(s32, scene, 0x4c) = 30;
                    ++FIELD(s32, scene, 0x40);
                }
                break;
            case 2:
                if (--FIELD(s32, scene, 0x4c) <= 0) {
                    FIELD(s32, scene, 0x5c) =
                        (FIELD(s32, scene, 0x5c) + 1) % 4;
                    FIELD(s32, scene, 0x40) = 0;
                }
                break;
            }
        } else if (phaseMode == 5 && FIELD(s32, scene, 0x40) == 0) {
            FIELD(s32, scene, 0x44) = 0x80;
            FIELD(s32, FIELD(void *, scene, 0x1c), 0x30) = 0x1800;
            FIELD(s32, FIELD(void *, scene, 0x20), 0x30) = 0x2800;
            FIELD(s32, FIELD(void *, scene, 0x24), 0x30) = 0x1800;
            FIELD(s32, FIELD(void *, scene, 0x28), 0x30) = 0x2800;
            ++FIELD(s32, scene, 0x40);
        }
    }

    FIELD(s32, scene, 0x48) += FIELD(s32, scene, 0x44);
    for (index = 0; index < 4; ++index) {
        u16 phase = (u16)((index << 14) + (u16)FIELD(s32, scene, 0x48));
        s32 sample = data_020c9670[(phase >> 4) * 2 + 1];
        s32 offset[4];
        s32 transformed[4];
        void *child = FIELD(void *, scene, 0x1c + index * 4);

        VecFx32Object_InitComponents(
            offset, (s32)(((s64)sample * 0x30000 + 0x800) >> 12), 0, 0);
        func_ov050_0220e168(transformed, (u8 *)scene + 0x30, offset);
        VecFx32Object_Assign((u8 *)child + 0x20, transformed);
        VecFx32Object_Destroy(transformed);
        VecFx32Object_Destroy(offset);
        Overlay050EffectManager_Update(child, FIELD(void *, scene, 0x2c));
        Overlay050Effect_SetAlpha(child, phase < 0x8000 ? 2 : 3);
    }
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0x14));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0x18));
    return 0;
}

/*
 * Initialize an offset-derived vector, derive a transform through
 * func_020adff0, and store/apply it to scene-owned state. Scene and SDK 3D
 * transform state change; nothing is returned and no direct MMIO occurs.
 */
extern "C" void func_ov050_0220e168(void *destination,
                                     const void *first,
                                     const void *second)
{
    VecFx32Object_Init(destination);
    func_020adff0(first != 0 ? (const u8 *)first + 4 : 0,
                  second != 0 ? (const u8 *)second + 4 : 0,
                  (u8 *)destination + 4);
}

/*
 * Allocate scene storage, construct it through func_ov050_0220db84, register
 * it with the shared scene/task system, and return the allocation. Heap and
 * scene-manager state change; failure follows the recovered allocation path.
 */
extern "C" void *func_ov050_0220e1a0(void *argument,
                                      const void *origin,
                                      const void *resources)
{
    void *scene = Heap_Alloc(0x60, data_ov050_0220e3f0, 4,
                             gHeapContext);

    if (scene != 0)
        scene = func_ov050_0220db84(scene, argument, origin, resources);
    RuntimePresentationManager_AppendFirstListEffect((u8 *)gGamePhaseRuntime + 0x2f7c, scene);
    return scene;
}
