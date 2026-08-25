#include "tingle/types.h"

/*
 * Overlay 5 transition priming. This recovered callback installs an initial
 * transition pair while the presentation remains in phase zero.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern const s32 data_ov005_021fca08[2];
extern void Overlay005_InitTransitionState(void *state, s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/*
 * If the signed phase word at state +0x04 is zero, pass the two words at
 * data_ov005_021fca08 to Overlay005_InitTransitionState. Return zero in all cases. Any
 * state changes are delegated to that helper; no hardware access occurs here.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay005_PrimeTransition(void *state)
{
    if (*(s32 *)((u8 *)state + 0x04) == 0) {
        Overlay005_InitTransitionState(state, data_ov005_021fca08[0],
                            data_ov005_021fca08[1]);
    }
    return 0;
}
