#include "tingle/types.h"

/*
 * Overlay 9 optional-object dispatch. This recovered helper invokes virtual
 * slot +0x04 when an object is present and reports unconditional completion.
 */

typedef void (*Overlay009VirtualCall)(void *object);

/*
 * If object is non-null, load its vtable at +0x00 and call slot +0x04 with the
 * object. Return one regardless of object presence. Virtual effects are
 * delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov009_021fea2c(void *object)
{
    if (object != 0) {
        void *vtable = *(void **)object;
        (*(Overlay009VirtualCall *)((u8 *)vtable + 4))(object);
    }
    return 1;
}
