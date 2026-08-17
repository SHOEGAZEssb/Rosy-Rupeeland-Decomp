#include "tingle/types.h"

/* Overlay 25 caller-owned and heap-owned main-scene teardown paths. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u8 data_ov025_02203318[];
extern const u8 data_ov025_02203370[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void __destroy_arr(void *, s32, s32, void *);
extern void Sound_ReleaseGroup(void *, s32);
extern void AnimationResourceState_Destroy(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern void func_020926f8(void *);
extern void func_020927b8(void *);
extern void PresentationList_DeleteAll(void *);
extern void func_ov025_021fdec8(void *);
extern void func_ov025_021ff1c8(void *);
extern void func_ov094_022196a4(void *);
#ifdef __cplusplus
}
#endif

/* Expand virtual deletion at each retail teardown site; no helper is emitted. */
#define VIRTUAL_DESTROY(object)                                                \
    do {                                                                       \
        void *destroy_object = (object);                                       \
        if (destroy_object != 0) {                                             \
            typedef void (*Destructor)(void *);                                \
            ((Destructor)FIELD(void *, FIELD(void *, destroy_object, 0), 4))(  \
                destroy_object);                                               \
        }                                                                      \
    } while (0)

/*
 * The two retail destructors contain this teardown sequence independently.
 * Keep it as a source macro so both recovered functions emit their own code.
 */
#define CLEANUP_SCENE(scene)                                                   \
    do {                                                                       \
        FIELD(const void *, scene, 0) = data_ov025_02203370;                   \
        FIELD(u32, scene, 0x20) &= ~0x400u;                                    \
        Sound_ReleaseGroup(gSoundContext, 0x16f);                                   \
        PresentationList_DeleteAll((u8 *)scene + 0x4f8);                                    \
        VIRTUAL_DESTROY(FIELD(void *, scene, 0x50c));                          \
        void *overlay94 = FIELD(void *, scene, 0x5c0);                         \
        if (overlay94 != 0) {                                                  \
            func_ov094_022196a4(overlay94);                                    \
            Heap_Free(overlay94);                                              \
        }                                                                      \
        *(volatile u16 *)0x04000050 = 0;                                       \
        *(volatile u16 *)0x04001050 = 0;                                       \
        for (s32 i = 0; i < 3; ++i) {                                         \
            void *widget = FIELD(void *, (u32)scene + (i << 2), 0xe4);        \
            if (widget == 0) continue;                                         \
            GraphicsSpriteGroup_Destroy(FIELD(void *, widget, 0xc));           \
            func_020927b8((u8 *)widget + 0x30);                                \
            AnimationResourceState_Destroy(widget);                                             \
            Heap_Free(widget);                                                 \
        }                                                                      \
        void *name_entry = FIELD(void *, scene, 0x598);                        \
        if (name_entry != 0) {                                                 \
            GraphicsSpriteGroup_Destroy(FIELD(void *, name_entry, 0));         \
            AnimationResourceState_Destroy((u8 *)name_entry + 4);                               \
            Heap_Free(name_entry);                                             \
        }                                                                      \
        VIRTUAL_DESTROY(FIELD(void *, scene, 0x59c));                          \
        GraphicsSpriteGroup_Destroy(FIELD(void *, scene, 0xb0));               \
        GraphicsSpriteGroup_Destroy(FIELD(void *, scene, 0xb4));               \
        GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14);             \
        func_020927b8((u8 *)scene + 0x574);                                    \
        func_020926f8((u8 *)scene + 0x530);                                    \
        FIELD(const void *, scene, 0x4f8) = data_ov025_02203318;               \
        PresentationList_DeleteAll((u8 *)scene + 0x4f8);                                    \
        __destroy_arr((u8 *)scene + 0x2f4, 3, 0xac,                            \
                      (void *)func_ov025_021ff1c8);                             \
        func_ov025_021fdec8((u8 *)scene + 0x248);                              \
        func_ov025_021fdec8((u8 *)scene + 0x19c);                              \
        func_ov025_021fdec8((u8 *)scene + 0xf0);                               \
        AnimationResourceState_Destroy((u8 *)scene + 0xa4);                                     \
        AnimationResourceState_Destroy((u8 *)scene + 0x98);                                     \
        AnimationResourceState_Destroy((u8 *)scene + 0x8c);                                     \
        AnimationResourceState_Destroy((u8 *)scene + 0x80);                                     \
        AnimationResourceState_Destroy((u8 *)scene + 0x74);                                     \
        AnimationResourceState_Destroy((u8 *)scene + 0x68);                                     \
        AnimationResourceState_Destroy((u8 *)scene + 0x5c);                                     \
    } while (0)

/*
 * Release every scene-owned object and resource while retaining caller-owned
 * scene storage. Graphics, input, blend-register, heap, and audio state change;
 * return the original scene pointer.
 */
extern "C" void *func_ov025_021ffa6c(void *scene)
{
    CLEANUP_SCENE(scene);
    return scene;
}

/*
 * Perform the same complete teardown as func_ov025_021FFA6C, then free the
 * scene allocation. Return the now-invalid original pointer value.
 */
extern "C" void *func_ov025_021ffc30(void *scene)
{
    CLEANUP_SCENE(scene);
    Heap_Free(scene);
    return scene;
}
