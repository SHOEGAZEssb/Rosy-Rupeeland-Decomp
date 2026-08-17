#include "tingle/checked_fs.h"
#include "tingle/types.h"

/*
 * Overlay 10 3D debug-scene construction. This recovered constructor loads two
 * packed files, creates model/render resources, and initializes DS 3D hardware.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_ov010_021fec34[];
extern const void *data_ov010_021fec68[];
extern const void *data_ov010_021fea38[];
extern const char *data_ov010_021fea50[2];
extern const char data_ov010_021fec7c[];
extern const char data_ov010_021fec84[];
extern const char data_ov010_021fec8c[];
extern void *data_020f4e14;
extern void *data_020f4e18;
extern u8 gHeapContext[];
extern void Scene_Init(void *);
extern void Scene_SetFlags03(void *);
extern void SceneInputBase_Init(void *);
extern void GraphicsResourceSetVariant_Init(void *);
extern void Graphics3DSceneState_Init(void *);
extern void func_02092364(void *);
extern void func_020923a4(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void func_02075238(void *);
extern void GraphicsSpriteRenderer_HideAllSprites(void *);
extern void *Heap_AllocCore(s32, const char *, s32, void *);
extern void func_020b4554(void *, s32);
extern void *Heap_Alloc(s32, const char *, s32, void *);
extern void *Graphics3DResourceOwner_Init(void *, s32, s32);
extern void *Graphics3DResourceOwner_CreateManager(void);
extern void *Graphics3DResourceBinding_Init(void *, void *, void *, s32, s32);
extern void func_ov010_021fd39c(void *);
extern void func_ov010_021fd45c(void *);
extern void func_ov010_021fce00(u32);
extern void func_ov010_021fce1c(u32);
extern void func_ov010_021fce40(s32);
extern void func_ov010_021fce7c(void *, s32, s32, s32);
extern void func_ov010_021fce84(void *, s32, s32, s32);
extern void func_ov010_021fce94(void *, s32, s32, s32);
extern void GX_DispOn(void);
extern void GX_SetGraphicsMode(s32, s32, s32);
extern void func_02092638(s32, s32, s32, s32);
extern void func_020b0300(u16 color, s32 alpha, s32 depth, s32 polygonId,
                          s32 fog);
extern void TitlePalette_SetSubBackdrop(s32);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the scene and members +0x24/+0x7C/+0x98/+0x180; install the
 * recovered descriptors and notify the manager. Load two path-table files into
 * allocations +0x90/+0x94 with length/32 at +0x134/+0x138 and record indices
 * +0x13C/+0x140. Process only full reads, matching the original open/read/close
 * behavior. Initialize manager state, allocate a 0x624-byte resource tagged by
 * data_ov010_021fec84 and construct it with arguments 4/2 at +0x78, retain
 * Graphics3DResourceOwner_CreateManager at +0x88, and allocate/configure a 0x18-byte resource at +0x130
 * using IDs 0x611A/0x611B and archive data_020f4e18.
 *
 * Clear +0x8C, +0x12C, +0x144/+0x148/+0x14C/+0x150; call the recovered defaults
 * and object setup; set +0x6C to 0x11 and +0x70 to 0x10. Select display zero,
 * enable display, choose graphics mode (1,0,1), set layer ordering, enable sub
 * BG0, configure DISP3DCNT and clear/fog registers, expand +0x154 to RGB555 for
 * the 3D clear-color helper, and initialize the two vectors at +0x98. Reset the
 * graphics value, set scene flags, initialize embedded +0x24 from descriptor
 * entries +0x20/+0x24, and return state. Allocation, file, scene, and graphics
 * effects are delegated. Confirmed direct I/O addresses are 0x04001000,
 * 0x04000060, 0x04000540, and 0x04000580.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov010_021fcebc(void *state)
{
    FSFile file;
    s32 i;
    void *manager = data_020f4e14;
    void *allocation;

    Scene_Init(state);
    SceneInputBase_Init((u8 *)state + 0x24);
    FIELD(const void *, state, 0) = data_ov010_021fec34;
    FIELD(const void *, state, 0x24) = data_ov010_021fec68;
    GraphicsResourceSetVariant_Init((u8 *)state + 0x7c);
    Graphics3DSceneState_Init((u8 *)state + 0x98);
    func_02092364((u8 *)state + 0x180);
    func_020923a4((u8 *)state + 0x180);
    FIELD(s32, state, 0x74) = 0;
    GraphicsSpriteRenderer_ClearTextBuffer(manager);
    for (i = 0; i < 2; i++) {
        s32 length;
        void *buffer;
        CheckedFS_InitFile(&file);
        if (!CheckedFS_OpenFile(&file, data_ov010_021fea50[i])) continue;
        length = CheckedFS_GetFileLength(&file);
        buffer = Heap_AllocCore(length, data_ov010_021fec7c, 4, gHeapContext);
        FIELD(void *, state, 0x90 + i * 4) = buffer;
        FIELD(s32, state, 0x134 + i * 4) = length >> 5;
        FIELD(s32, state, 0x13c + i * 4) = 0;
        if (CheckedFS_ReadFile(&file, buffer, length) != length) continue;
        func_020b4554(buffer, length);
        CheckedFS_CloseFile(&file);
    }
    func_02075238(manager);
    GraphicsSpriteRenderer_HideAllSprites(manager);
    allocation = Heap_Alloc(0x624, data_ov010_021fec84, 4, gHeapContext);
    if (allocation) Graphics3DResourceOwner_Init(allocation, 4, 2);
    FIELD(void *, state, 0x78) = allocation;
    FIELD(void *, state, 0x88) = Graphics3DResourceOwner_CreateManager();
    FIELD(s32, state, 0x8c) = 0;
    allocation = Heap_Alloc(0x18, data_ov010_021fec8c, 4, gHeapContext);
    if (allocation)
        Graphics3DResourceBinding_Init(allocation, data_020f4e18,
                      FIELD(void *, state, 0x78), 0x611a, 0x611b);
    FIELD(void *, state, 0x130) = allocation;
    FIELD(s32, state, 0x144) = 0;
    FIELD(s32, state, 0x148) = 0;
    FIELD(s32, state, 0x14c) = 0;
    FIELD(s32, state, 0x150) = 0;
    FIELD(s32, state, 0x12c) = 0;
    func_ov010_021fd39c(state);
    func_ov010_021fd45c(state);
    FIELD(s32, state, 0x6c) = 0x11;
    func_ov010_021fce00(0);
    GX_DispOn();
    GX_SetGraphicsMode(1, 0, 1);
    func_02092638(0, 1, 2, 3);
    FIELD(s32, state, 0x70) = 0x10;
    *(volatile u32 *)0x04001000 |= 0x10000;
    func_ov010_021fce1c(0);
    *(volatile u16 *)0x04000060 &= 0xcfef;
    func_ov010_021fce40(1);
    *(volatile u32 *)0x04000540 = 2;
    {
        s32 v = FIELD(s32, state, 0x154);
        func_020b0300((u16)(v | v << 5 | v << 10), 31, 0x7fff, 63, 0);
    }
    *(volatile u32 *)0x04000580 = 0xbfff0000;
    FIELD(s32, state, 0x98) = 1;
    func_ov010_021fce7c((u8 *)state + 0x98, 0, 0, 0x2000);
    func_ov010_021fce84((u8 *)state + 0x98, 0, 0, 0);
    TitlePalette_SetSubBackdrop(0);
    Scene_SetFlags03(state);
    func_ov010_021fce94((u8 *)state + 0x24,
                         (s32)data_ov010_021fea38[8],
                         (s32)data_ov010_021fea38[9] - 0x48, 0);
    return state;
}
