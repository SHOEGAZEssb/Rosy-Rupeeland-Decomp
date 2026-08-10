#include "tingle/types.h"

/* Overlay 16 per-frame scene component update dispatcher. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void func_020958d8(void *);
extern void func_02096304(void *);
extern void func_ov000_021fc164(void *);
extern void func_ov016_021fd358(void *);
extern void func_ov016_021fdf50(void *);
extern void func_ov016_021fe63c(void *);
#ifdef __cplusplus
}
#endif

/*
 * Advance the five embedded actor records at +0xE8, +0x194, +0x240, +0x2EC,
 * and +0x398, then refresh owner +0xE0. Conditionally update the list +0x444,
 * panel +0x448, auxiliary selector +0x44C, actor group +0x470, and message/effect
 * object +0x464 when their pointers are non-null. Return void. The called SDK
 * and overlay routines update presentation state; no direct MMIO occurs here.
 */
extern "C" void func_ov016_021ff7bc(void *state)
{
    func_020958d8((u8 *)state + 0xe8);
    func_020958d8((u8 *)state + 0x194);
    func_020958d8((u8 *)state + 0x240);
    func_020958d8((u8 *)state + 0x2ec);
    func_020958d8((u8 *)state + 0x398);
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0xe0));
    if (FIELD(void *, state, 0x444) != 0) {
        func_ov016_021fd358(FIELD(void *, state, 0x444));
    }
    if (FIELD(void *, state, 0x448) != 0) {
        func_ov016_021fdf50(FIELD(void *, state, 0x448));
    }
    if (FIELD(void *, state, 0x44c) != 0) {
        func_ov000_021fc164(FIELD(void *, state, 0x44c));
    }
    if (FIELD(void *, state, 0x470) != 0) {
        func_ov016_021fe63c(FIELD(void *, state, 0x470));
    }
    if (FIELD(void *, state, 0x464) != 0) {
        func_02096304(FIELD(void *, state, 0x464));
    }
}
