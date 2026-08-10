#include "tingle/types.h"

/*
 * Overlay 40 scene construction. This recovered constructor builds the large
 * scene's embedded vector and record arrays, configures main-engine graphics,
 * loads two resource triples, creates its fixed presentation groups, clears
 * runtime state, and invokes the two remaining scene initialization passes.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*Overlay040Place)(void *, void *, s32, s32, s32, s32);

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov040_021fce00(void *scene);
extern void func_ov040_021fce40(s32, s32, s32, s32, s32);
extern void func_ov040_021fce74(s32, s32, s32, s32);
extern void func_ov040_021fd724(void *record);
extern void func_ov040_021fd740(void *record);
extern void func_ov040_021fd8ac(void *scene);
extern void func_ov040_021fe1b0(void *scene);
extern void *func_ov040_02202ea4(void *owner, s32, s32, s32);
extern void func_02004fe0(void *vector);
extern void func_02005058(void *vector);
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_020050a4(void *destination, const void *source);
extern void __construct_array(void *array, u32 count, u32 stride,
                              void (*constructor)(void *),
                              void (*destructor)(void *));
extern void GraphicsResourceSet_Init(void *set);
extern void GraphicsResourceSet_Load(void *set, void *archive, s32 first,
                                     s32 second, s32 third);
extern void GraphicsResourceSet_Destroy(void *set);
extern void GraphicsResourceSet_ReleaseHandles(void *set);
extern void func_020b44e8(void);
extern void *func_0207043c(void);
extern void *func_02070874(void *resource);
extern void *func_02070888(void *resource);
extern void func_020708c4(void *resource);
extern void func_020b1924(void *destination, s32 slot, void *source);
extern void func_020b1784(void *destination, s32 slot, void *source);
extern void func_020b2058(void *destination, s32 slot, void *source);
extern void func_02070f80(void *resource, s32 value);
extern void func_02070e0c(void *resource, s32 first, s32 second);
extern void *func_0209a208(void *scene, s32 first, s32 second, s32 third,
                           void *argument, s32 value);
extern void GX_SetGraphicsMode(s32 mode);
extern void GX_SetBankForBG(s32 bank);
extern void func_020ae9a4(void);
extern void func_020ae90c(void);
extern void func_020ae284(s32, s32, s32);
extern void func_020af478(s32 bank);
extern void *data_020f4e18;
extern void **data_021052fc;
extern const void *data_ov040_022042a8;
#ifdef __cplusplus
}
#endif

static void *scene_create(void *scene, s32 first, s32 second, s32 third,
                          void *argument, s32 x, s32 y, s32 orientation)
{
    void *object = func_0209a208(scene, first, second, third, argument, 2);
    Overlay040Place place = *(Overlay040Place *)FIELD(void *, scene, 0);
    place(scene, object, x, y, 0, orientation);
    return object;
}

/*
 * Construct scene using retained owner `argument` and presentation factory
 * argument `resourceArgument`. The embedded arrays have confirmed offsets,
 * counts, and strides matching the destructor in func_ov040_021fd744. Main BG
 * control registers at 0x04000008 are configured for BG1/BG3. Returns scene;
 * allocation/resource helpers, display hardware, presentations, and global
 * graphics managers receive observable changes.
 */
