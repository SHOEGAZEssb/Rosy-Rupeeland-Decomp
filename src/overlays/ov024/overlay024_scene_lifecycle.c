#include "tingle/types.h"

/* Overlay 24 scene construction and paired caller-owned/heap-owned teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern const u32 data_ov024_021fe2e8[];
extern const u8 data_ov024_021fe338[];
extern const u8 data_ov024_021fe34c[];
extern const u8 data_ov024_021fe354[];
extern const u8 data_ov024_021fe35c[];
extern void *gDebugFont;
extern void *gGameWork;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void __construct_array(void *, s32, s32, void *);
extern void __destroy_arr(void *, s32, s32, void *);
extern void *func_02027fe8(void *, void *);
extern void func_020280d8(void *);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void func_02091b6c(void *);
extern void func_02091b98(void *, s32);
extern void func_02091e28(void *);
extern void func_020922f0(void *, s32);
extern void func_02093a88(void *);
extern void func_02093adc(void *, s32, s32, s32);
extern void func_020957bc(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02095940(void *);
extern void func_ov005_021fb86c(void *, void *, s32);
extern void func_ov005_021fbb78(void *);
extern void func_ov005_021fbd74(void *, s32);
extern void func_ov024_021fce00(void *);
extern void func_ov024_021fce04(void *, void *, void *);
extern void func_ov024_021fd2f8(void *);
extern void func_ov046_0220b7bc(void *, void *, s32);
extern void func_ov046_0220ba80(void *);
extern void func_ov046_0220bffc(void *, s32, s32, s32);
extern void func_ov046_0220c478(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the 0x2EC-byte overlay-24 scene in caller-provided storage.
 * It initializes resource owners, three sprite controllers, selection and
 * transition objects; imports two signed selections from game-work offsets
 * +0x12E/+0x1CE and clamps values above ten; creates overlay-5, overlay-46,
 * and debug-font children; enables scene flag 0x400; and installs the initial
 * callback pair. Heap, graphics, sound/scene, and controller state change.
 * The initialized scene pointer is returned.
 */
extern "C" void *func_ov024_021fce2c(void *scene)
{
    func_02091e28(scene);
    FIELD(const void *, scene, 0) = data_ov024_021fe338;
    func_02071ea4((u8 *)scene + 0x64);
    func_02071ea4((u8 *)scene + 0x70);
    func_020957bc((u8 *)scene + 0x80);
    __construct_array((u8 *)scene + 0x12c, 2, 0xac,
                      (void *)func_020957bc);
    func_02093a88((u8 *)scene + 0x284);
    func_02091b6c((u8 *)scene + 0x2c8);

    FIELD(void *, scene, 0x2e8) = 0;
    FIELD(s32, scene, 0x54) = 0;
    FIELD(s32, scene, 0x58) = FIELD(s16, gGameWork, 0x12e);
    FIELD(s32, scene, 0x5c) = FIELD(s16, gGameWork, 0x1ce);
    if (FIELD(s32, scene, 0x58) >= 11) FIELD(s32, scene, 0x58) = 10;
    if (FIELD(s32, scene, 0x5c) >= 11) FIELD(s32, scene, 0x5c) = 10;
    FIELD(s32, scene, 0x60) = FIELD(s32, scene, 0x5c);
    func_ov024_021fd2f8(scene);

    func_02071ee0((u8 *)scene + 0x64, data_020f4e18, 0x38, 1, 0x39);
    func_02071ee0((u8 *)scene + 0x70, data_020f4e18, 3, 1, 4);
    FIELD(void *, scene, 0x7c) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);

    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0x7c),
                                  (u8 *)scene + 0x64, 1);
    func_020957f0((u8 *)scene + 0x80, sprite, 6, 0, 0);
    func_02095820((u8 *)scene + 0x80, 234, 175);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0x7c),
                           (u8 *)scene + 0x70, 1);
    func_020957f0((u8 *)scene + 0x12c, sprite, 10, 0, 0);
    func_02095820((u8 *)scene + 0x12c, 16, 16);
    func_02095940((u8 *)scene + 0x12c);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0x7c),
                           (u8 *)scene + 0x70, 1);
    func_020957f0((u8 *)scene + 0x1d8, sprite, 12, 0, 0);
    func_02095820((u8 *)scene + 0x1d8, 16, 176);
    func_02095940((u8 *)scene + 0x1d8);

    void *menu = Heap_Alloc(0x15c, data_ov024_021fe34c, 4, gHeapContext);
    if (menu != 0) func_ov005_021fb86c(menu, data_020f4e14, 1);
    FIELD(void *, scene, 0x2bc) = menu;
    func_02093adc((u8 *)scene + 0x284, 0, FIELD(s32, scene, 0x60), 0);
    FIELD(s32, scene, 0x2b0) = 12;
    func_ov005_021fbd74(menu, FIELD(s32, scene, 0x290));

    void *panel = Heap_Alloc(0x118, data_ov024_021fe354, 4, gHeapContext);
    if (panel != 0) func_ov046_0220b7bc(panel, gDebugFont, 0);
    FIELD(void *, scene, 0x2c0) = panel;
    func_020922f0(scene, 0x3e);
    func_ov046_0220bffc(panel, FIELD(s32, scene, 0x290), 0, 0);
    func_ov046_0220c478(panel, FIELD(s32, scene, 0x290));

    void *debug = Heap_Alloc(0x3c, data_ov024_021fe35c, 4, gHeapContext);
    if (debug != 0) func_02027fe8(debug, gDebugFont);
    FIELD(void *, scene, 0x2c4) = debug;
    func_02091b98((u8 *)scene + 0x2c8, 120);
    FIELD(s32, scene, 0x2e4) = 1;
    FIELD(u32, scene, 0x20) |= 0x400;
    func_ov024_021fce04(scene, (void *)data_ov024_021fe2e8[0],
                       (void *)data_ov024_021fe2e8[1]);
    return scene;
}

static void cleanup_scene(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov024_021fe338;
    FIELD(u32, scene, 0x20) &= ~0x400u;

    void *object = FIELD(void *, scene, 0x2c4);
    if (object != 0) { func_020280d8(object); Heap_Free(object); }
    object = FIELD(void *, scene, 0x2c0);
    if (object != 0) { func_ov046_0220ba80(object); Heap_Free(object); }
    object = FIELD(void *, scene, 0x2bc);
    if (object != 0) { func_ov005_021fbb78(object); Heap_Free(object); }

    GraphicsSpriteGroup_Destroy(FIELD(void *, scene, 0x7c));
    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    *(volatile u32 *)0x04000000 &= ~0xe000u;
    __destroy_arr((u8 *)scene + 0x12c, 2, 0xac,
                  (void *)func_ov024_021fce00);
    func_ov024_021fce00((u8 *)scene + 0x80);
    func_02071eb8((u8 *)scene + 0x70);
    func_02071eb8((u8 *)scene + 0x64);
}

/*
 * Releases all scene-owned heap children, the cloned sprite owner, controller
 * array, and both resource descriptors; disables flag 0x400 and clears both
 * engine blend registers plus main-engine display mode bits. The scene storage
 * remains caller-owned and its original pointer is returned.
 */
extern "C" void *func_ov024_021fd138(void *scene)
{
    cleanup_scene(scene);
    return scene;
}

/*
 * Deleting-destructor variant of func_ov024_021FD138. It performs identical
 * heap/graphics/MMIO teardown, frees the scene allocation, and returns the
 * now-invalid original pointer value.
 */
extern "C" void *func_ov024_021fd214(void *scene)
{
    cleanup_scene(scene);
    Heap_Free(scene);
    return scene;
}
