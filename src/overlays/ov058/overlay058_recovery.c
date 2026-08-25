#include "tingle/field_effect.h"
#include "tingle/types.h"

/*
 * Overlay 58 owns a dual-screen text-and-background presentation. It loads
 * four graphics resource sets, maintains mirrored 256x192 buffers, advances
 * two sprite groups, pages encoded text, and owns the complete scene lifetime.
 */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u16 data_ov058_0220f524[];
extern const u8 data_ov058_0220fcc4[], data_ov058_0220fce4[];
extern const u8 data_ov058_0220fcec[], data_ov058_0220fcf4[];
extern const u8 data_ov058_0220fcfc[], data_ov058_0220fd04[];
extern const u16 *data_ov058_0220fd0c;
extern void *data_020f4e14[], *data_020f4e18[], *gDebugFont[];
extern void *gGamePhaseRuntime, *gGameWork;
extern u8 gHeapContext[], gMainBgPaletteBuffer[], gSubBgPaletteBuffer[];

#ifdef __cplusplus
extern "C" {
#endif


extern void *RuntimePresentationManager_AppendSecondListEffect(void *, void *);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void GraphicsSpriteState_SetFrameIndex(void *, s32);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern u16 *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern void GraphicsSpriteRenderer_ConfigureTextGridPriority(void *, s32, s32);
extern void GraphicsSpriteRenderer_SetTextGridPosition(void *, s32, s32);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern s32 GraphicsSpriteRenderer_MeasureText(void *, const u16 *, s32, s32);
extern s32 GraphicsSpriteRenderer_DrawCharacter(void *, u32, s32, s32, s32);
extern s32 Presentation_InterpolateQuadraticPulse(s32, s32, s32, s32);
extern void TitleCharacterResourceCollection_Init(void *);
extern void TitleCharacterResourceCollection_Destroy(void *);
extern void TitleCharacterResourceCollection_Append(void *, s32);
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Destroy(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Apply(void *, s32, s32);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void GraphicsBgMapResource_SetPaletteBank(void *, s32);
extern u32 GraphicsCharacterResource_GetUploadSize(void *);
extern void func_020b44e8(void);
extern void func_020b57d4(s32, void *, u32);
extern void func_020b5880(void *, const void *, u32);
extern void func_020b1924(const void *, u32, u32);
extern void func_020b18bc(const void *, u32, u32);
extern void func_020b1c64(const void *, u32, u32);
extern void func_020b1bfc(const void *, u32, u32);
extern void PaletteBuffer_Write(void *, const void *, u32, u32);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void *Heap_AllocAlternateEntry(u32, const void *, s32, void *);
extern void *Heap_AllocCore(u32, const void *, s32, void *);
extern void Heap_Free(void *);
extern void Heap_FreeCore(void *);
extern void MIi_CpuClearFast(u32, void *, u32);
extern void __construct_array(void *, u32, u32, void (*)(void *),
                              void (*)(void *));
extern void __destroy_arr(void *, u32, u32, void (*)(void *));
extern s32 GameWork_TestFlag(void *, s32);
extern void GameWork_SetFlag(void *, s32);
extern void GameWork_ClearFlag(void *, s32);
extern u32 genrand_int32(void);
extern u64 func_020bf1f8(u32, u32);
extern s32 func_020befec(s32, s32);
extern void *OverlayManager_GetGlobal(void);
extern void OverlayManager_UnloadOverlay(void *, s32);
#ifdef __cplusplus
}
#endif

void *func_ov058_0220e400(void *, void *, void *);
void *func_ov058_0220e5fc(void *);
void func_ov058_0220f11c(void *);
void func_ov058_0220f228(void *, s32);
void func_ov058_0220f308(void *);

/* Construct the paired animation resources and their main/sub sprite states. */
void *func_ov058_0220e400(void *object, void *mainGroup, void *subGroup)
{
    AnimationResourceState_InitEmbedded(object);
    AnimationResourceState_InitEmbedded((u8 *)object + 0xc);
    FIELD(void *, object, 0x18) = mainGroup;
    FIELD(void *, object, 0x1c) = subGroup;
    FIELD(s32, object, 0x30) = 0;
    AnimationResourceState_ReplaceResources(object, data_020f4e18[0], 0x223f, 0x2240, 0x2241);
    AnimationResourceState_ReplaceResources((u8 *)object + 0xc, data_020f4e18[0],
                  0x1000, 0x1001, 0x1002);
    FIELD(void *, object, 0x20) =
        GraphicsSpriteGroup_CreateStateFromSource(mainGroup, object, 2);
    GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, object, 0x20), 0, 0x80, 0xe, 2, 0x100, 0x20);
    FIELD(void *, object, 0x24) =
        GraphicsSpriteGroup_CreateStateFromSource(subGroup, object, 2);
    GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, object, 0x24), 0, 0x80, 0xe, 2, 0x100, 0x20);
    if (!GameWork_TestFlag(gGameWork, 0xcd)) {
        FIELD(void *, object, 0x28) = 0;
        FIELD(void *, object, 0x2c) = 0;
    } else {
        FIELD(void *, object, 0x28) =
            GraphicsSpriteGroup_CreateStateFromSource(mainGroup,
                                                       (u8 *)object + 0xc, 2);
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, object, 0x28), 0x11, 0x80, 2, 2, 0, 2);
        FIELD(void *, object, 0x2c) =
            GraphicsSpriteGroup_CreateStateFromSource(subGroup,
                                                       (u8 *)object + 0xc, 2);
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, object, 0x2c), 0x11, 0x80, 2, 2, 0, 2);
    }
    return object;
}

