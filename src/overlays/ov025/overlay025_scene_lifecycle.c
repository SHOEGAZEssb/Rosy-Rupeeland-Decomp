#include "tingle/types.h"

/* Overlay 25 main scene construction and caller-owned/heap-owned teardown paths. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern const s32 data_ov025_02202c9c[];
extern const s32 data_ov025_02202cb4[];
extern const u8 data_ov025_02202cf0[];
extern const u8 data_ov025_02202d68[];
extern const u32 data_ov025_02202ea8[];
extern const u8 data_ov025_02203318[];
extern const u8 data_ov025_02203370[];
extern const u8 data_ov025_02203384[];
extern const u8 data_ov025_0220338c[];
extern const u8 data_ov025_02203394[];
extern const u8 data_ov025_0220339c[];
extern const u8 data_ov025_022033a4[];
extern void *gDebugFont;
extern void *gGameWork;
extern void *gHeapContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void __construct_array(void *, s32, s32, void *);
extern void __destroy_arr(void *, s32, s32, void *);
extern u32 genrand_int32(void);
extern void GameWork_ClearFlag(void *, s32);
extern void func_0205974c(void *, s32);
extern void func_020597fc(void *, s32);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *func_02073ffc(void *, void *, s32);
extern void func_0207419c(void *);
extern void *func_020742cc(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void func_02075630(void *);
extern void func_02091b6c(void *);
extern void func_02091e28(void *);
extern void *func_02092cc0(void *, void *, void *);
extern void func_02092f88(void *, s32, void *);
extern void func_020926d8(void *);
extern void func_020926f8(void *);
extern void func_02092754(void *, s32);
extern void func_02092798(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void func_020929b0(void *);
extern void func_02094cf0(void *, const void *, s32);
extern void func_02095274(void *, void *);
extern void func_02095308(void *);
extern void *func_020953f4(void *, void *);
extern void func_020957bc(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02095940(void *);
extern void *func_ov025_021fdecc(void *);
extern void func_ov025_021fdec8(void *);
extern void *func_ov025_021ff21c(void *, void *);
extern void func_ov025_021ff23c(void *, s32, s32, s32, s32);
extern void func_ov025_021ff254(void *, void *, void *);
extern void func_ov025_021ff1c8(void *);
extern void func_ov025_021ff1dc(void *);
extern void func_ov025_021ffdfc(void *);
extern void func_ov025_02200014(void *);
extern void *func_ov094_02219568(void *, s32, s32);
extern void func_ov094_022196a4(void *);
#ifdef __cplusplus
}
#endif

static void virtual_destroy(void *object)
{
    if (object) {
        typedef void (*Destructor)(void *);
        ((Destructor)FIELD(void *, FIELD(void *, object, 0), 4))(object);
    }
}

static void setup_controller(void *scene, s32 offset, s32 animation,
                             s32 x, s32 y)
{
    void *sprite = func_02073ffc(FIELD(void *, scene, 0xb0),
                                  (u8 *)scene + 0x5c, 1);
    func_020957f0((u8 *)scene + offset, sprite, animation, 1, 16);
    func_02095820((u8 *)scene + offset, x, y);
    func_02095940((u8 *)scene + offset);
}

/*
 * Constructs the 0x63C-byte overlay-25 scene. It initializes seven resource
 * descriptors, six controller objects (three standalone plus a three-element
 * array), callback holder +0x4F8, touch/input and four transition objects,
 * seeds RNG +0x634, resets selection/owned-pointer fields, and configures both
 * display engines through recovered helpers. It loads all scene resource IDs,
 * creates shared/debug sprite owners and button sprites, allocates three
 * effects (+0x508/+0xDC/+0xE0), an overlay-94 object +0x5C0, and dialog +0x50C,
 * clears game flags 0x3D3/0x3D6, stops sound 0x16F, enables flag 0x400, and
 * installs initial callback pair +0x2EA8. Heap, RNG, input, graphics, game-work,
 * sound, and callback state change; the initialized scene pointer is returned.
 */
