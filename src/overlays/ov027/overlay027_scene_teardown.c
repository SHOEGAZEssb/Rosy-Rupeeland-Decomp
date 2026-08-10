#include "tingle/types.h"

/* Overlay 27 scene teardown and graphics-state restoration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov027_021feeb4[];
extern const u8 data_ov027_021fee60[];
extern void *data_020f4e14;
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void func_02095308(void *);
extern void Graphics3DResourceOwner_Destroy(void *);
extern void func_02075020(void *);
extern void func_02092418(void *);
extern void GX_SetGraphicsMode(s32, s32, s32);
extern void func_ov048_0220b7b4(void *);
extern void func_020923a0(void *);
extern void GraphicsResourceSetVariant_Destroy(void *);
#ifdef __cplusplus
}
#endif

/*
 * Tears down `scene` and returns it without freeing the scene allocation. It
 * restores vtable 0x021FEEB4, clears scene flag 0x400, tears down all four
 * child containers, destroys/frees resource group +0x54, releases shared font
 * resources, shuts down +0x164 and +0x198 subsystems, resets graphics mode,
 * clears main/sub blend-control registers 0x04000050/0x04001050, restores the
 * compact-record vtables, and releases resource handles +0x74/+0x68/+0x5C.
 */
extern "C" void *func_ov027_021fde24(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov027_021feeb4;
    FIELD(u32, scene, 0x20) &= ~0x400u;
    func_02095308((u8 *)scene + 0x120);
    func_02095308((u8 *)scene + 0x130);
    func_02095308((u8 *)scene + 0x140);
    func_02095308((u8 *)scene + 0x150);

    void *group = FIELD(void *, scene, 0x54);
    if (group) {
        Graphics3DResourceOwner_Destroy(group);
        Heap_Free(group);
    }
    func_02075020(data_020f4e14);
    func_02075020(gDebugFont);
    func_02092418((u8 *)scene + 0x164);
    GX_SetGraphicsMode(1, 0, 0);
    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    func_ov048_0220b7b4((u8 *)scene + 0x198);
    func_020923a0((u8 *)scene + 0x164);

    FIELD(const void *, scene, 0x150) = data_ov027_021fee60;
    func_02095308((u8 *)scene + 0x150);
    FIELD(const void *, scene, 0x140) = data_ov027_021fee60;
    func_02095308((u8 *)scene + 0x140);
    FIELD(const void *, scene, 0x130) = data_ov027_021fee60;
    func_02095308((u8 *)scene + 0x130);
    FIELD(const void *, scene, 0x120) = data_ov027_021fee60;
    func_02095308((u8 *)scene + 0x120);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0x74);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0x68);
    GraphicsResourceSetVariant_Destroy((u8 *)scene + 0x5c);
    return scene;
}

/* Performs the full scene teardown, frees the scene allocation, and returns its old address. */
extern "C" void *func_ov027_021fdf44(void *scene)
{
    func_ov027_021fde24(scene);
    Heap_Free(scene);
    return scene;
}
