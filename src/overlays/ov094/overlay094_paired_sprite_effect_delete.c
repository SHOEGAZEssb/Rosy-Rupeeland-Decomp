#include "tingle/types.h"

/* Overlay 94 deleting destructor for the paired title sprite effect. */

extern const u8 data_ov094_02219e9c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_ReleaseFromGroup(void *state);
extern void Heap_Free(void *memory);
extern void func_0209548c(void *effect);
#ifdef __cplusplus
}
#endif

/*
 * Restores the dispatch record, releases the second state, destroys inherited
 * paired-effect state, frees the allocation, and returns the original pointer.
 */
extern "C" void *func_ov094_02219460(void *effect)
{
    *(const void **)effect = data_ov094_02219e9c;
    GraphicsSpriteState_ReleaseFromGroup(*(void **)((u8 *)effect + 0xa4));
    func_0209548c(effect);
    Heap_Free(effect);
    return effect;
}
