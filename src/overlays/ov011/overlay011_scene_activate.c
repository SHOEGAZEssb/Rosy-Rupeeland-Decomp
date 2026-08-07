#include "tingle/types.h"
/* Overlay 11 embedded +0x24 scene activation wrapper. */
#ifdef __cplusplus
extern "C" {
#endif
extern void func_02091fb0(void *,s32);
#ifdef __cplusplus
}
#endif
/* Tail-call func_02091fb0 with state +0x24 and one; return void and delegate transition effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov011_021fd174(void *s){func_02091fb0((u8 *)s+0x24,1);}
