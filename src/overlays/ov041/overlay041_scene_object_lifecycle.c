#include "tingle/types.h"

/*
 * Overlay 41 scene-object resource lifecycle. These recovered methods configure
 * render children, release owned arrays, allocate descriptor slots, and detach
 * slots from their associated render resources.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void func_02072b68(void *, s32);
void func_02003e38(void *);
void func_020c0c24(void *, s32, s32, void *);
void func_02099fb0(void *);
void func_ov041_021fec04(void *, const void *);
u32 genrand_int32(void);
void func_ov041_021fce00(void *);
extern u8 data_ov041_02205820;
}

/*
 * Configure render with placement (x,y,z), pass the final byte argument to its
 * resource initializer, enable its object flags, reset scale/rotation fields,
 * and make its linked render object visible. No value is returned.
 */
extern "C" void func_ov041_021ff4d0(void *, void *render, s32 x, s32 y,
                                     s32 z, u8 resourceMode)
{
    void *linked = FIELD(void *, render, 0x0c);
    func_02072b68(linked, resourceMode);
    FIELD(u16, linked, 0x24) |= 2;
    FIELD(s32, render, 0x30) = x;
    FIELD(s32, render, 0x34) = y;
    FIELD(s32, render, 0x38) = z;
    FIELD(u16, render, 0x3c) = 0x100;
    FIELD(u16, render, 0x3e) = 0x100;
    FIELD(u16, render, 0x40) = 0;
    FIELD(u8, linked, 0x3a) = 1;
}

/*
 * Release all six flat arrays and both constructed record arrays, then invoke
 * the inherited object teardown. The original vtable is restored first. The
 * input object is returned and no hardware state is changed directly.
 */
extern "C" void *func_ov041_021ff530(void *object)
{
    FIELD(void *, object, 0) = &data_ov041_02205820;
    func_02003e38(FIELD(void *, object, 0x80));
    func_020c0c24(FIELD(void *, object, 0x84), 12, 8,
                  (void *)func_ov041_021fce00);
    func_020c0c24(FIELD(void *, object, 0x88), 12, 8,
                  (void *)func_ov041_021fce00);
    func_02003e38(FIELD(void *, object, 0x8c));
    func_02003e38(FIELD(void *, object, 0x90));
    func_02003e38(FIELD(void *, object, 0x94));
    func_02003e38(FIELD(void *, object, 0x98));
    func_02099fb0(object);
    return object;
}

/*
 * Allocate the highest free descriptor slot, store type and position, copy the
 * position into its previous-position record, seed a 16-bit random value, and
 * clear its counters. Returns the slot index or -1 when the pool is full.
 */
extern "C" s32 func_ov041_021ff5a8(void *object, s32 type,
                                    const void *position)
{
    for (s32 i = FIELD(s32, object, 0x1ac) - 1; i >= 0; --i) {
        if (((s16 *)FIELD(void *, object, 0x80))[i] <= -1) {
            ((s16 *)FIELD(void *, object, 0x80))[i] = (s16)type;
            u8 *current = (u8 *)FIELD(void *, object, 0x84) + i * 12;
            FIELD(s32, current, 4) = FIELD(s32, position, 4);
            FIELD(s32, current, 8) = FIELD(s32, position, 8);
            func_ov041_021fec04((u8 *)FIELD(void *, object, 0x88) + i * 12,
                                current);
            ((u16 *)FIELD(void *, object, 0x94))[i] =
                (u16)(genrand_int32() % 0xffff);
            ((u16 *)FIELD(void *, object, 0x8c))[i] = 0;
            ((s32 *)FIELD(void *, object, 0x90))[i] = 0;
            return i;
        }
    }
    return -1;
}

/*
 * Mark slot free. If it owns a render-resource index, hide both the outer and
 * linked render objects, clear the association, and return no value.
 */
extern "C" void func_ov041_021ff658(void *object, s32 index)
{
    ((s16 *)FIELD(void *, object, 0x80))[index] = -1;
    s32 renderIndex = ((s16 *)FIELD(void *, object, 0x98))[index];
    if (renderIndex < 0)
        return;
    void *render = FIELD(void *, object, 0x4c + renderIndex * 4);
    FIELD(u16, render, 0x42) |= 4;
    FIELD(u16, FIELD(void *, render, 0x0c), 0x24) |= 4;
    ((s16 *)FIELD(void *, object, 0x98))[index] = -1;
}
