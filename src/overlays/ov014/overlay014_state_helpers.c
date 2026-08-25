#include "tingle/types.h"

/* Overlay 14 subordinate reset, completion, and dual-engine display-register helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov014_021fd928[];
#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov000_021fc59c(void *);
extern void func_ov000_021fc5c4(void *);
extern void func_ov000_021fc5ec(void *);
extern void Overlay000_Grid_Update(void *);
extern void func_ov014_021fce14(void *, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Apply three reset/stop operations to subordinate +0x78, install the two-word
 * callback descriptor data_ov014_021fd928 through func_ov014_021fce14, and
 * return zero. Callees may alter subordinate presentation and scene state.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov014_021fd350(void *state)
{
    void *subordinate = FIELD(void *, state, 0x78);
    func_ov000_021fc59c(subordinate);
    func_ov000_021fc5c4(subordinate);
    func_ov000_021fc5ec(subordinate);
    func_ov014_021fce14(state, data_ov014_021fd928[0],
                        data_ov014_021fd928[1], 0);
    return 0;
}

/* If subordinate +0x78 is non-null, dispatch Overlay000_Grid_Update on it; always return one. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov014_021fd89c(void *state)
{
    void *subordinate = FIELD(void *, state, 0x78);
    if (subordinate != 0)
        Overlay000_Grid_Update(subordinate);
    return 1;
}

/*
 * When state flag bit 0x400 at +0x20 is set, replace DISPCNT bits 8..12 on the
 * main and sub engines with +0x48 and +0x4C shifted by eight. Return zero. Both
 * writes are confirmed Nintendo DS display-hardware effects.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov014_021fd8b8(void *state)
{
    if (FIELD(u32, state, 0x20) & 0x400) {
        volatile u32 *mainDispcnt = (volatile u32 *)0x04000000;
        volatile u32 *subDispcnt = (volatile u32 *)0x04001000;
        *mainDispcnt = (*mainDispcnt & ~0x1f00u) |
                       (FIELD(u32, state, 0x48) << 8);
        *subDispcnt = (*subDispcnt & ~0x1f00u) |
                      (FIELD(u32, state, 0x4c) << 8);
    }
    return 0;
}
