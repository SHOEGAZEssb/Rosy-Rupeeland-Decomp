#include "tingle/types.h"

/* Overlay 26 scene/controller shutdown and deleting teardown paths. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;
extern void *gSoundContext;
extern const u8 data_ov026_022048b8[];
extern const u8 data_ov026_02204944[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GX_SetGraphicsMode(s32, s32, s32);
extern void Heap_Free(void *);
extern void func_0205940c(void *, s32, s32);
extern void func_02071e04(void *, void *);
extern void GraphicsResourceSetVariant_Destroy(void *);
extern void func_02075020(void *);
extern void Graphics3DResourceOwner_Destroy(void *);
extern void Graphics3DLightSet_Destroy(void *);
extern void func_02092314(void *, s32, s32);
extern void func_020923a0(void *);
extern void func_02092418(void *);
extern void func_02095308(void *);
extern void func_ov048_0220b7b4(void *);
#ifdef __cplusplus
}
#endif

/*
 * Performs the common scene shutdown: unregisters task 0x3D/8, stops sound
 * 0x22, clears flag 0x400, tears down embedded state records and resource
 * descriptors, releases model resource +0x15C and manager +0x68, shuts down
 * debug/display helpers, restores graphics mode 1, and clears both display
 * control halfwords at 0x04000050/0x04001050. No scene storage is freed.
 */
static void teardown_scene(void *scene)
{
    func_02092314(scene, 0x3d, 8);
    func_0205940c(gSoundContext, 0x22, 0);
    FIELD(u32, scene, 0x20) &= ~0x400;
    func_02095308((u8 *)scene + 0x2f4);
    func_02095308((u8 *)scene + 0x304);
    func_02095308((u8 *)scene + 0x314);
    func_02071e04(data_020f4e18, FIELD(void *, scene, 0x15c));
    void *manager = FIELD(void *, scene, 0x68);
    if (manager != 0) {
        Graphics3DResourceOwner_Destroy(manager);
        Heap_Free(manager);
    }
    func_02075020(data_020f4e14);
    func_02075020(gDebugFont);
    func_02092418((u8 *)scene + 0x328);
    GX_SetGraphicsMode(1, 0, 0);
    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    func_ov048_0220b7b4((u8 *)scene + 0x370);
    func_020923a0((u8 *)scene + 0x328);

    /* The second pass restores each small record's own vtable before base teardown. */
    FIELD(const void *, scene, 0x314) = data_ov026_022048b8;
    func_02095308((u8 *)scene + 0x314);
    FIELD(const void *, scene, 0x304) = data_ov026_022048b8;
    func_02095308((u8 *)scene + 0x304);
    FIELD(const void *, scene, 0x2f4) = data_ov026_022048b8;
    func_02095308((u8 *)scene + 0x2f4);
    Graphics3DLightSet_Destroy((u8 *)scene + 0x180);
    for (s32 off = 0xac; off >= 0x7c; off -= 0xc)
        GraphicsResourceSetVariant_Destroy((u8 *)scene + off);
}

/* Restores the scene vtable, performs full shutdown, and returns `scene` without freeing it. */
extern "C" void *func_ov026_02200064(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov026_02204944;
    teardown_scene(scene);
    return scene;
}

/* Performs the full 0x02200064 shutdown, frees `scene`, and returns its old address. */
extern "C" void *func_ov026_022001bc(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov026_02204944;
    teardown_scene(scene);
    Heap_Free(scene);
    return scene;
}
