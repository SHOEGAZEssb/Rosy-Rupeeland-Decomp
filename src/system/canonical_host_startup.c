/*
 * Recovered retail process/bootstrap sequence, reconstructed from main at
 * 0x02000BA0 and the ARM9 constructor table at 0x020CDC24. Game-owned startup
 * order remains here; native code supplies only the SDK/host boundaries.
 */
#include "tingle/canonical_runtime.h"
#include "tingle/game_phase.h"
#include "tingle/game_phase_load_scene.h"
#include "tingle/game_work.h"
#include "tingle/graphics_hardware.h"
#include "tingle/graphics_resources.h"
#include "tingle/graphics_system.h"
#include "tingle/heap.h"
#include "tingle/random.h"
#include "tingle/scene.h"
#include "tingle/system.h"
#include "tingle/touch_panel.h"

#include <stddef.h>
#include <stdint.h>
#define STARTUP_STEP(name, call) do { (void)sizeof(name); call; } while (0)

extern void __sinit_020c1374(void);
extern void __sinit_020c13a0(void);
extern void __sinit_020c13cc(void);
extern void __sinit_020c13f8(void);
extern void __sinit_020c1490(void);
extern void __sinit_020c14bc(void);
extern void __sinit_020c152c(void);
extern void __sinit_020c1558(void);
extern void __sinit_020c15c0(void);
extern void __sinit_020c15ec(void);
extern void __sinit_020c1600(void);
extern void __sinit_020c162c(void);
extern void __sinit_020c1658(void);
extern void __sinit_020c1684(void);
extern void __sinit_020c16cc(void);
extern void __sinit_020c16f8(void);
extern void __sinit_020c176c(void);
extern void __sinit_020c1798(void);
extern void __sinit_020c17c4(void);

extern void FX_Init(void);
extern void PXI_Init(void);
extern s32 FS_Init(s32 default_dma);
extern void MIC_Init(void);
extern void func_01ff8000(void);
extern void SoundContext_Initialize(void);
extern void SoundContext_Update(void *context);
extern void RetailDatabaseManagers_InitGlobals(void);
extern void RetailSaveContext_InitializeGlobal(void);
extern void func_0206328c(void);
extern void RetailResourceDescriptorManager_InitGlobal(void);
extern void func_0206f780(void);
extern void func_0207a268(void);
extern s32 RetailSaveContext_IdentifyBackupDevice(RuntimeContext *context);
extern void *Heap_Alloc(u32 size, const char *tag, s32 alignment,
                        HeapContext *context);
extern u32 GX_HBlankIntr(u32 state);
extern u32 GX_VBlankIntr(u32 state);
extern void GX_DispOn(void);
extern void OS_WaitVBlankIntr(void);
extern void DisplayBrightness_UpdateAll(void);
extern void FrameTaskList_Update(void);
extern void GraphicsSpriteRenderer_BuildFrame(void *owner, s32 value);

extern const char data_020d3b80[];
extern const char data_020d3b88[];
extern HeapContext gHeapContext;
extern void *data_020f4e14;
extern void *data_020f4e1c;
extern void *gDebugFont;
extern void *gSoundContext;
extern u8 data_021052fc[];
extern u8 gGamePhaseMetadataTable[];
extern s32 func_ov025_022009d8(void *scene);
extern s32 func_ov025_02200e54(void *scene);
extern s32 func_ov025_02200fe4(void *scene);
extern s32 func_ov025_02201348(void *scene);
extern s32 func_ov025_02201f28(void *scene);

/* Run compiler-generated constructors in their exact ARM9 table order. */
static void RunStaticInitializers(void)
{
    __sinit_020c1374();
    __sinit_020c13a0();
    __sinit_020c13cc();
    __sinit_020c13f8();
    __sinit_020c1490();
    __sinit_020c14bc();
    __sinit_020c152c();
    __sinit_020c1558();
    __sinit_020c15c0();
    __sinit_020c15ec();
    __sinit_020c1600();
    __sinit_020c162c();
    __sinit_020c1658();
    __sinit_020c1684();
    __sinit_020c16cc();
    __sinit_020c16f8();
    __sinit_020c176c();
    __sinit_020c1798();
    __sinit_020c17c4();
}

