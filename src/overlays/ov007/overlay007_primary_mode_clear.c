#include "tingle/types.h"

/*
 * Overlay 7 primary-object mode reset. This recovered helper selects mode 4
 * and clears the controller's transient jitter state.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02072b68(void *member, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Submit mode 4 through the pointer stored at the primary object's +0x0C
 * field, then clear bytes +0xA1/+0xA0 and word +0x98. Return no value; no
 * direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov007_021fc1d4(void *state)
{
    void *primary = *(void **)((u8 *)state + 0x4c);

    func_02072b68(*(void **)((u8 *)primary + 0x0c), 4);
    *(u8 *)((u8 *)state + 0xa1) = 0;
    *(u8 *)((u8 *)state + 0xa0) = 0;
    *(s32 *)((u8 *)state + 0x98) = 0;
}
