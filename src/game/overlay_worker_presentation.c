#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Manage a presentation whose visible behavior is implemented by an overlay
 * worker.  Instances share an embedded runtime resource guarded by a global
 * count, drive a two-state overlay worker, and use GameWork flag 0x3bb as an
 * additional completion signal.
 */

typedef struct OverlayWorkerPresentation {
    void **vtable;
    u32 field04;
    s32 state08;
    u8 *worker0c;
    u8 sharedResource10[0x34];
} OverlayWorkerPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6304;
extern const char gOverlayWorkerAllocationTag[];
extern void *gGameWork;
extern s32 data_021055cc;
extern void *TimedSpritePresentation_InitBase(void *self);
extern void *func_0201e28c(void *self);
extern void OverlaySlot_Init(void *resource);
extern void OverlaySlot_LoadOverlay(void *resource, s32 id);
extern void OverlaySlot_UnloadOverlay(void *resource);
extern void OverlaySlot_Destroy(void *resource);
extern void GameWork_ClearFlag(void *gameWork, s32 flag);
extern s32 GameWork_TestFlag(void *gameWork, s32 flag);
extern void *func_ov043_0220b740(void *worker, s32 first, s32 second,
                                s32 third, s32 fourth);
extern void func_ov047_0220ba64(void *worker);
extern void func_ov047_0220baa8(void *worker);
extern s32 func_ov047_0220c338(void *worker);
extern void func_ov047_0220bda8(void *worker);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the recovered base, embedded sharedResource10, and this vtable;
 * clear GameWork flag 0x3bb and initialize shared resource ID 0x2f only for
 * the first live instance.  Allocate a 0x44-byte overlay worker, construct it
 * from the four recovered inputs, retain it, run its initial refresh, clear
 * state08, increment the shared count, and return self.  The retail path calls
 * the refresh function even if worker allocation failed.
 */
OverlayWorkerPresentation *func_020200bc(
    OverlayWorkerPresentation *self, s32 first, s32 second, s32 third,
    s32 fourth)
{
    u8 *worker;

    TimedSpritePresentation_InitBase(self);
    self->vtable = (void **)data_020d6304;
    OverlaySlot_Init(self->sharedResource10);
    GameWork_ClearFlag(gGameWork, 0x3bb);
    if (data_021055cc == 0) {
        OverlaySlot_LoadOverlay(self->sharedResource10, 0x2f);
    }
    worker = (u8 *)Heap_Alloc(0x44, gOverlayWorkerAllocationTag, 4, &gHeapContext);
    if (worker != 0) {
        func_ov043_0220b740(worker, first, second, third, fourth);
    }
    self->worker0c = worker;
    func_ov047_0220bda8(worker);
    self->state08 = 0;
    data_021055cc++;
    return self;
}

static OverlayWorkerPresentation *teardown_overlay_worker_presentation(
    OverlayWorkerPresentation *self)
{
    self->vtable = (void **)data_020d6304;
    data_021055cc--;
    if (self->worker0c != 0) {
        func_ov047_0220ba64(self->worker0c);
        Heap_Free(self->worker0c);
    }
    if (data_021055cc == 0) {
        OverlaySlot_UnloadOverlay(self->sharedResource10);
    }
    OverlaySlot_Destroy(self->sharedResource10);
    func_0201e28c(self);
    return self;
}

/*
 * Decrement the shared instance count, destroy and free worker0c when present,
 * release the shared resource globally when the last instance leaves, tear
 * down the embedded resource and recovered base, and return self.
 */
OverlayWorkerPresentation *func_02020188(
    OverlayWorkerPresentation *self)
{
    return teardown_overlay_worker_presentation(self);
}

/* Perform func_02020188's teardown, free self, and return its old address. */
OverlayWorkerPresentation *func_020201fc(
    OverlayWorkerPresentation *self)
{
    teardown_overlay_worker_presentation(self);
    Heap_Free(self);
    return self;
}

/*
 * In state zero, step the worker, advance to state one when its readiness test
 * succeeds, refresh it, and return zero.  In state one, refresh and return one
 * for confirmed worker modes 2, 7, 8, 9, 10, 12, or 14.  For other modes,
 * consume GameWork flag 0x3bb and return one if it was set; otherwise return
 * zero.  Values of state08 beyond one are inert and return zero.
 */
s32 func_02020278(OverlayWorkerPresentation *self)
{
    s32 mode;

    if (self->state08 == 0) {
        func_ov047_0220baa8(self->worker0c);
        if (func_ov047_0220c338(self->worker0c) != 0) {
            self->state08++;
        }
        func_ov047_0220bda8(self->worker0c);
        return 0;
    }
    if (self->state08 != 1) {
        return 0;
    }
    func_ov047_0220bda8(self->worker0c);
    mode = *(s32 *)(self->worker0c + 0x20);
    if (mode == 2 || (mode >= 7 && mode <= 10) || mode == 12 || mode == 14) {
        return 1;
    }
    if (GameWork_TestFlag(gGameWork, 0x3bb) != 0) {
        GameWork_ClearFlag(gGameWork, 0x3bb);
        return 1;
    }
    return 0;
}
