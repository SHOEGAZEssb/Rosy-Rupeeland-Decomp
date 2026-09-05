#include "tingle/types.h"

/*
 * Overlay 49 render-resource lifecycle. The recovered routines construct,
 * apply, and release a group of model/animation handles embedded in the
 * derived object. Exact assembly preserves the SDK's required ownership order.
 */

/*
 * Build the sixteen-vector offset table used by the impact effect. In direct
 * mode, reveal the shared render object and assign the selected offset to it
 * and to the object's current vector; otherwise submit the supplied vector to
 * the owner's effect runtime. Temporary vectors are destroyed before return.
 */
extern "C" void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void VecFx32Object_Assign(void *, const void *);
extern "C" void func_0209f09c(void *, const void *);

extern "C" void func_ov049_0220bbdc(void *object, const void *vector,
                                     s32 index, s32 indirect)
{
    static const s32 components[16][3] = {
        {0, 0xb33, 0},       {-0x800, 0x800, 0},
        {-0xb33, 0, 0},      {-0x800, -0x800, 0},
        {0, -0xb33, 0},      {0x800, -0x800, 0},
        {0xb33, 0, 0},       {0x800, 0x800, 0},
        {0, 0x219a, 0},      {-0x1800, 0x1800, 0},
        {-0x219a, 0, 0},     {-0x1800, -0x1800, 0},
        {0, -0x219a, 0},     {0x1800, -0x1800, 0},
        {0x219a, 0, 0},      {0x1800, 0x1800, 0},
    };
    u8 temporary[0x100];
    u8 *state = (u8 *)object;
    for (s32 i = 0; i < 16; ++i)
        VecFx32Object_InitComponents(temporary + i * 0x10, components[i][0],
                                     components[i][1], components[i][2]);
    if (indirect == 0) {
        u8 *render = *(u8 **)(state + 0x84);
        *(u16 *)(render + 0x42) &= (u16)~4;
        VecFx32Object_Assign(render + 0x2c, vector);
        VecFx32Object_Assign(state + 0x8c, temporary + index * 0x10);
    } else {
        u8 *owner = *(u8 **)(state + 0x48);
        func_0209f09c(*(void **)(owner + 0x10), vector);
    }
    for (s32 i = 15; i >= 0; --i)
        VecFx32Object_Destroy(temporary + i * 0x10);
}

/*
 * Advance the shared render object by the current vector while accelerating
 * its Y component downward. When it crosses its terminal plane, hide/reset it,
 * submit its terminal position, and dispatch the owner's selected overlay-39
 * impact callback unless the owner is already in its terminal state.
 */
extern "C" void VecFx32Object_Add(void *, const void *);
extern "C" s32 func_ov039_021fee00(void *, const void *);
extern "C" s32 func_ov039_02201620(void *, const void *);

extern "C" void func_ov049_0220be28(void *object)
{
    u8 *state = (u8 *)object;
    u8 *render = *(u8 **)(state + 0x84);
    if ((*(u16 *)(render + 0x42) & 4) != 0)
        return;
    *(s32 *)(state + 0x98) -= 0x19a;
    VecFx32Object_Add(render + 0x2c, state + 0x8c);
    if (*(s32 *)(render + 0x38) >= 0)
        return;
    *(u16 *)(render + 0x42) |= 4;
    *(s32 *)(render + 0x38) = 0;
    u8 *owner = *(u8 **)(state + 0x48);
    func_0209f09c(*(void **)(owner + 0x10), render + 0x2c);
    if (*(s16 *)(*(u8 **)(owner + 8) + 0xb8) >= 1)
        return;
    if (*(s32 *)(owner + 0x14) != 0)
        func_ov039_021fee00(*(void **)(owner + 0x14), render + 0x2c);
    else
        func_ov039_02201620(*(void **)(owner + 0x18), render + 0x2c);
}

/*
 * Release the base object, every primary/secondary render pair, and the shared
 * render record through the SDK destructor using the supplied mode. Storage
 * ownership is handled by that destructor; no direct hardware access occurs.
 */
extern "C" void func_0209a2ac(void *, s32, s32);

extern "C" void func_ov049_0220c0b8(void *object, s32 mode)
{
    u8 *state = (u8 *)object;
    func_0209a2ac(object, 0, 1);
    for (s32 index = *(s32 *)(state + 0x88) - 1; index >= 0; --index) {
        func_0209a2ac(*(void **)(state + 0x4c + index * 4), mode, 1);
        func_0209a2ac(*(void **)(state + 0x68 + index * 4), mode, 1);
    }
    func_0209a2ac(*(void **)(state + 0x84), mode, 1);
}
