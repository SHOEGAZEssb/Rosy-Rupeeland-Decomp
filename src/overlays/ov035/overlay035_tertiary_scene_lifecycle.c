#include "tingle/types.h"

/* Overlay 35 tertiary-scene destruction and kind-3 object spawning. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov035_02203cb0[];
extern const u8 data_ov035_02203af8[];
extern const u8 data_ov035_02203d28[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095308(void *collection);
extern void Graphics3DResourceOwner_RemoveManager(void *resource);
extern void GraphicsResourceSetVariant_Destroy(void *state);
extern void Heap_Free(void *allocation);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *resourceSet, void *resource);
extern s32 func_020918f4(void *randomState, s32 maximum);
extern s32 func_0209189c(void *randomState, s32 minimum, s32 maximum);
extern void func_ov035_021fdd28(void *record, s32 identifier, s32 value20,
                               s32 value24, s32 value28, u8 value5a,
                               u16 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov035_021fdb54(void *object, s32 kind, s32 baseArgument,
                                s32 direction, s32 baseline, s32 positionZ,
                                s32 angle);
extern void func_02095274(void *collection, void *object);
#ifdef __cplusplus
}
#endif

/* Releases both collections, resource set +0x124, and all seven resource states. */
static void release_tertiary_scene(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov035_02203cb0;
    func_02095308((u8 *)scene + 0x174);
    func_02095308((u8 *)scene + 0x184);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, scene, 0x124), 0));
    FIELD(const void *, scene, 0x184) = data_ov035_02203af8;
    func_02095308((u8 *)scene + 0x184);
    FIELD(const void *, scene, 0x174) = data_ov035_02203af8;
    func_02095308((u8 *)scene + 0x174);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0x118);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0x10c);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0x100);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xf4);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xe8);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xdc);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0xcc);
}

/*
 * Non-deleting destructor: releases both collections, resource-set ownership,
 * and all resource states, then returns the scene without freeing it.
 */
extern "C" void *func_ov035_021ffa44(void *scene)
{
    release_tertiary_scene(scene);
    return scene;
}

/*
 * Deleting destructor: performs the same owned-state cleanup, frees the scene,
 * and returns its original invalid address. Heap/resource state changes.
 */
extern "C" void *func_ov035_021ffad8(void *scene)
{
    release_tertiary_scene(scene);
    Heap_Free(scene);
    return scene;
}

/*
 * Spawns one kind-3 animated object from resource +0x118. A random identifier
 * 0..1 is installed with byte 0x12 and flags 0x40. Successful allocation uses
 * randomized baseline [-0x600,0x1200), position [0,0x400), and angle/scale
 * [0,0x10000), plus caller direction. The result is attached to collection
 * +0x184. Returns no value; RNG, heap, resource, and collection state change.
 */
extern "C" void func_ov035_021ffb74(void *scene, s32 direction)
{
    void *record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0x124),
                                  (u8 *)scene + 0x118);
    func_ov035_021fdd28(
        record, func_020918f4((u8 *)scene + 0xc0, 2),
        0, 0, 0, 0x12, 0x40);
    void *object = Heap_Alloc(0xb0, data_ov035_02203d28, 4, gHeapContext);
    if (object != 0) {
        s32 baseline =
            func_0209189c((u8 *)scene + 0xc0, -0x600, 0x1200);
        s32 positionZ =
            func_0209189c((u8 *)scene + 0xc0, 0, 0x400);
        s32 angle = func_020918f4((u8 *)scene + 0xc0, 0x1000) << 4;
        object = func_ov035_021fdb54(object, 3, (s32)record, direction,
                                    baseline, positionZ, angle);
    }
    func_02095274((u8 *)scene + 0x184, object);
}
