#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"

/* Compact flag, timing, global-access, and deleting helpers for the runtime. */

extern GamePhaseRuntime *gGamePhaseRuntime;
extern void *data_020f4e14;
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *font);
#ifdef __cplusplus
}
#endif

/*
 * Process pending presentation refresh bits 0x10 and 0x20 independently,
 * clearing each request before refreshing its associated text/font object.
 * Returns no value.
 */
void GamePhaseRuntime_ProcessPendingPresentationRefreshes(GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    u32 flags = *(u32 *)(b + 0x30b8);
    if (flags & 0x10) {
        *(u32 *)(b + 0x30b8) = flags & ~0x10;
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    }
    flags = *(u32 *)(b + 0x30b8);
    if (flags & 0x20) {
        *(u32 *)(b + 0x30b8) = flags & ~0x20;
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    }
}

/* No-op predicate; it changes no state and always returns zero. */
s32 GamePhaseRuntime_DefaultPredicateReturnZero(void)
{
    return 0;
}

/*
 * Increment the signed counter at offset four. Values above 30 reset to zero
 * and return one; all other values remain stored and return zero.
 */
s32 FrameCounter_Tick31(void *counter)
{
    s32 value = ++*(s32 *)((u8 *)counter + 4);
    if (value > 30) {
        *(s32 *)((u8 *)counter + 4) = 0;
        return 1;
    }
    return 0;
}

/* Store value at offset 0x30f8 of the global active runtime; returns no value. */
void GamePhaseRuntime_SetGlobalValue30F8(void *value)
{
    *(void **)((u8 *)gGamePhaseRuntime + 0x30f8) = value;
}

/* Return the area-dependent auxiliary overlay object at +0x30ec; changes no state. */
void *GamePhaseRuntime_GetAuxiliaryOverlayObject(GamePhaseRuntime *self)
{
    return *(void **)((u8 *)self + 0x30ec);
}

/* Free allocation and return its original address; Heap_Free is the only effect. */
void *Heap_FreeAndReturnPointer(void *allocation)
{
    Heap_Free(allocation);
    return allocation;
}
