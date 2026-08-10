#include "tingle/types.h"

/* Overlay 26 scene/controller construction, resource loading, and effect population. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;
extern void *gHeapContext;
extern const s16 data_020c9670[];
extern const s32 data_020cdc1c[];
extern const s32 data_ov026_02204750[];
extern const u8 data_ov026_02204944[];
extern const u8 data_ov026_02204a70[];
extern const u8 data_ov026_02204a78[];
extern const u8 data_ov026_02204a80[];
extern const u8 data_ov026_02204a88[];
extern const u8 data_ov026_02204a90[];
extern const u8 data_ov026_02204a98[];
extern const u8 data_ov026_02204aa0[];
extern const u8 data_ov026_02204aa8[];
extern const u8 data_ov026_02204ab0[];
extern const u8 data_ov026_02204ab8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void G3X_Init(void);
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void *func_02071adc(void *, s32);
extern void func_020720c0(void *);
extern void func_020720e8(void *, void *, s32, s32, s32);
extern void GraphicsSpriteRenderer_HideAllSprites(void *);
extern void func_02075238(void *);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *, void *);
extern void *Graphics3DResourceOwner_Init(void *, s32, s32);
extern void *Graphics3DResourceOwner_CreateManager(void *);
extern void Graphics3DResourceOwner_PrepareResources(void *, void *);
extern void Graphics3DLightSet_Init(void *);
extern void Graphics3DSceneState_Init(void *);
extern void func_02091b6c(void *);
extern s32 func_0209189c(void *, s32, s32);
extern s32 func_020918f4(void *, s32);
extern void func_02091e28(void *);
extern void func_02092364(void *);
extern void func_020923a4(void *);
extern void *func_02094ad4(void *);
extern void func_020948d4(void *, s32);
extern void func_02094bbc(void *, s32, s32, s32);
extern void func_02095274(void *, void *);
extern void func_020ae6dc(void);
extern s32 func_020befec(s32, s32);
extern void func_ov043_0220b740(void *);
extern void *func_ov026_021fce54(void *, void *, s32, u16);
extern void *func_ov026_021fd030(void *, void *, s32);
extern void *func_ov026_021fd370(void *);
extern void *func_ov026_021fd5b0(void *, void *);
extern void *func_ov026_021fe680(void *);
extern void *func_ov026_021fe92c(void *, void *);
extern void *func_ov026_021fec6c(void *);
extern void *func_ov026_021fef9c(void *, void *);
extern void func_ov026_021ff7f0(void *);
extern void func_ov026_021ff830(void *, u32, s32, s32, s32, u8, u32);
extern void func_ov026_021ff878(void *, s32, s32);
extern void func_ov026_0220035c(void *, s32, s32, s32, s32);
extern void func_ov026_02200390(void *);
extern void func_ov026_02200d20(void *, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/* Allocates, constructs, and registers one polymorphic child in list +0x2F4. */
static void register_child(void *scene, s32 field_offset, u32 size,
                           const void *label, void *constructed)
{
    (void)size;
    (void)label;
    FIELD(void *, scene, field_offset) = constructed;
    func_02095274((u8 *)scene + 0x2f4, constructed);
}

/*
 * Constructs the main overlay-26 scene from `scene_id`, `range_start`, and
 * `range_end`. It initializes five resource descriptors, particle/object
 * managers, three embedded state records, display/debug helpers, and loads
 * resources 0x6023/26/29/2C/2F plus model resource 0x5000. It then allocates
 * and registers the composite effect and its companion render/effect objects,
 * creates 24 radial particles, 16 secondary particles, and one central record,
 * initializes camera/scale controls, and sets scene flag 0x400. Returns `scene`.
 * Exact allocation labels and numeric controls are retained because their SDK
 * meanings are not yet confirmed.
 */
