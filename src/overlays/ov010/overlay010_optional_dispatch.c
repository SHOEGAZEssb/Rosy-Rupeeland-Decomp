#include "tingle/types.h"
/* Overlay 10 optional virtual dispatch. */
typedef void(*Call)(void *);
/* If object exists, call vtable slot +4 with it; return one regardless and delegate all effects. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov010_021fe950(void *o){if(o){void *v=*(void **)o;(*(Call *)((u8 *)v+4))(o);}return 1;}