extern "C" void *func_ov025_021ff27c(void *scene)
{
    func_02091e28(scene);
    FIELD(const void *, scene, 0) = data_ov025_02203370;
    for (s32 offset = 0x5c; offset <= 0xa4; offset += 0xc)
        func_02071ea4((u8 *)scene + offset);
    func_020957bc((u8 *)scene + 0xf0);
    func_020957bc((u8 *)scene + 0x19c);
    func_020957bc((u8 *)scene + 0x248);
    __construct_array((u8 *)scene + 0x2f4, 3, 0xac,
                      (void *)func_020957bc);
    func_ov025_021ff1dc((u8 *)scene + 0x4f8);
    func_020926d8((u8 *)scene + 0x530);
    func_02092798((u8 *)scene + 0x574);
    func_020929b0((u8 *)scene + 0x5a0);
    func_02091b6c((u8 *)scene + 0x5c4);
    func_02091b6c((u8 *)scene + 0x5e0);
    func_02091b6c((u8 *)scene + 0x5fc);
    func_02091b6c((u8 *)scene + 0x618);
    FIELD(u32, scene, 0x634) = genrand_int32();
    FIELD(void *, scene, 0x598) = 0;
    FIELD(s32, scene, 0x54) = -1;
    FIELD(void *, scene, 0x5b8) = 0;
    FIELD(void *, scene, 0x5bc) = 0;
    FIELD(void *, scene, 0x638) = 0;
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    for (s32 id = 0x8032; id <= 0x8037; ++id)
        func_02092754((u8 *)scene + 0x530, id);
    func_ov025_021ffdfc(scene);
    func_ov025_02200014(scene);
    func_02092814((u8 *)scene + 0x574, 0x7001);
    func_02092814((u8 *)scene + 0x574, 0x7005);
    func_02092814((u8 *)scene + 0x574, 0x7007);

    func_02071ee0((u8 *)scene + 0x5c, data_020f4e18, 0x4f, 0x50, 0x51);
    func_02071ee0((u8 *)scene + 0x68, data_020f4e18, 0x52, 0x53, 0x54);
    func_02071ee0((u8 *)scene + 0x98, data_020f4e18, 0x1046, 0x1047, 0x1048);
    func_02071ee0((u8 *)scene + 0x74, data_020f4e18, 0x241b, 0x241c, 0x241d);
    func_02071ee0((u8 *)scene + 0x80, data_020f4e18, 0x2421, 0x2422, 0x2423);
    func_02071ee0((u8 *)scene + 0x8c, data_020f4e18, 0x2427, 0x2428, 0x2429);
    func_02071ee0((u8 *)scene + 0xa4, data_020f4e18, 0x242d, 0x242e, 0x242f);
    FIELD(void *, scene, 0xb0) = func_020742cc(data_020f4e14);
    FIELD(void *, scene, 0xb4) = func_020742cc(gDebugFont);
    FIELD(s32, FIELD(void *, scene, 0xb4), 0x18) = 0;
    FIELD(s32, FIELD(void *, scene, 0xb4), 0x1c) = 0x100;
    for (s32 i = 0; i < 3; ++i) FIELD(void *, scene, 0xe4 + i * 4) = 0;

    for (s32 i = 0; i < 3; ++i) {
        void *sprite = func_02073ffc(FIELD(void *, scene, 0xb0),
                                     (u8 *)scene + 0x5c, 1);
        func_020957f0((u8 *)scene + 0x2f4 + i * 0xac,
                      sprite, 0x20 + i * 2, 1, 16);
        func_02095820((u8 *)scene + 0x2f4 + i * 0xac, 0xd4, 0);
        func_02095940((u8 *)scene + 0x2f4 + i * 0xac);
    }
    FIELD(void *, scene, 0xbc) = func_02073ffc(FIELD(void *, scene, 0xb0),
                                                (u8 *)scene + 0x8c, 2);
    func_02073e48(FIELD(void *, scene, 0xbc), 0, 0x80, 0x60, 0, 0, 6);
    for (s32 i = 0; i < 6; ++i) {
        void *sprite = func_02073ffc(FIELD(void *, scene, 0xb4),
                                     (u8 *)scene + 0xa4, 2);
        FIELD(void *, scene, 0xc4 + i * 4) = sprite;
        func_02073e48(sprite, i, data_ov025_02202c9c[i],
                      data_ov025_02202cb4[i] - 0x100, 1, 0xf000, 2);
    }
    FIELD(void *, scene, 0xc0) = func_02073ffc(FIELD(void *, scene, 0xb4),
                                                (u8 *)scene + 0x98, 2);
    func_02073e48(FIELD(void *, scene, 0xc0), 8, 0x80, -0xa0, 1, 0, 6);
    setup_controller(scene, 0xf0, 0x2c, 0x94, 0xb3);
    setup_controller(scene, 0x19c, 0x26, 0xe4, 0xa0);
    setup_controller(scene, 0x248, 0x32, 0xe0, 0xb3);

    void *effect = Heap_Alloc(0xfc, data_ov025_02203384, 4, gHeapContext);
    if (effect) effect = func_ov025_021fdecc(effect);
    FIELD(void *, scene, 0x508) = effect;
    func_02095274((u8 *)scene + 0x4f8, effect);

    void *sprite = func_02073ffc(FIELD(void *, scene, 0xb4),
                                  (u8 *)scene + 0x74, 2);
    func_02073e48(sprite, 0, 0, 0, 1, 0x4000, 2);
    effect = Heap_Alloc(0xa0, data_ov025_0220338c, 4, gHeapContext);
    if (effect) effect = func_ov025_021ff21c(effect, sprite);
    FIELD(void *, scene, 0xdc) = effect;
    func_02095274((u8 *)scene + 0x4f8, effect);
    func_02094cf0(effect, data_ov025_02202d68, 1);

    sprite = func_02073ffc(FIELD(void *, scene, 0xb4),
                            (u8 *)scene + 0x80, 2);
    func_02073e48(sprite, 0, 0x80, 0xb0, 1, 0x4000, 2);
    effect = Heap_Alloc(0xa0, data_ov025_02203394, 4, gHeapContext);
    if (effect) effect = func_020953f4(effect, sprite);
    FIELD(void *, scene, 0xe0) = effect;
    func_02095274((u8 *)scene + 0x4f8, effect);
    func_02094cf0(effect, data_ov025_02202cf0, 1);

    void *overlay94 = Heap_Alloc(0x4c, data_ov025_0220339c, 4, gHeapContext);
    if (overlay94) overlay94 = func_ov094_02219568(overlay94, 0xd8, 0xd8);
    FIELD(void *, scene, 0x5c0) = overlay94;
    void *dialog = Heap_Alloc(0xec, data_ov025_022033a4, 4, gHeapContext);
    if (dialog) dialog = func_02092cc0(dialog, gDebugFont,
                                      FIELD(void *, scene, 0x57c));
    FIELD(void *, scene, 0x50c) = dialog;
    func_ov025_021ff23c(dialog, 0x10, 0x70, 0xe0, 0x40);
    FIELD(s32, dialog, 0xd0) = 13;
    FIELD(s32, dialog, 0xd4) = 0;
    FIELD(s32, dialog, 0xb4) = 0;
    FIELD(s32, dialog, 0xbc) = -2;
    FIELD(s32, dialog, 0xc0) = 0;
    func_02092f88(dialog, 1, (u8 *)scene + 0x510);
    FIELD(void *, scene, 0x59c) = 0;
    GameWork_ClearFlag(gGameWork, 0x3d3);
    GameWork_ClearFlag(gGameWork, 0x3d6);
    func_0205974c(gSoundContext, 0x16f);
    FIELD(u32, scene, 0x20) |= 0x400;
    func_ov025_021ff254(scene, (void *)data_ov025_02202ea8[0],
                       (void *)data_ov025_02202ea8[1]);
    return scene;
}

