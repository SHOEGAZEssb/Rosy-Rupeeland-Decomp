#include "tingle/types.h"

/*
 * Overlay 6 presentation deletion. This recovered deleting destructor releases
 * both heap helpers, restores display state, and frees the presentation object.
 */

typedef struct Overlay006Presentation {
    const void *vtable_000;
    u8 field_004[0x1c];
    u32 flags_020;
    u8 field_024[0x6c];
    void *overlay46Helper_090;
    void *auxiliary_094;
} Overlay006Presentation;

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_ov006_021fbc88[];
extern void AreaInfoPanelPresentation_Destroy(void *object);
extern void func_ov046_0220ba80(void *object);
extern void Heap_Free(void *memory);
#ifdef __cplusplus
}
#endif

/*
 * Restore data_ov006_021fbc88, clear +0x20 bit 10, destroy/free auxiliary
 * +0x94 and overlay-46 helper +0x90 when non-null, clear sub BLDCNT
 * 0x04001050 and main DISPCNT bits 13..15, then Heap_Free(state) and return the
 * original pointer. Ownership and MMIO effects are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay006Presentation *func_ov006_021fb8c8(Overlay006Presentation *state)
{
    void *object;

    state->vtable_000 = data_ov006_021fbc88;
    state->flags_020 &= ~0x400;
    object = state->auxiliary_094;
    if (object != 0) {
        AreaInfoPanelPresentation_Destroy(object);
        Heap_Free(object);
    }
    object = state->overlay46Helper_090;
    if (object != 0) {
        func_ov046_0220ba80(object);
        Heap_Free(object);
    }
    *(volatile u16 *)0x04001050 = 0;
    *(volatile u32 *)0x04000000 &= ~0xe000;
    Heap_Free(state);
    return state;
}
