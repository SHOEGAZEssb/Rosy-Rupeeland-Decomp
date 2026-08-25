#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"

/*
 * Dispatch a script-selected runtime-object operation.  Most modes allocate a
 * concrete object, run its recovered constructor, and register it in one of
 * the game-phase runtime's two owned lists; several modes instead update
 * debug-font storage or invoke a global phase action.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void *data_020f4e14;
extern void *gDebugFont;
extern const char data_020d5b34[];
extern const char data_020d5b74[];
extern const char data_020d5b94[];
extern const char data_020d5b9c[];
extern const char data_020d5ba4[];
extern const char data_020d5bac[];
extern const char data_020d5bb4[];
extern const char data_020d5bbc[];
extern const char data_020d5bc4[];
extern const char data_020d5bcc[];
extern const char data_020d5bd4[];
extern const char data_020d5bdc[];
extern const char data_020d5be4[];
extern void RuntimePresentationManager_AppendFirstListEffect(void *list, void *object);
extern void RuntimePresentationManager_AppendSecondListEffect(void *list, void *object);
extern void *OverlayTransitionScene_Init(void *object, s32 kind, s32 parameter);
extern void *Overlay33RuntimeScene_Init(void *object, s32 parameter);
extern void *func_020200bc(void *object, s32 value, s32 zero0, s32 zero1,
                           s32 parameter);
extern void *DisplayFadePresentation_Init(void *object, s32 mode, s32 value,
                                          s32 parameter);
extern void SceneDisplayResources_Setup(s32 sceneIndex);
extern void *DualArrayBlendPresentation_Init(void *object, s32 value);
extern void *func_0202225c(void *object);
extern void *PaletteCyclePresentation_Init(void *object);
extern void *func_02023fa0(void *object);
extern void *func_020240cc(void *object, s32 value);
extern void *func_02024200(void *object);
extern void *func_0202432c(void *object, s32 value, s32 parameter);
extern void *func_02024468(void *object);
extern void *FourSlot3DPresentation_Init(void *object, s32 value);
extern void *IndexedSpriteOverlayPresentation_Init(void *object, s32 value);
extern void *ReversedFrameSpriteOverlayPresentation_Init(void *object, s32 value);
extern void *OverlayManager_GetGlobal(void);
extern void OverlayManager_LoadOverlay(void *state, s32 enabled, s32 value);
extern void func_ov058_0220f484(void);
extern u16 *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *font);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *font);
#ifdef __cplusplus
}
#endif

/* Allocate a four-byte-aligned object of size bytes from the global heap. */
static void *allocateObject(u32 size, const char *tag)
{
    return Heap_Alloc(size, tag, 4, &gHeapContext);
}

/* Return the presentation manager at confirmed runtime offset 0x2f7c. */
static void *runtimePresentationManager(void)
{
    return (u8 *)gGamePhaseRuntime + 0x2f7c;
}

/*
 * Pop parameter, value, and mode operands.  Modes 0..20 perform the recovered
 * allocation/constructor/list operation described by their calls below;
 * unknown modes share modes 0/1's generic constructor.  Allocation failure is
 * still forwarded as a null list entry where the original does so.  Mode 16
 * invokes SDK/overlay-facing phase work, modes 18/19 alter debug-font backing
 * storage, and mode 7 is a no-op.  Return zero.
 */
