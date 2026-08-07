#include "tingle/types.h"

/*
 * Overlay 9 scene-member idle callback. This recovered helper initializes an
 * embedded member from descriptor entries when its +0x28 field is clear.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_ov009_021feb80[];
extern void func_ov009_021fce74(void *member, s32 first, s32 second, s32 unused);
#ifdef __cplusplus
}
#endif

/*
 * If state +0x28 is zero, initialize member +0x24 from descriptor entries
 * data_ov009_021feb80[2] and data_ov009_021feb80[3]-0x48. Return zero in all
 * cases. Member effects are delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov009_021fd49c(void *state)
{
    if (*(s32 *)((u8 *)state + 0x28) == 0) {
        func_ov009_021fce74((u8 *)state + 0x24,
                             (s32)data_ov009_021feb80[2],
                             (s32)data_ov009_021feb80[3] - 0x48, 0);
    }
    return 0;
}
