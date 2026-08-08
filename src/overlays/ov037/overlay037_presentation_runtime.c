#include "tingle/types.h"

/* Overlay 37 deleting presentation teardown and active-frame display update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov037_021fe648(void *presentation);
extern void Heap_Free(void *allocation);
extern void func_ov048_0220ba90(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Deleting form of presentation teardown. Its recovered body duplicates all
 * effects documented for func_ov037_021fe648, then frees presentation itself
 * and returns the former address. The portable form shares that documented
 * teardown to keep the duplicated behavior explicit and maintainable.
 */
extern "C" void *func_ov037_021fe718(void *presentation)
{
    func_ov037_021fe648(presentation);
    Heap_Free(presentation);
    return presentation;
}

/*
 * If active flag 0x400 at +0x20 is set, updates the +0x94 subsystem and writes
 * presentation field +0x48 into main-engine DISPCNT bits 8..12, preserving all
 * other display-control bits. Always returns 0. Presentation subsystem state
 * and display MMIO may change; no heap state is affected.
 */
extern "C" s32 func_ov037_021fe7dc(void *presentation)
{
    if ((FIELD(u32, presentation, 0x20) & 0x400) != 0) {
        func_ov048_0220ba90((u8 *)presentation + 0x94);
        u32 display = REG32(0x04000000);
        display &= ~0x1f00u;
        display |= FIELD(u32, presentation, 0x48) << 8;
        REG32(0x04000000) = display;
    }
    return 0;
}
