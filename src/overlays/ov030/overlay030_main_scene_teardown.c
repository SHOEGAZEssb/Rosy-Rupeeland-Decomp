#include "tingle/types.h"

/* Overlay 30 main scene resource teardown and display-state restoration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov030_021ff8b0[];
extern void *data_020f4e18[];
extern void *data_020f4e14[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void func_ov045_0220d2d8(s32);
extern void func_0207419c(void *);
extern void func_ov045_0220b8cc(void *);
extern void *func_ov030_021fd27c(void *);
extern void func_02071c38(void *, void *);
extern void func_02075a88(void *);
extern void func_02075630(void *);
extern void func_ov030_021fcf18(void *);
extern void func_02071eb8(void *);
extern void func_020927b8(void *);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay030Destructor)(void *);

/* Invokes vtable slot 1 on a non-null owned polymorphic child. */
static void destroy_owned_child(void *child)
{
    if (child != 0) {
        void **vtable = FIELD(void **, child, 0);
        ((Overlay030Destructor)vtable[1])(child);
    }
}

/* Shared implementation of the two recovered teardown entry points. */
static void teardown_main_scene(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov030_021ff8b0;
    FIELD(u32, scene, 0x20) &= ~0x400;
    if (FIELD(s32, scene, 0x35c) != -1)
        func_ov045_0220d2d8(FIELD(s32, scene, 0x35c));
    func_0207419c(FIELD(void *, scene, 0x78));

    void *object = FIELD(void *, scene, 0x2c8);
    if (object != 0) {
        func_ov045_0220b8cc(object);
        Heap_Free(object);
    }
    object = FIELD(void *, scene, 0x2c4);
    if (object != 0) {
        func_ov030_021fd27c(object);
        Heap_Free(object);
    }
    destroy_owned_child(FIELD(void *, scene, 0x2c0));
    destroy_owned_child(FIELD(void *, scene, 0x2bc));
    func_02071c38(data_020f4e18[0], FIELD(void *, scene, 0x360));

    /* Disable both engines' blend coefficients and clear display-mode bits. */
    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    *(volatile u32 *)0x04000000 &= ~0xe000;
    func_02075a88(data_020f4e14[0]);
    func_02075630(data_020f4e14[0]);
    func_02075630(gDebugFont);
    func_ov030_021fcf18((u8 *)scene + 0x210);
    func_ov030_021fcf18((u8 *)scene + 0x164);
    func_ov030_021fcf18((u8 *)scene + 0xb8);
    func_02071eb8((u8 *)scene + 0x94);
    func_02071eb8((u8 *)scene + 0x88);
    func_02071eb8((u8 *)scene + 0x7c);
    func_020927b8((u8 *)scene + 0x54);
}

/*
 * Tears down `scene` without freeing its storage. It stops an active overlay-45
 * handle, releases renderer/auxiliary/widget/dialog/archive resources, clears
 * both engines' blend registers and main DISPCNT mode bits 13..15, and destroys
 * controller/resource/config subobjects. Returns `scene`; heap storage remains
 * caller-owned, while SDK, heap-child, and display hardware state change.
 */
extern "C" void *func_ov030_021fdf78(void *scene)
{
    teardown_main_scene(scene);
    return scene;
}

/*
 * Performs the same teardown and hardware restoration as 0x021FDF78, then
 * frees `scene` itself. It returns the original pointer value after freeing it,
 * matching the recovered ABI; callers must not dereference that result.
 */
extern "C" void *func_ov030_021fe0c4(void *scene)
{
    teardown_main_scene(scene);
    Heap_Free(scene);
    return scene;
}