/* Periodically choose a different random frame for both primary sprites. */
void func_ov058_0220e598(void *object)
{
    s32 frame;
    if (--FIELD(s32, object, 0x30) >= 0) return;
    FIELD(s32, object, 0x30) = (s32)(genrand_int32() & 3) + 6;
    do {
        frame = (s32)(func_020bf1f8(genrand_int32(), 3) >> 32);
    } while (frame == FIELD(u8, FIELD(void *, object, 0x20), 0x39));
    GraphicsSpriteState_SetFrameIndex(FIELD(void *, object, 0x20), frame);
    GraphicsSpriteState_SetFrameIndex(FIELD(void *, object, 0x24), frame);
}

/* Allocate and clear the 256x192 32-bit mirrored display buffer. */
void *func_ov058_0220e5fc(void *bufferOwner)
{
    void *buffer = Heap_AllocAlternateEntry(0xc000, data_ov058_0220fce4,
                                 4, gHeapContext);
    FIELD(void *, bufferOwner, 0) = buffer;
    MIi_CpuClearFast(0, buffer, 0xc000);
    return bufferOwner;
}

/* Upload the lower half of the scene buffer to the main display surface. */
void func_ov058_0220e63c(void *bufferOwner)
{
    func_020b5880(FIELD(void *, data_020f4e14[0], 0),
                  (u8 *)FIELD(void *, bufferOwner, 0) + 0x6000, 0x6000);
}

/* Snapshot the main display surface into the lower half of the scene buffer. */
void func_ov058_0220e664(void *bufferOwner)
{
    func_020b5880((u8 *)FIELD(void *, bufferOwner, 0) + 0x6000,
                  FIELD(void *, data_020f4e14[0], 0), 0x6000);
}

/* Snapshot the sub display surface into the upper half of the scene buffer. */
void func_ov058_0220e68c(void *bufferOwner)
{
    func_020b5880(FIELD(void *, bufferOwner, 0),
                  FIELD(void *, gDebugFont[0], 0), 0x6000);
}

static void Overlay058_ShiftEightPixels(u32 *pixels, u32 incoming)
{
    s32 i;
    for (i = 0; i < 7; ++i) pixels[i] = pixels[i + 1];
    pixels[7] = incoming;
}

/* Shift both 256x192 buffers left, feeding rows across their paired regions. */
void func_ov058_0220e6b0(void *bufferOwner)
{
    u32 *pixels = FIELD(u32 *, bufferOwner, 0);
    s32 outer, block, row;
    for (outer = 0; outer < 5; ++outer) {
        for (block = 0; block < 4; ++block) {
            for (row = 0; row < 7; ++row) {
                Overlay058_ShiftEightPixels(pixels, pixels[0x100 / 4]);
                pixels += 8;
            }
            for (row = 0; row < 8; ++row) {
                Overlay058_ShiftEightPixels(pixels, pixels[0x1900 / 4]);
                pixels += 8;
            }
        }
    }
    for (block = 0; block < 4; ++block) {
        for (row = 0; row < 7; ++row) {
            Overlay058_ShiftEightPixels(pixels, pixels[0x100 / 4]);
            pixels += 8;
        }
        for (row = 0; row < 8; ++row) {
            Overlay058_ShiftEightPixels(pixels, 0);
            pixels += 8;
        }
    }
}

