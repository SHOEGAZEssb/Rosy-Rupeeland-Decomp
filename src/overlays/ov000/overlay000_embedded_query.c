#include "tingle/types.h"

/*
 * Overlay 0 embedded-state query forwarding. This recovered helper exposes a
 * result from the object embedded at offset 0x270.
 */

typedef struct Overlay000EmbeddedQueryState {
    u8 field_000[0x270];
    u8 embedded_270[1];
} Overlay000EmbeddedQueryState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 IndexedSelectionController_AdvancePacing(void *embeddedState);
#ifdef __cplusplus
}
#endif

/*
 * Pass the embedded object at state+0x270 to IndexedSelectionController_AdvancePacing and return its
 * result unchanged. The operation's semantics and side effects remain
 * unconfirmed; this wrapper performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc528(Overlay000EmbeddedQueryState *state)
{
    return IndexedSelectionController_AdvancePacing(state->embedded_270);
}
