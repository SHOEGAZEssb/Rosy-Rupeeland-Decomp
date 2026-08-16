#include "tingle/types.h"

/* Overlay 14 presentation visibility toggle tied to a subordinate runtime object. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov000_021fcad8(void *);
extern void func_ov000_021fb8f0(void *, void *);
extern void func_ov000_021fb890(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * When argument two is zero and the subordinate +0x78 query returns a non-null
 * +0x0C member, call func_ov000_021fb8f0 on +0x88 and set state flag bit 1 at
 * +0x4C. Otherwise call func_ov000_021fb890(+0x88,1) and clear that flag. Return
 * void; the callees alter presentation state. The visibility interpretation is
 * inferred from the shared overlay 0 interfaces.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov014_021fd2f8(void *state, s32 forceDisabled)
{
    void *record = 0;

    if (forceDisabled == 0) {
        void *entry = func_ov000_021fcad8(*(void **)((u8 *)state + 0x78));
        record = *(void **)((u8 *)entry + 0x0c);
    }

    if (record != 0) {
        func_ov000_021fb8f0(*(void **)((u8 *)state + 0x88), record);
        *(u32 *)((u8 *)state + 0x4c) |= 2;
    } else {
        func_ov000_021fb890(*(void **)((u8 *)state + 0x88), 1);
        *(u32 *)((u8 *)state + 0x4c) &= ~2u;
    }
}
