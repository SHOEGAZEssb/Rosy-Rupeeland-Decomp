#include "tingle/types.h"

/*
 * Overlay 38 close-state, terminal callback, hardware render commit, and heap
 * deletion tails. These recovered functions finish model closure and publish
 * presentation state to main-engine display registers.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov038_021fdcd8[];
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020946a8(void *model, s32 mode);
extern s32 func_02093ffc(void *model);
extern void func_ov038_021fd578(void *presentation);
extern void func_02092288(void *presentation, s32 event);
extern void func_02093de4(void *model);
extern s32 func_020946c8(void *model, void *input);
extern void func_02092260(void *presentation, s32 event);
extern void func_02094738(void *model, s32 mode);
extern void func_ov038_021fce04(void *node, u32 first, u32 second);
extern void func_ov038_021fd37c(void *presentation);
extern void func_ov046_0220c1d8(void *panel);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Drive a three-phase close/confirmation flow. Phase zero starts model mode 4;
 * phase one waits for completion, emits event 8 if the window origin changed,
 * and otherwise refreshes pending selection animation; phase two accepts a
 * gated input through func_020946c8 or, after the gate clears, starts model
 * mode 6 and installs the callback pair at 0x021FDCD8. Always advances the UI
 * update, returns zero, and may change model, phase, event, and callback state.
 */
extern "C" s32 func_ov038_021fdacc(void *presentation)
{
    void *model = FIELD(void *, presentation, 0x314);
    switch (FIELD(s32, presentation, 4)) {
    case 0:
        func_020946a8(model, 4);
        FIELD(s32, presentation, 4)++;
        FIELD(s32, presentation, 8) = 0;
        /* fall through */
    case 1:
        if (!func_02093ffc(model)) {
            func_ov038_021fd578(presentation);
            break;
        }
        if (FIELD(s32, model, 0x0c) != FIELD(s32, model, 0x10)) {
            func_02092288(presentation, 8);
        }
        FIELD(s32, presentation, 4)++;
        FIELD(s32, presentation, 8) = 0;
        /* fall through */
    case 2:
        func_02093de4(model);
        if ((FIELD(u32, presentation, 0x20) & 0x10) != 0) {
            if (func_020946c8(model, (u8 *)presentation + 0x30)) {
                func_02092260(presentation, 8);
                FIELD(s32, presentation, 4)--;
                FIELD(s32, presentation, 8) = 0;
            }
        } else {
            func_02094738(model, 6);
            func_ov038_021fce04(presentation, data_ov038_021fdcd8[0],
                                data_ov038_021fdcd8[1]);
        }
        break;
    }
    func_ov038_021fd37c(presentation);
    return 0;
}

/* Advance the presentation once and return one, signaling terminal completion. */
extern "C" s32 func_ov038_021fdbf0(void *presentation)
{
    func_ov038_021fd37c(presentation);
    return 1;
}

/*
 * If presentation flag 0x400 is set, commit the panel, replace DISPCNT bits
 * 8..12 from +0x48, write the signed 9-bit +0x33C displacement to 0x04000010,
 * and pack the two low nine-bit halves of system-state word +0x64 into register
 * 0x0400001C. Returns zero; these are confirmed main-engine DS MMIO effects.
 */
extern "C" s32 func_ov038_021fdc00(void *presentation)
{
    if ((FIELD(u32, presentation, 0x20) & 0x400) != 0) {
        func_ov046_0220c1d8(FIELD(void *, presentation, 0x340));
        volatile u32 *registers = (volatile u32 *)0x04000000;
        registers[0] = (registers[0] & ~0x1f00u) |
                       (FIELD(u32, presentation, 0x48) << 8);
        registers[4] = (FIELD(u32, presentation, 0x33c) << 16) & 0x01ff0000;
        u32 packed = *(u32 *)(gSystemState + 0x64);
        registers[7] = (packed & 0x1ff) | ((packed << 16) & 0x01ff0000);
    }
    return 0;
}

/* Free the supplied allocation and return its former address for ABI compatibility. */
extern "C" void *func_ov038_021fdc70(void *allocation)
{
    Heap_Free(allocation);
    return allocation;
}
