#include "tingle/types.h"

/* Overlay 25 main title/menu scene construction and owned-object setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
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

typedef struct TransitionPair {
    void *callback;
    void *argument;
} TransitionPair;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void __construct_array(void *, s32, s32, void *, void *);
extern void __destroy_arr(void *, s32, s32, void *);
extern u32 genrand_int32(void);
extern void GameWork_ClearFlag(void *, s32);
extern void func_0205974c(void *, s32);
extern void func_020597fc(void *, s32);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
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
extern void func_ov025_021ff254(void *, TransitionPair);
extern void func_ov025_021ff1c8(void *);
extern void func_ov025_021ff1dc(void *);
extern void func_ov025_021ffdfc(void *);
extern void func_ov025_02200014(void *);
extern void *func_ov094_02219568(void *, s32, s32);
extern void func_ov094_022196a4(void *);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the 0x63C-byte overlay-25 scene. It initializes seven resource
 * descriptors, six controller objects (three standalone plus a three-element
 * array), callback holder +0x4F8, touch/input and four transition objects,
 * seeds RNG +0x634, resets selection/owned-pointer fields, and configures both
 * display engines through recovered helpers. It loads all scene resource IDs,
 * creates shared/debug sprite owners and button sprites, allocates three
 * effects (+0x508/+0xDC/+0xE0), an overlay-94 object +0x5C0, and dialog +0x50C,
 * clears game flags 0x3D3/0x3D6, stops sound 0x16F, enables flag 0x400, and
 * installs callback pair data_ov025_02202EA8, whose retail first word is
 * func_ov025_022009D8 (the introductory record scan). Heap, RNG, input,
 * graphics, game-work, sound, and callback state change; the initialized scene
 * pointer is returned.
 */
