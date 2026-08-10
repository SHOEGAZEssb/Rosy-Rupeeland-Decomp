#include "tingle/types.h"

/* Overlay 35 tertiary-scene backdrop rendering and resource synchronization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DSceneState_Apply(void *state);
extern void func_ov045_0220bc3c(s32 x, s32 y, s32 width, s32 height,
                               s32 depth, s32 scale, s32 flags);
extern void GraphicsAnimationInstanceManager_Render(void *resourceSet, void *transform);
#ifdef __cplusplus
}
#endif

/*
 * Advances transform state +0x0C, draws two recovered backdrop rectangles via
 * the shared overlay-45/48 primitive helper, and synchronizes resource set
 * +0x124 with transform +0x64. The first spans (-0x90,-0xA0,0x20,0x140), the
 * second (0x90,0x140,0x20,-0xA0); both use depth -0x40, scale 0x4000, flags 0.
 * Returns no value; renderer and likely direct GX state change through helpers.
 */
extern "C" void func_ov035_021ffe44(void *scene)
{
    Graphics3DSceneState_Apply((u8 *)scene + 0x0c);
    func_ov045_0220bc3c(-0x90, -0xa0, -0x20, 0x140,
                        -0x40, 0x4000, 0);
    func_ov045_0220bc3c(0x90, 0x140, 0x20, -0xa0,
                        -0x40, 0x4000, 0);
    GraphicsAnimationInstanceManager_Render(FIELD(void *, scene, 0x124), (u8 *)scene + 0x64);
}
