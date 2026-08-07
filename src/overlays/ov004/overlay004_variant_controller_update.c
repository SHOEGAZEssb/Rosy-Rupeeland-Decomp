#include "tingle/types.h"

/*
 * Overlay 4 variant-controller update. This recovered callback conditionally
 * advances the allocated helper while display-mode updates are enabled.
 */

typedef struct Overlay004VariantController {
    u8 field_000[0x20];
    u32 field_020_0_9 : 10;
    s32 applyDisplayMode_020_10 : 1;
    u32 field_020_11_31 : 21;
    u8 field_024[0x30];
    void *helper_054;
} Overlay004VariantController;

typedef void (*Overlay004VirtualUpdate)(void *object);

/*
 * When the signed one-bit flag at +0x20 bit 10 is set and helper_054 is
 * non-null, invoke the helper's vtable slot at +0x0C. Return zero regardless
 * of whether dispatch occurs. All state changes are delegated to the virtual
 * callee and this wrapper performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov004_021fca88(Overlay004VariantController *state)
{
    if (state->applyDisplayMode_020_10 && state->helper_054 != 0) {
        void *vtable = *(void **)state->helper_054;
        Overlay004VirtualUpdate update =
            *(Overlay004VirtualUpdate *)((u8 *)vtable + 0x0c);

        update(state->helper_054);
    }
    return 0;
}
