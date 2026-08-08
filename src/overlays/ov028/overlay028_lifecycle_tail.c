#include "tingle/types.h"

/* Overlay 28 frame callbacks, scanline hardware hooks, and deleting destructor. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov028_021ff29c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void func_02095308(void *);
extern void func_020afd0c(void *, s32, s32, s32);
extern void func_ov028_021fce94(void *);
extern void func_ov028_021fe438(void *);
#ifdef __cplusplus
}
#endif

/* Runs the common scene graphics update and returns one. */
extern "C" s32 func_ov028_021ff0b0(void *state)
{
    func_ov028_021fe438(state);
    return 1;
}

/*
 * When scene flag bit 10 at +0x20 is set, increments scanline phase +0x280,
 * invokes the SDK transfer/configuration helper for register 0x04000050 with
 * constants 4/0x18/9, and replaces main DISPCNT bits 8..12 with scene value
 * +0x48. Returns zero. Scene memory, SDK transfer state, and Nintendo DS main
 * display hardware change only while the flag is enabled.
 */
extern "C" s32 func_ov028_021ff0c0(void *state)
{
    if (FIELD(u32, state, 0x20) & 0x400) {
        FIELD(s32, state, 0x280)++;
        func_020afd0c((void *)0x04000050, 4, 0x18, 9);
        volatile u32 *dispcnt = (volatile u32 *)0x04000000;
        *dispcnt = (*dispcnt & ~0x1f00u) |
                   ((u32)FIELD(s32, state, 0x48) << 8);
    }
    return 0;
}

/*
 * When scene flag bit 10 at +0x20 is set, applies scanline coordinate state
 * +0x280 through `func_ov028_021fce94`. Returns zero; BG2X/BG2Y MMIO may change
 * during visible scanlines.
 */
extern "C" s32 func_ov028_021ff128(void *state)
{
    if (FIELD(u32, state, 0x20) & 0x400)
        func_ov028_021fce94((u8 *)state + 0x280);
    return 0;
}

/*
 * Installs base vtable 0x021FF29C, runs the base destructor, frees `object`, and
 * returns its former address. Base SDK and heap ownership are released.
 */
extern "C" void *func_ov028_021ff14c(void *object)
{
    FIELD(const void *, object, 0) = data_ov028_021ff29c;
    func_02095308(object);
    Heap_Free(object);
    return object;
}