/* Execute retail pre-main construction and main's boot-phase setup. */
s32 TingleRecoveredCanonicalStartup(void)
{
    GraphicsResourceSet *sets;
    TouchPanelManager *touch;
    SceneManager *scenes;
    s32 save_identified;

    STARTUP_STEP("runtime", InitRuntime());
    STARTUP_STEP("static initializers", RunStaticInitializers());
    STARTUP_STEP("graphics hardware", GraphicsHardware_Init());
    STARTUP_STEP("fixed point", FX_Init());
    STARTUP_STEP("ipc", PXI_Init());
    if (!FS_Init(-1))
        return 0;
    STARTUP_STEP("random", InitRandom());
    STARTUP_STEP("system state", SystemState_Init());
    STARTUP_STEP("graphics system", GraphicsSystem_Init());
    STARTUP_STEP("display interrupts", func_01ff8000());

    touch = (TouchPanelManager *)Heap_Alloc(
        sizeof(*touch), data_020d3b80, 4, &gHeapContext);
    if (touch != NULL)
        touch = TouchPanelManager_Init(touch);
    gTouchPanelManager = touch;

    STARTUP_STEP("microphone", MIC_Init());
    STARTUP_STEP("sound resources", SoundContext_Initialize());
    sets = GraphicsResourceSets_Get();
    STARTUP_STEP("graphics resource sets", GraphicsResourceSets_Load(sets));
    STARTUP_STEP("game work", GameWork_Create());
    STARTUP_STEP("retail database managers", RetailDatabaseManagers_InitGlobals());
    STARTUP_STEP("runtime context", RetailSaveContext_InitializeGlobal());
    STARTUP_STEP("manager 0206328c", func_0206328c());
    STARTUP_STEP("resource descriptor manager", RetailResourceDescriptorManager_InitGlobal());
    STARTUP_STEP("manager 0206f780", func_0206f780());
    STARTUP_STEP("manager 0207a268", func_0207a268());

    gSystemState.enabledKeyMask = 0x0fff;
    for (save_identified = 0; save_identified < PAD_STATE_COUNT;
         ++save_identified) {
        gSystemState.pads[save_identified].repeatStartDelay = 20;
        gSystemState.pads[save_identified].repeatInterval = 4;
    }
    GX_VBlankIntr(1);
    GX_HBlankIntr(1);
    OS_WaitVBlankIntr();
    GX_DispOn();
    *(volatile u32 *)0x04001000 |= 0x00010000;
    STARTUP_STEP("scene manager allocation",
        scenes = (SceneManager *)Heap_Alloc(
            sizeof(*scenes), data_020d3b88, 4, &gHeapContext));
    if (scenes != NULL)
        STARTUP_STEP("scene manager initialization",
                     scenes = SceneManager_Init(scenes));
    gSceneManager = scenes;
    if (scenes == NULL)
        return 0;
    STARTUP_STEP("save identification",
                 save_identified = RetailSaveContext_IdentifyBackupDevice(gRuntimeContext));
    if (!save_identified)
        return 0;
    STARTUP_STEP("game phase bootstrap", (void)0);
    if (GamePhase_Bootstrap() == NULL)
        return 0;
    UpdateKeyState(PAD_Read(), 0);
    return 1;
}

/*
 * Derive the second, gameplay-facing pad record exactly as retail main does at
 * 0x02000D48..0x02000E2C. Direct D-pad input selects D-pad movement, while
 * pressing A/B/X/Y selects the alternate right/down/up/left movement layout.
 * The physical face-button bits and GameWork's phase-owned suppression mask
 * are removed before the normal pad edge/repeat updater receives slot one.
 * The resulting repeated/pressed/held snapshots are also mirrored into the
 * three GameWork halfwords consumed by other gameplay systems. Returns no
 * value; SystemState, GameWork flag 0x384, and GameWork input snapshots change.
 */
