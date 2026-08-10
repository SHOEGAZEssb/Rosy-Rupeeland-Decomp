#include "tingle/types.h"

/* Overlay 35 quaternary scene camera, backdrop, and model rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DSceneState_Apply(void *camera);
extern void Graphics3DLight_Apply(void *record, s32 index);
extern void func_ov048_0220baec(s32 x0, s32 y0, s32 x1, s32 y1,
                               s32 depth, s32 width, s32 height);
extern void GraphicsAnimationInstanceManager_Render(void *resourceSet, void *transform);
extern void func_ov035_021fd7b0(s32 first, s32 second, s32 third, s32 fourth,
                               s32 fifth, s32 sixth, s32 seventh, s32 eighth);
extern void func_ov035_021fcfa0(void *object, void *transform);
#ifdef __cplusplus
}
#endif

/*
 * Renders the quaternary scene. It applies camera state +0x0C, submits all
 * four 16-byte records at +0x120, draws two fixed backdrop strips, prepares
 * resource set +0x104 with transform +0x64, clears the overlay render state,
 * and renders every linked object starting at collection head +0x174. There
 * is no return value; graphics-engine and per-object render state change.
 */
extern "C" void func_ov035_022007ec(void *scene)
{
    Graphics3DSceneState_Apply((u8 *)scene + 0x0c);
    for (s32 i = 0; i < 4; ++i)
        Graphics3DLight_Apply((u8 *)scene + 0x120 + i * 0x10, i);

    /* Confirmed screen-edge rectangles; parameter semantics remain inferred. */
    func_ov048_0220baec(-0xc0, 0x180, 0xc0, 0, -0x80, 0x18, 0x10);
    func_ov048_0220baec(-0xc0, 0, 0xc0, -0x180, -0x80, 0x10, 0x18);
    GraphicsAnimationInstanceManager_Render(FIELD(void *, scene, 0x104), (u8 *)scene + 0x64);
    func_ov035_021fd7b0(0, 0, 0, 0, 0, 0, 0, 0);

    void *object = FIELD(void *, scene, 0x174);
    while (object != 0) {
        func_ov035_021fcfa0(object, (u8 *)scene + 0x64);
        object = FIELD(void *, object, 8);
    }
}
