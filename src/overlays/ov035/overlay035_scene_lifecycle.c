#include "tingle/types.h"

/* Overlay 35 scene-owner destruction and randomized animated-object spawning. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov035_02203b98[];
extern const u8 data_ov035_02203af8[];
extern const u8 data_ov035_02203d28[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095308(void *object);
extern void Graphics3DResourceOwner_RemoveManager(void *resource);
extern void func_020720d4(void *state);
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

/*
 * Releases scene-owned collection/resource state without freeing the scene.
 * It restores the scene vtable, cleans collection +0x10C, releases the first
 * resource referenced through +0x100, restores and cleans the embedded record
 * base at +0x10C, then destroys resource states +0xF4/+0xE8/+0xDC/+0xCC.
 * Returns the scene; engine/resource ownership changes, without direct MMIO.
 */
extern "C" void *func_ov035_021fe13c(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov035_02203b98;
    func_02095308((u8 *)scene + 0x10c);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, scene, 0x100), 0));
    FIELD(const void *, scene, 0x10c) = data_ov035_02203af8;
    func_02095308((u8 *)scene + 0x10c);
    func_020720d4((u8 *)scene + 0xf4);
    func_020720d4((u8 *)scene + 0xe8);
    func_020720d4((u8 *)scene + 0xdc);
    func_020720d4((u8 *)scene + 0xcc);
    return scene;
}

/*
 * Deleting destructor: performs the same collection/resource cleanup as
 * func_ov035_021fe13c, frees the scene allocation, and returns its original
 * now-invalid address. Heap and engine ownership change; no direct MMIO occurs.
 */
extern "C" void *func_ov035_021fe1a0(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov035_02203b98;
    func_02095308((u8 *)scene + 0x10c);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, scene, 0x100), 0));
    FIELD(const void *, scene, 0x10c) = data_ov035_02203af8;
    func_02095308((u8 *)scene + 0x10c);
    func_020720d4((u8 *)scene + 0xf4);
    func_020720d4((u8 *)scene + 0xe8);
    func_020720d4((u8 *)scene + 0xdc);
    func_020720d4((u8 *)scene + 0xcc);
    Heap_Free(scene);
    return scene;
}

/*
 * Spawns one kind-2 animated object using the sprite record from resource +0xF4.
 * A random identifier 0..7 is installed with byte 0x12 and flags 0x40. On a
 * successful 0xB0-byte allocation, random baseline [-0x600,0x1200), position
 * [0,0x400), and scale [0,0x10000) are passed with the direction argument to
 * the animated constructor. The result, including null on failure, is attached
 * to collection +0x10C. Returns no value; RNG, heap, resource, and collection
 * state change.
 */
extern "C" void func_ov035_021fe20c(void *scene, s32 direction)
{
    void *record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0x100),
                                  (u8 *)scene + 0xf4);
    s32 identifier = func_020918f4((u8 *)scene + 0xc0, 8);
    func_ov035_021fdd28(record, identifier, 0, 0, 0, 0x12, 0x40);

    void *object = Heap_Alloc(0xb0, data_ov035_02203d28, 4, gHeapContext);
    if (object != 0) {
        s32 baseline =
            func_0209189c((u8 *)scene + 0xc0, -0x600, 0x1200);
        s32 positionZ =
            func_0209189c((u8 *)scene + 0xc0, 0, 0x400);
        s32 angle = func_020918f4((u8 *)scene + 0xc0, 0x1000) << 4;
        object = func_ov035_021fdb54(object, 2, (s32)record, direction,
                                    baseline, positionZ, angle);
    }
    func_02095274((u8 *)scene + 0x10c, object);
}
