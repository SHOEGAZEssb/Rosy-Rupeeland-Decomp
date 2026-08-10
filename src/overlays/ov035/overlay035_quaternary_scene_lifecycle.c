#include "tingle/types.h"

/* Overlay 35 quaternary scene destruction and common per-frame maintenance. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203c78[];
extern const u8 data_ov035_02203af8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095308(void *collection);
extern void Graphics3DResourceOwner_RemoveManager(void *resourceSetRoot);
extern void func_02071e04(void *resourceContext, void *resource);
extern void Graphics3DLightSet_Destroy(void *records);
extern void GraphicsResourceSetVariant_Destroy(void *state);
extern void Heap_Free(void *allocation);
extern void func_02095360(void *collection);
extern void func_ov035_021fdd70(void *record, s32 x, s32 y, s32 z);
extern void GraphicsAnimationInstanceManager_Update(void *resourceSet);
#ifdef __cplusplus
}
#endif

/*
 * Releases every object and resource owned by a quaternary scene. The two
 * collection cleanups occur both before and after their vtables are reset to
 * data_ov035_02203af8, matching the derived/base teardown sequence. Returns
 * scene without freeing its storage; renderer and resource registries change.
 */
extern "C" void *func_ov035_0220043c(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov035_02203c78;
    func_02095308((u8 *)scene + 0x160);
    func_02095308((u8 *)scene + 0x170);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, scene, 0x104), 0));
    func_02071e04(data_020f4e18[0], FIELD(void *, scene, 0x100));

    FIELD(const void *, scene, 0x170) = data_ov035_02203af8;
    func_02095308((u8 *)scene + 0x170);
    FIELD(const void *, scene, 0x160) = data_ov035_02203af8;
    func_02095308((u8 *)scene + 0x160);
    Graphics3DLightSet_Destroy((u8 *)scene + 0x120);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xf4);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xe8);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xdc);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xcc);
    return scene;
}

/*
 * Performs the same teardown as func_ov035_0220043c and then releases scene's
 * heap allocation. Returns the now-invalid original address, preserving the
 * binary ABI; resource, renderer, and heap state are observably changed.
 */
extern "C" void *func_ov035_022004d4(void *scene)
{
    func_ov035_0220043c(scene);
    Heap_Free(scene);
    return scene;
}

/*
 * Advances the scene's two object collections, copies the current X/Y/Z values
 * at +0x10/+0x20/+0x30 of animated object +0x110 into scene vector +0x0C,
 * and updates resource set +0x104. It has no return value and changes renderer,
 * scene-vector, animation, and resource-set state.
 */
extern "C" void func_ov035_02200574(void *scene)
{
    func_02095360((u8 *)scene + 0x160);
    func_02095360((u8 *)scene + 0x170);
    void *animated = FIELD(void *, scene, 0x110);
    func_ov035_021fdd70((u8 *)scene + 0x0c,
                        FIELD(s32, animated, 0x10),
                        FIELD(s32, animated, 0x20),
                        FIELD(s32, animated, 0x30));
    GraphicsAnimationInstanceManager_Update(FIELD(void *, scene, 0x104));
}