/* Construct the scene, graphics owners, text resources, buffers, and slots. */
void *func_ov058_0220e840(void *scene, void *owner)
{
    s32 i;
    u16 *palette;
    (void)owner;
    FieldEffect_Init(scene);
    FIELD(const void *, scene, 0) = data_ov058_0220fcc4;
    __construct_array((u8 *)scene + 0x18, 4, 0xc,
                      GraphicsResourceSet_Init, GraphicsResourceSet_Destroy);
    FIELD(s32, scene, 0x50) = 0;
    TitleCharacterResourceCollection_Init((u8 *)scene + 0x84);
    TitleCharacterResourceCollection_Append((u8 *)scene + 0x84, 0x7001);
    TitleCharacterResourceCollection_Append((u8 *)scene + 0x84, 0x7009);
    FIELD(const u16 *, scene, 0xa8) = data_ov058_0220fd0c;
    GraphicsSpriteRenderer_ConfigureTextGridPriority(data_020f4e14[0], 2, 0x10);
    GraphicsSpriteRenderer_ConfigureTextGridPriority(gDebugFont[0], 2, 0x10);
    FIELD(void *, scene, 0xc) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14[0]);
    FIELD(void *, scene, 0x10) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont[0]);
    FIELD(void *, scene, 0x14) = Heap_Alloc(0x34, data_ov058_0220fcec, 4, gHeapContext);
    if (FIELD(void *, scene, 0x14))
        func_ov058_0220e400(FIELD(void *, scene, 0x14),
                            FIELD(void *, scene, 0xc), FIELD(void *, scene, 0x10));
    FIELD(void *, scene, 0x80) = Heap_Alloc(4, data_ov058_0220fcf4, 4, gHeapContext);
    if (FIELD(void *, scene, 0x80)) func_ov058_0220e5fc(FIELD(void *, scene, 0x80));
    FIELD(s32, scene, 0x48) = 0;
    FIELD(s32, scene, 0x4c) = 0;
    for (i = 0; i < 5; ++i) {
        FIELD(s32, scene, 0x58 + i * 4) = -1;
        FIELD(s32, scene, 0x6c + i * 4) = 0;
    }
    FIELD(s32, scene, 0x58) = 0;
    FIELD(s32, scene, 0x5c) = 1;
    FIELD(s32, scene, 0x60) = 2;
    FIELD(s32, scene, 0x54) = 3;
    FIELD(s32, scene, 0x6c) = 0;
    FIELD(s32, scene, 0x70) = 0xc;
    FIELD(s32, scene, 0x74) = 0x18;
    FIELD(s32, scene, 0xac) = 0;
    palette = GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14[0]);
    palette[2] = 0x0c85;
    palette[3] = 0x25d3;
    palette = GraphicsSpriteRenderer_GetObjectPaletteAddress(gDebugFont[0]);
    palette[2] = 0x25d3;
    palette[3] = 0x0c85;
    func_ov058_0220f11c(scene);
    ((void (**)(void *, s32))FIELD(void *, scene, 0))[5](scene, 0);
    GameWork_ClearFlag(gGameWork, 0x3d3);
    GameWork_ClearFlag(gGameWork, 0x3d4);
    FIELD(u32, scene, 4) |= 2;
    return scene;
}

static void Overlay058_DestroySceneMembers(void *scene)
{
    void *object;
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14[0]);
    GraphicsSpriteRenderer_QueuePaletteUploads(gDebugFont[0]);
    GraphicsSpriteRenderer_ConfigureTextGridPriority(data_020f4e14[0], 0, 0x10);
    GraphicsSpriteRenderer_ConfigureTextGridPriority(gDebugFont[0], 0, 0x10);
    object = FIELD(void *, scene, 0x14);
    if (object) {
        AnimationResourceState_Destroy((u8 *)object + 0xc);
        AnimationResourceState_Destroy(object);
        Heap_Free(object);
    }
    object = FIELD(void *, scene, 0x80);
    if (object) {
        Heap_Free(FIELD(void *, object, 0));
        Heap_Free(object);
    }
    GraphicsSpriteGroup_Destroy(FIELD(void *, scene, 0xc));
    GraphicsSpriteGroup_Destroy(FIELD(void *, scene, 0x10));
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 1);
    TitleCharacterResourceCollection_Destroy((u8 *)scene + 0x84);
    __destroy_arr((u8 *)scene + 0x18, 4, 0xc, GraphicsResourceSet_Destroy);
    FieldEffect_DestroyBase(scene);
}

