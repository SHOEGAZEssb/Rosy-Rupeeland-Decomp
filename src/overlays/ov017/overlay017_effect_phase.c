#include "tingle/types.h"

/* Overlay 17 effect-phase timing, motion handoff, collision response, and derived-state update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern u8 data_ov017_022016e0[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_InterpolateLinear(s32, s32, s32, s32);
extern void PresentationScalar_SetImmediate(void *, s32);
extern s32 func_020adc90(s32, s32);
extern s32 Overlay017_WaitForSquareRoot(void);
extern void func_ov017_021fda64(void *);
extern void func_ov017_021fe0b4(void *);
extern void func_ov017_021fe160(void *);
extern s32 func_ov017_021fe178(void *);
#ifdef __cplusplus
}
#endif

/*
 * Advance phase +0xB4 using counter +0xB8. Phase 0 waits for caller duration
 * +0xA0; phase 1 interpolates component +0x1C from 0x200000 to zero over 30
 * frames; phase 2 initializes global pointer +0x10 and falls through to phase
 * 3. Phases 3/4 animate +0x1C through -0x10000 and back while invoking the
 * recovered motion update. Phase 5 either continues motion or, when within
 * radius +0xA4 of global X/Z +0x30/+0x34, uses the geometry square-root unit to
 * normalize a 0x2000 response into +0xA8/+0xB0, advances progress, and returns
 * to phase 2. Phase 6 only refreshes derived state. Always call 0x021FE0B4 and
 * return zero. Object, overlay-global, SDK, and geometry MMIO state may change.
 */
extern "C" s32 func_ov017_021fde40(void *state)
{
    s32 counter;

    switch (FIELD(s32, state, 0xb4)) {
    case 0:
        counter = ++FIELD(s32, state, 0xb8);
        if (counter > FIELD(u16, state, 0xa0)) {
            FIELD(s32, state, 0xb4) = 1;
            FIELD(s32, state, 0xb8) = 0;
        }
        break;
    case 1:
        counter = ++FIELD(s32, state, 0xb8);
        if (counter > 0x1e) {
            FIELD(s32, state, 0xb4) = 2;
            FIELD(s32, state, 0xb8) = 0;
        } else {
            PresentationScalar_SetImmediate((u8 *)state + 0x1c,
                          Presentation_InterpolateLinear(0x200000, 0, 0x1e, counter));
        }
        break;
    case 2:
        if (FIELD(void *, data_ov017_022016e0, 0x10) == 0) {
            FIELD(void *, data_ov017_022016e0, 0x10) =
                FIELD(void *, data_ov017_022016e0, 0x14);
        }
        FIELD(s32, state, 0xb4) = 3;
        FIELD(s32, state, 0xb8) = 0;
        /* fall through */
    case 3:
        counter = ++FIELD(s32, state, 0xb8);
        if (counter <= 8) {
            PresentationScalar_SetImmediate((u8 *)state + 0x1c,
                          Presentation_InterpolateLinear(0, -0x10000, 8, counter));
        } else {
            PresentationScalar_SetImmediate((u8 *)state + 0x1c, -0x10000);
            FIELD(s32, state, 0xb4) =
                func_ov017_021fe178(state) ? 6 : 4;
            FIELD(s32, state, 0xb8) = 0;
        }
        func_ov017_021fda64(state);
        break;
    case 4:
        counter = ++FIELD(s32, state, 0xb8);
        if (counter <= 0x14) {
            PresentationScalar_SetImmediate((u8 *)state + 0x1c,
                          Presentation_InterpolateLinear(-0x10000, 0, 0x14, counter));
        } else {
            PresentationScalar_SetImmediate((u8 *)state + 0x1c, 0);
            FIELD(s32, state, 0xb4) = 5;
            FIELD(s32, state, 0xb8) = 0;
        }
        func_ov017_021fda64(state);
        break;
    case 5:
        if (FIELD(void *, data_ov017_022016e0, 4) != 0) {
            s32 dz = FIELD(s32, state, 0x30) / 0x1000 -
                     FIELD(s32, data_ov017_022016e0, 0x34);
            s32 dx = FIELD(s32, state, 0x10) / 0x1000 -
                     FIELD(s32, data_ov017_022016e0, 0x30);
            s32 distanceSquared = dx * dx + dz * dz;
            s32 radius = FIELD(s32, state, 0xa4);
            if (distanceSquared <= radius * radius) {
                if (dx != 0) {
                    volatile u8 *sqrtRegs = (volatile u8 *)0x040002b0;
                    s32 length;
                    *(volatile u16 *)sqrtRegs = 1;
                    *(volatile s32 *)(sqrtRegs + 8) = distanceSquared << 24;
                    *(volatile s32 *)(sqrtRegs + 0xc) =
                        (distanceSquared << 24) >> 31;
                    length = Overlay017_WaitForSquareRoot();
                    if (length > 0) {
                        s32 scale = func_020adc90(0x2000, length);
                        FIELD(s32, state, 0xa8) = dx * scale;
                        FIELD(s32, state, 0xb0) = dz * scale;
                    }
                }
                func_ov017_021fe160(state);
                FIELD(s32, state, 0xb4) = 2;
                FIELD(s32, state, 0xb8) = 0;
                break;
            }
        }
        func_ov017_021fda64(state);
        break;
    }
    func_ov017_021fe0b4(state);
    return 0;
}
