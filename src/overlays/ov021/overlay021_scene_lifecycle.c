#include "tingle/types.h"

/* Overlay 21 scene construction and the paired non-freeing/freeing teardown paths. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *data_021e9ac0;
extern u8 data_021f3ecc[];
extern const u32 data_ov021_02202e10[];
extern const u8 data_ov021_02202f64[];
extern const u8 data_ov021_02202f88[];
extern const u8 data_ov021_02202f90[];
extern void *gDebugFont;
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void MIi_CpuCopy16(const void *, void *, u32);
extern void __construct_array(void *, s32, s32, void (*)(void *), void (*)(void *));
extern void __destroy_arr(void *, s32, s32, void (*)(void *));
extern void OverlaySlot_Init(void *);
extern void OverlaySlot_Destroy(void *);
extern void InventoryRecordCollection_Sort(void *, s32);
extern void InventoryRecordCollection_SortAlternate(void *, s32);
extern void *GraphicsArchive_AcquirePaletteResource(void *, s32);
extern void GraphicsArchive_ReleasePaletteResource(void *, void *);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern u32 LanguageLookupDatabase_GetResourceSize(const void *, s32);
extern const void *LanguageLookupDatabase_GetResourceById(const void *, s32);
extern void SceneInputBase_Init(void *);
extern void TitleCharacterResourceCollection_Init(void *);
extern void TitleCharacterResourceCollection_Destroy(void *);
extern void TitleCharacterResourceCollection_Append(void *, s32);
extern void TitleScrollValue_Init(void *);
extern void *TitleDialog_Init(void *, void *, void *);
extern void func_02092f88(void *, s32, void *);
extern void SpriteMotionController_Init(void *);
extern u32 genrand_int32(void);
extern void func_ov002_021fb9c4(void *);
extern void func_ov021_021fd074(void *);
extern s32 func_ov021_021fd150(void *);
extern void func_ov021_021fd790(void *);
extern void func_ov021_021fd794(void *);
extern void func_ov021_021fd7a8(void *, s32, s32, s32, s32);
extern void func_ov021_021fd7c0(void *, u32, u32);
extern void func_ov021_021fdf88(void *);
extern void func_ov021_021fe098(void *);
extern void Overlay021_SetupMainBackground(void *);
extern void func_ov021_021fe520(void *);
extern void func_ov021_021fe6b0(void *);
extern void func_ov045_0220b83c(void *);
extern void func_ov045_0220b8cc(void *);
extern void *func_ov045_0220c48c(s32, s32, s32);
extern void func_ov045_0220d2d8(s32);
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

static void destroy_scene_members(void *state)
{
    if (FIELD(s32, state, 0x2d0) != -1)
        func_ov045_0220d2d8(FIELD(s32, state, 0x2d0));

    void *currency_anim = FIELD(void *, state, 0x3ec);
    if (currency_anim != 0) {
        func_ov045_0220b8cc(currency_anim);
        Heap_Free(currency_anim);
    }
    destroy_polymorphic(FIELD(void *, state, 0x354));
    destroy_polymorphic(FIELD(void *, state, 0x358));

    void *panel = FIELD(void *, state, 0x390);
    if (panel != 0) {
        func_ov002_021fb9c4(panel);
        Heap_Free(panel);
    }
    destroy_polymorphic(FIELD(void *, state, 0x384));
    destroy_polymorphic(FIELD(void *, state, 0x38c));
    destroy_polymorphic(FIELD(void *, state, 0x388));

    for (s32 i = 0; i < 2; ++i) {
        void *list = FIELD(void *, state, 0x2a4 + i * 4);
        if (list != 0) {
            func_ov021_021fd074(list);
            Heap_Free(list);
        }
    }

    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0x94));
    GraphicsArchive_ReleasePaletteResource(data_020f4e18, FIELD(void *, state, 0x400));
    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14);
    GraphicsSpriteRenderer_QueuePaletteUploads(gDebugFont);
    OverlaySlot_Destroy((u8 *)state + 0x41c);
    __destroy_arr((u8 *)state + 0x14c, 2, 0xac, func_ov021_021fd790);
    func_ov021_021fd790((u8 *)state + 0xa0);
    AnimationResourceState_Destroy((u8 *)state + 0x88);
    AnimationResourceState_Destroy((u8 *)state + 0x7c);
    TitleCharacterResourceCollection_Destroy((u8 *)state + 0x58);
}

/*
 * Constructs an overlay 21 scene in caller-provided storage and records the
 * requested mode from the second argument at +0x54. It initializes base/input,
 * two 0xAC controllers, interpolation objects, random state, copied resources
 * 0x2E2/0x2E3, graphics/font handles, list and sprite widgets, dialog and
 * currency-animation objects, then enables per-frame bit 0x400 and selects the
 * initial state descriptor 0x02202E10. Heap allocations and graphics/SDK state
 * change. The initialized scene pointer is returned.
 */
