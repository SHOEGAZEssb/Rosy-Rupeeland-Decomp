#include "tingle/graphics_bg_map_resource.h"
#include "tingle/heap.h"

/* Overlay 32 terminal halt sequence and initialization of 0x6C-byte display children. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG16(address) (*(volatile u16 *)(address))
#define REG32(address) (*(volatile u32 *)(address))

typedef struct GraphicsResourceSet {
    void *characterResource;
    void *paletteResource;
    GraphicsBgMapResource *bgMapResource;
} GraphicsResourceSet;

extern void *gSoundContext;
extern void *gDebugFont;
extern void *data_020f4e14[];
extern void *data_020f4e18[];
extern const u8 data_ov032_02202348[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_StopAllManagedPlayers(void *);
extern void GraphicsSpriteGroupOwner_DestroyGroup(...);
extern void func_020b44e8(void);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsResourceSet_Load(...);
extern void GraphicsBgCharacterResource_UploadToMainBg(...);
extern s32 GraphicsResource_GetFormat(void *);
extern void GraphicsBgPaletteResource_UploadToMainBg(...);
extern void GraphicsResourceSet_ReleaseHandles(GraphicsResourceSet *);
extern void *func_020959d4(...);
extern void ModalState_InitResources(...);
extern void Sound_Reset(void *);
extern void OS_Halt(void);
extern void func_ov032_0220147c(void *);
extern void *AnimationResourceState_ReleaseResources(void *);
#ifdef __cplusplus
}
#endif

typedef void (*VirtualDestructor)(void *);

/*
 * Runs a four-phase terminal sequence. State 0 stops sound, destroys the object
 * at +0x10, detaches both text renderers, disables sub BG layers, retains only
 * main BG2, and clears both canvases. State 1 loads archive IDs
 * 0x8030/0x8031/0x8032 to BG2 and allocates/configures a 0x2D0-byte object at
 * +0xF24. State 2 waits six frames through +0xB74. State 3 resets sound and
 * calls OS_Halt, which has a platform-level non-returning effect. Before the
 * halt path is reached the function returns constant 2.
 */
extern "C" s32 func_ov032_02200da4(void *scene)
{
    switch (FIELD(s32, scene, 0xb64)) {
    case 0: {
        Sound_StopAllManagedPlayers(gSoundContext);
        void *owned = FIELD(void *, scene, 0x10);
        if (owned != 0) {
            void **vtable = FIELD(void **, owned, 0);
            ((VirtualDestructor)vtable[1])(owned);
        }
        GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont, FIELD(void *, scene, 4));
        GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14[0], FIELD(void *, scene, 0));
        REG32(0x04000000) = (REG32(0x04000000) & ~0x1f00) | 0x1400;
        REG32(0x04001000) &= ~0x1f00;
        func_020b44e8();
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14[0]);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        ++FIELD(s32, scene, 0xb64);
        break;
    }
    case 1: {
        GraphicsResourceSet *set = (GraphicsResourceSet *)((u8 *)scene + 0xf18);
        GraphicsResourceSet_Load(set, data_020f4e18[0], 0x8030, 0x8031, 0x8032);
        func_020b44e8();
        GraphicsBgCharacterResource_UploadToMainBg(set->characterResource, 2, 0);
        GraphicsBgPaletteResource_UploadToMainBg(set->paletteResource,
                      GraphicsResource_GetFormat(set->characterResource)
                          ? 0x6000 : 0);
        GraphicsBgMapResource_UploadToMainBg(set->bgMapResource, 2, 0);
        GraphicsResourceSet_ReleaseHandles(set);
        REG16(0x05000000) = 0x24a3;
        void *object = Heap_Alloc(0x2d0, (const char *)data_ov032_02202348, 4,
                                  &gHeapContext);
        if (object != 0) object = func_020959d4(object, 0, 0);
        FIELD(void *, scene, 0xf24) = object;
        ModalState_InitResources(object, 0x1f);
        FIELD(s32, scene, 0xb74) = 0;
        ++FIELD(s32, scene, 0xb64);
        break;
    }
    case 2: {
        s32 previous = FIELD(s32, scene, 0xb74)++;
        if (previous >= 5) ++FIELD(s32, scene, 0xb64);
        break;
    }
    case 3:
        Sound_Reset(gSoundContext);
        OS_Halt();
        break;
    }
    return 2;
}

/*
 * Initializes a 0x6C-byte child with pointers/indices `arg1`..`arg3`, derives
 * its base X coordinate at +0x48 from index `arg2` (12, 88, 136, 192, or 282),
 * sets Y +0x4C to 144, clears +0x64, and resets controller +0x18 and resource
 * set +0x0C. Returns the resource-reset result, normally the embedded set.
 */
extern "C" void *func_ov032_02200f88(void *child, void *arg1, u32 arg2, void *arg3)
{
    FIELD(void *, child, 0) = arg1;
    FIELD(u32, child, 4) = arg2;
    FIELD(void *, child, 8) = arg3;
    switch (arg2) {
    case 0: FIELD(s32, child, 0x48) = 0xc; break;
    case 1: FIELD(s32, child, 0x48) = 0xc8 - (3 - arg2) * 0x38; break;
    case 2:
    case 3: FIELD(s32, child, 0x48) = 0xc0 - (3 - arg2) * 0x38; break;
    case 4: FIELD(s32, child, 0x48) = 0x11a; break;
    }
    FIELD(s32, child, 0x4c) = 0x90;
    FIELD(s32, child, 0x64) = 0;
    func_ov032_0220147c((u8 *)child + 0x18);
    return AnimationResourceState_ReleaseResources((u8 *)child + 0xc);
}
