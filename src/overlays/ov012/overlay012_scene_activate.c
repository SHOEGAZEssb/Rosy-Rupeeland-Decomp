#include "tingle/types.h"

/* Overlay 12 object-viewer scene activation wrapper. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02091fb0(void *, s32);
#ifdef __cplusplus
}
#endif

/* Pass the embedded scene member at +0x24 and value one to func_02091fb0; returns void and delegates all transition effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fd598(void *state)
{
    func_02091fb0((u8 *)state + 0x24, 1);
}
