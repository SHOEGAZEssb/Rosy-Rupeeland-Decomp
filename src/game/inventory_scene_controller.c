/*
 * Inventory scene controller. This resident scene selects one of the two
 * overlay-backed inventory views, preserves its three-word view state while
 * switching tabs, and coordinates the dual-screen brightness transitions.
 */
#include "tingle/overlay_manager.h"
#include "tingle/types.h"

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct MemberFunctionPointer {
    u32 function;
    s32 adjustment;
} MemberFunctionPointer;

typedef struct InventoryViewState {
    u32 field00;
    u32 field04;
    u32 field08;
} InventoryViewState;

typedef void *(*VirtualDestroy)(void *object);
typedef s32 (*VirtualUpdate)(void *object);

extern u8 data_020e55d8[];
extern const MemberFunctionPointer data_020e558c;
extern const MemberFunctionPointer data_020e559c;
extern const MemberFunctionPointer data_020e55a4;
extern const MemberFunctionPointer data_020e55ac;
extern const char data_020e55ec[];
extern const char data_020e55f4[];
extern void *gGameWork;
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *SceneInputBase_Init(void *scene);
extern void SceneInputBase_SetMemberCallback(void *scene, MemberFunctionPointer callback);
extern s32 SceneInputBase_Update(void *scene, s32 active);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void DisplayBrightness_StartMainTransition(s32 mode, s32 duration);
extern void DisplayBrightness_StartSubTransition(s32 mode, s32 duration);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void *Overlay014_Scene_Init(void *scene,
                                const InventoryViewState *state);
extern void *func_ov015_021fce58(void *scene,
                                const InventoryViewState *state,
                                s32 soundMode);
extern void Overlay000_CaptureViewState(InventoryViewState *output,
                                const void *view);
extern void Overlay001_CaptureViewState(InventoryViewState *output,
                                const void *view);
#ifdef __cplusplus
}
#endif

/* Clear a caller-owned three-word inventory view-state record. */
void *InventoryViewState_Init(InventoryViewState *state)
{
    state->field00 = 0;
    state->field04 = 0;
    state->field08 = 0;
    return state;
}

/* Copy all three words of a saved inventory view state and return output. */
InventoryViewState *InventoryViewState_Copy(InventoryViewState *output,
                                 const InventoryViewState *input)
{
    *output = *input;
    return output;
}

/* Load and construct the overlay-0/14 inventory view from saved state +0x70. */
void InventoryScene_LoadPrimaryView(void *scene)
{
    void *child;

    OverlaySlot_LoadOverlay((OverlaySlot *)((u8 *)scene + 0x58), 0);
    OverlaySlot_LoadOverlay((OverlaySlot *)((u8 *)scene + 0x64), 14);
    child = Heap_Alloc(0x90, data_020e55ec, 4, gHeapContext);
    if (child != 0)
        child = Overlay014_Scene_Init(
            child, (const InventoryViewState *)((u8 *)scene + 0x70));
    FIELD(void *, scene, 0x54) = child;
    FIELD(u32, scene, 0x20) |= 0x400;
}

/* Load and construct the overlay-1/15 inventory view from saved state +0x7C. */
void InventoryScene_LoadSecondaryView(void *scene)
{
    void *child;

    OverlaySlot_LoadOverlay((OverlaySlot *)((u8 *)scene + 0x58), 1);
    OverlaySlot_LoadOverlay((OverlaySlot *)((u8 *)scene + 0x64), 15);
    child = Heap_Alloc(0x304, data_020e55f4, 4, gHeapContext);
    if (child != 0)
        child = func_ov015_021fce58(
            child, (const InventoryViewState *)((u8 *)scene + 0x7c), 0);
    FIELD(void *, scene, 0x54) = child;
    FIELD(u32, scene, 0x20) |= 0x400;
}

/*
 * Construct the inventory controller in caller-owned 0x88-byte storage.
 * Flag 0x387 selects overlays 0/14, flag 0x388 selects overlays 1/15, and no
 * selection installs the terminal callback. Both request flags are consumed.
 */
void *InventoryScene_Init(void *scene)
{
    SceneInputBase_Init(scene);
    FIELD(const void *, scene, 0) = data_020e55d8;
    OverlaySlot_Init((OverlaySlot *)((u8 *)scene + 0x58));
    OverlaySlot_Init((OverlaySlot *)((u8 *)scene + 0x64));
    InventoryViewState_Init((InventoryViewState *)((u8 *)scene + 0x70));
    InventoryViewState_Init((InventoryViewState *)((u8 *)scene + 0x7c));

    if (GameWork_TestFlag(gGameWork, 0x387)) {
        InventoryScene_LoadPrimaryView(scene);
        SceneInputBase_SetMemberCallback(scene, data_020e559c);
    } else if (GameWork_TestFlag(gGameWork, 0x388)) {
        InventoryScene_LoadSecondaryView(scene);
        SceneInputBase_SetMemberCallback(scene, data_020e558c);
    } else {
        FIELD(void *, scene, 0x54) = 0;
        SceneInputBase_SetMemberCallback(scene, data_020e55ac);
    }

    GameWork_ClearFlag(gGameWork, 0x387);
    GameWork_ClearFlag(gGameWork, 0x388);
    return scene;
}

