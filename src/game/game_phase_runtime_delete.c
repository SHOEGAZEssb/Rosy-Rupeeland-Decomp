#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"

/* Heap-deleting destruction entry point for GamePhaseRuntime. */

/*
 * Perform the complete documented teardown from func_02007064, free the
 * runtime allocation, and return its original address. Retail duplicates the
 * destructor body; the portable implementation shares it. All scene, overlay,
 * task, sound, hardware, and heap effects of func_02007064 occur first.
 */
GamePhaseRuntime *func_0200719c(GamePhaseRuntime *self)
{
    func_02007064(self);
    Heap_Free(self);
    return self;
}
