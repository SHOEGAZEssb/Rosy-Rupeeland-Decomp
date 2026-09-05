#include "tingle/types.h"

/*
 * Overlay 49 derived runtime-object construction. The recovered object extends
 * the shared base with render resources, two embedded records, and five
 * animation/transform entries. Exact assembly preserves array initialization
 * and SDK constructor call ordering.
 */

/*
 * Construct caller-owned `object`, bind the owner and overlay vtable, create
 * three or seven primary/secondary render pairs according to `mode`, position
 * them through the base virtual method, and create one shared render record.
 * Return `object`; SDK render-resource ownership is transferred to the object.
 */
extern "C" const u32 data_ov049_0220d364[];
extern "C" void *func_ov049_0220b740(void *);
extern "C" void VecFx32Object_Init(void *);
extern "C" void *func_0209a208(void *, s32, s32, s32, s32, s32);

typedef void (*Overlay049PlaceMethod)(void *, void *, s32, s32, s32, s32);

extern "C" void *func_ov049_0220b780(void *object, void *owner,
                                      s32 resourceArgument, s32 mode)
{
    u8 *state = (u8 *)object;
    func_ov049_0220b740(object);
    *(const u32 **)state = data_ov049_0220d364;
    VecFx32Object_Init(state + 0x8c);
    VecFx32Object_Init(state + 0x9c);
    *(void **)(state + 0x48) = owner;
    *(s32 *)(state + 0x88) = (mode == 0 || mode == 2) ? 3 : 7;
    const void *const *vtable = *(const void *const **)state;
    Overlay049PlaceMethod place = (Overlay049PlaceMethod)vtable[0];
    /* +0x88 is a count; the secondary sprites share palette 0x3299. */
    for (s32 index = *(s32 *)(state + 0x88) - 1; index >= 0; --index) {
        s32 x;
        s32 y;
        if (index < 3) {
            x = (index - 1) * 0x82000 + 0x200000;
            y = 0x258000;
        } else {
            s32 pair = index / 2;
            x = ((index & 1) * 2 - 1) * 0x9b000 + 0x200000;
            y = pair * 0x6e000 + 0x96000;
        }
        void *primary =
            func_0209a208(object, 0x16a3, 0x16a4, 0x16a5,
                          resourceArgument, 2);
        *(void **)(state + 0x4c + index * 4) = primary;
        place(object, primary, x, y, 0, 0);
        *(u8 *)(*(u8 **)((u8 *)primary + 0xc) + 0x3a) = 1;
        *(s16 *)(state + 0xac + index * 2) = 0;

        void *secondary =
            func_0209a208(object, 0x32ae, 0x3299, 0x32af,
                          resourceArgument, 2);
        *(void **)(state + 0x68 + index * 4) = secondary;
        place(object, secondary, x, index < 3 ? 0x23a000 : y - 0x1e000,
              0, 0);
        *(u8 *)(*(u8 **)((u8 *)secondary + 0xc) + 0x3a) = 0;
        *(u16 *)((u8 *)secondary + 0x42) |= 4;
    }
    void *shared = func_0209a208(object, 0x16a3, 0x16a4, 0x16a5,
                                 resourceArgument, 2);
    *(void **)(state + 0x84) = shared;
    place(object, shared, 0, 0, 0, 3);
    *(u8 *)(*(u8 **)((u8 *)shared + 0xc) + 0x3a) = 0;
    *(u16 *)((u8 *)shared + 0x42) |= 4;
    return object;
}