static void cleanup_scene(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov025_02203370;
    FIELD(u32, scene, 0x20) &= ~0x400u;
    func_020597fc(gSoundContext, 0x16f);
    func_02095308((u8 *)scene + 0x4f8);
    virtual_destroy(FIELD(void *, scene, 0x50c));
    void *overlay94 = FIELD(void *, scene, 0x5c0);
    if (overlay94) { func_ov094_022196a4(overlay94); Heap_Free(overlay94); }
    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    for (s32 i = 0; i < 3; ++i) {
        void *widget = FIELD(void *, scene, 0xe4 + i * 4);
        if (!widget) continue;
        func_0207419c(FIELD(void *, widget, 0xc));
        func_020927b8((u8 *)widget + 0x30);
        func_02071eb8(widget);
        Heap_Free(widget);
    }
    void *name_entry = FIELD(void *, scene, 0x598);
    if (name_entry) {
        func_0207419c(FIELD(void *, name_entry, 0));
        func_02071eb8((u8 *)name_entry + 4);
        Heap_Free(name_entry);
    }
    virtual_destroy(FIELD(void *, scene, 0x59c));
    func_0207419c(FIELD(void *, scene, 0xb0));
    func_0207419c(FIELD(void *, scene, 0xb4));
    func_02075630(data_020f4e14);
    func_020927b8((u8 *)scene + 0x574);
    func_020926f8((u8 *)scene + 0x530);
    FIELD(const void *, scene, 0x4f8) = data_ov025_02203318;
    func_02095308((u8 *)scene + 0x4f8);
    __destroy_arr((u8 *)scene + 0x2f4, 3, 0xac,
                  (void *)func_ov025_021ff1c8);
    func_ov025_021fdec8((u8 *)scene + 0x248);
    func_ov025_021fdec8((u8 *)scene + 0x19c);
    func_ov025_021fdec8((u8 *)scene + 0xf0);
    for (s32 offset = 0xa4; offset >= 0x5c; offset -= 0xc)
        func_02071eb8((u8 *)scene + offset);
}

/*
 * Releases every scene-owned object/resource while retaining caller-owned
 * scene storage. This includes dialog/effects, overlay-94, optional record/name
 * widgets, sprite owners, font/input/touch state, controllers, descriptors,
 * blend registers, and sound 0x16F. Returns the original scene pointer.
 */
extern "C" void *func_ov025_021ffa6c(void *scene)
{
    cleanup_scene(scene);
    return scene;
}

/*
 * Deleting-destructor variant of func_ov025_021FFA6C. It performs identical
 * heap/graphics/input/audio teardown, frees the scene allocation, and returns
 * the now-invalid original pointer value.
 */
extern "C" void *func_ov025_021ffc30(void *scene)
{
    cleanup_scene(scene);
    Heap_Free(scene);
    return scene;
}