/* Destroy every scene member but retain the scene allocation for its owner. */
void *func_ov058_0220ea68(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov058_0220fcc4;
    Overlay058_DestroySceneMembers(scene);
    return scene;
}

/* Destroy every scene member and free the scene allocation. */
void *func_ov058_0220eb50(void *scene)
{
    func_ov058_0220ea68(scene);
    Heap_Free(scene);
    return scene;
}

/* Apply the scrolling origin to the main and sub affine background registers. */
void func_ov058_0220ec40(void *scene)
{
    u32 x = (u32)(FIELD(s32, scene, 0x48) - 0x20) & 0x1ff;
    u32 mainY = (u32)(FIELD(s32, scene, 0x4c) - 0x1e) & 0x1ff;
    u32 subY = (u32)(FIELD(s32, scene, 0x4c) - 0xde) & 0x1ff;
    *(volatile u32 *)0x04000014 = x | (mainY << 16);
    *(volatile u32 *)0x04001014 = x | (subY << 16);
}

/* Configure both display engines for the overlay's affine background layout. */
void func_ov058_0220eca4(void *scene)
{
    volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
    volatile u32 *subDisplay = (volatile u32 *)0x04001000;
    volatile u16 *mainBg1 = (volatile u16 *)0x0400000a;
    volatile u16 *subBg1 = (volatile u16 *)0x0400100a;
    volatile u16 *subBg2 = (volatile u16 *)0x0400100c;
    u32 mode = (*mainDisplay & 0x1f00) >> 8;
    *mainBg1 = (u16)((*mainBg1 & 0x43) | 0x9a10);
    *mainDisplay = (*mainDisplay & ~0x1f00u) | ((mode | 2) << 8);
    *mainBg1 = (u16)((*mainBg1 & ~3u) | 2);
    *subBg1 = (u16)((*subBg1 & 0x43) | 0x9a10);
    *subBg2 = (u16)((*subBg2 & 0x43) | 0x1e80);
    *subDisplay = (*subDisplay & ~0x1f00u) | 0x1600;
    *subBg1 = (u16)((*subBg1 & ~3u) | 2);
    *subBg2 = (u16)((*subBg2 & ~3u) | 3);
    func_ov058_0220f308(scene);
}

/* Lay out and draw the next encoded text page, then advance its source cursor. */
void func_ov058_0220ed64(void *scene)
{
    s32 widths[16];
    u16 lineBuffer[32];
    const u16 *text = FIELD(const u16 *, scene, 0xa8);
    s32 sourceIndex = 1, lineLength = 0, lineIndex = 0;
    s32 x, y;
    GraphicsSpriteRenderer_SetFontResource(data_020f4e14[0], FIELD(void *, scene, 0x88));
    for (;;) {
        u16 character = text[sourceIndex++];
        if (character == 0xee00 || character == 0xee01) {
            lineBuffer[lineLength] = 0;
            widths[lineIndex] = GraphicsSpriteRenderer_MeasureText(
                data_020f4e14[0], lineBuffer, 4, 1);
            if (character == 0xee01) break;
            ++lineIndex;
            lineLength = 0;
        } else lineBuffer[lineLength++] = character;
    }
    y = 0x86 - (lineIndex * 0xc) / 2;
    x = 0x80 - widths[0] / 2;
    sourceIndex = 1;
    lineIndex = 0;
    for (;;) {
        s32 advance;
        u16 character = text[sourceIndex++];
        if (character == 0xee00) {
            ++lineIndex;
            y += 0xc;
            x = 0x80 - widths[lineIndex] / 2;
            continue;
        }
        if (character == 0xee01) {
            FIELD(const u16 *, scene, 0xa8) = text + sourceIndex;
            return;
        }
        advance = GraphicsSpriteRenderer_DrawCharacter(
            data_020f4e14[0], character, x,
            y + Presentation_InterpolateQuadraticPulse(0, 6, 0x80, x - 0x40), 2);
        if (advance > 0) x += advance + 1;
        else if (advance == 0) x += 5;
    }
}