static void UpdateGameplayKeyState(void)
{
    u16 keys = gSystemState.pads[0].held;
    u8 *work = (u8 *)gGameWork;

    if ((keys & 0x00f0) != 0) {
        GameWork_ClearFlag(gGameWork, 0x384);
    } else if ((keys & 0x0c03) != 0) {
        GameWork_SetFlag(gGameWork, 0x384);
    }

    if (GameWork_TestFlag(gGameWork, 0x384) != 0) {
        if ((keys & 0x0001) != 0) keys |= 0x0010;
        if ((keys & 0x0002) != 0) keys |= 0x0080;
        if ((keys & 0x0800) != 0) keys |= 0x0020;
        if ((keys & 0x0400) != 0) keys |= 0x0040;
    }

    keys &= (u16)~0x0c03;
    keys &= (u16)~*(s16 *)(work + 0x228);
    UpdateKeyState(keys, 1);
    *(u16 *)(work + 0x226) = gSystemState.pads[1].held;
    *(u16 *)(work + 0x224) = gSystemState.pads[1].pressed;
    *(u16 *)(work + 0x222) = gSystemState.pads[1].repeated;
}

/* Execute the recovered retail main-loop calls in their original order. */
void TingleRecoveredCanonicalRunFrame(void)
{
    UpdateSystemFrame();
    genrand_int32();
    DisplayBrightness_UpdateAll();
    TouchPanelManager_Update(gTouchPanelManager);
    UpdateGameplayKeyState();
    FrameTaskList_Update();
    SceneManager_UpdateCurrent(gSceneManager);
    if (data_020f4e1c != NULL) {
        if (data_020f4e14 != NULL)
            GraphicsSpriteRenderer_BuildFrame(data_020f4e14, 1);
        if (gDebugFont != NULL)
            GraphicsSpriteRenderer_BuildFrame(gDebugFont, 1);
    }
    SoundContext_Update(gSoundContext);
}

/* Resolve the configured metadata record without adding state to game code. */
s32 TingleRecoveredCanonicalGetPhase(void)
{
    u8 *runtime = *(u8 **)data_021052fc;
    const u8 *metadata;
    uintptr_t distance;

    if (runtime == NULL) return 0;
    metadata = *(const u8 **)(runtime + 0x30bc);
    if (metadata < gGamePhaseMetadataTable) return 0;
    distance = (uintptr_t)(metadata - gGamePhaseMetadataTable);
    if (distance % 0x58u != 0) return 0;
    return (s32)(distance / 0x58u) + 1;
}

s32 TingleRecoveredCanonicalGetSceneState(void)
{
    Scene *current = SceneManager_GetCurrent(gSceneManager);
    GamePhaseLoadScene *loader;

    if (current == NULL || current->vtable == NULL ||
        (void *)current->vtable->update != (void *)GamePhaseLoadScene_Update)
        return -1;
    loader = (GamePhaseLoadScene *)current;
    if (loader->ownedObject == NULL) return -1;
    return *(s32 *)((u8 *)loader->ownedObject + 4);
}

s32 TingleRecoveredCanonicalGetTitleCallback(void)
{
    Scene *current = SceneManager_GetCurrent(gSceneManager);
    GamePhaseLoadScene *loader;
    void *callback;

    if (current == NULL || current->vtable == NULL ||
        (void *)current->vtable->update != (void *)GamePhaseLoadScene_Update)
        return 0;
    loader = (GamePhaseLoadScene *)current;
    if (loader->ownedObject == NULL) return 0;
    callback = *(void **)((u8 *)loader->ownedObject + 0x24);
    if (callback == (void *)func_ov025_022009d8) return 1;
    if (callback == (void *)func_ov025_02200e54) return 2;
    if (callback == (void *)func_ov025_02200fe4) return 3;
    if (callback == (void *)func_ov025_02201348) return 4;
    if (callback == (void *)func_ov025_02201f28) return 5;
    return -1;
}
