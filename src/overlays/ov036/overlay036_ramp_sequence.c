#include "tingle/types.h"

/* Overlay 36 six-state ramp-controller presentation sequence. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern const u8 data_ov036_02205340[];
extern const u8 data_ov036_02204f30[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02059278(void *sound, s32 id, s32 value);
extern void func_0205929c(void *sound, s32 id, s32 value);
extern void Sound_Play(void *sound, s32 id, s32 mode);
extern void func_02094cf0(void *object, const void *data, s32 mode);
extern s32 func_02095248(void *object);
extern s32 func_ov036_021fd28c(void *object);
extern void func_020773cc(void *manager, s32 selector, void *resourceSet);
extern void func_ov036_022018a8(void *controller);
extern void func_ov036_02201a78(void *controller);
#ifdef __cplusplus
}
#endif

/*
 * Advances the ramp presentation through state +0xA0. State 0 starts sound
 * 0xB0 with value 0x7F and applies data_ov036_02205340/data_ov036_02204f30 to
 * children +0x11C/+0xD8, then deliberately falls through. States 1 and 2 wait
 * for +0x11C completion, bind its selector +0x9C to resource sets +0xF4 and
 * +0x100 respectively, and clear +0x90; state 2 also plays sound 0x1B0 mode
 * zero, activates the persistent child pool, and clears +0xD8's +0x90.
 * State 3 waits again, plays 0x1B0 mode one, and clears +0x11C's +0x90.
 * State 4 waits for the object's alternate completion predicate and updates
 * sound 0xB0 with value 0x10. State 5 reports completion. Every call services
 * func_ov036_02201a78. Returns one only in state 5, otherwise zero; sound,
 * manager resource bindings, child state, state +0xA0, and emitted effects may
 * change.
 */
extern "C" s32 func_ov036_02201acc(void *controller)
{
    switch (FIELD(s32, controller, 0xa0)) {
    case 0:
        func_02059278(gSoundContext, 0xb0, 0x7f);
        func_02094cf0(FIELD(void *, controller, 0x11c),
                      data_ov036_02205340, 1);
        func_02094cf0(FIELD(void *, controller, 0xd8),
                      data_ov036_02204f30, 1);
        ++FIELD(s32, controller, 0xa0);
        /* The recovered jump table intentionally continues into state 1. */
    case 1:
        if (func_02095248(FIELD(void *, controller, 0x11c)) != 0) {
            void *child = FIELD(void *, controller, 0x11c);
            func_020773cc(FIELD(void *, controller, 0x118),
                          FIELD(s32, child, 0x9c),
                          (u8 *)controller + 0xf4);
            FIELD(s32, child, 0x90) = 0;
            ++FIELD(s32, controller, 0xa0);
        }
        break;
    case 2:
        if (func_02095248(FIELD(void *, controller, 0x11c)) != 0) {
            Sound_Play(gSoundContext, 0x1b0, 0);
            void *child = FIELD(void *, controller, 0x11c);
            func_020773cc(FIELD(void *, controller, 0x118),
                          FIELD(s32, child, 0x9c),
                          (u8 *)controller + 0x100);
            func_ov036_022018a8(controller);
            FIELD(s32, child, 0x90) = 0;
            FIELD(s32, FIELD(void *, controller, 0xd8), 0x90) = 0;
            ++FIELD(s32, controller, 0xa0);
        }
        break;
    case 3:
        if (func_02095248(FIELD(void *, controller, 0x11c)) != 0) {
            Sound_Play(gSoundContext, 0x1b0, 1);
            FIELD(s32, FIELD(void *, controller, 0x11c), 0x90) = 0;
            ++FIELD(s32, controller, 0xa0);
        }
        break;
    case 4:
        if (func_ov036_021fd28c(FIELD(void *, controller, 0x11c)) != 0) {
            func_0205929c(gSoundContext, 0xb0, 0x10);
            ++FIELD(s32, controller, 0xa0);
        }
        break;
    case 5:
        func_ov036_02201a78(controller);
        return 1;
    }
    func_ov036_02201a78(controller);
    return 0;
}
