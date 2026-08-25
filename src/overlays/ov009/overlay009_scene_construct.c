#include "tingle/checked_fs.h"
#include "tingle/graphics_resources.h"
#include "tingle/types.h"

/*
 * Overlay 9 scene construction. This recovered constructor initializes scene
 * members, loads six files, and configures both Nintendo DS display engines.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_ov009_021fee8c[];
extern const void *data_ov009_021feec0[];
extern const void *data_ov009_021feb80[];
extern const char *data_ov009_021feba8[6];
extern const char data_ov009_021feed4[];
extern void *data_020f4e14;
extern void *data_020f4e18;
extern u8 gHeapContext[];

extern void Scene_Init(void *state);
extern void Scene_SetFlags03(void *state);
extern void SceneInputBase_Init(void *member);
extern void AnimationResourceState_InitEmbedded(void *member);
extern void GraphicsBankStateSnapshot_Init(void *member);
extern void func_020923a4(void *member);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *manager);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *manager);
extern void *Heap_AllocCore(s32 size, const char *tag, s32 alignment,
                          void *heapContext);
extern void func_020b4554(void *address, s32 size);
extern void func_ov009_021fd294(void *state);
extern void func_ov009_021fd360(void *state);
extern void func_ov009_021fce00(u32 select);
extern void func_ov009_021fce1c(u32, u32, u32, u32);
extern void func_ov009_021fce48(u32, u32, u32, u32);
extern void func_ov009_021fce74(void *, s32, s32, s32);
extern void GX_DispOn(void);
extern void GX_SetGraphicsMode(s32 displayMode, s32 bgMode, s32 bg0As);
extern void GX_SetBankForBG(s32 bank);
extern void TitleDisplay_SetMainBgPriorities(s32 first, s32 second, s32 third, s32 fourth);
extern void func_020b44e8(void);
extern void TitlePalette_SetMainBackdrop(u16 color);
extern void TitlePalette_SetSubBackdrop(s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the scene base and embedded members at +0x24, +0x78, and +0x13C;
 * install descriptors data_ov009_021fee8c/data_ov009_021feec0 and clear +0x74.
 * Notify the manager referenced by data_020f4e14, then try each of the six
 * confirmed paths in data_ov009_021feba8. For each opened file, allocate its
 * exact length with tag "KKAV", alignment 4 and gHeapContext, store the buffer
 * at +0x8C+index*4, length/32 at +0xA8+index*4, and zero at +0xC0+index*4;
 * read it, flush/process it through func_020b4554 only on a full read, and then
 * close it. Failed opens or short reads leave the fields established so far.
 *
 * Retain GraphicsSpriteGroupOwner_CreateGroup's result at +0x84; clear +0x88, +0xD8/+0xDC/+0xE0,
 * +0xEC and +0x11C; set +0xA4 to one; and invoke the recovered setup helpers.
 * Select display routing zero, enable the main display, configure main display
 * mode/bank/BG2/BG3, write negative +0xF0/+0xF4 scroll values to both main BG2
 * and BG3 offsets, and configure layer ordering. Enable sub BG0 in display mode
 * one, load graphics IDs 0xC003..0xC005, apply resource values 3/0, expand the
 * 5-bit +0xE8 value to RGB555, reset the associated graphics value, and set
 * scene flags. Finally initialize +0x24 fields from descriptor entries +0x10
 * and +0x14-0x48, destroy the temporary resources, and return state.
 *
 * File, allocation, cache, graphics, and scene effects are delegated. Direct
 * hardware effects target DISPCNT at 0x04000000/0x04001000 and BG2/BG3 scroll
 * registers at 0x04000018..0x0400001F.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov009_021fce9c(void *state)
{
    GraphicsResourceSet resources;
    FSFile file;
    s32 index;
    void *manager;
    volatile u32 *mainDispcnt = (volatile u32 *)0x04000000;
    volatile u32 *subDispcnt = (volatile u32 *)0x04001000;
    volatile u32 *mainBgScroll = (volatile u32 *)0x04000018;

    Scene_Init(state);
    SceneInputBase_Init((u8 *)state + 0x24);
    FIELD(const void *, state, 0x00) = data_ov009_021fee8c;
    FIELD(const void *, state, 0x24) = data_ov009_021feec0;
    AnimationResourceState_InitEmbedded((u8 *)state + 0x78);
    GraphicsBankStateSnapshot_Init((u8 *)state + 0x13c);
    func_020923a4((u8 *)state + 0x13c);
    FIELD(s32, state, 0x74) = 0;
    manager = data_020f4e14;
    GraphicsSpriteRenderer_ClearTextBuffer(manager);

    for (index = 0; index < 6; index++) {
        s32 length;
        void *buffer;

        CheckedFS_InitFile(&file);
        if (!CheckedFS_OpenFile(&file, data_ov009_021feba8[index])) {
            continue;
        }
        length = CheckedFS_GetFileLength(&file);
        buffer = Heap_AllocCore(length, data_ov009_021feed4, 4, gHeapContext);
        FIELD(void *, state, 0x8c + index * 4) = buffer;
        FIELD(s32, state, 0xa8 + index * 4) = length >> 5;
        FIELD(s32, state, 0xc0 + index * 4) = 0;
        if (CheckedFS_ReadFile(&file, buffer, length) != length) {
            continue;
        }
        func_020b4554(buffer, length);
        CheckedFS_CloseFile(&file);
    }

    FIELD(void *, state, 0x84) = GraphicsSpriteGroupOwner_CreateGroup(manager);
    FIELD(s32, state, 0x88) = 0;
    FIELD(s32, state, 0xa4) = 1;
    FIELD(s32, state, 0xd8) = 0;
    FIELD(s32, state, 0xdc) = 0;
    FIELD(s32, state, 0xe0) = 0;
    FIELD(s32, state, 0xec) = 0;
    FIELD(s32, state, 0x11c) = 0;
    func_ov009_021fd294(state);
    func_ov009_021fd360(state);

    func_ov009_021fce00(0);
    GX_DispOn();
    *mainDispcnt = (*mainDispcnt & ~0x1f00) | 0x1800;
    GX_SetGraphicsMode(1, 0, 0);
    GX_SetBankForBG(2);
    *mainDispcnt &= ~0x38000000;
    func_ov009_021fce1c(0, 0, 0x1e, 0);
    func_ov009_021fce48(0, 0, 0x1e, 0);
    mainBgScroll[0] = ((u32)-FIELD(s32, state, 0xf0) & 0x1ff) |
                      (((u32)-FIELD(s32, state, 0xf4) & 0x1ff) << 16);
    mainBgScroll[1] = mainBgScroll[0];
    TitleDisplay_SetMainBgPriorities(0, 1, 2, 3);

    *subDispcnt |= 0x10000;
    *subDispcnt = (*subDispcnt & ~0x1f00) | 0x1000;
    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources, data_020f4e18, 0xc003, 0xc004,
                             0xc005);
    func_020b44e8();
    func_02072048(&resources, 3, 0);
    {
        u32 component = FIELD(u32, state, 0xe8);
        TitlePalette_SetMainBackdrop((u16)(component | (component << 5) | (component << 10)));
    }
    TitlePalette_SetSubBackdrop(0);
    Scene_SetFlags03(state);
    func_ov009_021fce74((u8 *)state + 0x24,
                         (s32)data_ov009_021feb80[4],
                         (s32)data_ov009_021feb80[5] - 0x48, 0);
    GraphicsResourceSet_Destroy(&resources);
    return state;
}
