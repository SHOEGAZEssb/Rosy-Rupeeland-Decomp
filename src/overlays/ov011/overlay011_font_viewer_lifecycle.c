#include <stddef.h>

#include "tingle/checked_fs.h"
#include "tingle/graphics_resources.h"
#include "tingle/types.h"

/*
 * Overlay 11 font-resource viewer lifecycle. The scene loads one fixed index
 * file, uploads a fixed graphics triplet, and owns the file buffer and its
 * embedded debug renderer until non-deleting or deleting teardown.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const void *data_ov011_021fe5c8[];
extern const void *data_ov011_021fe5fc[];
extern const s32 data_ov011_021fe3b0[];
extern const char data_ov011_021fe6c0[];
extern const char data_ov011_021fe6dc[];
extern void *gDebugFont;
extern void *data_020f4e14;
extern void *data_020f4e18;
extern u8 gHeapContext[];

extern void Scene_Init(void *state);
extern void Scene_Destroy(void *state);
extern void SceneInputBase_Init(void *member);
extern void GraphicsBankStateSnapshot_Init(void *renderer);
extern void func_020923a4(void *renderer);
extern void GraphicsBankStateSnapshot_Destroy(void *renderer);
extern void func_02092418(void *renderer);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *renderer);
extern void *Heap_AllocCore(s32 size, const char *tag, s32 alignment,
                            void *heapContext);
extern void Heap_FreeCore(void *allocation);
extern void Heap_Free(void *allocation);
extern void func_020b4554(void *bytes, s32 size);
extern s32 func_020bf1f8(s32 numerator, s32 denominator);
extern void func_020b44e8(void);
extern void func_020b198c(const void *source, u32 destination, u32 size);
extern void func_020b1ff0(const void *source, u32 destination, u32 size);
extern void func_020b1ccc(const void *source, u32 destination, u32 size);
extern s32 func_0207043c(void *resource);
extern void *GraphicsBgResourceData_GetDecoded(void *resource);
extern s32 func_02070888(void *resource);
extern void DebugText_BeginFrame(void);
extern void GX_DispOn(void);
extern void GXS_SetGraphicsMode(s32 mode);
extern void GX_SetBankForSubBG(s32 bank);
extern void func_020aea7c(s32 value);
extern void TitleDisplay_ResetSubBgScroll(void);
extern void TitleDisplay_SetSubBgPriorities(s32 a, s32 b, s32 c, s32 d);
extern void TitlePalette_SetMainBackdrop(u16 color);
extern void TitlePalette_SetSubBackdrop(u16 color);
extern void func_ov011_021fce00(u32 select);
extern void func_ov011_021fce1c(u32 size, u32 depth, u32 screen,
                                u32 character, u32 overflow);
extern void func_ov011_021fce50(void *member, s32 x, s32 y, s32 mode);
extern void func_ov011_021fdea4(void *state);
extern s32 func_ov011_021fdae0(void *resource);

/* Return the decoded 16-bit image byte count from width and height metadata. */
s32 func_ov011_021fdae0(void *resource)
{
    u8 *metadata = FIELD(u8 *, resource, 0x20);
    return FIELD(s32, metadata, 0x0c) * FIELD(s32, metadata, 0x10) * 2;
}

/*
 * Construct the font viewer, load its 24-byte records, upload fixed graphics
 * resources C003/C004/C005, initialize display state, render the selected
 * record, and seed the embedded member from descriptor words 2/3. Return the
 * caller-owned scene pointer; file and graphics APIs own their usual effects.
 */
void *func_ov011_021fdb6c(void *state)
{
    FSFile file;
    GraphicsResourceSet resources;
    s32 length = 0;
    void *bytes = NULL;
    volatile u32 *mainDispcnt = (volatile u32 *)0x04000000;
    volatile u32 *subDispcnt = (volatile u32 *)0x04001000;

    Scene_Init(state);
    SceneInputBase_Init((u8 *)state + 0x24);
    FIELD(const void *, state, 0x00) = data_ov011_021fe5c8;
    FIELD(const void *, state, 0x24) = data_ov011_021fe5fc;
    GraphicsBankStateSnapshot_Init((u8 *)state + 0x80);
    FIELD(s32, state, 0x74) = 0;
    FIELD(s32, state, 0xc0) = 14;
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);

    CheckedFS_InitFile(&file);
    if (CheckedFS_OpenFile(&file, data_ov011_021fe6c0)) {
        length = CheckedFS_GetFileLength(&file);
        bytes = Heap_AllocCore(length, data_ov011_021fe6dc, 4,
                               gHeapContext);
        FIELD(void *, state, 0x7c) = bytes;
        if (CheckedFS_ReadFile(&file, bytes, length) == length) {
            func_020b4554(bytes, length);
            CheckedFS_CloseFile(&file);
        }
    }
    FIELD(s32, state, 0xb4) = func_020bf1f8(length, 0x18);
    FIELD(s32, state, 0xb8) = 0;
    FIELD(s32, state, 0xbc) = 0;

    func_ov011_021fce00(0);
    func_020923a4((u8 *)state + 0x80);
    GX_DispOn();
    *mainDispcnt = (*mainDispcnt & ~0x1f00u) | 0x1000u;
    *subDispcnt |= 0x10000u;
    *subDispcnt = (*subDispcnt & ~0x1f00u) | 0x1000u;
    GXS_SetGraphicsMode(0);
    GX_SetBankForSubBG(4);
    func_020aea7c(0x80);
    func_ov011_021fce1c(0, 0, 0x10, 0, 0);
    TitleDisplay_ResetSubBgScroll();
    TitleDisplay_SetSubBgPriorities(0, 1, 2, 3);

    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources, data_020f4e18, 0xc003, 0xc004,
                             0xc005);
    func_020b44e8();
    func_020b198c(FIELD(void *, resources.resource0, 0x24), 0,
                  (u32)func_0207043c(resources.resource0));
    func_020b1ff0(GraphicsBgResourceData_GetDecoded(resources.resource1), 0,
                  (u32)func_02070888(resources.resource1));
    func_020b1ccc(FIELD(void *, resources.resource2, 0x24), 0,
                  (u32)func_ov011_021fdae0(resources.resource2));
    TitlePalette_SetMainBackdrop(0x4210);
    TitlePalette_SetSubBackdrop(0x4210);
    func_ov011_021fdea4(state);
    func_ov011_021fce50((u8 *)state + 0x24, data_ov011_021fe3b0[2],
                        data_ov011_021fe3b0[3] - 0x48, 0);
    GraphicsResourceSet_Destroy(&resources);
    return state;
}

/*
 * Destroy the font viewer without freeing the scene. Restore descriptors,
 * disable display selection, release the renderer and owned file buffer, and
 * return the same pointer.
 */
void *func_ov011_021fdde0(void *state)
{
    FIELD(const void *, state, 0x00) = data_ov011_021fe5c8;
    FIELD(const void *, state, 0x24) = data_ov011_021fe5fc;
    func_ov011_021fce00(0);
    func_02092418((u8 *)state + 0x80);
    Heap_FreeCore(FIELD(void *, state, 0x7c));
    DebugText_BeginFrame();
    GraphicsBankStateSnapshot_Destroy((u8 *)state + 0x80);
    Scene_Destroy(state);
    return state;
}

/* Destroy the font viewer, free the scene allocation, and return its old ABI pointer. */
void *func_ov011_021fde34(void *state)
{
    func_ov011_021fdde0(state);
    Heap_Free(state);
    return state;
}
