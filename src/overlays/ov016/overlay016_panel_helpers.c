#include "tingle/types.h"

/* Overlay 16 six-slot panel teardown and visibility reset helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void __destroy_arr(void *, s32, s32, void (*)(void *));
extern void func_02071eb8(void *);
extern void func_02071f38(void *);
extern void func_02074058(void *);
extern void func_0207419c(void *);
extern void func_02076428(void *, s32, s32, s32, s32, s32);
extern void func_020927b8(void *);
#ifdef __cplusplus
}
#endif

/*
 * Destroy the owner children at +8/+4, embedded resource +0xD4, resources
 * +0x78/+0x6C, the six-element 0x0C-byte resource array at +0x24, then resources
 * +0x18/+0x0C. Return the original state pointer. SDK graphics resources are
 * released in reverse construction order and there is no direct MMIO.
 */
extern "C" void *func_ov016_021fd97c(void *state)
{
    func_0207419c(FIELD(void *, state, 8));
    func_0207419c(FIELD(void *, state, 4));
    func_020927b8((u8 *)state + 0xd4);
    func_02071eb8((u8 *)state + 0x78);
    func_02071eb8((u8 *)state + 0x6c);
    __destroy_arr((u8 *)state + 0x24, 6, 0xc, func_02071eb8);
    func_02071eb8((u8 *)state + 0x18);
    func_02071eb8((u8 *)state + 0xc);
    return state;
}

/*
 * Reset the panel's resources and hide all sprites. When clearText is nonzero,
 * clear rectangle (0x20,0x28)-(0xF8,0xB8) on the font at +0. Refresh child +4,
 * resource +0x18, and all six resources at +0x24; then set hidden bit 2 in
 * sprite halfword +0x24 for each of the three six-entry arrays at +0x8C/+0xA4/
 * +0xBC and the fixed sprites +0x84/+0x88. Return void; graphics state changes
 * through SDK calls without direct hardware access.
 */
extern "C" void func_ov016_021fd9dc(void *state, s32 clearText)
{
    s32 i;

    if (clearText != 0) {
        func_02076428(FIELD(void *, state, 0), 0x20, 0x28, 0xf8, 0xb8, 0);
    }
    func_02074058(FIELD(void *, state, 4));
    func_02071f38((u8 *)state + 0x18);
    for (i = 0; i < 6; i++) {
        func_02071f38((u8 *)state + 0x24 + i * 0xc);
        FIELD(u16, FIELD(void *, state, 0x8c + i * 4), 0x24) |= 4;
        FIELD(u16, FIELD(void *, state, 0xa4 + i * 4), 0x24) |= 4;
        FIELD(u16, FIELD(void *, state, 0xbc + i * 4), 0x24) |= 4;
    }
    FIELD(u16, FIELD(void *, state, 0x84), 0x24) |= 4;
    FIELD(u16, FIELD(void *, state, 0x88), 0x24) |= 4;
}
