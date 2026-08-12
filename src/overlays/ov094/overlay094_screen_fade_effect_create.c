#include "tingle/types.h"

/* Overlay 94 construction for the title/menu's independent screen effect. */

extern const u8 data_ov094_02219ed4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020949ec(void *effect);
extern void func_020afce8(void *registerAddress, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Initializes the inherited effect, installs its overlay dispatch record,
 * clears the owned pointer at +0x9C, and seeds the +0x7C/+0x80 state pair to
 * 0x20/zero. It also writes value 14 through the SDK-side helper to hardware
 * address 0x04000050, then returns the effect.
 */
extern "C" void *func_ov094_02219234(void *effect)
{
    func_020949ec(effect);
    *(const void **)effect = data_ov094_02219ed4;
    *(s32 *)((u8 *)effect + 0x9c) = 0;
    *(s32 *)((u8 *)effect + 0x7c) = 0x20;
    *(s32 *)((u8 *)effect + 0x80) = 0;
    func_020afce8((void *)0x04000050, 14);
    return effect;
}