/* Queue one text-window resource slot and arm its delayed page draw. */
void func_ov058_0220eef0(void *scene, s32 offset)
{
    s32 slot = FIELD(s32, scene, 0x54);
    s32 type;
    if (FIELD(u16, FIELD(const u16 *, scene, 0xa8), 0) == 0) {
        GameWork_SetFlag(gGameWork, 0x3d4);
        FIELD(const u16 *, scene, 0xa8) = data_ov058_0220fd0c;
    }
    type = FIELD(u16, FIELD(const u16 *, scene, 0xa8), 0) == 0xee04 ? 3 : 2;
    FIELD(s32, scene, 0x58 + slot * 4) = type;
    FIELD(s32, scene, 0x6c + slot * 4) = offset;
    FIELD(s32, scene, 0x54) = slot + 1;
    func_ov058_0220f228(scene, slot);
    if (FIELD(s32, scene, 0x54) >= 5) FIELD(s32, scene, 0x54) = 0;
    FIELD(s32, scene, 0xac) = 0x20;
}

/* Advance scrolling, page timing, sprites, and both text-grid origins. */
s32 func_ov058_0220efa4(void *scene)
{
    if (GameWork_TestFlag(gGameWork, 0x3d3) &&
        !GameWork_TestFlag(gGameWork, 0x3d4)) {
        s32 before, after;
        func_ov058_0220e63c(FIELD(void *, scene, 0x80));
        func_ov058_0220e6b0(FIELD(void *, scene, 0x80));
        func_ov058_0220e664(FIELD(void *, scene, 0x80));
        func_ov058_0220e68c(FIELD(void *, scene, 0x80));
        before = func_020befec(FIELD(s32, scene, 0x4c) / 32, 12);
        ++FIELD(s32, scene, 0x4c);
        after = func_020befec(FIELD(s32, scene, 0x4c) / 32, 12);
        if (before != after) {
            s32 offset = (after + 1) * 12;
            while (offset >= 0x40) offset -= 0x40;
            func_ov058_0220eef0(scene, offset);
        }
        if (FIELD(s32, scene, 0xac) && --FIELD(s32, scene, 0xac) == 0)
            func_ov058_0220ed64(scene);
    }
    func_ov058_0220e598(FIELD(void *, scene, 0x14));
    FIELD(s32, FIELD(void *, scene, 0xc), 0x18) = -FIELD(s32, scene, 0x48);
    FIELD(s32, FIELD(void *, scene, 0xc), 0x1c) = 0x60 - FIELD(s32, scene, 0x4c);
    FIELD(s32, FIELD(void *, scene, 0x10), 0x18) = -FIELD(s32, scene, 0x48);
    FIELD(s32, FIELD(void *, scene, 0x10), 0x1c) = 0x120 - FIELD(s32, scene, 0x4c);
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0xc));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0x10));
    GraphicsSpriteRenderer_SetTextGridPosition(data_020f4e14[0],
                                                -FIELD(s32, scene, 0x48), 0);
    GraphicsSpriteRenderer_SetTextGridPosition(gDebugFont[0],
                                                -FIELD(s32, scene, 0x48), 0);
    return 0;
}

/* Load four resource sets, tint their decoded palettes, and select map banks. */
void func_ov058_0220f11c(void *scene)
{
    s32 i;
    for (i = 0; i < 4; ++i) {
        void *set = (u8 *)scene + 0x18 + i * 0xc;
        void *map;
        u16 *colors;
        s32 colorCount, color;
        GraphicsResourceSet_Load(set, data_020f4e18[0],
            data_ov058_0220f524[i * 3], data_ov058_0220f524[i * 3 + 1],
            data_ov058_0220f524[i * 3 + 2]);
        map = FIELD(void *, set, 8);
        colors = FIELD(u16 *, map, 0x24);
        colorCount = FIELD(s32, FIELD(void *, map, 0x20), 0xc) *
                     FIELD(s32, FIELD(void *, map, 0x20), 0x10);
        for (color = 0; color < colorCount; ++color)
            colors[color] = (u16)((colors[color] & 0xfc00) |
                ((colors[color] & 0x03ff) + i * 0x100));
        GraphicsBgMapResource_SetPaletteBank(map, 15 - i);
        func_020b44e8();
    }
}

