#include "tingle/types.h"

/*
 * Overlay 41 scene-object reset helpers. These recovered routines clear every
 * active descriptor and construct a shuffled 62-entry category schedule plus
 * its dedicated render resource.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void func_ov041_021ff658(void *, s32);
u32 genrand_int32(void);
void *func_0209a208(void *, s32, s32, s32, s32, s32);
extern const s32 data_ov041_02204c1c[3];
extern const s32 data_ov041_02204ca0[11];
}

typedef void (*PlacementCallback)(void *, void *, s32, s32, s32, s32);

/*
 * Walk the descriptor pool backwards and release every slot whose type is
 * greater than -1. This hides associated render resources through the slot
 * release helper and returns no value.
 */
extern "C" void func_ov041_021ff6b8(void *object)
{
    for (s32 i = FIELD(s32, object, 0x1ac) - 1; i >= 0; --i) {
        if (((s16 *)FIELD(void *, object, 0x80))[i] > -1)
            func_ov041_021ff658(object, i);
    }
}

/*
 * Reset four counters, derive a threshold from the sum of an eleven-word
 * table, fill and Fisher-Yates-like shuffle the 62 category entries at 0xAC,
 * then create, place and initially hide resource IDs 0x14C3..0x14C5. The
 * resource context is retained by the factory; RNG state is consumed.
 */
extern "C" void func_ov041_021ff6f8(void *object, void *resourceContext)
{
    s32 initial[3] = {
        data_ov041_02204c1c[0],
        data_ov041_02204c1c[1],
        data_ov041_02204c1c[2]
    };
    FIELD(s32, object, 0x1a4) = 0;
    FIELD(s32, object, 0x1b8) = 0;
    FIELD(s32, object, 0x1b0) = 0;
    FIELD(s32, object, 0x1b4) = 0;

    s32 sum = 0;
    for (s32 i = 10; i >= 0; --i)
        sum += data_ov041_02204ca0[i];
    FIELD(s32, object, 0x1bc) = (sum + (sum < 0)) >> 1;

    s32 boundary = initial[0] + initial[1];
    for (s32 i = 61; i >= 0; --i) {
        if (initial[0] > i)
            FIELD(s32, object, 0xac + i * 4) = 8;
        else if (boundary > i)
            FIELD(s32, object, 0xac + i * 4) =
                6 + (genrand_int32() & 1);
        else
            FIELD(s32, object, 0xac + i * 4) =
                (s32)(genrand_int32() % 6);
    }
    for (s32 i = 61; i >= 0; --i) {
        s32 other = (s32)(genrand_int32() % 62);
        s32 value = FIELD(s32, object, 0xac + i * 4);
        FIELD(s32, object, 0xac + i * 4) =
            FIELD(s32, object, 0xac + other * 4);
        FIELD(s32, object, 0xac + other * 4) = value;
    }

    void *render = func_0209a208(object, 0x14c3, 0x14c4, 0x14c5,
                                  (s32)resourceContext, 1);
    FIELD(void *, object, 0x7c) = render;
    PlacementCallback place = *(PlacementCallback *)FIELD(void *, object, 0);
    place(object, render, 0x40000, 0x64000, 0, 0);
    FIELD(u16, render, 0x42) |= 4;
}
