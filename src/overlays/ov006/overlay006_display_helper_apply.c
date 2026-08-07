#include "tingle/types.h"

/*
 * Overlay 6 display-helper application. This recovered callback conditionally
 * submits the overlay-46 helper while display updates are enabled.
 */

typedef struct Overlay006DisplayHelperState {
    u8 field_000[0x20];
    u32 field_020_0_9 : 10;
    s32 enabled_020_10 : 1;
    u32 field_020_11_31 : 21;
    u8 field_024[0x6c];
    void *overlay46Helper_090;
} Overlay006DisplayHelperState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov046_0220c1d8(void *helper);
#ifdef __cplusplus
}
#endif

/*
 * If the signed one-bit flag at +0x20 bit 10 is set, call
 * func_ov046_0220c1d8 with overlay46Helper_090. Return zero in all cases.
 * Observable graphics effects are delegated to overlay 46 and no direct MMIO
 * access occurs here.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov006_021fbc00(Overlay006DisplayHelperState *state)
{
    if (state->enabled_020_10) {
        func_ov046_0220c1d8(state->overlay46Helper_090);
    }
    return 0;
}