extern "C" void *func_ov040_021fcebc(void *scene, void *argument,
                                      void *resourceArgument)
{
    u32 temporarySet[3];
    s32 vector[4];
    volatile u32 *display = (volatile u32 *)0x04000000;

    func_ov040_021fce00(scene);
    FIELD(const void *, scene, 0) = data_ov040_022042a8;
    func_02004fe0((u8 *)scene + 0x4c);
    func_02004fe0((u8 *)scene + 0x5c);
    func_02004fe0((u8 *)scene + 0x74);
    __construct_array((u8 *)scene + 0x84, 0x1e, 0x10, func_02004fe0, func_02005058);
    __construct_array((u8 *)scene + 0x660, 0x1e, 0x10, func_02004fe0, func_02005058);
    __construct_array((u8 *)scene + 0x864, 4, 0x0c, func_ov040_021fd724, func_ov040_021fd740);
    __construct_array((u8 *)scene + 0x894, 4, 0x0c, func_ov040_021fd724, func_ov040_021fd740);
    __construct_array((u8 *)scene + 0x8c4, 0x1e, 0x10, func_02004fe0, func_02005058);
    func_ov040_021fd724((u8 *)scene + 0xac8);
    func_ov040_021fd724((u8 *)scene + 0xb14);
    __construct_array((u8 *)scene + 0xb54, 2, 0x10, func_02004fe0, func_02005058);
    func_ov040_02202ea4((u8 *)scene + 0xbd8, 0, 0, 0);
    GraphicsResourceSet_Init((u8 *)scene + 0x1b7c);
    FIELD(void *, scene, 0x48) = argument;
    FIELD(void *, scene, 0xbd8) = argument;

    func_020ae9a4();
    func_020ae90c();
    func_020ae284(1, 0, 1);
    *display = (*display & ~0x1f00) | 0x1b00;
    GX_SetBankForBG(0x10);
    func_ov040_021fce40(0, 0, 0x1e, 2, 0);
    *(volatile u16 *)0x0400000a = (*(volatile u16 *)0x0400000a & (u16)~3) | 2;
    *(volatile u32 *)0x04000014 = 0;
    func_ov040_021fce74(1, 0, 0x1c, 0);
    *(volatile u16 *)0x0400000c &= (u16)~3;
    *(volatile u32 *)0x0400001c = 0;

    GraphicsResourceSet_Init(temporarySet);
    GraphicsResourceSet_Load(temporarySet, data_020f4e18, 0xa07e, 0xa07f, 0xa080);
    func_020b44e8();
    func_020b1924(FIELD(void *, (void *)temporarySet[0], 0x24), 0, func_0207043c());
    func_020b44e8();
    func_020b2058(func_02070874((void *)temporarySet[1]), 0x80,
                  func_02070888((void *)temporarySet[1]));
    func_020b44e8();
    func_02070f80((void *)temporarySet[2], 4);
    func_020b44e8();
    func_02070e0c((void *)temporarySet[2], 1, 0);
    func_020b44e8();
    GraphicsResourceSet_ReleaseHandles(temporarySet);

    GraphicsResourceSet_Load((u8 *)scene + 0x1b7c, data_020f4e18, 0xa081, 0xa082, 0xa083);
    func_020b44e8();
    func_020b1784(FIELD(void *, FIELD(void *, scene, 0x1b7c), 0x24), 0, func_0207043c());
    func_020b44e8();
    func_020b2058(func_02070874(FIELD(void *, scene, 0x1b80)), 0,
                  func_02070888(FIELD(void *, scene, 0x1b80)));
    func_020b44e8();
    func_02070e0c(FIELD(void *, scene, 0x1b84), 3, 0);
    func_020b44e8();

    FIELD(s32, scene, 0x30) = 0;
    FIELD(s32, scene, 0x34) = 0x6e;
    FIELD(s32, scene, 0x38) = 0;
    FIELD(u16, scene, 0x3c) = 0x100;
    FIELD(u16, scene, 0x3e) = 0x100;
    FIELD(u16, scene, 0x40) = 0;

    FIELD(void *, scene, 0xb44) = scene_create(scene, 0x100f, 0x1001, 0x1010,
                                                resourceArgument, 0x80000, 0xc0000, 0x1d);
    FIELD(u16, FIELD(void *, scene, 0xb44), 0x42) &= (u16)~4;
    FIELD(s32, FIELD(void *, scene, 0xb44), 0x44) = -50;
    for (s32 index = 3; index > 0; index--) {
        void *object = scene_create(scene, 0x1013, 0x1001, 0x1014,
                                    resourceArgument, 0x80000, 0xc0000, 0x10);
        FIELD(void *, scene, 0xb44 + index * 4) = object;
        FIELD(u16, object, 0x42) |= 4;
    }

    for (s32 offset = 0xb78; offset <= 0xb9c; offset += 4) FIELD(s32, scene, offset) = 0;
    FIELD(s32, scene, 0xb38) = 0;
    FIELD(s32, scene, 0xaa8) = 0;
    FIELD(s32, scene, 0xaac) = 0;
    FIELD(s32, scene, 0xab0) = 0;
    FIELD(s32, scene, 0xab8) = 0;
    FIELD(s32, scene, 0xabc) = 0;

    FIELD(void *, scene, 0xba0) = scene_create(scene, 0x13c0, 0x13c1, 0x13c2,
                                                resourceArgument, 0x40000, 0x5c000, 0);
    FIELD(u16, FIELD(void *, scene, 0xba0), 0x42) |= 4;
    FIELD(s32, FIELD(void *, scene, 0xba0), 0x44) = -1000;
    FIELD(s32, scene, 0xbac) = 0;
    FIELD(s32, scene, 0xba4) = 0;
    FIELD(s32, scene, 0xb20) = 0;
    FIELD(s32, scene, 0xb24) = 0;
    FIELD(s32, scene, 0xb28) = 0x70;
    FIELD(s32, scene, 0xb2c) = 0x70;
    FIELD(s32, scene, 0xb30) = 0;
    FIELD(s32, scene, 0xb34) = 0;
    FIELD(s32, scene, 0xb3c) = 0;
    FIELD(s32, scene, 0xb40) = 0;
    FIELD(s32, scene, 0xbb4) = 0;
    FIELD(s32, scene, 0xbb8) = 0;
    FIELD(s32, scene, 0xbb0) = 0;
    FIELD(s32, scene, 0xbc0) = 0;

    for (s32 index = 2; index >= 0; index--) {
        void *object = scene_create(scene, 0x1378, 0x1379, 0x137a,
                                    resourceArgument, 0x186000, 0x60000, 0);
        FIELD(void *, scene, 0xbc4 + index * 4) = object;
        FIELD(s32, object, 0x44) = index;
        FIELD(u16, object, 0x42) |= 4;
    }
    FIELD(s32, scene, 0xbd0) = 0;
    func_0200500c(vector, 0, 0x6e000, 0);
    func_020050a4((u8 *)scene + 0x74, vector);
    func_02005058(vector);

    FIELD(s32, scene, 0xadc) = 0;
    FIELD(s32, scene, 0xae0) = 0;
    FIELD(s32, scene, 0xae4) = 0;
    FIELD(s32, scene, 0x860) = 0;
    FIELD(void *, scene, 0xac0) = scene_create(scene, 0x1655, 0x1656, 0x1657,
                                                resourceArgument, 0x80000, 0xc0000, 0);
    FIELD(u16, FIELD(void *, scene, 0xac0), 0x42) |= 4;
    FIELD(void *, scene, 0xac4) = scene_create(scene, 0x1655, 0x1656, 0x1657,
                                                resourceArgument, 0x80000, 0xc0000, 1);
    FIELD(u16, FIELD(void *, FIELD(void *, scene, 0xac4), 0x0c), 0x24) &= (u16)~2;
    FIELD(u16, FIELD(void *, scene, 0xac4), 0x42) |= 4;
    FIELD(s32, FIELD(void *, scene, 0xac4), 0x44) = 0x96;
    FIELD(u16, FIELD(void *, scene, 0xac4), 0x3c) = 0x100;
    FIELD(u16, FIELD(void *, scene, 0xac4), 0x3e) = 0x100;
    FIELD(s32, scene, 0xad4) = 0;
    FIELD(s32, scene, 0xad8) = 0;
    for (s32 index = 3; index >= 0; index--) {
        void *object = scene_create(scene, 0x1652, 0x1653, 0x1654,
                                    resourceArgument, 0x80000, 0xc0000, 0);
        FIELD(void *, scene, 0xae8 + index * 4) = object;
        FIELD(u16, object, 0x42) |= 4;
        FIELD(s32, scene, 0xaf8 + index * 4) = 0;
    }
    FIELD(s32, scene, 0xb08) = 0;
    FIELD(s32, scene, 0x70) = 0;
    FIELD(s32, scene, 0xaa4) = 0;

    func_ov040_021fd8ac(scene);
    FIELD(s32, scene, 0x848) = 0x1000;
    if (FIELD(void *, *data_021052fc, 0x2ea8) == 0) {
        FIELD(void *, scene, 0xb10) = 0;
    } else {
        void *descriptor = FIELD(void *, FIELD(void *, *data_021052fc, 0x2ea8), 0x29c);
        void *object = scene_create(scene, FIELD(u16, descriptor, 2),
                                    FIELD(u16, descriptor, 4), FIELD(u16, descriptor, 6),
                                    resourceArgument, 0x80000, 0x61000, 0x13);
        FIELD(void *, scene, 0xb10) = object;
        FIELD(u16, FIELD(void *, object, 0x0c), 0x24) &= (u16)~2;
        FIELD(u16, object, 0x42) &= (u16)~4;
        FIELD(u8, FIELD(void *, object, 0x0c), 0x3a) = 2;
        func_020708c4(FIELD(void *, object, 0x14));
    }
    func_ov040_021fe1b0(scene);
    GraphicsResourceSet_Destroy(temporarySet);
    return scene;
}