s32 GamePhaseActorScriptVm_DispatchObjectFactory(GamePhaseActorScriptVm *self)
{
    s32 parameter = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 mode = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *createdObject;

    switch (mode) {
    case 20:
        createdObject = allocateObject(0x18, data_020d5b94);
        if (createdObject)
            createdObject = func_02024468(createdObject);
        RuntimePresentationManager_AppendFirstListEffect(runtimePresentationManager(), createdObject);
        break;
    case 19:
        GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14);
        GraphicsSpriteRenderer_QueuePaletteUploads(gDebugFont);
        break;
    case 18: {
        u16 *debugPalette = GraphicsSpriteRenderer_GetObjectPaletteAddress(gDebugFont);
        debugPalette[value] = (u16)parameter;
        GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14)[value] = debugPalette[value];
        break;
    }
    case 17:
        createdObject = allocateObject(0x18, data_020d5b9c);
        if (createdObject)
            createdObject = func_0202432c(createdObject, value, parameter);
        RuntimePresentationManager_AppendFirstListEffect(runtimePresentationManager(), createdObject);
        break;
    case 16: {
        void *state = OverlayManager_GetGlobal();
        OverlayManager_LoadOverlay(state, 1, 0x3a);
        func_ov058_0220f484();
        break;
    }
    case 15:
        createdObject = allocateObject(0x18, data_020d5ba4);
        if (createdObject)
            createdObject = func_02024200(createdObject);
        RuntimePresentationManager_AppendFirstListEffect(runtimePresentationManager(), createdObject);
        break;
    case 14:
        createdObject = allocateObject(0x1c, data_020d5bac);
        if (createdObject)
            createdObject = IndexedSpriteOverlayPresentation_Init(createdObject, value);
        RuntimePresentationManager_AppendFirstListEffect(runtimePresentationManager(), createdObject);
        break;
    case 13:
        createdObject = allocateObject(0x18, data_020d5bb4);
        if (createdObject)
            createdObject = func_020240cc(createdObject, value);
        RuntimePresentationManager_AppendFirstListEffect(runtimePresentationManager(), createdObject);
        break;
    case 12:
        createdObject = allocateObject(0x1c, data_020d5bbc);
        if (createdObject)
            createdObject = ReversedFrameSpriteOverlayPresentation_Init(createdObject, value);
        RuntimePresentationManager_AppendFirstListEffect(runtimePresentationManager(), createdObject);
        break;
    case 11:
        /* 0x448 is a confirmed allocation size; the object type is unknown. */
        createdObject = allocateObject(0x448, data_020d5bc4);
        if (createdObject)
            createdObject = PaletteCyclePresentation_Init(createdObject);
        RuntimePresentationManager_AppendSecondListEffect(runtimePresentationManager(), createdObject);
        break;
    case 10:
        createdObject = allocateObject(0x1c, data_020d5b74);
        if (createdObject)
            createdObject = func_020200bc(createdObject, value, 0, 0, parameter);
        RuntimePresentationManager_AppendFirstListEffect(runtimePresentationManager(), createdObject);
        break;
    case 9:
        createdObject = allocateObject(0x90, data_020d5bcc);
        if (createdObject)
            createdObject = FourSlot3DPresentation_Init(createdObject, value);
        RuntimePresentationManager_AppendFirstListEffect(runtimePresentationManager(), createdObject);
        break;
    case 8:
        createdObject = allocateObject(0x40, data_020d5bd4);
        if (createdObject)
            Overlay33RuntimeScene_Init(createdObject, value);
        break;
    case 7:
        break;
    case 6:
        createdObject = allocateObject(0x18, data_020d5bb4);
        if (createdObject)
            createdObject = func_02023fa0(createdObject);
        RuntimePresentationManager_AppendFirstListEffect(runtimePresentationManager(), createdObject);
        break;
    case 5:
        createdObject = allocateObject(0x44, data_020d5bdc);
        if (createdObject)
            OverlayTransitionScene_Init(createdObject, 1, value);
        break;
    case 4:
        createdObject = allocateObject(0x24, data_020d5be4);
        if (createdObject)
            createdObject = func_0202225c(createdObject);
        RuntimePresentationManager_AppendSecondListEffect(runtimePresentationManager(), createdObject);
        break;
    case 3:
        SceneDisplayResources_Setup(value);
        break;
    case 2:
        createdObject = allocateObject(0x3cc, data_020d5b34);
        if (createdObject)
            createdObject = DualArrayBlendPresentation_Init(createdObject, value);
        RuntimePresentationManager_AppendSecondListEffect(runtimePresentationManager(), createdObject);
        break;
    default:
        createdObject = allocateObject(0x54, data_020d5b34);
        if (createdObject)
            createdObject = DisplayFadePresentation_Init(createdObject, mode, value,
                                                  parameter);
        RuntimePresentationManager_AppendSecondListEffect(runtimePresentationManager(), createdObject);
        break;
    }
    return 0;
}
