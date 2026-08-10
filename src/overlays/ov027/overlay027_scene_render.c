#include "tingle/types.h"

/* Overlay 27 per-frame scene rendering and geometry-engine finalization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_ov043_0220b9bc(void *);
extern void func_020b0558(void);
extern void Graphics3DSceneState_Apply(void *);
extern void func_ov027_021fcefc(void *);
extern void GraphicsAnimationInstanceManager_Render(void *, void *);
extern void func_ov027_021fd0b0(u32, u32, u32, u32, u32, u32, u32, u32);
extern void func_ov027_021fd834(void *);
extern void func_ov048_0220bad4(void *);
#ifdef __cplusplus
}
#endif

/*
 * Renders the scene. It queries graphics context +0x198, clears +0x10C and
 * chooses +0x110=0xC00 only when that query returns zero, resets geometry
 * state, updates +0x80, draws resource owner +0x114, submits resource data
 * through +0x58/+0xD8, clears the polygon command, and draws every linked
 * motion object beginning at +0x154 (next pointer +8). It then writes matrix
 * restore/end registers and finalizes context +0x198. Returns void and directly
 * affects Nintendo DS geometry registers.
 */
extern "C" void func_ov027_021fe0f8(void *scene)
{
    s32 active = func_ov043_0220b9bc((u8 *)scene + 0x198);
    FIELD(s32, scene, 0x10c) = 0;
    FIELD(s32, scene, 0x110) = active == 0 ? 0xc00 : 0;
    func_020b0558();
    *(volatile u32 *)0x040004c0 = 0x7f107fff;
    *(volatile u32 *)0x04000444 = 0;
    Graphics3DSceneState_Apply((u8 *)scene + 0x80);
    func_ov027_021fcefc(FIELD(void *, scene, 0x114));
    GraphicsAnimationInstanceManager_Render(FIELD(void *, scene, 0x58), (u8 *)scene + 0xd8);
    func_ov027_021fd0b0(0, 0, 0, 0, 0, 0, 0, 0);
    for (void *node = FIELD(void *, scene, 0x154); node;
         node = FIELD(void *, node, 8))
        func_ov027_021fd834(node);
    *(volatile u32 *)0x04000448 = 1;
    *(volatile u32 *)0x04000540 = 0;
    func_ov048_0220bad4((u8 *)scene + 0x198);
}
