#include "tingle/types.h"

/*
 * Overlay 45 graphics helpers. These recovered leaf routines apply uniform
 * presentation parameters and update packed Nintendo DS sub-engine control
 * bits used by the following scene class.
 * Matching assembly preserves the register allocation of the MMIO helper;
 * its portable hardware expression remains documented below.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *gDebugFont;
extern "C" void func_020708c4(void *resource);
extern "C" void func_02070958(void *resource, s32 first, s32 second,
                               s32 third);
extern "C" void GraphicsSpriteRenderer_QueueStatePaletteUploads(void *font, void *sprite);

/*
 * Apply one value uniformly to the resource at +8 after its shared prepare
 * call, then associate sprite +0x20 with the global debug font. Resource,
 * sprite, and font presentation state change; no value is returned.
 */
extern "C" void Overlay045Graphics_SetUniformValue(void *object, s32 value)
{
    func_020708c4(FIELD(void *, object, 8));
    func_02070958(FIELD(void *, object, 8), value, value, value);
    GraphicsSpriteRenderer_QueueStatePaletteUploads(gDebugFont, FIELD(void *, object, 0x20));
}

/*
 * Replace selected bits of the sub-engine register at 0x0400100A. Preserve
 * mask 0x43, then pack inputs into bit positions 14, 7, 8, 2, and 13
 * respectively. This directly changes Nintendo DS display hardware state.
 */
#ifndef MATCHING_BUILD
extern "C" void func_ov045_0220c2e0(u32 bit14, u32 bit7, u32 bit8,
                                     u32 bits2, u32 bit13)
{
    u32 value = *(volatile u16 *)0x0400100a & 0x43;
    value |= bit14 << 14;
    value |= bit7 << 7;
    value |= bit8 << 8;
    value |= bits2 << 2;
    value |= bit13 << 13;
    *(volatile u16 *)0x0400100a = (u16)value;
}
#endif
