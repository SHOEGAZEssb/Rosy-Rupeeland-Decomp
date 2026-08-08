#include "tingle/types.h"

/* Overlay 34 render-object base hook and constructor. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov034_021ff178[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020949ec(void *object);
extern void func_020948d4(void *embedded, s32 capacity, s32 initialValue);
#ifdef __cplusplus
}
#endif

/*
 * Empty base-destructor hook for the overlay-34 render object. It accepts the
 * object, changes no observable state, returns no value, and performs no SDK or
 * hardware operation.
 */
extern "C" void func_ov034_021fce00(void *object)
{
    (void)object;
}

/*
 * Constructs an overlay-34 render object in `object`. It initializes the common
 * base, installs vtable 0x021FF178, stores caller pointers/indices at +0x9C,
 * +0xA0, and +0xA4, clears +0xA6, and initializes the embedded render buffer at
 * +0x6C with capacity 0x200 and initial value zero. Returns `object`; engine
 * allocation/buffer state may change, but no direct MMIO occurs here.
 */
extern "C" void *func_ov034_021fce04(void *object, void *owner,
                                     s32 entryIndex, u16 mode)
{
    func_020949ec(object);
    FIELD(const void *, object, 0) = data_ov034_021ff178;
    FIELD(void *, object, 0x9c) = owner;
    FIELD(s32, object, 0xa0) = entryIndex;
    FIELD(u16, object, 0xa4) = mode;
    FIELD(u16, object, 0xa6) = 0;
    func_020948d4((u8 *)object + 0x6c, 0x200, 0);
    return object;
}
