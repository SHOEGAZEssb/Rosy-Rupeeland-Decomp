#include "tingle/types.h"

/* Overlay 25 effect render callbacks, event dispatch, and small lifecycle helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_02203318[];
extern const u8 data_ov025_02203338[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_Play(void *, s32, s32);
extern void func_02095308(void *);
extern void func_020953c8(void *, void *);
extern void func_020954e0(void *);
extern void func_020954f4(void *);
extern void func_ov025_021fdec8(void *);
#ifdef __cplusplus
}
#endif

static s32 fixed_to_integer(s32 value)
{
    /* The recovered correction makes signed 20.12 conversion truncate at zero. */
    return (value + (s32)((u32)(value >> 11) >> 20)) >> 12;
}

/*
 * Render-position callback for the effect controller. It converts base fixed-
 * point x +0x10 and combined y +0x20/+0x30 to integer sprite coordinates,
 * writes them to both primary sprites, and offsets both secondary sprites by
 * signed +0xA8 on x. Four sprite positions change; returns void.
 */
extern "C" void func_ov025_021ff0c8(void *object)
{
    s32 x = fixed_to_integer(FIELD(s32, object, 0x10));
    s32 y = fixed_to_integer(FIELD(s32, object, 0x20) +
                             FIELD(s32, object, 0x30));
    void *primary[2] = { FIELD(void *, object, 0xe8),
                         FIELD(void *, object, 0xf0) };
    void *secondary[2] = { FIELD(void *, object, 0xec),
                           FIELD(void *, object, 0xf4) };
    for (s32 i = 0; i < 2; ++i) {
        FIELD(u16, primary[i], 0x2c) = (u16)x;
        FIELD(u16, primary[i], 0x2e) = (u16)y;
        FIELD(u16, secondary[i], 0x2c) =
            (u16)(x + FIELD(s32, object, 0xa8));
        FIELD(u16, secondary[i], 0x2e) = (u16)y;
    }
}

/* Marks both sprite owners +0xE0/+0xE4 ready by storing one at owner +0x20. */
extern "C" void func_ov025_021ff140(void *object)
{
    FIELD(s32, FIELD(void *, object, 0xe0), 0x20) = 1;
    FIELD(s32, FIELD(void *, object, 0xe4), 0x20) = 1;
}

/*
 * Dispatches a recovered effect event from `event`. Type zero invokes one of
 * two SDK effect hooks according to argument +4 and returns 2. Type one splits
 * the low halfword argument into a high sound group (bits 7+) and low 7-bit ID,
 * plays it through gSoundContext, and returns 2. Other types return 1.
 */
extern "C" s32 func_ov025_021ff158(void *object, const void *event)
{
    s32 type = FIELD(s32, event, 0);
    if (type == 0) {
        if (FIELD(s32, event, 4)) func_020954e0(object);
        else func_020954f4(object);
        return 2;
    }
    if (type == 1) {
        u16 packed = (u16)FIELD(s32, event, 4);
        Sound_Play(gSoundContext, packed >> 7, packed & 0x7f);
        return 2;
    }
    return 1;
}

/* Calls the documented empty lifecycle hook and returns the original object. */
extern "C" void *func_ov025_021ff1c8(void *object)
{
    func_ov025_021fdec8(object);
    return object;
}

/*
 * Initializes a 16-byte callback holder with vtable data_ov025_02203318 and
 * clears fields +4/+8/+0xC. Only holder memory changes; returns void.
 */
extern "C" void func_ov025_021ff1dc(void *holder)
{
    FIELD(const void *, holder, 0) = data_ov025_02203318;
    FIELD(s32, holder, 4) = 0;
    FIELD(s32, holder, 8) = 0;
    FIELD(s32, holder, 0xc) = 0;
}

/* Restores holder vtable +0 and invokes SDK cleanup; returns the same pointer. */
extern "C" void *func_ov025_021ff1fc(void *holder)
{
    FIELD(const void *, holder, 0) = data_ov025_02203318;
    func_02095308(holder);
    return holder;
}

/* Initializes the SDK base object from `sprite`, installs vtable data_ov025_02203338, and returns it. */
extern "C" void *func_ov025_021ff21c(void *object, void *sprite)
{
    func_020953c8(object, sprite);
    FIELD(const void *, object, 0) = data_ov025_02203338;
    return object;
}

/* Stores four caller values at object offsets +0xA4/+0xA8/+0xAC/+0xB0. */
extern "C" void func_ov025_021ff23c(void *object, s32 value_a,
                                     s32 value_b, s32 value_c, s32 value_d)
{
    FIELD(s32, object, 0xa4) = value_a;
    FIELD(s32, object, 0xa8) = value_b;
    FIELD(s32, object, 0xac) = value_c;
    FIELD(s32, object, 0xb0) = value_d;
}

/*
 * Installs callback/argument at scene +0x24/+0x28 and clears callback step +4
 * and timer +8. The callback is not invoked; no value is returned.
 */
extern "C" void func_ov025_021ff254(void *scene, void *callback, void *argument)
{
    FIELD(void *, scene, 0x24) = callback;
    FIELD(void *, scene, 0x28) = argument;
    FIELD(s32, scene, 4) = 0;
    FIELD(s32, scene, 8) = 0;
}
