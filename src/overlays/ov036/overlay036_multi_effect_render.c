#include "tingle/types.h"

/* Overlay 36 multi-effect controller render traversal across two child lists. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DSceneState_Apply(void *transform);
extern void func_020773e4(void *manager, void *matrix);
extern void func_ov036_021fdef0(s32, s32, s32, s32,
                                s32, s32, s32, s32);
extern void func_ov036_021fcfa0(void *object, void *matrix);
extern void func_ov036_021fd128(s32, s32, s32, s32, s32, s32);
extern void func_ov036_021fd4c8(void *particle);
#ifdef __cplusplus
}
#endif

/*
 * Renders the multi-effect controller. It submits transform +0xC and applies
 * manager +0xE8 using matrix/work area +0x64, clears polygon attributes, and
 * walks list head +0x11C through +8 with the common object renderer and matrix.
 * It then establishes particle GX attributes and walks head +0x12C through +8
 * with the motion-primitive renderer. It returns nothing and changes manager,
 * transform, and Nintendo DS GX state.
 */
extern "C" void func_ov036_021ffefc(void *controller)
{
    Graphics3DSceneState_Apply((u8 *)controller + 0xc);
    func_020773e4(FIELD(void *, controller, 0xe8),
                  (u8 *)controller + 0x64);
    func_ov036_021fdef0(0, 0, 0, 0, 0, 0, 0, 0);
    void *object = FIELD(void *, controller, 0x11c);
    while (object != 0) {
        func_ov036_021fcfa0(object, (u8 *)controller + 0x64);
        object = FIELD(void *, object, 8);
    }
    func_ov036_021fd128(0, 0, 3, 0x10, 0x1f, 0);
    object = FIELD(void *, controller, 0x12c);
    while (object != 0) {
        func_ov036_021fd4c8(object);
        object = FIELD(void *, object, 8);
    }
}
