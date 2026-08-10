#include "tingle/types.h"

/* Overlay 36 orbit-controller transform, manager, and resource-object rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DSceneState_Apply(void *transform);
extern void GraphicsAnimationInstanceManager_Render(void *manager, void *matrix);
extern void func_ov036_0220009c(void *object);
extern void func_ov036_021fd128(s32, s32, s32, s32, s32, s32);
extern void func_ov036_021fdef0(s32, s32, s32, s32,
                                s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Renders the orbit controller. It submits transform +0xC, applies manager
 * +0x100 using matrix/work area +0x64, draws secondary resource object +0x144,
 * then establishes common GX attributes (mode 0x13, alpha 31) and clears the
 * packed polygon attributes. It returns nothing and changes transform, manager,
 * and Nintendo DS GX state.
 */
extern "C" void func_ov036_02200fb8(void *controller)
{
    Graphics3DSceneState_Apply((u8 *)controller + 0xc);
    GraphicsAnimationInstanceManager_Render(FIELD(void *, controller, 0x100),
                  (u8 *)controller + 0x64);
    func_ov036_0220009c(FIELD(void *, controller, 0x144));
    func_ov036_021fd128(0, 0, 3, 0x13, 0x1f, 0);
    func_ov036_021fdef0(0, 0, 0, 0, 0, 0, 0, 0);
}
