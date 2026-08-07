#include "tingle/types.h"

/*
 * Overlay 9 active-object release. This recovered helper detaches the retained
 * object and resets the embedded resource description used to create it.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02074038(void *owner, void *object);
extern void func_02071f38(void *member);
#ifdef __cplusplus
}
#endif

/*
 * Pass +0x84 and +0x88 to func_02074038, clear +0x88, then reset embedded
 * member +0x78 through func_02071f38. Return no value. Resource effects are
 * delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov009_021fd338(void *state)
{
    func_02074038(FIELD(void *, state, 0x84), FIELD(void *, state, 0x88));
    FIELD(void *, state, 0x88) = 0;
    func_02071f38((u8 *)state + 0x78);
}