extern "C" void *func_ov021_021fd7e8(void *state, s32 mode)
{
    SceneInputBase_Init(state);
    FIELD(const void *, state, 0) = data_ov021_02202f64;
    TitleCharacterResourceCollection_Init((u8 *)state + 0x58);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x7c);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x88);
    SpriteMotionController_Init((u8 *)state + 0xa0);
    __construct_array((u8 *)state + 0x14c, 2, 0xac,
                      SpriteMotionController_Init, func_ov021_021fd790);
    FIELD(s32, state, 0x2cc) = 0;
    func_ov021_021fd794((u8 *)state + 0x35c);
    func_ov021_021fd794((u8 *)state + 0x368);
    TitleScrollValue_Init((u8 *)state + 0x404);
    OverlaySlot_Init((u8 *)state + 0x41c);

    FIELD(s32, state, 0x3d8) = 0;
    FIELD(s32, state, 0x3dc) = 0;
    FIELD(s32, state, 0x3e0) = 0;
    FIELD(s32, state, 0x3fc) = 0;
    FIELD(s32, state, 0x2c4) = 0;
    FIELD(s32, state, 0x54) = mode;
    FIELD(void *, state, 0x2c0) = 0;
    FIELD(void *, state, 0x354) = 0;
    FIELD(void *, state, 0x358) = 0;
    FIELD(void *, state, 0x390) = 0;
    FIELD(void *, state, 0x384) = 0;
    FIELD(void *, state, 0x2bc) = 0;
    FIELD(void *, state, 0x37c) = 0;
    FIELD(void *, state, 0x380) = 0;
    FIELD(s32, state, 0x374) = -1;
    FIELD(s32, state, 0x378) = -1;
    FIELD(s32, state, 0x2d0) = -1;
    FIELD(s32, state, 0x3e4) = -1;
    FIELD(s32, state, 0x3e8) = 0;
    for (s32 i = 0; i < 2; ++i) {
        FIELD(void *, state, 0x2ac + i * 4) = 0;
        FIELD(void *, state, 0x2b4 + i * 4) = 0;
    }

    FIELD(u32, state, 0x2cc) = genrand_int32();
    InventoryRecordCollection_SortAlternate((u8 *)data_021e9ac0 + 0x34, 1);
    InventoryRecordCollection_Sort(data_021e9ac0, 0);
    u32 size = LanguageLookupDatabase_GetResourceSize(data_021f3ecc, 0x2e2);
    MIi_CpuCopy16(LanguageLookupDatabase_GetResourceById(data_021f3ecc, 0x2e2),
                  (u8 *)state + 0x2d4, size);
    size = LanguageLookupDatabase_GetResourceSize(data_021f3ecc, 0x2e3);
    MIi_CpuCopy16(LanguageLookupDatabase_GetResourceById(data_021f3ecc, 0x2e3),
                  (u8 *)state + 0x314, size);

    FIELD(void *, state, 0x400) = GraphicsArchive_AcquirePaletteResource(data_020f4e18, 0xc007);
    TitleCharacterResourceCollection_Append((u8 *)state + 0x58, 0x7007);
    TitleCharacterResourceCollection_Append((u8 *)state + 0x58, 0x7005);
    TitleCharacterResourceCollection_Append((u8 *)state + 0x58, 0x7001);
    TitleCharacterResourceCollection_Append((u8 *)state + 0x58, 0x7000);
    AnimationResourceState_ReplaceResources((u8 *)state + 0x7c, data_020f4e18, 0x3d, 0x3e, 0x3f);
    AnimationResourceState_ReplaceResources((u8 *)state + 0x88, data_020f4e18, 0x44, 0x45, 0x46);
    FIELD(void *, state, 0x38c) = func_ov045_0220c48c(mode, 0, 0);
    FIELD(void *, state, 0x94) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);

    func_ov021_021fdf88(state);
    func_ov021_021fe098(state);
    Overlay021_SetupMainBackground(state);
    func_ov021_021fe520(state);
    func_ov021_021fe6b0(state);
    if (FIELD(void *, state, 0x2a4) != 0)
        FIELD(s32, state, 0x3e4) = func_ov021_021fd150(FIELD(void *, state, 0x2a4));

    for (s32 i = 0; i < 16; ++i) {
        FIELD(u16, state, 0x3b8 + i * 2) = 0;
        FIELD(u16, state, 0x398 + i * 2) = 0;
    }

    void *dialog = Heap_Alloc(0xec, data_ov021_02202f88, 4, gHeapContext);
    if (dialog != 0)
        TitleDialog_Init(dialog, data_020f4e14,
                      FIELD(void *, state, 0x58));
    FIELD(void *, state, 0x388) = dialog;
    func_ov021_021fd7a8(dialog, 0x50, 0x28, 0xa8, 0x84);
    FIELD(s32, dialog, 0xbc) = -2;
    FIELD(s32, dialog, 0xd0) = 13;
    FIELD(s32, dialog, 0xd4) = 0;
    func_02092f88(dialog, 6, (u8 *)state + 0x398);
    func_02092f88(dialog, 5, (u8 *)state + 0x3b8);

    void *currency_anim = Heap_Alloc(0x70, data_ov021_02202f90, 4, gHeapContext);
    if (currency_anim != 0)
        func_ov045_0220b83c(currency_anim);
    FIELD(void *, state, 0x3ec) = currency_anim;
    FIELD(u32, state, 0x20) |= 0x400;
    func_ov021_021fd7c0(state, data_ov021_02202e10[0],
                        data_ov021_02202e10[1]);
    return state;
}

/*
 * Runs the non-freeing teardown used when the scene storage is owned by its
 * caller. It disables per-frame bit 0x400; stops any active overlay-45 effect;
 * destroys/free heap-owned animation, panels, prompt, dialog, and both lists;
 * releases graphics/font/controller resources; and clears both blend-control
 * registers. The input scene storage remains allocated and is returned.
 */
extern "C" void *func_ov021_021fdb80(void *state)
{
    FIELD(const void *, state, 0) = data_ov021_02202f64;
    FIELD(u32, state, 0x20) &= ~0x400U;
    destroy_scene_members(state);
    return state;
}

/*
 * Runs the owning destructor. It performs the same hardware, SDK, controller,
 * list, dialog, panel, and heap-member cleanup as 0x021FDB80, then frees the
 * scene allocation itself. The original pointer is returned for ABI parity but
 * must not be dereferenced after the call.
 */
extern "C" void *func_ov021_021fdd34(void *state)
{
    FIELD(const void *, state, 0) = data_ov021_02202f64;
    FIELD(u32, state, 0x20) &= ~0x400U;
    destroy_scene_members(state);
    Heap_Free(state);
    return state;
}