extern "C" void *func_ov025_021ff27c(void *scene)
{
    func_02091e28(scene);
    FIELD(const void *, scene, 0) = data_ov025_02203370;
    func_02071ea4((u8 *)scene + 0x5c);
    func_02071ea4((u8 *)scene + 0x68);
    func_02071ea4((u8 *)scene + 0x74);
    func_02071ea4((u8 *)scene + 0x80);
    func_02071ea4((u8 *)scene + 0x8c);
    func_02071ea4((u8 *)scene + 0x98);
    func_02071ea4((u8 *)scene + 0xa4);
    func_020957bc((u8 *)scene + 0xf0);
    func_020957bc((u8 *)scene + 0x19c);
    func_020957bc((u8 *)scene + 0x248);
    __construct_array((u8 *)scene + 0x2f4, 3, 0xac,
                      (void *)func_020957bc,
                      (void *)func_ov025_021ff1c8);
    func_ov025_021ff1dc((u8 *)scene + 0x4f8);
    func_020926d8((u8 *)scene + 0x530);
    func_02092798((u8 *)scene + 0x574);
    func_020929b0((u8 *)scene + 0x5a0);
    func_02091b6c((u8 *)scene + 0x5c4);
    func_02091b6c((u8 *)scene + 0x5e0);
    func_02091b6c((u8 *)scene + 0x5fc);
    func_02091b6c((u8 *)scene + 0x618);
    FIELD(u32, scene, 0x634) = 0;
    FIELD(u32, scene, 0x634) = genrand_int32();
    FIELD(void *, scene, 0x598) = 0;
    FIELD(s32, scene, 0x54) = -1;
    FIELD(void *, scene, 0x5b8) = 0;
    FIELD(void *, scene, 0x5bc) = 0;
    FIELD(void *, scene, 0x638) = 0;
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    func_02092754((u8 *)scene + 0x530, 0x8032);
    func_02092754((u8 *)scene + 0x530, 0x8033);
    func_02092754((u8 *)scene + 0x530, 0x8034);
    func_02092754((u8 *)scene + 0x530, 0x8035);
    func_02092754((u8 *)scene + 0x530, 0x8036);
    func_02092754((u8 *)scene + 0x530, 0x8037);
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
    FIELD(void *, scene, 0xb0) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    FIELD(void *, scene, 0xb4) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    FIELD(s32, FIELD(void *, scene, 0xb4), 0x18) = 0;
    FIELD(s32, FIELD(void *, scene, 0xb4), 0x1c) = 0x100;
    for (s32 i = 0; i < 3; ++i) FIELD(void *, scene, 0xe4 + i * 4) = 0;

    for (s32 i = 0; i < 3; ++i) {
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb0),
                                     (u8 *)scene + 0x5c, 1);
        func_020957f0((u8 *)scene + 0x2f4 + i * 0xac,
                      sprite, 0x20 + i * 2, 1, 16);
        func_02095820((u8 *)scene + 0x2f4 + i * 0xac, 0xd4, 0);
        func_02095940((u8 *)scene + 0x2f4 + i * 0xac);
    }
    FIELD(void *, scene, 0xbc) = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb0),
                                                (u8 *)scene + 0x8c, 2);
    func_02073e48(FIELD(void *, scene, 0xbc), 0, 0x80, 0x60, 0, 0, 6);
    s32 x_positions[6] = {0x40, 0x67, 0x9a, 0xbf, 0xe4, 0x15};
    s32 y_positions[6] = {0x5f, 0x32, 0x53, 0x7e, 0x4f, 0x46};
    for (s32 i = 0; i < 6; ++i) {
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb4),
                                     (u8 *)scene + 0xa4, 2);
        FIELD(void *, scene, 0xc4 + i * 4) = sprite;
        func_02073e48(sprite, i, x_positions[i],
                      y_positions[i] - 0x100, 1, 0xf000, 2);
    }
    FIELD(void *, scene, 0xc0) = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb4),
                                                (u8 *)scene + 0x98, 2);
    func_02073e48(FIELD(void *, scene, 0xc0), 8, 0x80, -0xa0, 1, 0, 6);
    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, scene, 0xb0), (u8 *)scene + 0x5c, 1);
    func_020957f0((u8 *)scene + 0xf0, sprite, 0x2c, 1, 16);
    func_02095820((u8 *)scene + 0xf0, 0x94, 0xb3);
    func_02095940((u8 *)scene + 0xf0);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, scene, 0xb0), (u8 *)scene + 0x5c, 1);
    func_020957f0((u8 *)scene + 0x19c, sprite, 0x26, 1, 16);
    func_02095820((u8 *)scene + 0x19c, 0xe4, 0xa0);
    func_02095940((u8 *)scene + 0x19c);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, scene, 0xb0), (u8 *)scene + 0x5c, 1);
    func_020957f0((u8 *)scene + 0x248, sprite, 0x32, 1, 16);
    func_02095820((u8 *)scene + 0x248, 0xe0, 0xb3);
    func_02095940((u8 *)scene + 0x248);

    void *effect = Heap_Alloc(0xfc, data_ov025_02203384, 4, gHeapContext);
    if (effect) effect = func_ov025_021fdecc(effect);
    FIELD(void *, scene, 0x508) = effect;
    func_02095274((u8 *)scene + 0x4f8, effect);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb4),
                                                       (u8 *)scene + 0x74, 2);
    func_02073e48(sprite, 0, 0, 0, 1, 0x4000, 2);
    effect = Heap_Alloc(0xa0, data_ov025_0220338c, 4, gHeapContext);
    if (effect) effect = func_ov025_021ff21c(effect, sprite);
    FIELD(void *, scene, 0xdc) = effect;
    func_02095274((u8 *)scene + 0x4f8, effect);
    func_02094cf0(effect, data_ov025_02202d68, 1);

    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb4),
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
    func_ov025_021ff254(scene,
        *(const TransitionPair *)data_ov025_02202ea8);
    return scene;
}
