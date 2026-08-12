#include "tingle/types.h"

/* Overlay 94 frame update for the title/menu screen effect. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02094d28(void *effect, s32 mode, s32 lower, s32 upper);
extern void func_02094dd4(void *effect);
extern void func_020afca0(void *registerAddress, s32 value);
extern s32 func_ov094_02217bc8(void *effect);
#ifdef __cplusplus
}
#endif

/*
 * Advances inherited effect state. While +0x9C is zero it increments that
 * state once the overlay predicate succeeds, derives a blend value from the
 * inherited interpolator, and writes it through the SDK-side helper to
 * hardware address 0x04000050. State one performs no further work. Returns
 * zero on every path.
 */
extern "C" s32 func_ov094_022192e0(void *effect)
{
    func_02094dd4(effect);
    s32 state = *(s32 *)((u8 *)effect + 0x9c);
    switch (state) {
    case 0:
        if (func_ov094_02217bc8(effect)) {
            *(s32 *)((u8 *)effect + 0x9c) += 1;
        }
        s32 value = func_02094d28(effect, 1, 0, -4);
        func_020afca0((void *)0x04000050, value);
        break;
    case 1:
        break;
    }
    return 0;
}
