#include "tingle/types.h"

/* Overlay 12 optional object callback dispatch. */

typedef void (*Overlay012Callback)(void *);

/* If object is non-null, call vtable slot +4 with object; return one regardless and delegate all callback effects. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov012_021fe3e8(void *object)
{
    if (object != 0) {
        void *vtable = *(void **)object;
        (*(Overlay012Callback *)((u8 *)vtable + 4))(object);
    }
    return 1;
}
