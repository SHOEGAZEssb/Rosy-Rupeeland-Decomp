#include "tingle/types.h"

/*
 * Overlay 7 primary-object timed mode setup. This recovered helper selects
 * mode 5, clears transient jitter state, and initializes a frame countdown.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02072b68(void *member, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Submit mode 5 through the pointer stored at the primary object's +0x0C
 * field, clear bytes +0xA1/+0xA0 and word +0x98, and set halfword +0xD8 to
 * 240. Return no value; no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov007_021fc200(void *state)
{
    void *primary = *(void **)((u8 *)state + 0x4c);

    func_02072b68(*(void **)((u8 *)primary + 0x0c), 5);
    *(u8 *)((u8 *)state + 0xa1) = 0;
    *(u8 *)((u8 *)state + 0xa0) = 0;
    *(s32 *)((u8 *)state + 0x98) = 0;
    *(u16 *)((u8 *)state + 0xd8) = 240;
}
