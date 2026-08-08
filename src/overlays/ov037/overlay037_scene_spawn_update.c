#include "tingle/types.h"

/* Overlay 37 timed spawning of transient scene objects and their lifetime setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021feeb0[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02091c7c(void *timer, s32 mode);
extern s32 func_020918f4(void *randomState, s32 bound);
extern void *func_02077308(void *resourceOwner, void *slot);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_020955d8(void *object, void *actor);
extern s32 func_0209189c(void *randomState, s32 minimum, s32 maximum);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_020948d4(void *field, s32 value, ...);
extern void func_020948e4(void *field, s32 mode, s32 value);
extern void func_020948f8(void *field, s32 mode, s32 value);
extern s32 func_02077248(void *actor);
extern void func_02095274(void *container, void *object);
extern void func_02091b98(void *timer, s32 delay);
extern void func_02076be8(void *actor, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Stores the signed low halfword of lifetime at +0x7C and clears elapsed
 * progress at +0x80. Returns nothing and only changes object state.
 */
extern "C" void func_ov037_021fdf50(void *object, s32 lifetime)
{
    FIELD(s32, object, 0x7c) = (s16)lifetime;
    FIELD(s32, object, 0x80) = 0;
}

/*
 * Processes two independent scene timers. A +0x1A8 event chooses one of two
 * actors, allocates a transient object, randomizes its position/scale and
 * lifetime, registers it in +0x12C, then restarts the timer with delay 2. A
 * +0x1C4 event randomizes an actor mode, spawns another object relative to the
 * primary child at +0x118, configures motion/lifetime, registers it, and
 * restarts with delay 8. Returns nothing; RNG, timers, heap, actors, and the
 * owned-child container may change.
 */
extern "C" void func_ov037_021fdd08(void *scene)
{
    void *randomState = (u8 *)scene + 0xbc;
    void *resourceOwner = FIELD(void *, scene, 0x114);

    if (func_02091c7c((u8 *)scene + 0x1a8, 2)) {
        void *slot = (u8 *)scene +
            (func_020918f4(randomState, 2) ? 0xec : 0xf8);
        void *actor = func_02077308(resourceOwner, slot);
        FIELD(u16, actor, 0x50) |= 0x40;

        void *object = Heap_Alloc(0xa0, data_ov037_021feeb0, 4, gHeapContext);
        if (object != 0)
            object = func_020955d8(object, actor);
        s32 x = func_0209189c(randomState, -0x800, 0x800);
        s32 z = func_0209189c(randomState, 0x80, 0x100);
        func_02094bbc(object, x, 0x1200, z);
        func_020948d4((u8 *)object + 0x6c,
                      func_0209189c(randomState, 0x1000, 0x2000));
        func_020948e4((u8 *)object + 0x1c, 1,
                      func_0209189c(randomState, 0x800, 0xc00));
        func_ov037_021fdf50(object, func_02077248(actor));
        FIELD(s32, object, 0x88) = 1;
        func_02095274((u8 *)scene + 0x12c, object);
        func_02091b98((u8 *)scene + 0x1a8, 2);
    }

    if (!func_02091c7c((u8 *)scene + 0x1c4, 2))
        return;

    void *actor = func_02077308(resourceOwner, (u8 *)scene + 0x104);
    func_02076be8(actor, func_0209189c(randomState, 5, 10) & 0xff);
    FIELD(u8, actor, 0x5a) = 6;
    FIELD(u8, actor, 0x5b) = 0x18;
    FIELD(u16, actor, 0x50) |= 0x40;

    void *object = Heap_Alloc(0xa0, data_ov037_021feeb0, 4, gHeapContext);
    if (object != 0)
        object = func_020955d8(object, actor);
    s32 offset = func_0209189c(randomState, -0x200, 0x200);
    void *primary = FIELD(void *, scene, 0x118);
    func_02094bbc(object, FIELD(s32, primary, 0x10) + offset,
                   FIELD(s32, primary, 0x20),
                   FIELD(s32, primary, 0x30) + 0x10);
    func_020948f8((u8 *)object + 0x0c, 1, offset);
    func_020948f8((u8 *)object + 0x1c, 1, 0x400);
    FIELD(s32, object, 0x7c) = 0x3c;
    FIELD(s32, object, 0x80) = 0;
    FIELD(s32, object, 0x88) = 1;
    func_02095274((u8 *)scene + 0x12c, object);
    func_02091b98((u8 *)scene + 0x1c4, 8);
}
