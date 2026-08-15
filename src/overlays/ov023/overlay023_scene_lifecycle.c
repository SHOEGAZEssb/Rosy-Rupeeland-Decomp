#include "tingle/types.h"

/* Overlay 23 main 0x524-byte scene construction and owned-resource teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *data_ov023_021ffb60[];
extern void *data_ov023_021ffbc4;
extern const u8 data_ov023_021ffbf0[];
extern const u8 data_ov023_021ffbf8[];
extern void *gDebugFont;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern void __construct_array(void *, s32, s32, void *);
extern void __destroy_arr(void *, s32, s32, void *);
extern void func_02071c38(void *, void *);
extern void *func_020716bc(void *, s32);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void func_02073e48(void *, s32, s32, s32, ...);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern void func_02091b6c(void *);
extern void func_02091e28(void *);
extern void func_020926d8(void *);
extern void func_020926f8(void *);
extern void func_02092754(void *, s32);
extern void func_02092798(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void func_020929b0(void *);
extern void func_02092cc0(void *, void *, void *);
extern void IndexedSelectionController_Init(void *);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern void *SpritePresentation_Init(void *, void *);
extern void SpritePresentation_SyncPosition(void *);
extern void func_020957bc(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_020afd0c(void *, s32, s32, s32, s32);
extern void *func_ov023_021fcfcc(void *);
extern void *func_ov023_021fd5d0(void *);
extern void func_ov023_021fd9b4(void *);
extern void func_ov023_021fd9b8(void *, s32, s32, s32, s32);
extern void func_ov023_021fd9d0(void *, void *, void *);
extern void func_ov023_021fe164(void *);
extern void func_ov023_021fe270(void *);
extern void func_ov023_021fe2cc(void *);
extern void func_ov023_021fe39c(void *);
extern void func_ov023_021fe640(void *, s32);
extern void func_ov023_021fe994(void *, s32);
#ifdef __cplusplus
}
#endif

static void virtual_destroy(void *object)
{
    if (object != 0) {
        typedef void (*Dtor)(void *);
        ((Dtor)FIELD(void *, FIELD(void *, object, 0), 4))(object);
    }
}

/*
 * Constructs the complete overlay-23 scene. It initializes base/input/touch,
 * sprite-resource, controller, dialog, transition, and animation subobjects;
 * clears eighteen collection slots and ownership pointers; loads shared sprite
 * resources; creates cursor/button controllers and two 0xA0 effect objects;
 * configures both engine blend registers; allocates dialog +0x4B8; enables
 * scene flag 0x400; and installs callback pair data_ov023_021ffb60. Heap,
 * graphics, input, font, MMIO, and scene state change; returns the scene.
 */
