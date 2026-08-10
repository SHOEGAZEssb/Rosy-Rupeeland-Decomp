#include "tingle/types.h"

/* Overlay 36 ramp-controller backdrop and primitive-list rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DSceneState_Apply(void *state);
extern void func_ov045_0220bc3c(s32 x, s32 y, s32 width, s32 height,
                                s32 depth, s32 scale, s32 flags);
extern void func_020773e4(void *manager, void *transform);
extern void func_ov036_021fd128(s32 lightMask, s32 polygonMode,
                                s32 cullMode, s32 polygonId,
                                s32 alpha, s32 misc);
extern void func_ov036_021fdef0(s32, s32, s32, s32,
                                s32, s32, s32, s32);
extern void func_ov036_021fd6e0(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Advances transform state +0xC, draws two shared overlay-45/48 backdrop
 * primitives with recovered coordinate tuples (-0x90,-0xA0,-0x20,0x140) and
 * (0x90,0x140,0x20,-0xA0), both using depth -0x40, value 0x1F, and flags zero,
 * then synchronizes manager +0x118 with transform +0x64. It configures polygon
 * state (cull 3, ID 0x12, alpha 0x1F, final value 0x8000), clears the companion
 * render parameters, and draws every primitive linked from list head +0x15C
 * through link +8. Returns nothing and changes renderer/GX state.
 */
extern "C" void func_ov036_02201c7c(void *controller)
{
    Graphics3DSceneState_Apply((u8 *)controller + 0xc);
    func_ov045_0220bc3c(-0x90, -0xa0, -0x20, 0x140,
                        -0x40, 0x1f, 0);
    func_ov045_0220bc3c(0x90, 0x140, 0x20, -0xa0,
                        -0x40, 0x1f, 0);
    func_020773e4(FIELD(void *, controller, 0x118),
                  (u8 *)controller + 0x64);
    func_ov036_021fd128(0, 0, 3, 0x12, 0x1f, 0x8000);
    func_ov036_021fdef0(0, 0, 0, 0, 0, 0, 0, 0);
    for (void *object = FIELD(void *, controller, 0x15c);
         object != 0; object = FIELD(void *, object, 8))
        func_ov036_021fd6e0(object);
}
