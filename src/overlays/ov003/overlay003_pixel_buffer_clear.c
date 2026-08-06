#include "tingle/types.h"

/* Overlay 3 pixel-buffer clearing. This recovered helper resets the complete
 * allocated image buffer to zero without changing its palette. */

typedef struct Overlay003PixelBufferClearState {
    void *pixels_000;
} Overlay003PixelBufferClearState;

#ifdef __cplusplus
extern "C" {
#endif
extern void MIi_CpuClearFast(u32 value, void *destination, u32 size);
#ifdef __cplusplus
}
#endif

/* Clear all 0x6000 bytes at pixels_000 and return no value. The SDK fast-clear
 * routine owns the memory operation; this wrapper performs no direct hardware access. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov003_021fb7ec(Overlay003PixelBufferClearState *state)
{
    MIi_CpuClearFast(0, state->pixels_000, 0x6000);
}
