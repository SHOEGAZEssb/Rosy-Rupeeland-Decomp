#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"

/* Replace the runtime scene object at offset 0x30e8 by mode and orientation. */

extern u8 gGamePhaseDualScreenUiPresentationAllocationTag[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02025f20(void *object, void *area);
extern void *func_020261bc(void *object, void *area);
extern void *DualScreenUiPresentationBase_InitAlternateEntry(void *object, void *area);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/*
 * Destroy the existing object at 0x30e8 through virtual slot one, then create
 * its replacement. Mode zero selects a 0xd4-byte orientation-one object or a
 * 0xd8-byte orientation-two object; modes one/two select a 0xc8-byte common
 * object. Invalid modes/orientations halt. Allocation failure stores null.
 * Returns no value; destruction always precedes allocation.
 */
void GamePhaseRuntime_RecreateDualScreenUiPresentation(GamePhaseRuntime *self, s32 mode, void *area)
{
    u8 *b = (u8 *)self;
    void *object = *(void **)(b + 0x30e8);
    u32 orientation;

    if (object != 0) {
        (*(void (***)(void *))object)[1](object);
        *(void **)(b + 0x30e8) = 0;
    }

    if (mode == 0) {
        orientation = (*(u32 *)((u8 *)area + 0x40) << 12) >> 30;
        if (orientation == 1) {
            object = Heap_Alloc(0xd4, (const char *)gGamePhaseDualScreenUiPresentationAllocationTag, 4,
                                &gHeapContext);
            if (object != 0)
                object = func_02025f20(object, area);
            *(void **)(b + 0x30e8) = object;
            return;
        }
        if (orientation == 2) {
            object = Heap_Alloc(0xd8, (const char *)gGamePhaseDualScreenUiPresentationAllocationTag, 4,
                                &gHeapContext);
            if (object != 0)
                object = func_020261bc(object, area);
            *(void **)(b + 0x30e8) = object;
            return;
        }
        OS_Halt();
        return;
    }
    if (mode == 1 || mode == 2) {
        object = Heap_Alloc(0xc8, (const char *)gGamePhaseDualScreenUiPresentationAllocationTag, 4,
                            &gHeapContext);
        if (object != 0)
            object = DualScreenUiPresentationBase_InitAlternateEntry(object, area);
        *(void **)(b + 0x30e8) = object;
        return;
    }
    OS_Halt();
}