/*
 * Destroy the active inventory child and both overlay slots without freeing
 * the controller. Child ownership is released through virtual slot two.
 */
void *InventoryScene_Destroy(void *scene)
{
    void *child;

    FIELD(const void *, scene, 0) = data_020e55d8;
    FIELD(u32, scene, 0x20) &= ~0x400u;
    child = FIELD(void *, scene, 0x54);
    if (child != 0) {
        void **vtable = FIELD(void **, child, 0);
        ((VirtualDestroy)vtable[2])(child);
    }
    GameWork_ClearFlag(gGameWork, 0x387);
    GameWork_ClearFlag(gGameWork, 0x388);
    OverlaySlot_Destroy((OverlaySlot *)((u8 *)scene + 0x64));
    OverlaySlot_Destroy((OverlaySlot *)((u8 *)scene + 0x58));
    return scene;
}

/* Destroy the inventory controller, free its storage, and return its address. */
void *InventoryScene_Delete(void *scene)
{
    InventoryScene_Destroy(scene);
    Heap_Free(scene);
    return scene;
}

/* Terminal callback: keep any child inactive and report completion. */
s32 InventoryScene_UpdateTerminal(void *scene)
{
    SceneInputBase_Update(FIELD(void *, scene, 0x54), 0);
    return 1;
}

/* Forward the per-frame callback through child virtual slot three when live. */
s32 InventoryScene_UpdateChild(void *scene)
{
    void *child = FIELD(void *, scene, 0x54);

    if ((FIELD(u32, scene, 0x20) & 0x400) != 0 && child != 0) {
        void **vtable = FIELD(void **, child, 0);
        ((VirtualUpdate)vtable[3])(child);
    }
    return 0;
}

/*
 * Drive inventory input and tab switching. A child request sets flag 0x387 or
 * 0x388; the controller fades out, captures that view's three-word state,
 * destroys and unloads it, constructs the requested peer, then fades in.
 * Returns zero on every frame while state changes remain observable in scene.
 */
s32 InventoryScene_UpdateInput(void *scene)
{
    s32 state = FIELD(s32, scene, 4);

    switch (state) {
    case 0:
        FIELD(u32, scene, 0x20) |= 1;
        FIELD(s32, scene, 4) = 1;
        FIELD(s32, scene, 8) = 0;
        /* Retail advances into state one on the construction frame. */
    case 1:
        if (SceneInputBase_Update(FIELD(void *, scene, 0x54),
                          (s32)(FIELD(u32, scene, 0x20) << 30) >> 31)) {
            if (GameWork_TestFlag(gGameWork, 0x387) ||
                GameWork_TestFlag(gGameWork, 0x388)) {
                DisplayBrightness_StartMainTransition(2, 0x10);
                DisplayBrightness_StartSubTransition(2, 0x10);
                FIELD(s32, scene, 4) = 2;
                FIELD(s32, scene, 8) = 0;
            } else {
                SceneInputBase_SetMemberCallback(scene, data_020e55a4);
            }
        }
        break;
    case 2:
        SceneInputBase_Update(FIELD(void *, scene, 0x54), 0);
        if (DisplayBrightness_IsMainTransitionComplete()) {
            void *child = FIELD(void *, scene, 0x54);

            if (GameWork_TestFlag(gGameWork, 0x387)) {
                InventoryViewState captured;
                Overlay001_CaptureViewState(&captured,
                                    FIELD(void *, child, 0xdc));
                InventoryViewState_Copy(
                    (InventoryViewState *)((u8 *)scene + 0x7c), &captured);
            } else {
                InventoryViewState captured;
                Overlay000_CaptureViewState(&captured,
                                    FIELD(void *, child, 0x78));
                InventoryViewState_Copy(
                    (InventoryViewState *)((u8 *)scene + 0x70), &captured);
            }

            FIELD(u32, scene, 0x20) &= ~0x400u;
            if (child != 0) {
                void **vtable = FIELD(void **, child, 0);
                ((VirtualDestroy)vtable[2])(child);
            }
            FIELD(void *, scene, 0x54) = 0;
            OverlaySlot_UnloadOverlay(
                (OverlaySlot *)((u8 *)scene + 0x58));
            OverlaySlot_UnloadOverlay(
                (OverlaySlot *)((u8 *)scene + 0x64));

            if (GameWork_TestFlag(gGameWork, 0x387))
                InventoryScene_LoadPrimaryView(scene);
            else
                InventoryScene_LoadSecondaryView(scene);
            GameWork_ClearFlag(gGameWork, 0x387);
            GameWork_ClearFlag(gGameWork, 0x388);
            DisplayBrightness_StartMainTransition(1, 0x10);
            DisplayBrightness_StartSubTransition(1, 0x10);
            FIELD(s32, scene, 4) = 3;
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 3:
        SceneInputBase_Update(FIELD(void *, scene, 0x54), 0);
        if (DisplayBrightness_IsMainTransitionComplete()) {
            FIELD(s32, scene, 4) = 0;
            FIELD(s32, scene, 8) = 0;
        }
        break;
    default:
        break;
    }
    return 0;
}
