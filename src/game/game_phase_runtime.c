#include "tingle/frame_task.h"
#include "tingle/game_work.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"
#include "tingle/util_animation_resource.h"
#include "tingle/vec_fx32.h"

/*
 * Construction of the game's large, phase-specific runtime scene. The object
 * aggregates scene state, rendering helpers, an overlay slot, and a frame task;
 * most embedded types retain offset-derived identities pending their recovery.
 */

typedef struct GamePhaseRuntimeGlobal {
    GamePhaseRuntime *runtime;
    FrameTaskNode *taskNode;
} GamePhaseRuntimeGlobal;

extern u32 data_020d431c[];
extern u8 data_020d4348[];
extern GamePhaseRuntimeGlobal data_021052fc;
extern u8 data_02105310[];
extern void *gLupyContext;

#ifdef __cplusplus
extern "C" {
#endif

extern void func_0200e4dc(void *object);
extern void func_02009d14(void *object, void *source);
extern void func_020099dc(void *object);
extern void func_020ae90c(void *object);
extern void *func_0201022c(void *task, GamePhaseRuntime *runtime);
extern void func_02006ff0(GamePhaseRuntime *runtime);
extern void GXS_SetGraphicsMode(u32 bgMode);
extern void func_02002e5c(s32 value);
extern void func_0200a35c(void *object);
extern void func_020090c0(void *object);
extern void func_0200ae8c(void *object);
extern void func_0200e650(void *object, const void *config);
extern void ActorInteractionRuntime_Start(void);
extern void func_02038b64(void *entity);
extern void Actor_AdjustPositionForTerrainHeight(void *entity);
extern void func_02038e50(void *entity, s32 enabled);
extern void func_0200a114(void *object, void *entity);
extern void func_020091c0(void *object, void *entity);
extern void func_0200a310(void *object);
extern void func_0200ec6c(void *object, s32 enabled);
extern void *func_02009d0c(void *object);
extern void *func_02009d78(void *object);
extern void ActorCollection_DispatchEventToActors(void *object, void *value);
extern void func_02006fd4(s32 value);
extern void func_02020060(void *object, const void *config);
extern void func_0201140c(void *object, s32 enabled);
extern void func_02012444(void *object, void *source);
extern void func_02010520(FrameTask *task, s32 enabled);

#ifdef __cplusplus
}
#endif

/*
 * Initialize the scene and embedded helpers, publish the singleton runtime,
 * allocate/register its GMTK-tagged frame task, run final setup, and return
 * self. This mutates global task state, may allocate from the game heap, and
 * initializes an embedded ARM9 overlay slot at offset 0x30c0.
 */
GamePhaseRuntime *func_02006ae0(GamePhaseRuntime *self)
{
    u8 *bytes = (u8 *)self;
    void *task;

    Scene_Init((Scene *)self);
    self->vtable = data_020d431c;
    func_0200e4dc(bytes + 0x24);

    /* These adjacent objects share storage at 0x2fa4..0x2fbf. */
    *(s32 *)(bytes + 0x2fb8) = 0;
    func_02009d14(bytes + 0x2fbc, bytes + 0x2fa4);
    func_020099dc(bytes + 0x3044);
    func_020057dc((TouchPoint *)(bytes + 0x30a8));

    *(s32 *)(bytes + 0x30b4) = 0;
    *(s32 *)(bytes + 0x30b8) = 0;
    *(s32 *)(bytes + 0x30bc) = 0;
    func_02006268((OverlaySlot *)(bytes + 0x30c0));
    *(u8 *)(bytes + 0x30cc) = 0;
    *(s32 *)(bytes + 0x30e4) = -1;
    *(s32 *)(bytes + 0x30e8) = 0;
    *(s32 *)(bytes + 0x30ec) = 0;
    *(s32 *)(bytes + 0x30f0) = 0;
    *(s32 *)(bytes + 0x30f4) = 0;
    func_020ae90c(bytes + 0x3000);

    data_021052fc.runtime = self;
    self->field_04 = 1;
    task = Heap_Alloc(0x30, (const char *)data_020d4348, 4, &gHeapContext);
    if (task != 0)
        task = func_0201022c(task, self);
    data_021052fc.taskNode = FrameTaskList_Add((FrameTask *)task, 0);

    func_02006ff0(self);
    return self;
}

/*
 * Apply one phase configuration to the runtime. This establishes sub-screen
 * graphics mode, initializes map/entity systems, positions up to two entities,
 * binds render resources, configures the global LUPY context, and enables scene
 * processing. Config field meanings remain offset-derived except where their
 * bit behavior is directly confirmed. Hardware display registers, GameWork,
 * global task state, and numerous embedded runtime objects may change.
 */
