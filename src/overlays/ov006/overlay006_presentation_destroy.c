#include "tingle/types.h"

/*
 * Overlay 6 presentation destruction. This recovered non-deleting destructor
 * releases its two heap helpers and restores display hardware state.
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
extern void func_020280d8(void *object);
extern void func_ov046_0220ba80(void *object);
extern void Heap_Free(void *memory);
#ifdef __cplusplus
}
#endif

/*
 * Restore data_ov006_021fbc88 as the vtable and clear +0x20 bit 10. For the
 * non-null auxiliary at +0x94, call func_020280d8 then Heap_Free; for the
 * non-null overlay-46 helper at +0x90, call func_ov046_0220ba80 then Heap_Free.
 * Clear sub BLDCNT halfword 0x04001050 and bits 13..15 of main DISPCNT
 * 0x04000000, then return state without freeing it. Ownership and MMIO effects
 * are confirmed; embedded members require no explicit teardown in this routine.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay006Presentation *func_ov006_021fb848(Overlay006Presentation *state)
{
    void *object;

    state->vtable_000 = data_ov006_021fbc88;
    state->flags_020 &= ~0x400;
    object = state->auxiliary_094;
    if (object != 0) {
        func_020280d8(object);
        Heap_Free(object);
    }
    object = state->overlay46Helper_090;
    if (object != 0) {
        func_ov046_0220ba80(object);
        Heap_Free(object);
    }
    *(volatile u16 *)0x04001050 = 0;
    *(volatile u32 *)0x04000000 &= ~0xe000;
    return state;
}
