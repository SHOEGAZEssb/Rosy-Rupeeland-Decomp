#include "tingle/frame_task.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"

/*
 * Ordered destruction of GamePhaseRuntime and its embedded/owned subsystems.
 * Optional pointers retain offset-derived names until their classes are known.
 */

typedef struct GamePhaseRuntimeGlobal {
    GamePhaseRuntime *runtime;
    FrameTaskNode *taskNode;
} GamePhaseRuntimeGlobal;

extern u32 data_020d431c[];
extern GamePhaseRuntimeGlobal data_021052fc;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020ae9a4(void);
extern void func_020ae90c(void);
extern void func_0200e61c(void *object);
extern void func_ov056_0220e79c(void *object);
extern void func_0200e5bc(void *object);
extern void func_0200f824(void);
extern void func_0200f314(void);
extern void func_02058ce0(void *soundContext);
extern void func_020099fc(void *object);
extern void func_02009d58(void *object);
extern void func_0200e574(void *object);

#ifdef __cplusplus
}
#endif

typedef void (*DeletingDestructor)(void *object);

/*
 * Restore this class's vtable, disable scene processing, tear down global and
 * embedded systems in retail order, release optional heap objects and the frame
 * task, restore DS BG0 display routing, destroy the overlay slot, then destroy
 * the Scene base. Returns self; sound, overlay, heap, hardware, and task state
 * may all change.
 */
GamePhaseRuntime *func_02007064(GamePhaseRuntime *self)
{
    u8 *bytes = (u8 *)self;
    void *object;

    self->vtable = data_020d431c;
    Scene_ClearFlags03((Scene *)self);
    func_020ae9a4();
    func_020ae90c();

    object = *(void **)(bytes + 0x30e8);
    if (object != 0) {
        DeletingDestructor *vtable = *(DeletingDestructor **)object;
        vtable[1](object);
        *(void **)(bytes + 0x30e8) = 0;
    }

    func_0200e61c(bytes + 0x24);
    object = *(void **)(bytes + 0x2fb8);
    if (object != 0) {
        DeletingDestructor *vtable = *(DeletingDestructor **)object;
        vtable[1](object);
    }

    object = *(void **)(bytes + 0x30ec);
    if (object != 0) {
        func_ov056_0220e79c(object);
        Heap_Free(object);
        *(void **)(bytes + 0x30ec) = 0;
    }

    func_0200e5bc(bytes + 0x24);
    func_02007040(self);
    func_0200f824();
    func_0200f314();

    *(volatile u32 *)0x04000000 =
        (*(volatile u32 *)0x04000000 & ~0x1f00) | 0x1000;
    *(volatile u32 *)0x04001000 =
        (*(volatile u32 *)0x04001000 & ~0x1f00) | 0x1000;

    FrameTaskList_DestroyNode(data_021052fc.taskNode);
    func_02058ce0(gSoundContext);
    func_02006280((OverlaySlot *)(bytes + 0x30c0));
    func_020099fc(bytes + 0x3044);
    func_02009d58(bytes + 0x2fbc);
    func_0200e574(bytes + 0x24);
    Scene_Destroy((Scene *)self);
    return self;
}
