#include "tingle/game_phase_runtime.h"

/* Compact placement-value helpers used by actor synchronization. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02004fe0(void *value);
extern void func_020adff0(const void *left, const void *right,
                          void *destination);
#ifdef __cplusplus
}
#endif

/* Copy four signed halfwords from source to destination; changes no other state. */
void func_02008354(void *destination, const void *source)
{
    s16 *dst = (s16 *)destination;
    const s16 *src = (const s16 *)source;
    dst[0] = src[0];
    dst[1] = src[1];
    dst[2] = src[2];
    dst[3] = src[3];
}

/*
 * Initialize destination, then add the three-component payloads beginning at
 * offset four of left and right. Null inputs remain null. Returns no value;
 * initialization and the external vector addition mutate destination.
 */
void func_02008378(void *destination, const void *left, const void *right)
{
    func_02004fe0(destination);
    if (right != 0)
        right = (const u8 *)right + 4;
    if (left != 0)
        left = (const u8 *)left + 4;
    func_020adff0(left, right, (u8 *)destination + 4);
}

/* Store four inputs as truncated signed halfwords; returns no value. */
void func_020083b0(void *destination, s32 a, s32 b, s32 c, s16 d)
{
    s16 *dst = (s16 *)destination;
    dst[0] = (s16)a;
    dst[1] = (s16)b;
    dst[2] = (s16)c;
    dst[3] = (s16)d;
}
