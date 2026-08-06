#include "tingle/types.h"

/*
 * Overlay 1 no-op callback. This recovered hook intentionally performs no work
 * and exists to satisfy a callback or lifecycle interface.
 */

/*
 * Ignore all implicit callback context, return no value, and leave memory, SDK
 * state, and hardware unchanged.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fbab8(void)
{
}