void func_02006bdc(GamePhaseRuntime *self, const void *configPointer,
                   s32 x, s32 y, s32 z)
{
    const u8 *config = (const u8 *)configPointer;
    u8 *bytes = (u8 *)self;
    void *entity;
    void *secondary;
    s32 fixedY = y << 12;
    s32 fixedZ = z << 12;
    u32 modeBits;

    Scene_ClearFlags03((Scene *)self);
    *(const void **)(bytes + 0x30bc) = configPointer;
    GXS_SetGraphicsMode(0);

    /* Select BG0 for the 3D engine on both DS display-control registers. */
    *(volatile u32 *)0x04000000 =
        (*(volatile u32 *)0x04000000 & ~0x1f00) | 0x1000;
    *(volatile u32 *)0x04001000 =
        (*(volatile u32 *)0x04001000 & ~0x1f00) | 0x1000;

    func_02002e5c(*(const s16 *)(config + 0x54));
    func_0200a35c(bytes + 0x2fbc);
    func_020090c0(bytes + 0x3044);
    func_0200ae8c(data_02105310);
    func_0200807c(self, (void *)configPointer, 1);
    func_0200e650(bytes + 0x24, configPointer);
    func_02008bb8(self, (void *)configPointer, 1);
    ((void (*)(s32))*(const void *const *)(config + 0x24))(0);
    ActorInteractionRuntime_Start();

    entity = *(void **)(bytes + 0x2ea4);
    *(s32 *)((u8 *)entity + 0x1c) = x << 12;
    *(s32 *)((u8 *)entity + 0x20) = fixedY;
    *(s32 *)((u8 *)entity + 0x24) = fixedZ;
    func_020050a4((VecFx32Object *)((u8 *)entity + 0x28),
                  (VecFx32Object *)((u8 *)entity + 0x18));
    if (GameWork_TestFlag(gGameWork, 0x3f2) != 0) {
        *(s32 *)((u8 *)entity + 0x24) = 0x60000;
        func_02038b64(entity);
    } else if (*(s32 *)((u8 *)entity + 0x24) == 0) {
        Actor_AdjustPositionForTerrainHeight(entity);
    }

    secondary = *(void **)(bytes + 0x2ea8);
    if (secondary != 0 &&
        (*(u32 *)((u8 *)secondary + 0x268) & 0x10) != 0 &&
        (*(u32 *)((u8 *)secondary + 0x268) & 0x20) == 0) {
        *(s32 *)((u8 *)secondary + 0x1c) = (x + 0x14) << 12;
        *(s32 *)((u8 *)secondary + 0x20) = fixedY;
        *(s32 *)((u8 *)secondary + 0x24) = fixedZ;
        func_020050a4((VecFx32Object *)((u8 *)secondary + 0x28),
                      (VecFx32Object *)((u8 *)secondary + 0x18));
        if (GameWork_TestFlag(gGameWork, 0x3f2) != 0) {
            *(s32 *)((u8 *)secondary + 0x24) = 0x60000;
        } else if (*(s32 *)((u8 *)secondary + 0x24) == 0) {
            Actor_AdjustPositionForTerrainHeight(secondary);
        }
    }

    func_02038e50(entity,
                  (u32)(*(const s32 *)config - 2) <= 2 ? 1 : 0);
    func_0200a114(bytes + 0x2fbc, entity);
    func_020091c0(bytes + 0x3044, entity);
    func_0200a310(bytes + 0x2fbc);
    func_02008cf8(self, func_02008af8(self), (void *)configPointer);
    *(s32 *)(bytes + 0x30fc) = 1;
    func_020088b8(self, 1, 0);
    func_0200ec6c(bytes + 0x24, 1);

    ActorCollection_DispatchEventToActors((u8 *)*(void **)(bytes + 0x2fb8) + 8,
                  func_02009d0c(bytes + 0x3044));
    ActorCollection_DispatchEventToActors(bytes + 0x28, func_02009d78(bytes + 0x2fbc));

    modeBits = *(const u32 *)(config + 0x40);
    if ((s32)(modeBits << 9) < 0)
        func_02006fd4(0);
    else
        func_02006fd4(1);

    switch ((modeBits >> 18) & 3) {
    case 1:
        if (*(const s16 *)(config + 0x12) >= 0)
            func_02020060(func_02009d78(bytes + 0x2fbc), configPointer);
        break;
    case 2:
        if (*(const s16 *)(config + 0x12) >= 0)
            func_02020060(func_02009d78(bytes + 0x2fbc), configPointer);
        break;
    }

    *(s32 *)(bytes + 0x30e4) = -1;
    func_0201140c(gLupyContext, 1);
    *(u16 *)((u8 *)gLupyContext + 0xbc) = 250;
    *(u16 *)((u8 *)gLupyContext + 0xbe) = 30;

    if (((modeBits >> 18) & 3) == 2 &&
        *(const s32 *)(config + 0x48) != -1) {
        func_02012444(*(void **)(bytes + 0x2fb8), bytes + 0x2fa4);
    }

    *(void **)(bytes + 0x30f0) = entity;
    func_02010520(data_021052fc.taskNode->task, 1);
    *(u32 *)(bytes + 0x30b8) |= 0x30;
    Scene_SetFlags03((Scene *)self);
}
