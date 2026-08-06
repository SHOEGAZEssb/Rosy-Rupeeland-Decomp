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
extern void func_02002728(void *allocation);
#ifdef __cplusplus
}
#endif

/* Free pixels_000 through func_02002728 and return state; heap effects are
 * delegated to that callee, and no other state or hardware is touched. */
#ifdef __cplusplus
extern "C"
#endif
Overlay003PixelBufferDestroyState *func_ov003_021fb7d4(
    Overlay003PixelBufferDestroyState *state)
{
    func_02002728(state->pixels_000);
    return state;
}
