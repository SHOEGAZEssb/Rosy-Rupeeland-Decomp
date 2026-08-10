#include "tingle/types.h"

/* Overlay 22 scene construction and paired caller-owned/heap-owned teardown paths. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern const u32 data_ov022_02200558[];
extern const u8 data_ov022_022006a0[];
extern const u8 data_ov022_022006d4[];
extern const u8 data_ov022_022006dc[];
extern const u8 data_ov022_022006e4[];
extern void *gDebugFont;
extern void *gGameWork;
extern void *gHeapContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void __construct_array(void *, s32, s32, void (*)(void *), void (*)(void *));
extern void __destroy_arr(void *, s32, s32, void (*)(void *));
extern void func_020597fc(void *, s32);
extern void *func_020716bc(void *, s32);
extern void func_02071c38(void *, void *);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_0207419c(void *);
extern void *func_020742cc(void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern void func_02091e28(void *);
extern void func_02092798(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void func_020929b0(void *);
extern void *func_02092cc0(void *, void *, s32);
extern void func_02092f88(void *, s32, void *);
extern void func_020957bc(void *);
extern u32 genrand_int32(void);
extern void func_ov022_021fcf08(void *);
extern void *func_ov022_021fcf98(void *);
extern void *func_ov022_021fd370(void *);
extern void *func_ov022_021fd458(void *);
extern void func_ov022_021fda28(void *);
extern void func_ov022_021fdd00(void *);
extern void func_ov022_021fdd04(void *, s32, s32, s32, s32);
extern void func_ov022_021fdd1c(void *, void *, void *);
extern void func_ov022_021fe3c0(void *);
extern void func_ov022_021fe498(void *);
extern void func_ov022_021fe544(void *);
extern void func_ov022_021fe688(void *);
extern void func_ov022_021fee3c(void *);
extern void func_ov046_0220ba80(void *);
#ifdef __cplusplus
}
#endif

static void destroy_polymorphic(void *object)
{
    if (object != 0) {
        void **vtable = FIELD(void **, object, 0);
        ((void (*)(void *))vtable[1])(object);
    }
}

static void destroy_scene_members(void *scene)
{
    func_020597fc(gSoundContext, 0x122);

    void *emitter = FIELD(void *, scene, 0x354);
    if (emitter != 0) {
        func_ov022_021fcf98(emitter);
        Heap_Free(emitter);
    }
    void *overlay46 = FIELD(void *, scene, 0x35c);
    if (overlay46 != 0) {
        func_ov046_0220ba80(overlay46);
        Heap_Free(overlay46);
    }
    void *status = FIELD(void *, scene, 0x350);
    if (status != 0) {
        func_ov022_021fd458(status);
        Heap_Free(status);
    }
    destroy_polymorphic(FIELD(void *, scene, 0x2cc));
    destroy_polymorphic(FIELD(void *, scene, 0x2b4));

    void *menu = FIELD(void *, scene, 0x2b8);
    if (menu != 0) {
        func_ov022_021fda28(menu);
        Heap_Free(menu);
    }
    func_0207419c(FIELD(void *, scene, 0x9c));
    func_0207419c(FIELD(void *, scene, 0xa0));
    func_02071c38(data_020f4e18, FIELD(void *, scene, 0x374));
    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14);
    GraphicsSpriteRenderer_QueuePaletteUploads(gDebugFont);
    __destroy_arr((u8 *)scene + 0x154, 2, 0xac, func_ov022_021fdd00);
    func_ov022_021fdd00((u8 *)scene + 0xa8);
    func_02071eb8((u8 *)scene + 0x90);
    func_02071eb8((u8 *)scene + 0x84);
    func_02071eb8((u8 *)scene + 0x78);
    func_020927b8((u8 *)scene + 0x54);
}

/*
 * Constructs the overlay 22 scene in caller-provided storage. It initializes
 * base/input state, three resource holders, one controller plus two 0xAC
 * controller-array elements, render control +0x378, RNG +0x390, graphics/font
 * handles, and resource IDs 0x7007/0x7005/0x7001, 0x3D..0x41, and 0x4000..2.
 * It allocates the status widget +0x350, dialog +0x2CC, and emitter +0x354;
 * constructs graphics/subsystems via the recovered helpers; clears game-work
 * halfword +0x204; enables per-frame bit 0x400; and installs initial descriptor
 * 0x02200558. Heap, SDK, graphics, dialog, and persistent game state change.
 * The initialized scene pointer is returned.
 */
