#include "tingle/types.h"
#include "tingle/heap.h"

/*
 * Overlay 3 pixel-buffer construction. This recovered subsystem allocates a
 * cleared 0x6000-byte image buffer, builds a grayscale palette, and randomizes
 * a shared table of fifty two-word records used by later drawing routines.
 */

typedef struct Overlay003Pair {
    u32 field_00;
    u32 field_04;
} Overlay003Pair;

typedef struct Overlay003PixelBufferState {
    void *pixels_000;
    u16 palette_004[16];
} Overlay003PixelBufferState;

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_ov003_021fbcd0[];
extern Overlay003Pair data_ov003_021fbb40[50];
extern void MIi_CpuClearFast(u32 value, void *destination, u32 size);
extern u32 genrand_int32(void);
extern s32 func_020bf1f8(s32 numerator, s32 denominator);
extern void func_ov003_021fb7c0(Overlay003Pair *destination,
                                const Overlay003Pair *source);
#ifdef __cplusplus
}
#endif

/*
 * Allocate 0x6000 bytes with the overlay's confirmed allocation tag, 0x20-byte
 * alignment, and gHeapContext, then clear the buffer. Fill palette_004 with 16
 * RGB555 grayscale entries where each channel equals twice the index. Perform
 * 100 random swaps in the mutable 50-entry data_ov003_021fbb40 table; the
 * compiler runtime helper supplies each random value modulo 50 via its
 * remainder result. Return state. Heap/RNG effects occur through callees; the
 * shared-table purpose beyond later drawing order remains inferred.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay003PixelBufferState *Overlay003_PixelBuffer_Init(
    Overlay003PixelBufferState *state)
{
    s32 i;

    state->pixels_000 =
        Heap_AllocCore(0x6000, data_ov003_021fbcd0, 0x20, &gHeapContext);
    MIi_CpuClearFast(0, state->pixels_000, 0x6000);
    for (i = 0; i < 16; i++) {
        u16 channel = (u16)(i * 2);
        state->palette_004[i] =
            channel | (channel << 5) | (channel << 10);
    }
    for (i = 0; i < 100; i++) {
        s32 first = genrand_int32() % 50;
        s32 second = genrand_int32() % 50;

        if (first != second) {
            Overlay003Pair temporary = data_ov003_021fbb40[first];
            func_ov003_021fb7c0(&data_ov003_021fbb40[first],
                                &data_ov003_021fbb40[second]);
            func_ov003_021fb7c0(&data_ov003_021fbb40[second], &temporary);
        }
    }
    return state;
}
