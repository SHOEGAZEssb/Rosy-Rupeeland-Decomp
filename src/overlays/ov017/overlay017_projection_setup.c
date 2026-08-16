#include "tingle/types.h"

/* Overlay 17 geometry projection setup and derived scene-distance calculation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov017_02201414[];
extern u8 data_ov017_022016e0[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adc90(s32, s32);
extern s32 func_020b01a0(s32 *, s32 *);
extern void func_020b0558(void);
extern void Graphics3DSceneState_Apply(void *);
#ifdef __cplusplus
}
#endif

/*
 * Reset geometry state and initialize the component at +0x310. Program the
 * geometry registers rooted at 0x04000444 twice, using the radius selected by
 * overlay-global index +0xC. Each pass waits for 0x020B01A0 to produce values,
 * derives a magnitude through 0x020ADC90, and stores scene values at +0x3A4
 * (magnitude*128/4096 + 128) and +0x3A8 (96 - magnitude*96/4096). Repeated
 * volatile zero writes are confirmed matching behavior and intentionally kept.
 * State, geometry SDK, and Nintendo DS geometry MMIO change; returns void.
 */
extern "C" void func_ov017_021ff75c(void *state)
{
    volatile s32 *reg444 = (volatile s32 *)0x04000444;
    volatile s32 *reg448 = (volatile s32 *)0x04000448;
    /* Position-test output is X/Y/Z at slots 1..3 plus W at slot 0. */
    s32 outputs[4];
    s32 radius = data_ov017_02201414[
        FIELD(s32, data_ov017_022016e0, 0xc)];

    func_020b0558();
    Graphics3DSceneState_Apply((u8 *)state + 0x310);
    *reg444 = 0;
    reg444[0xb] = radius * 0x10;
    reg444[0xb] = 0;
    reg444[0xb] = 0;
    reg444[0x60] = 0;
    reg444[0x60] = 0;
    while (func_020b01a0(&outputs[1], &outputs[0]) != 0) {
    }
    FIELD(s32, state, 0x3a4) =
        func_020adc90(outputs[1], outputs[0]) * 0x80 / 0x1000 + 0x80;

    *reg448 = 1;
    *reg444 = 0;
    reg448[0xa] = 0;
    reg448[0xa] = 0;
    reg448[0xa] = radius * 0x10;
    reg448[0x5f] = 0;
    reg448[0x5f] = 0;
    while (func_020b01a0(&outputs[1], &outputs[0]) != 0) {
    }
    FIELD(s32, state, 0x3a8) =
        0x60 - func_020adc90(outputs[2], outputs[0]) * 0x60 / 0x1000;
    *reg448 = 1;
}
