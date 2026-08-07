#include "tingle/types.h"

/*
 * Overlay 4 variant-controller deletion. This recovered deleting destructor
 * disables display-mode updates, destroys the owned helper, and frees state.
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
extern void Heap_Free(void *memory);
#ifdef __cplusplus
}
#endif

/*
 * Restore data_ov004_021fcdbc as the vtable, clear +0x20 bit 10, invoke the
 * non-null helper_054 object's vtable slot at +0x08, then pass state to
 * Heap_Free and return the original pointer. The virtual call and allocator
 * perform the observable teardown; no direct hardware access occurs here.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay004VariantController *
func_ov004_021fca40(Overlay004VariantController *state)
{
    state->vtable_000 = data_ov004_021fcdbc;
    state->flags_020 &= ~0x400;
    if (state->helper_054 != 0) {
        void *vtable = *(void **)state->helper_054;
        Overlay004VirtualDestroy destroy =
            *(Overlay004VirtualDestroy *)((u8 *)vtable + 0x08);

        destroy(state->helper_054);
    }
    Heap_Free(state);
    return state;
}
