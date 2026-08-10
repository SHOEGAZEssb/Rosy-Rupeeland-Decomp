#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"

/* Heap-deleting destruction entry point for GamePhaseRuntime. */

/*
 * Perform the complete documented teardown from GamePhaseRuntime_Destroy, free the
 * runtime allocation, and return its original address. Retail duplicates the
 * destructor body; the portable implementation shares it. All scene, overlay,
 * task, sound, hardware, and heap effects of GamePhaseRuntime_Destroy occur first.
 */
GamePhaseRuntime *GamePhaseRuntime_DestroyAndFree(GamePhaseRuntime *self)
{
    GamePhaseRuntime_Destroy(self);
    Heap_Free(self);
    return self;
}
