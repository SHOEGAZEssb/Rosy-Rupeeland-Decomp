#include "tingle/types.h"

/*
 * Overlay 4 variant-controller destruction. This recovered non-deleting
 * destructor disables display-mode updates and destroys the owned helper.
 */

typedef struct Overlay004VariantController {
    const void *vtable_000;
    u8 field_004[0x1c];
    u32 flags_020;
    u8 field_024[0x30];
    void *helper_054;
} Overlay004VariantController;

typedef void (*Overlay004VirtualDestroy)(void *object);

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_ov004_021fcdbc[];
#ifdef __cplusplus
}
#endif

/*
 * Restore data_ov004_021fcdbc as the vtable, clear +0x20 bit 10, and, when
 * helper_054 is non-null, invoke its vtable slot at +0x08. Return state. The
 * virtual callee owns the helper's teardown effects; this function does not
 * free state itself or access hardware directly.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay004VariantController *
func_ov004_021fca00(Overlay004VariantController *state)
{
    state->vtable_000 = data_ov004_021fcdbc;
    state->flags_020 &= ~0x400;
    if (state->helper_054 != 0) {
        void *vtable = *(void **)state->helper_054;
        Overlay004VirtualDestroy destroy =
            *(Overlay004VirtualDestroy *)((u8 *)vtable + 0x08);

        destroy(state->helper_054);
    }
    return state;
}
