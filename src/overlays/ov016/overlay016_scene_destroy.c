#include "tingle/types.h"

/* Overlay 16 main scene destruction and deleting-destruction paths. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *gDebugFont;
extern const u32 data_ov016_02201540[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void func_02071eb8(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern void func_020926f8(void *);
extern void func_020927b8(void *);
extern void func_ov000_021fb848(void *);
extern void func_ov016_021fd06c(void *);
extern void func_ov016_021fd97c(void *);
extern void func_ov016_021fe0d4(void *);
extern void func_ov016_021fe24c(void *);
#ifdef __cplusplus
}
#endif

/* Delete a nonnull polymorphic object through vtable slot +4. */
static void overlay016_delete_virtual(void *object)
{
    typedef void (*DeleteFunction)(void *);
    if (object != 0) {
        DeleteFunction *vtable = *(DeleteFunction **)object;
        vtable[1](object);
    }
}

/* Release every owned subobject and embedded resource in the main scene. */
static void overlay016_release_scene(void *state)
{
    void *object;

    FIELD(u32, state, 0x20) &= ~0x400u;
    object = FIELD(void *, state, 0x470);
    if (object != 0) {
        func_ov016_021fe24c(object);
        Heap_Free(object);
    }
    object = FIELD(void *, state, 0x450);
    if (object != 0) {
        func_ov000_021fb848(object);
        Heap_Free(object);
    }
    overlay016_delete_virtual(FIELD(void *, state, 0x44c));
    object = FIELD(void *, state, 0x448);
    if (object != 0) {
        func_ov016_021fd97c(object);
        Heap_Free(object);
    }
    object = FIELD(void *, state, 0x444);
    if (object != 0) {
        func_ov016_021fd06c(object);
        Heap_Free(object);
    }
    overlay016_delete_virtual(FIELD(void *, state, 0x460));
    overlay016_delete_virtual(FIELD(void *, state, 0x464));
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0xe0));

    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14);
    GraphicsSpriteRenderer_QueuePaletteUploads(gDebugFont);

    func_ov016_021fe0d4((u8 *)state + 0x398);
    func_ov016_021fe0d4((u8 *)state + 0x2ec);
    func_ov016_021fe0d4((u8 *)state + 0x240);
    func_ov016_021fe0d4((u8 *)state + 0x194);
    func_ov016_021fe0d4((u8 *)state + 0xe8);
    func_02071eb8((u8 *)state + 0xd4);
    func_02071eb8((u8 *)state + 0xc8);
    func_020926f8((u8 *)state + 0x84);
    func_020927b8((u8 *)state + 0x60);
}

/*
 * Restore vtable 0x02201540 and release every optional list, panel, actor-group,
 * and polymorphic child plus all embedded resources. Clear state bit 10 and both
 * engines' blend-control registers at 0x04000050/0x04001050, reset the main and
 * debug font managers, and return state without freeing it. Heap/SDK graphics
 * resources are released and the two volatile MMIO writes disable blending.
 */
extern "C" void *func_ov016_021feaa4(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov016_02201540;
    overlay016_release_scene(state);
    return state;
}

/*
 * Perform the same full scene cleanup as func_ov016_021FEAA4, then free the scene
 * allocation and return its former pointer. Heap/SDK resources are released and
 * main/sub blend-control registers are cleared through direct MMIO writes.
 */
extern "C" void *func_ov016_021fec0c(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov016_02201540;
    overlay016_release_scene(state);
    Heap_Free(state);
    return state;
}
