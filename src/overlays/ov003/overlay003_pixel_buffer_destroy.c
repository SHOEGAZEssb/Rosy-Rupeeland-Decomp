#include "tingle/types.h"

/*
 * Overlay 3 pixel-buffer destruction. This recovered helper frees the image
 * buffer allocated by the subsystem constructor.
 */

typedef struct Overlay003PixelBufferDestroyState {
    void *pixels_000;
} Overlay003PixelBufferDestroyState;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_FreeCore(void *allocation);
#ifdef __cplusplus
}
#endif

/* Free pixels_000 through Heap_FreeCore and return state; heap effects are
 * delegated to that callee, and no other state or hardware is touched. */
#ifdef __cplusplus
extern "C"
#endif
Overlay003PixelBufferDestroyState *func_ov003_021fb7d4(
    Overlay003PixelBufferDestroyState *state)
{
    Heap_FreeCore(state->pixels_000);
    return state;
}
