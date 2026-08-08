#include "tingle/types.h"

/* Overlay 35 secondary-scene render orchestration across object collections. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02077b44(void *state);
extern void func_ov035_021fe9dc(void *object);
extern void func_ov035_021fe6e4(void *object, s32 mode);
extern void func_020773e4(void *resourceSet, void *transform);
extern void func_ov035_021fd7b0(s32 format, s32 transform, s32 sizeS,
                               s32 sizeT, s32 repeatS, s32 repeatT,
                               s32 flip, u32 address);
extern void func_ov035_021fcfa0(void *object, s32 mode);
extern void func_ov035_021fd128(s32 lightMask, s32 polygonMode, s32 cullMode,
                               s32 polygonId, s32 alpha, s32 miscBits);
extern void func_ov035_021fda24(void *particle);
#ifdef __cplusplus
}
#endif

/*
 * Renders the secondary scene. It advances transform state +0x0C, draws the
 * +0x140 and +0x13C transition wrappers, synchronizes resource set +0xF8 with
 * transform +0x64, clears texture attributes, and draws the linked render
 * objects rooted at collection link +0x120. It then installs polygon ID 0x16
 * with alpha 31 and draws particles linked at +0x130. Collection traversal uses
 * each node's +8 link. Returns no value; renderer and direct GX state change.
 */
extern "C" void func_ov035_021ff3bc(void *scene)
{
    func_02077b44((u8 *)scene + 0x0c);
    func_ov035_021fe9dc(FIELD(void *, scene, 0x140));
    func_ov035_021fe6e4(FIELD(void *, scene, 0x13c),
                        (s32)((u8 *)scene + 0x64));
    func_020773e4(FIELD(void *, scene, 0xf8), (u8 *)scene + 0x64);
    func_ov035_021fd7b0(0, 0, 0, 0, 0, 0, 0, 0);

    void *node = FIELD(void *, scene, 0x120);
    while (node != 0) {
        func_ov035_021fcfa0(node, (s32)((u8 *)scene + 0x64));
        node = FIELD(void *, node, 8);
    }
    func_ov035_021fd128(0, 0, 3, 0x16, 0x1f, 0);
    node = FIELD(void *, scene, 0x130);
    while (node != 0) {
        func_ov035_021fda24(node);
        node = FIELD(void *, node, 8);
    }
}
