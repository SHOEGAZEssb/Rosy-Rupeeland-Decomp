#include "tingle/types.h"

/*
 * Overlay 1 embedded-state query forwarding. This recovered helper exposes a
 * result from the column controller embedded at offset 0x1C0.
 */

typedef struct Overlay001EmbeddedQueryState {
    u8 field_000[0x1c0];
    u8 embedded_1c0[1];
} Overlay001EmbeddedQueryState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02093c78(void *embeddedState);
#ifdef __cplusplus
}
#endif

/*
 * Pass the embedded object at state+0x1C0 to func_02093c78 and return its result
 * unchanged. The query meaning remains unconfirmed; this wrapper changes no
 * other state and performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc310(Overlay001EmbeddedQueryState *state)
{
    return func_02093c78(state->embedded_1c0);
}
