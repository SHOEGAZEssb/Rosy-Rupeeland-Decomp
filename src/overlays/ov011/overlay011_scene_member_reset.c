#include "tingle/types.h"

/* Overlay 11 embedded scene-member reset wrapper. */

#ifdef __cplusplus
extern "C" {
#endif
extern const s32 data_ov011_021fe3b0[];
extern void func_ov011_021fce50(void *member, s32 x, s32 y, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Reinitialize the member at state +0x24 using descriptor words +0x28 and
 * +0x2C, subtracting the confirmed 0x48 vertical bias from the latter. Pass
 * mode zero, return zero, and delegate all member-state changes.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov011_021fd410(void *state)
{
    func_ov011_021fce50((u8 *)state + 0x24, data_ov011_021fe3b0[10],
                        data_ov011_021fe3b0[11] - 0x48, 0);
    return 0;
}
