#include "tingle/types.h"

/* Overlay 27 scene construction, resource loading, and child population. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov027_021feeb4[];
extern const u8 data_ov027_021fef24[];
extern const u8 data_ov027_021fef2c[];
extern const u8 data_ov027_021fef34[];
extern const u8 data_ov027_021fef3c[];
extern const s32 data_ov027_021feb54[];
extern const s32 data_ov027_021fea04[];
extern const s32 data_ov027_021fe928[];
extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void func_02091e28(void *);
extern void func_020720c0(void *);
extern void Graphics3DSceneState_Init(void *);
extern void func_02092364(void *);
extern void func_ov043_0220b740(void *);
extern void func_02091b6c(void *);
extern void G3X_Init(void);
extern void func_020923a4(void *);
extern void func_02075238(void *);
extern void GraphicsSpriteRenderer_HideAllSprites(void *);
extern void func_020ae6dc(void);
extern void *Graphics3DResourceOwner_Init(void *, s32, s32);
extern void *Graphics3DResourceOwner_CreateManager(void);
extern void func_020720e8(void *, void *, s32, s32, s32);
extern void Graphics3DResourceOwner_PrepareResources(void *, void *);
extern void *func_02094ad4(void *);
extern void func_02095274(void *, void *);
extern void func_02094bbc(void *, s32, s32, s32);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *, void *);
extern void func_ov027_021fd9c8(void *);
extern void *func_ov027_021fce04(void *, s32);
extern void *func_ov027_021fd1c8(void *, void *, const s32 *, s32);
extern void func_ov027_021fd180(void *, s32, s32, s32, s32, s32, s32);
extern void func_ov027_021fe0ac(void *);
extern void func_ov027_021fda08(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the overlay scene and returns `scene`. It initializes base and
 * graphics/SDK state, three resource handles at +0x5C/+0x68/+0x74, the child
 * containers at +0x120..+0x150, timer/controller state, and resource IDs
 * 0x6030..0x6038. It allocates controller children +0x118/+0x11C and resource
 * owner +0x114. The 58 records at 0x021FEB54 are sorted by descending word-2
 * key before 0xB0-byte animated children are allocated into +0x130; 28 records
 * at 0x021FEA04 configure sprites obtained from resource +0x68. Finally it
 * initializes scene flags/counters and copies the pair at 0x021FE928 through
 * the compact state helper. Heap allocations use heap 4 and preserve null on
 * failure; G3X_Init resets the Nintendo DS 3D engine.
 */
extern "C" void *func_ov027_021fda30(void *scene)
{
    func_02091e28(scene);
    FIELD(const void *, scene, 0) = data_ov027_021feeb4;
    func_020720c0((u8 *)scene + 0x5c);
    func_020720c0((u8 *)scene + 0x68);
    func_020720c0((u8 *)scene + 0x74);
    Graphics3DSceneState_Init((u8 *)scene + 0x80);
    func_ov027_021fd9c8((u8 *)scene + 0x120);
    func_ov027_021fd9c8((u8 *)scene + 0x130);
    func_ov027_021fd9c8((u8 *)scene + 0x140);
    func_ov027_021fd9c8((u8 *)scene + 0x150);
    func_02092364((u8 *)scene + 0x164);
    func_ov043_0220b740((u8 *)scene + 0x198);
    FIELD(s32, scene, 0x5bc) = 0;
    func_02091b6c((u8 *)scene + 0x5c4);
    G3X_Init();
    FIELD(s32, scene, 0x50) = 0;
    func_020923a4((u8 *)scene + 0x164);
    func_02075238(data_020f4e14);
    GraphicsSpriteRenderer_HideAllSprites(data_020f4e14);
    func_02075238(gDebugFont);
    GraphicsSpriteRenderer_HideAllSprites(gDebugFont);
    func_020ae6dc();

    void *group = Heap_Alloc(0x624, data_ov027_021fef24, 4, gHeapContext);
    if (group)
        group = Graphics3DResourceOwner_Init(group, 4, 2);
    FIELD(void *, scene, 0x54) = group;
    FIELD(void *, scene, 0x58) = Graphics3DResourceOwner_CreateManager();

    func_020720e8((u8 *)scene + 0x5c, data_020f4e18,
                   0x6030, 0x6031, 0x6032);
    Graphics3DResourceOwner_PrepareResources(group, (u8 *)scene + 0x5c);
    func_020720e8((u8 *)scene + 0x68, data_020f4e18,
                   0x6036, 0x6037, 0x6038);
    Graphics3DResourceOwner_PrepareResources(group, (u8 *)scene + 0x68);
    func_020720e8((u8 *)scene + 0x74, data_020f4e18,
                   0x6033, 0x6034, 0x6035);
    Graphics3DResourceOwner_PrepareResources(group, (u8 *)scene + 0x74);

    void *child = Heap_Alloc(0x9c, data_ov027_021fef2c, 4, gHeapContext);
    if (child)
        child = func_02094ad4(child);
    FIELD(void *, scene, 0x118) = child;
    func_02095274((u8 *)scene + 0x120, child);
    child = Heap_Alloc(0x9c, data_ov027_021fef2c, 4, gHeapContext);
    if (child)
        child = func_02094ad4(child);
    FIELD(void *, scene, 0x11c) = child;
    func_02095274((u8 *)scene + 0x120, child);

    child = Heap_Alloc(0xa0, data_ov027_021fef34, 4, gHeapContext);
    if (child)
        child = func_ov027_021fce04(child, (s32)group);
    FIELD(void *, scene, 0x114) = child;
    func_02095274((u8 *)scene + 0x120, child);
    func_02094bbc(FIELD(void *, scene, 0x118), 0, -0x600, 0x3000);
    func_02094bbc(FIELD(void *, scene, 0x11c), 0, -0x600, 0);

    s32 order[58];
    for (s32 i = 0; i < 58; ++i)
        order[i] = i;
    for (s32 i = 0; i < 57; ++i) {
        for (s32 j = i + 1; j < 58; ++j) {
            if (data_ov027_021feb54[order[i] * 3 + 2] <
                data_ov027_021feb54[order[j] * 3 + 2]) {
                s32 swap = order[i];
                order[i] = order[j];
                order[j] = swap;
            }
        }
    }
    for (s32 i = 0; i < 58; ++i) {
        void *resource = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0x58),
                                       (u8 *)scene + 0x5c);
        void *entry = Heap_Alloc(0xb0, data_ov027_021fef3c, 4,
                                 gHeapContext);
        if (entry)
            entry = func_ov027_021fd1c8(
                entry, resource, data_ov027_021feb54 + order[i] * 3, i);
        func_02095274((u8 *)scene + 0x130, entry);
    }

    for (s32 i = 0; i < 28; ++i) {
        void *sprite = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0x58),
                                     (u8 *)scene + 0x68);
        const s32 *entry = data_ov027_021fea04 + i * 3;
        func_ov027_021fd180(sprite, entry[0], entry[1], entry[2], 0, 0x11,
                            0);
    }

    FIELD(s32, scene, 0x5bc) = 0;
    FIELD(s32, scene, 0x160) = 0;
    FIELD(s32, scene, 0x5c0) = 0x20000;
    func_ov027_021fe0ac(scene);
    FIELD(u32, scene, 0x20) |= 0x400;
    func_ov027_021fda08(scene, data_ov027_021fe928[0],
                         data_ov027_021fe928[1]);
    return scene;
}