/* Copy one queued 12-row resource window to both engines, wrapping at row 64. */
void func_ov058_0220f228(void *scene, s32 slot)
{
    s32 type = FIELD(s32, scene, 0x58 + slot * 4);
    s32 offset, firstRows;
    u8 *source;
    if (type < 0) return;
    offset = FIELD(s32, scene, 0x6c + slot * 4);
    source = FIELD(u8 *, FIELD(void *, scene, 0x20 + type * 0xc), 0x24);
    if (offset <= 0x34) {
        func_020b1c64(source, (u32)offset << 6, 0x300);
        func_020b1bfc(source, (u32)offset << 6, 0x300);
        return;
    }
    firstRows = 0x40 - offset;
    func_020b1c64(source, (u32)offset << 6, (u32)firstRows << 6);
    func_020b1bfc(source, (u32)offset << 6, (u32)firstRows << 6);
    source += firstRows << 6;
    func_020b1c64(source, 0, (u32)(12 - firstRows) << 6);
    func_020b1bfc(source, 0, (u32)(12 - firstRows) << 6);
}

/* Initialize background graphics, upload four resource pairs, and publish palettes. */
void func_ov058_0220f308(void *scene)
{
    u8 temporary[12];
    void *clearBuffer;
    s32 i;
    GraphicsResourceSet_Init(temporary);
    GraphicsResourceSet_Load(temporary, data_020f4e18[0], 0xb09f, 0xb0a0, 0xb0a1);
    func_020b44e8();
    GraphicsResourceSet_Apply(temporary, 2, 0x4000);
    clearBuffer = Heap_AllocCore(0x1000, data_ov058_0220fcfc, 4, gHeapContext);
    func_020b57d4(0, clearBuffer, 0x1000);
    func_020b1c64(clearBuffer, 0, 0x1000);
    func_020b1bfc(clearBuffer, 0, 0x1000);
    Heap_FreeCore(clearBuffer);
    for (i = 0; i < 4; ++i) {
        void *set = (u8 *)scene + 0x18 + i * 0xc;
        void *graphics = FIELD(void *, set, 0);
        void *palette = FIELD(void *, set, 4);
        u32 destination = (u32)(15 - i) << 5;
        u32 offset = (u32)i * 0x2000;
        func_020b1924(FIELD(void *, graphics, 0x24), offset, GraphicsCharacterResource_GetUploadSize(graphics));
        func_020b18bc(FIELD(void *, graphics, 0x24), offset, GraphicsCharacterResource_GetUploadSize(graphics));
        PaletteBuffer_Write(gMainBgPaletteBuffer,
            GraphicsBgResourceData_GetDecoded(palette), destination, 0x20);
        PaletteBuffer_Write(gSubBgPaletteBuffer,
            GraphicsBgResourceData_GetDecoded(palette), destination, 0x20);
    }
    for (i = 0; i < 5; ++i) func_ov058_0220f228(scene, i);
    GraphicsResourceSet_Destroy(temporary);
}

/* Allocate, construct, register, and return the overlay scene. */
void *func_ov058_0220f484(void)
{
    void *scene = Heap_Alloc(0xb0, data_ov058_0220fd04, 4, gHeapContext);
    if (scene) scene = func_ov058_0220e840(scene, (u8 *)gGamePhaseRuntime + 0x2fbc);
    RuntimePresentationManager_AppendSecondListEffect((u8 *)gGamePhaseRuntime + 0x2f7c, scene);
    return scene;
}

/* Enable both sprite groups or release their indexed entries when disabled. */
void func_ov058_0220f4e8(void *scene, s32 enabled)
{
    if (enabled) {
        FIELD(s32, FIELD(void *, scene, 0xc), 0x20) = 1;
        FIELD(s32, FIELD(void *, scene, 0x10), 0x20) = 1;
    } else {
        GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, scene, 0xc));
        GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, scene, 0x10));
    }
}

/* Preserve the intentional scene vtable no-op callback. */
void func_ov058_0220f51c(void *scene) { (void)scene; }

/* Preserve the intentional secondary scene vtable no-op callback. */
void func_ov058_0220f520(void *scene) { (void)scene; }
