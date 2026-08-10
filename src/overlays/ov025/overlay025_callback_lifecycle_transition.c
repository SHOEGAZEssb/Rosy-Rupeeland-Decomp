#include "tingle/types.h"

/* Overlay 25 callback-holder lifecycle and title-state transition helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TransitionPair {
    void *callback;
    void *argument;
} TransitionPair;

extern const u8 data_ov025_02203318[];
extern const u8 data_ov025_02203338[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095308(void *);
extern void func_020953c8(void *, void *);
extern void func_ov025_021fdec8(void *);
#ifdef __cplusplus
}
#endif

/* Calls the recovered empty lifecycle hook and returns the original object. */
extern "C" void *func_ov025_021ff1c8(void *object)
{
    func_ov025_021fdec8(object);
    return object;
}

/*
 * Initializes a 16-byte callback holder with vtable data_ov025_02203318 and
 * clears fields +8/+4/+0xC. Only holder memory changes; returns void.
 */
extern "C" void func_ov025_021ff1dc(void *holder)
{
    FIELD(const void *, holder, 0) = data_ov025_02203318;
    FIELD(s32, holder, 8) = 0;
    FIELD(s32, holder, 4) = 0;
    FIELD(s32, holder, 0xc) = 0;
}

/* Restores holder vtable +0, invokes SDK cleanup, and returns the holder. */
extern "C" void *func_ov025_021ff1fc(void *holder)
{
    FIELD(const void *, holder, 0) = data_ov025_02203318;
    func_02095308(holder);
    return holder;
}

/*
 * Initializes the SDK base object from `sprite`, installs vtable
 * data_ov025_02203338, and returns the object.
 */
extern "C" void *func_ov025_021ff21c(void *object, void *sprite)
{
    func_020953c8(object, sprite);
    FIELD(const void *, object, 0) = data_ov025_02203338;
    return object;
}

/* Stores caller values at object offsets +0xA4/+0xA8/+0xAC/+0xB0. */
extern "C" void func_ov025_021ff23c(void *object, s32 value_a,
                                     s32 value_b, s32 value_c, s32 value_d)
{
    FIELD(s32, object, 0xa4) = value_a;
    FIELD(s32, object, 0xa8) = value_b;
    FIELD(s32, object, 0xac) = value_c;
    FIELD(s32, object, 0xb0) = value_d;
}

/*
 * Installs the callback/argument pair at scene +0x24/+0x28 and clears callback
 * step +4 and timer +8. The callback is not invoked; no value is returned.
 */
extern "C" void func_ov025_021ff254(void *scene, TransitionPair transition)
{
    FIELD(void *, scene, 0x24) = transition.callback;
    FIELD(void *, scene, 0x28) = transition.argument;
    FIELD(s32, scene, 4) = 0;
    FIELD(s32, scene, 8) = 0;
}
