#include "tingle/types.h"

/* Overlay 29 scene resource teardown and deleting-destructor variants. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14[];
extern void *data_020f4e18[];
extern void *gGamePhaseRuntime;
extern void *gDebugFont;
extern const u8 data_ov029_021fecfc[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void RuntimePresentationManager_BroadcastSlot1C(void *, s32);
extern void GraphicsArchive_ReleasePaletteResource(void *, void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern void func_020927b8(void *);
extern void func_ov002_021fb9c4(void *);
extern void func_ov045_0220b8cc(void *);
extern void func_ov045_0220d2d8(s32);
#ifdef __cplusplus
}
#endif

static void Overlay029_DestroyPointer(void *object)
{
    if (object != 0) {
        typedef void (*Destructor)(void *);
        FIELD(Destructor *, object, 0)[1](object);
    }
}

static void Overlay029_TearDown(void *state)
{
    FIELD(const void *, state, 0) = data_ov029_021fecfc;
    FIELD(u32, state, 0x20) &= ~0x400u;
    if (FIELD(s32, state, 0x70) != -1)
        func_ov045_0220d2d8(FIELD(s32, state, 0x70));
    void *child = FIELD(void *, state, 0xd0);
    if (child != 0) {
        func_ov045_0220b8cc(child);
        Heap_Free(child);
    }
    child = FIELD(void *, state, 0xa8);
    if (child != 0) {
        func_ov002_021fb9c4(child);
        Heap_Free(child);
    }
    Overlay029_DestroyPointer(FIELD(void *, state, 0xa0));
    Overlay029_DestroyPointer(FIELD(void *, state, 0xa4));
    Overlay029_DestroyPointer(FIELD(void *, state, 0x9c));
    GraphicsArchive_ReleasePaletteResource(data_020f4e18[0], FIELD(void *, state, 0xe8));
    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14[0]);
    GraphicsSpriteRenderer_QueuePaletteUploads(gDebugFont);
    RuntimePresentationManager_BroadcastSlot1C((u8 *)gGamePhaseRuntime + 0x2f7c, 0);
    func_020927b8((u8 *)state + 0x78);
}

/*
 * Restores vtable 0x021FECFC, clears active bit 0x400, releases optional handle
 * +0x70, owned children +0xD0/+0xA8, virtually destroys objects +0xA0/+0xA4/
 * +0x9C, releases resource +0xE8 and manager +0x78, clears main/sub blend
 * registers, releases both fonts, and disables the global mode configured by
 * the constructor. Returns `state` without freeing it; heap, SDK, external
 * overlay, and Nintendo DS MMIO state change.
 */
extern "C" void *func_ov029_021fd174(void *state)
{
    Overlay029_TearDown(state);
    return state;
}

/*
 * Performs the full teardown of `func_ov029_021fd174`, then frees `state` and
 * returns its former address. All scene-owned heap, SDK, and hardware state is
 * released or restored.
 */
extern "C" void *func_ov029_021fd2a0(void *state)
{
    Overlay029_TearDown(state);
    Heap_Free(state);
    return state;
}