extern "C" void *func_ov023_021fd9f8(void *scene)
{
    func_02091e28(scene);
    FIELD(void *, scene, 0) = data_ov023_021ffbc4;
    func_02092798((u8 *)scene + 0x54);
    func_020926d8((u8 *)scene + 0x78);
    func_02071ea4((u8 *)scene + 0xbc);
    func_020957bc((u8 *)scene + 0xd0);
    func_020957bc((u8 *)scene + 0x17c);
    __construct_array((u8 *)scene + 0x228, 2, 0xac,
                      (void *)func_020957bc);
    IndexedSelectionController_Init((u8 *)scene + 0x480);
    func_020929b0((u8 *)scene + 0x4c4);
    func_02091b6c((u8 *)scene + 0x4dc);
    FIELD(void *, scene, 0x4bc) = 0;
    FIELD(void *, scene, 0x390) = 0;
    for (s32 i = 0; i < 18; ++i) FIELD(void *, scene, 0x430 + i * 4) = 0;
    FIELD(void *, scene, 0x478) = 0;
    FIELD(void *, scene, 0x394) = 0;
    FIELD(void *, scene, 0x47c) = 0;
    FIELD(void *, scene, 0x4c0) = func_020716bc(data_020f4e18, 0xc007);
    func_02092814((u8 *)scene + 0x54, 0x7007);
    func_02092814((u8 *)scene + 0x54, 0x7005);
    func_02092754((u8 *)scene + 0x78, 0x803c);
    func_02092754((u8 *)scene + 0x78, 0x803b);
    func_02071ee0((u8 *)scene + 0xbc, data_020f4e18, 0x3d, 0x3e, 0x3f);
    func_ov023_021fe164(scene);
    func_ov023_021fe270(scene);
    func_ov023_021fe2cc(scene);

    FIELD(void *, scene, 0xc8) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    FIELD(void *, scene, 0xcc) = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, scene, 0xc8), (u8 *)scene + 0xbc, 1);
    func_02073e48(FIELD(void *, scene, 0xcc), 0x14, 0x86, 0x2d, 1, 0, 6);
    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xc8),
                                 (u8 *)scene + 0xbc, 1);
    func_020957f0((u8 *)scene + 0xd0, sprite, 6, 1, 0);
    func_02095820((u8 *)scene + 0xd0, 0x80, 0xaa);
    sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xc8),
                           (u8 *)scene + 0xbc, 1);
    func_020957f0((u8 *)scene + 0x17c, sprite, 2, 1, 0);
    func_02095820((u8 *)scene + 0x17c, 0xe4, 0xaa);
    for (s32 i = 0; i < 2; ++i) {
        sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xc8),
                               (u8 *)scene + 0xbc, 1);
        func_020957f0((u8 *)scene + 0x228 + i * 0xac,
                      sprite, i + 12, 1, 0);
        func_02095820((u8 *)scene + 0x228 + i * 0xac,
                      0x94 + i * 0x3c, 0x10);
    }
    for (s32 i = 0; i < 2; ++i) {
        void *effect = Heap_Alloc(0xa0, data_ov023_021ffbf0,
                                  4, gHeapContext);
        if (effect) effect = SpritePresentation_Init(effect,
            GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xc8), (u8 *)scene + 0xbc, 1));
        FIELD(void *, scene, 0x380 + i * 4) = effect;
        FIELD(u8, FIELD(void *, effect, 0x9c), 0x3a) = 1;
        FIELD(u16, FIELD(void *, effect, 0x9c), 0x28) = 0;
        Presentation_SetPosition(effect, 0x2a000, 0x16000 + i * 0x34000, 0);
        SpritePresentation_SyncPosition(effect);
    }
    func_ov023_021fe640(scene, 0);
    func_ov023_021fe39c(scene);
    func_ov023_021fe994(scene, 0);
    func_020afd0c((void *)0x04000050, 4, 8, 8, 8);
    func_020afd0c((void *)0x04001050, 4, 8, 8, 8);
    void *dialog = Heap_Alloc(0xec, data_ov023_021ffbf8, 4, gHeapContext);
    if (dialog) func_02092cc0(dialog, gDebugFont,
                              FIELD(void *, scene, 0x54));
    FIELD(void *, scene, 0x4b8) = dialog;
    func_ov023_021fd9b8(dialog, 0x50, 0x28, 0xa8, 0x84);
    FIELD(s32, dialog, 0xbc) = -2;
    FIELD(s32, dialog, 0xd0) = 12;
    FIELD(s32, dialog, 0xd4) = 0;
    FIELD(u32, scene, 0x20) |= 0x400;
    func_ov023_021fd9d0(scene, data_ov023_021ffb60[0],
                       data_ov023_021ffb60[1]);
    return scene;
}

static void cleanup_scene(void *scene)
{
    FIELD(void *, scene, 0) = data_ov023_021ffbc4;
    FIELD(u32, scene, 0x20) &= ~0x400u;
    virtual_destroy(FIELD(void *, scene, 0x380));
    virtual_destroy(FIELD(void *, scene, 0x384));
    virtual_destroy(FIELD(void *, scene, 0x4bc));
    virtual_destroy(FIELD(void *, scene, 0x4b8));
    void *records = FIELD(void *, scene, 0x390);
    if (records) { func_ov023_021fcfcc(records); Heap_Free(records); }
    for (s32 i = 0; i < 18; ++i) {
        void *collection = FIELD(void *, scene, 0x430 + i * 4);
        if (collection) { func_ov023_021fd5d0(collection); Heap_Free(collection); }
    }
    GraphicsSpriteGroup_Destroy(FIELD(void *, scene, 0xc8));
    func_02071c38(data_020f4e18, FIELD(void *, scene, 0x4c0));
    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14);
    GraphicsSpriteRenderer_QueuePaletteUploads(gDebugFont);
    __destroy_arr((u8 *)scene + 0x228, 2, 0xac,
                  (void *)func_ov023_021fd9b4);
    func_ov023_021fd9b4((u8 *)scene + 0x17c);
    func_ov023_021fd9b4((u8 *)scene + 0xd0);
    func_02071eb8((u8 *)scene + 0xbc);
    func_020926f8((u8 *)scene + 0x78);
    func_020927b8((u8 *)scene + 0x54);
}

/*
 * Tears down every resource owned by the scene but leaves the scene allocation
 * intact: effect/dialog objects, record collection, eighteen pointer
 * collections, cloned sprite owner, resource handle, blend registers, font
 * contexts, controller array, resource descriptor, touch, and input objects.
 * Heap/SDK/MMIO state changes; returns the original scene pointer.
 */
extern "C" void *func_ov023_021fde08(void *scene)
{
    cleanup_scene(scene);
    return scene;
}

/*
 * Deleting-destructor variant of func_ov023_021FDE08. It performs identical
 * teardown, frees the scene allocation, and returns the now-invalid original
 * pointer value. Heap/SDK/MMIO state changes.
 */
extern "C" void *func_ov023_021fdf70(void *scene)
{
    cleanup_scene(scene);
    Heap_Free(scene);
    return scene;
}
