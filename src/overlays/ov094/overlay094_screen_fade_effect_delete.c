#include "tingle/types.h"

/* Overlay 94 deleting destructor for the title/menu screen effect. */

extern const u8 data_ov094_02219ed4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *memory);
extern void func_ov094_02219230(void *effect);
#ifdef __cplusplus
}
#endif

/*
 * Restores the dispatch record, clears hardware blend-control register
 * 0x04000050, invokes the no-op base destructor, frees the allocation, and
 * returns the original pointer.
 */
extern "C" void *func_ov094_022192a8(void *effect)
{
    *(const void **)effect = data_ov094_02219ed4;
    *(volatile u16 *)0x04000050 = 0;
    func_ov094_02219230(effect);
    Heap_Free(effect);
    return effect;
}
