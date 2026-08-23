#include "tingle/types.h"

/* Overlay 30 palette buffer preparation and dual-engine blend setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void func_020b44e8(void);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void func_02070638(void *, s32, s32);
extern void GraphicsBgMapResource_UploadToMainBg(void *, s32, s32);
extern void func_020b2058(void *, s32, s32);
extern void func_020706c4(void *, s32, s32);
extern void GraphicsBgMapResource_UploadToSubBg(void *, s32, s32);
extern void func_020b1ff0(void *, s32, s32);
extern void func_020afd0c(void *, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Temporarily loads resource IDs 0xC006..0xC008, obtains a palette-like buffer
 * from scene resource +0x360 and records its +0x20 address at +0x32C/+0x330 with
 * length 0x10. It copies 0x20 bytes through two complementary engine resource
 * paths, configures blend registers 0x04000050/0x04001050 with (4,24,8), restores
 * display mode field +0x48 to 0x1C, and destroys the temporary resource set.
 * Returns void; scene palette metadata, graphics resources, and blend MMIO/SDK
 * state change. The semantic purpose of the complementary copy helpers remains
 * inferred from their paired use.
 */
extern "C" void func_ov030_021fe448(void *scene)
{
    u32 resources[3];
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18[0],
                             0xc006, 0xc007, 0xc008);
    func_020b44e8();
    void *buffer = (u8 *)GraphicsBgResourceData_GetDecoded(FIELD(void *, scene, 0x360)) + 0x20;
    FIELD(void *, scene, 0x330) = buffer;
    FIELD(void *, scene, 0x32c) = buffer;
    FIELD(s32, scene, 0x334) = 0x10;

    func_02070638((void *)resources[0], 2, 0);
    GraphicsBgMapResource_UploadToMainBg((void *)resources[2], 2, 0);
    func_020b2058(buffer, 0, 0x20);
    func_020706c4((void *)resources[0], 2, 0);
    GraphicsBgMapResource_UploadToSubBg((void *)resources[2], 2, 0);
    func_020b1ff0(buffer, 0, 0x20);
    func_020afd0c((void *)0x04000050, 4, 0x18, 8);
    func_020afd0c((void *)0x04001050, 4, 0x18, 8);
    FIELD(s32, scene, 0x48) = 0x1c;
    GraphicsResourceSet_Destroy(resources);
}
