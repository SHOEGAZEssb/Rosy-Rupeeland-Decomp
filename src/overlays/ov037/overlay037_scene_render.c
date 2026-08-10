#include "tingle/types.h"

/* Overlay 37 scene rendering and compact list-node initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02077b44(void *sceneTransform);
extern void Graphics3DLight_Apply(void *record, s32 index);
extern void func_ov037_021fd324(void *resourceObject);
extern void func_020773e4(void *resourceOwner, void *matrixContext);
extern void func_ov037_021fd4e0(u32, u32, u32, u32, u32, u32, u32, u32);
extern void func_ov037_021fcf20(void *object, void *matrixContext);
#ifdef __cplusplus
}
#endif

/*
 * Renders the main scene. It applies the scene transform at +8, updates four
 * 16-byte records at +0x14C, draws permanent resource object +0x124, prepares
 * the resource owner with matrix context +0x60, clears texture parameters,
 * then traverses the +0x140 linked list through node+8 and draws each object.
 * Returns nothing; geometry-engine and renderer state change, while list and
 * scene ownership are only read.
 */
extern "C" void func_ov037_021fe440(void *scene)
{
    func_02077b44((u8 *)scene + 8);
    for (s32 i = 0; i < 4; ++i)
        Graphics3DLight_Apply((u8 *)scene + 0x14c + i * 16, i);
    func_ov037_021fd324(FIELD(void *, scene, 0x124));
    func_020773e4(FIELD(void *, scene, 0x114), (u8 *)scene + 0x60);
    func_ov037_021fd4e0(0, 0, 0, 0, 0, 0, 0, 0);
    void *node = FIELD(void *, scene, 0x140);
    while (node != 0) {
        func_ov037_021fcf20(node, (u8 *)scene + 0x60);
        node = FIELD(void *, node, 8);
    }
}

/*
 * Initializes a compact scene node by retaining the second and third arguments
 * at +0x24/+0x28 and clearing link-like words +4/+8. Returns nothing and has no
 * SDK or hardware effects. The unusual register-save prologue is compiler ABI
 * behavior rather than evidence of extra arguments.
 */
extern "C" void func_ov037_021fe4d4(void *node, void *value24, void *value28)
{
    FIELD(void *, node, 0x24) = value24;
    FIELD(void *, node, 0x28) = value28;
    FIELD(s32, node, 4) = 0;
    FIELD(s32, node, 8) = 0;
}