extern "C" void *func_ov026_021ff8a0(void *scene, s32 scene_id,
                                      s32 range_start, s32 range_end)
{
    func_02091e28(scene);
    FIELD(const void *, scene, 0) = data_ov026_02204944;
    FIELD(s32, scene, 0x54) = scene_id;
    FIELD(s32, scene, 0x60) = range_start;
    FIELD(s32, scene, 0x64) = range_end;
    for (s32 off = 0x7c; off <= 0xac; off += 0xc)
        func_020720c0((u8 *)scene + off);
    Graphics3DLightSet_Init((u8 *)scene + 0x180);
    Graphics3DSceneState_Init((u8 *)scene + 0x1c0);
    Graphics3DSceneState_Init((u8 *)scene + 0x254);
    func_ov026_021ff7f0((u8 *)scene + 0x2f4);
    func_ov026_021ff7f0((u8 *)scene + 0x304);
    func_ov026_021ff7f0((u8 *)scene + 0x314);
    func_02092364((u8 *)scene + 0x328);
    func_ov043_0220b740((u8 *)scene + 0x370);
    FIELD(s32, scene, 0x7a4) = 0;
    func_02091b6c((u8 *)scene + 0x7a8);

    s32 variant = scene_id == 999 ? 0 : scene_id - 1;
    if (variant < 0 || variant > 9)
        variant = 0;
    FIELD(s32, scene, 0x58) = variant;
    FIELD(s32, scene, 0x5c) = range_end - range_start;
    G3X_Init();
    FIELD(s32, scene, 0x50) = 0;
    func_020923a4((u8 *)scene + 0x328);
    func_02075238(data_020f4e14);
    GraphicsSpriteRenderer_HideAllSprites(data_020f4e14);
    func_02075238(gDebugFont);
    GraphicsSpriteRenderer_HideAllSprites(gDebugFont);
    func_020ae6dc();

    void *manager = Heap_Alloc(0x624, data_ov026_02204a70, 4, gHeapContext);
    if (manager != 0)
        manager = Graphics3DResourceOwner_Init(manager, 4, 2);
    FIELD(void *, scene, 0x68) = manager;
    FIELD(void *, scene, 0x6c) = Graphics3DResourceOwner_CreateManager(manager);
    FIELD(void *, scene, 0x70) = Graphics3DResourceOwner_CreateManager(manager);
    FIELD(void *, scene, 0x74) = Graphics3DResourceOwner_CreateManager(manager);
    FIELD(void *, scene, 0x78) = Graphics3DResourceOwner_CreateManager(manager);

    static const s32 resource_ids[5] = {0x6029, 0x6026, 0x6023, 0x602f, 0x602c};
    for (s32 i = 0; i < 5; ++i) {
        void *descriptor = (u8 *)scene + 0x7c + i * 0xc;
        s32 id = resource_ids[i];
        func_020720e8(descriptor, data_020f4e18, id - 2, id - 1, id);
        Graphics3DResourceOwner_PrepareResources(manager, descriptor);
    }

    void *model_resource = func_02071adc(data_020f4e18, 0x5000);
    FIELD(void *, scene, 0x15c) = model_resource;
    for (s32 i = 0; i < 3; ++i) {
        void *child = Heap_Alloc(0x9c, data_ov026_02204a78, 4, gHeapContext);
        if (child != 0)
            child = func_02094ad4(child);
        register_child(scene, 0x2e8 + i * 4, 0x9c,
                       data_ov026_02204a78, child);
    }

    void *child = Heap_Alloc(0x140, data_ov026_02204a80, 4, gHeapContext);
    if (child != 0)
        child = func_ov026_021fef9c(child, manager);
    register_child(scene, 0x160, 0x140, data_ov026_02204a80, child);
    child = Heap_Alloc(0xbc, data_ov026_02204a88, 4, gHeapContext);
    if (child != 0)
        child = func_ov026_021fd030(child, manager, variant);
    register_child(scene, 0x164, 0xbc, data_ov026_02204a88, child);
    child = Heap_Alloc(0xb8, data_ov026_02204a90, 4, gHeapContext);
    if (child != 0)
        child = func_ov026_021fd370(child);
    register_child(scene, 0x168, 0xb8, data_ov026_02204a90, child);
    child = Heap_Alloc(0xc8, data_ov026_02204a98, 4, gHeapContext);
    if (child != 0)
        child = func_ov026_021fe680(child);
    register_child(scene, 0x16c, 0xc8, data_ov026_02204a98, child);
    child = Heap_Alloc(0xac, data_ov026_02204aa0, 4, gHeapContext);
    if (child != 0)
        child = func_ov026_021fe92c(child, manager);
    register_child(scene, 0x170, 0xac, data_ov026_02204aa0, child);
    child = Heap_Alloc(0xb0, data_ov026_02204aa8, 4, gHeapContext);
    if (child != 0)
        child = func_ov026_021fec6c(child);
    register_child(scene, 0x174, 0xb0, data_ov026_02204aa8, child);
    child = Heap_Alloc(0xb0, data_ov026_02204ab0, 4, gHeapContext);
    if (child != 0)
        child = func_ov026_021fce54(child, model_resource, 7, 0x7fff);
    register_child(scene, 0x178, 0xb0, data_ov026_02204ab0, child);
    func_020948d4((u8 *)child + 0x6c, 0x63d);
    child = Heap_Alloc(0xa4, data_ov026_02204ab8, 4, gHeapContext);
    if (child != 0)
        child = func_ov026_021fd5b0(child, manager);
    register_child(scene, 0x17c, 0xa4, data_ov026_02204ab8, child);

    func_ov026_02200d20(scene, 0x8000, 0x2000, 0);
    func_020948d4((u8 *)FIELD(void *, scene, 0x2e8) + 0x1c, 0x1000);
    func_02094bbc(FIELD(void *, scene, 0x2ec), 0, 0, 0);
    FIELD(s32, scene, 0x7a4) = 0;

    for (s32 i = 0; i < 24; ++i) {
        s32 radius = func_0209189c((u8 *)scene + 0x7a4, 0x4cd, 0x800);
        u32 angle = (u16)func_020befec(i << 16, 24);
        s32 index = (angle >> 4) & 0xfff;
        s32 x = (data_020c9670[index * 2 + 1] * radius + 0x800) >> 12;
        s32 z = (data_020c9670[index * 2] * radius + 0x800) >> 12;
        void *record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0x70),
                                     (u8 *)scene + 0x7c);
        FIELD(void *, scene, 0xf8 + i * 4) = record;
        func_ov026_021ff830(record, 0, x, 0xcd, z, 3, 0x40);
        FIELD(s32, record, 0x44) = 0x8000;
        FIELD(u8, record, 0x57) = 1;
    }

    for (s32 i = 0; i < 16; ++i) {
        u32 angle = (u32)func_020918f4((u8 *)scene + 0x7a4, 0x1000);
        s32 index = (angle >> 4) & 0xfff;
        s32 x = (data_020c9670[index * 2 + 1] * 0x800 + 0x800) >> 12;
        s32 z = (data_020c9670[index * 2] * 0x800 + 0x800) >> 12;
        void *record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0x74),
                                     (u8 *)scene + 0x88);
        FIELD(void *, scene, 0xb8 + i * 4) = record;
        func_ov026_021ff830(record, 0, z, i * 0x333 + 0x800,
                            x, (u8)(i + 4), 0x242);
        FIELD(s32, record, 0x34) = 0x2000;
        FIELD(s32, record, 0x38) = 0x2000;
        FIELD(s32, record, 0x44) = 0x8000;
    }

    void *central = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0x6c),
                                   (u8 *)scene + 0xac);
    FIELD(void *, scene, 0x158) = central;
    func_ov026_021ff830(central, 0, 0, 0, 0, 0x19, 0x44);
    FIELD(s32, scene, 0x324) = 0;
    FIELD(s32, scene, 0x36c) = 0x20;
    func_ov026_02200390(scene);
    func_ov026_0220035c(scene, data_020cdc1c[0], data_020cdc1c[1],
                        range_start, range_end);
    func_ov026_021ff878(scene, data_ov026_02204750[0],
                        data_ov026_02204750[1]);
    FIELD(u32, scene, 0x20) |= 0x400;
    return scene;
}
