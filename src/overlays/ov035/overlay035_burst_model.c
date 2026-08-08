#include "tingle/types.h"

/* Overlay 35 burst-model construction, completion state, and GX bit control. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov035_02203c08[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov035_021fcec4(void *object, void *resource,
                                s32 resourceIndex, s32 entry);
extern void func_020948d4(void *field, s32 value);
extern s32 func_02094c48(void *object);
extern void Sound_Play(void *soundContext, s32 id, s32 argument);
extern void func_020948f8(void *field, s32 mode, s32 value);
extern void func_020948e4(void *field, s32 mode, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a burst-model object from object, resource, and resourceIndex.
 * The common render-object entry is fixed at 0x11, the vtable becomes
 * data_ov035_02203c08, field +0xB8 is 0x8000, state +0xC4 starts at zero,
 * field +0x6C is initialized to 0x800, and halfword +0xBE is 0x2000. Returns
 * object; only object and common render/tween state change.
 */
extern "C" void *func_ov035_02201584(void *object, void *resource,
                                      s32 resourceIndex)
{
    func_ov035_021fcec4(object, resource, resourceIndex, 0x11);
    FIELD(const void *, object, 0) = data_ov035_02203c08;
    FIELD(s32, object, 0xb8) = 0x8000;
    FIELD(s32, object, 0xc4) = 0;
    func_020948d4((u8 *)object + 0x6c, 0x800);
    FIELD(u16, object, 0xbe) = 0x2000;
    return object;
}

/*
 * Advances the burst model's three-stage state +0xC4. Stage 0 waits for the
 * common object update, plays sound 0x1CB, and, when field +0x88 is nonzero,
 * selects entry +0xA8=0x19/index +0xA0=2, configures Z motion -0x100 and
 * field +0x6C motion to 0x800, and starts a 12-frame timing window. Stage 1
 * waits for one more common completion; stage 2 is terminal. Returns 1 only in
 * stage 2, otherwise 0. Sound, animation, transform, and object state change.
 */
extern "C" s32 func_ov035_022015cc(void *object)
{
    switch (FIELD(s32, object, 0xc4)) {
    case 0:
        if (func_02094c48(object) != 0) {
            Sound_Play(gSoundContext, 0x1cb, 0);
            if (FIELD(s32, object, 0x88) != 0) {
                FIELD(s32, object, 0xa8) = 0x19;
                FIELD(s32, object, 0xa0) = 2;
                func_020948d4((u8 *)object + 0x6c, 0);
                func_020948f8((u8 *)object + 0x2c, 1, -0x100);
                func_020948e4((u8 *)object + 0x6c, 5, 0x800);
                FIELD(s32, object, 0x7c) = 12;
                FIELD(s32, object, 0x80) = 0;
            }
            ++FIELD(s32, object, 0xc4);
        }
        break;
    case 1:
        if (func_02094c48(object) != 0)
            ++FIELD(s32, object, 0xc4);
        break;
    case 2:
        return 1;
    }
    return 0;
}

/*
 * Updates halfword hardware register 0x04000060. A zero input applies mask
 * 0xCFDF; a nonzero input clears bits 0x3000 and sets bit 0x20. The exact bit
 * operations and direct I/O effect are confirmed, while the higher-level GX
 * feature controlled by this register remains unidentified. Returns nothing.
 */
extern "C" void func_ov035_022016ac(s32 enabled)
{
    volatile u16 *reg = (volatile u16 *)0x04000060;
    if (enabled == 0)
        *reg &= 0xcfdf;
    else
        *reg = (*reg & ~0x3000) | 0x20;
}
