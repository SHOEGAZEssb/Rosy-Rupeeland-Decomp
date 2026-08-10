#include "tingle/game_phase_state.h"
#include "tingle/heap.h"

/* Create and configure the map/runtime object selected by a phase descriptor. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 gGamePhaseStateRendererAllocationTag[];
extern void *func_02029218(void *object);
extern void func_02029ca4(void *object, const void *configuration);
extern void *func_0202becc(void *object);
extern void *func_0202c308(void *object);
extern void *func_0202c744(void *object);
extern void *func_0202cbe0(void *object);
extern void GamePhaseRegionTable_Load(void *object, u32 value);
extern void GamePhaseRegionTable_SetGameWorkFlagBase(void *object, u32 value);
#ifdef __cplusplus
}
#endif

typedef void *(*ObjectConstructor)(void *object);
typedef void (*ObjectConfigureMethod)(void *object, u32 value,
                                      s32 enabled, s32 mode);

/*
 * Set BG0..BG3 priorities to 0/0/1/2 and hide DISPCNT planes 0..2. Allocate
 * the 0x187c-byte phase object variant selected by phase IDs 2/0xc7, 3, 4,
 * 0x5d, or the default, then configure it from descriptor offsets 0x04/0x34.
 * The helper at 0x2f80 also receives descriptor values 0x04 and 0x48.
 */
void GamePhaseState_CreatePhaseObject(GamePhaseState *self, const void *configuration)
{
    const u8 *config = (const u8 *)configuration;
    u32 phaseId = *(u32 *)config;
    ObjectConstructor constructor;
    void *object;

    *(volatile u16 *)0x0400000e =
        (*(volatile u16 *)0x0400000e & ~3) | 2;
    *(volatile u16 *)0x0400000c =
        (*(volatile u16 *)0x0400000c & ~3) | 1;
    *(volatile u16 *)0x0400000a &= (u16)~3;
    *(volatile u16 *)0x04000008 &= (u16)~3;
    *(volatile u32 *)0x04000000 &= ~0x38000000;

    if (phaseId == 2 || phaseId == 0xc7)
        constructor = func_0202becc;
    else if (phaseId == 3)
        constructor = func_0202c308;
    else if (phaseId == 4)
        constructor = func_0202c744;
    else if (phaseId == 0x5d)
        constructor = func_0202cbe0;
    else
        constructor = func_02029218;

    object = Heap_Alloc(0x187c, (const char *)gGamePhaseStateRendererAllocationTag, 4,
                        &gHeapContext);
    if (object != 0)
        object = constructor(object);
    self->phaseObject = object;
    ((ObjectConfigureMethod)(*(void ***)object)[5])(
        object, *(u32 *)(config + 4), 1, 0);
    func_02029ca4(object, config + 0x34);
    GamePhaseRegionTable_Load(self->helper_2f80, *(u32 *)(config + 4));
    GamePhaseRegionTable_SetGameWorkFlagBase(self->helper_2f80, *(u32 *)(config + 0x48));
}
