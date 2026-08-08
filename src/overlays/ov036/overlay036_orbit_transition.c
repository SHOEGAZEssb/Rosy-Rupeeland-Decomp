#include "tingle/types.h"

/* Overlay 36 configuration-driven orbit-object transform transition. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_020948d4(void *field, s32 value);
extern void func_020948e4(void *field, s32 mode, s32 value);
extern void func_020948f8(void *field, s32 mode, s32 value);
extern void func_ov036_021fd4b0(void *object, s16 duration);
#ifdef __cplusplus
}
#endif

/*
 * Configures an orbit object's next transition; owner is unused. With index
 * config +0, position becomes (config +8, config +0xC + index*0x280-0x600,
 * -index*0x40-0x20). Rotation +0x5C is reset then receives a mode-2 target from
 * +0x10. Field +0x1C receives target +0x14 using mode +0x1C, and the common
 * timer starts signed duration +0x18. It returns nothing; position, transform,
 * interpolation, and timer state change.
 */
extern "C" void func_ov036_02200b38(void *owner, void *object,
                                     const void *config)
{
    (void)owner;
    s32 index = FIELD(s32, config, 0);
    func_02094bbc(object,
                   FIELD(s32, config, 8),
                   FIELD(s32, config, 0xc) + index * 0x280 - 0x600,
                   -(index << 6) - 0x20);
    func_020948d4((u8 *)object + 0x5c, 0);
    func_020948e4((u8 *)object + 0x5c, 2, FIELD(s32, config, 0x10));
    func_020948f8((u8 *)object + 0x1c,
                  FIELD(s32, config, 0x1c),
                  FIELD(s32, config, 0x14));
    func_ov036_021fd4b0(object, (s16)FIELD(s32, config, 0x18));
}
