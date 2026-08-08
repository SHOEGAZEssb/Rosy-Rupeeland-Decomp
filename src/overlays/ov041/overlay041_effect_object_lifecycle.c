#include "tingle/types.h"

/*
 * Overlay 41 effect-controller lifecycle helpers. These recovered methods
 * release its owned helper/record arrays and configure newly created render
 * children with placement, scale, visibility, and a fixed control value.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void __destroy_arr(void *, s32, s32, void *);
void func_02005058(void *);
void func_ov041_021fce00(void *);
void func_02099fb0(void *);
void Heap_Free(void *);
void func_02072b68(void *, s32);
extern u8 data_ov041_022059b8;
}

/*
 * Restore the derived vtable, destroy the optional helper's sixty 16-byte
 * transform records, run its inherited teardown and free it. Then destroy the
 * controller's 91 12-byte records and run the controller's inherited teardown.
 * Returns the original controller pointer; all owned storage becomes invalid.
 */
extern "C" void *func_ov041_022012f4(void *object)
{
    FIELD(void *, object, 0) = &data_ov041_022059b8;
    void *helper = FIELD(void *, object, 0x958);
    if (helper != 0) {
        __destroy_arr((u8 *)helper + 0x13c, 0x3c, 0x10,
                      (void *)func_02005058);
        func_02099fb0(helper);
        Heap_Free(helper);
    }
    __destroy_arr((u8 *)object + 0x68, 0x5b, 12,
                  (void *)func_ov041_021fce00);
    func_02099fb0(object);
    return object;
}

/*
 * Initialize render's linked resource from the final byte argument, set its
 * active/resource flags, store fixed control value 50, placement (x,y,z), unit
 * scale and zero rotation. The first object argument is unused; no value is
 * returned.
 */
extern "C" void func_ov041_02201364(void *, void *render, s32 x, s32 y,
                                     s32 z, u8 resourceMode)
{
    void *linked = FIELD(void *, render, 0x0c);
    func_02072b68(linked, resourceMode);
    FIELD(u16, linked, 0x24) |= 2;
    FIELD(u8, linked, 0x3a) = 1;
    FIELD(s32, render, 0x44) = 50;
    FIELD(s32, render, 0x30) = x;
    FIELD(s32, render, 0x34) = y;
    FIELD(s32, render, 0x38) = z;
    FIELD(u16, render, 0x3c) = 0x100;
    FIELD(u16, render, 0x3e) = 0x100;
    FIELD(u16, render, 0x40) = 0;
}