extern "C" void *func_ov022_021fdd44(void *scene)
{
    func_02091e28(scene);
    FIELD(const void *, scene, 0) = data_ov022_022006a0;
    func_02092798((u8 *)scene + 0x54);
    func_02071ea4((u8 *)scene + 0x78);
    func_02071ea4((u8 *)scene + 0x84);
    func_02071ea4((u8 *)scene + 0x90);
    func_020957bc((u8 *)scene + 0xa8);
    __construct_array((u8 *)scene + 0x154, 2, 0xac,
                      func_020957bc, func_ov022_021fdd00);
    func_020929b0((u8 *)scene + 0x378);
    FIELD(s32, scene, 0x390) = 0;
    FIELD(void *, scene, 0x2c0) = 0;
    FIELD(void *, scene, 0x2b4) = 0;
    FIELD(void *, scene, 0x2b8) = 0;
    FIELD(void *, scene, 0x2bc) = 0;
    FIELD(void *, scene, 0x35c) = 0;
    FIELD(u32, scene, 0x390) = genrand_int32();
    FIELD(s32, scene, 0x2c4) = 0;
    FIELD(s32, scene, 0x2c8) = 0;
    FIELD(s32, scene, 0x2b0) = 0;

    FIELD(void *, scene, 0x374) = func_020716bc(data_020f4e18, 0xc007);
    func_02092814((u8 *)scene + 0x54, 0x7007);
    func_02092814((u8 *)scene + 0x54, 0x7005);
    func_02092814((u8 *)scene + 0x54, 0x7001);
    func_02071ee0((u8 *)scene + 0x78, data_020f4e18,
                  0x3d, 0x3e, 0x3f);
    func_02071ee0((u8 *)scene + 0x84, data_020f4e18,
                  0x40, 0x3e, 0x41);
    func_02071ee0((u8 *)scene + 0x90, data_020f4e18,
                  0x4000, 0x4001, 0x4002);

    void *status = Heap_Alloc(0x34, data_ov022_022006d4, 4, gHeapContext);
    if (status != 0)
        status = func_ov022_021fd370(status);
    FIELD(void *, scene, 0x350) = status;
    FIELD(void *, scene, 0x9c) = func_020742cc(data_020f4e14);
    FIELD(void *, scene, 0xa0) = func_020742cc(data_020f4e14);
    func_ov022_021fe3c0(scene);
    func_ov022_021fe498(scene);
    func_ov022_021fe544(scene);
    func_ov022_021fe688(scene);
    func_ov022_021fee3c(scene);

    void *dialog = Heap_Alloc(0xec, data_ov022_022006dc, 4, gHeapContext);
    if (dialog != 0)
        dialog = func_02092cc0(dialog, gDebugFont, FIELD(s32, scene, 0x54));
    FIELD(void *, scene, 0x2cc) = dialog;
    func_ov022_021fdd04(dialog, 0x50, 0x28, 0xa8, 0x84);
    FIELD(s32, dialog, 0xbc) = -2;
    FIELD(s32, dialog, 0xd0) = 13;
    FIELD(s32, dialog, 0xd4) = 0;
    func_02092f88(dialog, 5, (u8 *)scene + 0x2d0);
    func_02092f88(dialog, 6, (u8 *)scene + 0x310);

    void *emitter = Heap_Alloc(0x70, data_ov022_022006e4, 4, gHeapContext);
    if (emitter != 0)
        func_ov022_021fcf08(emitter);
    FIELD(void *, scene, 0x354) = emitter;
    FIELD(u16, gGameWork, 0x204) = 0;
    FIELD(u32, scene, 0x20) |= 0x400;
    func_ov022_021fdd1c(scene, (void *)data_ov022_02200558[0],
                        (void *)data_ov022_02200558[1]);
    return scene;
}

/*
 * Runs the non-freeing scene destructor. It restores vtable 0x022006A0,
 * disables per-frame bit 0x400, stops sound 0x122, releases or destroys all
 * emitter/overlay/status/dialog/menu/font/graphics/controller/input members,
 * and clears both blend-control registers. Caller-owned scene storage remains
 * allocated and is returned.
 */
extern "C" void *func_ov022_021fe010(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov022_022006a0;
    FIELD(u32, scene, 0x20) &= ~0x400U;
    destroy_scene_members(scene);
    return scene;
}

/*
 * Runs the owning scene destructor. It performs the same SDK, sound, graphics,
 * controller, and heap-member cleanup as 0x021FE010, then frees the scene
 * allocation itself. The original pointer is returned for ABI parity but is
 * invalid for dereference after the call.
 */
extern "C" void *func_ov022_021fe18c(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov022_022006a0;
    FIELD(u32, scene, 0x20) &= ~0x400U;
    destroy_scene_members(scene);
    Heap_Free(scene);
    return scene;
}
