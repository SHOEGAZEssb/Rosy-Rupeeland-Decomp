#include "tingle/types.h"

/* Overlay 35 quinary scene teardown and owned primitive-list release. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203c24[];
extern const u8 data_ov035_02203af8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov035_021fd4dc(void *list);
extern void Heap_Free(void *allocation);
extern void func_02095308(void *collection);
extern void func_02077688(void *resourceSetRoot);
extern void func_02071e04(void *resourceContext, void *resource);
extern void func_020720d4(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Performs the common quinary teardown. It destroys and frees optional list
 * +0x170, clears all three collections, releases resource set +0xF8 and asset
 * +0xF4, resets the collection vtables, and destroys states +0xE8/+0xDC/+0xCC.
 * Returns scene without releasing its own storage; heap, renderer, and resource
 * registries change.
 */
static void *teardown_scene(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov035_02203c24;
    void *list = FIELD(void *, scene, 0x170);
    if (list != 0) {
        func_ov035_021fd4dc(list);
        Heap_Free(list);
    }
    func_02095308((u8 *)scene + 0x108);
    func_02095308((u8 *)scene + 0x118);
    func_02095308((u8 *)scene + 0x128);
    func_02077688(FIELD(void *, FIELD(void *, scene, 0xf8), 0));
    func_02071e04(data_020f4e18[0], FIELD(void *, scene, 0xf4));

    FIELD(const void *, scene, 0x128) = data_ov035_02203af8;
    func_02095308((u8 *)scene + 0x128);
    FIELD(const void *, scene, 0x118) = data_ov035_02203af8;
    func_02095308((u8 *)scene + 0x118);
    FIELD(const void *, scene, 0x108) = data_ov035_02203af8;
    func_02095308((u8 *)scene + 0x108);
    func_020720d4((u8 *)scene + 0xe8);
    func_020720d4((u8 *)scene + 0xdc);
    func_020720d4((u8 *)scene + 0xcc);
    return scene;
}

/*
 * Tears down the quinary scene and returns its still-allocated address. Inputs
 * and state effects are described by teardown_scene; the scene storage remains
 * owned by the caller.
 */
extern "C" void *func_ov035_02200d40(void *scene)
{
    return teardown_scene(scene);
}

/*
 * Tears down the quinary scene, frees its allocation, and returns the original
 * now-invalid address to preserve the binary ABI. Heap, renderer, and resource
 * state change.
 */
extern "C" void *func_ov035_02200dfc(void *scene)
{
    teardown_scene(scene);
    Heap_Free(scene);
    return scene;
}
