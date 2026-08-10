#include "tingle/types.h"

/*
 * Overlay 43 controller destruction. These recovered destructor variants
 * release every resource owned by the debug-style presentation controller.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_ov043_0220c4bc[];
extern "C" void *data_020f4e14;
extern "C" void *gDebugFont;
extern "C" void GraphicsSpriteGroup_Destroy(void *object);
extern "C" void GraphicsSpriteRenderer_QueuePaletteUploads(void *font);
extern "C" void OverlaySlot_Destroy(void *object);
extern "C" void func_ov043_0220b740(void *component);
extern "C" void func_02071eb8(void *object);
extern "C" void func_020927b8(void *object);
extern "C" void Heap_Free(void *allocation);

/* Release resources shared by the non-deleting and deleting destructors. */
static void destroy_members(void *object)
{
    FIELD(void *, object, 0) = data_ov043_0220c4bc;
    FIELD(u32, object, 0x20) &= ~0x400;

    void *child = FIELD(void *, object, 0x2f4);
    if (child) {
        void **vtable = FIELD(void **, child, 0);
        ((void (*)(void *))vtable[2])(child);
    }
    if (FIELD(void *, object, 0x8c))
        GraphicsSpriteGroup_Destroy(FIELD(void *, object, 0x8c));
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14);
    GraphicsSpriteRenderer_QueuePaletteUploads(gDebugFont);
    OverlaySlot_Destroy((u8 *)object + 0x2e8);
    OverlaySlot_Destroy((u8 *)object + 0x2dc);
    func_ov043_0220b740((u8 *)object + 0x1e8);
    func_ov043_0220b740((u8 *)object + 0x13c);
    func_ov043_0220b740((u8 *)object + 0x90);
    func_02071eb8((u8 *)object + 0x80);
    func_020927b8((u8 *)object + 0x5c);
}

/*
 * Destroy a controller without freeing its storage and return the original
 * pointer. It clears flag 0x400 and releases the optional virtual child at
 * +0x2F4, touch object +0x8C, font resources, embedded SDK objects, canvases,
 * and base scene. Virtual calls and SDK releases are observable side effects.
 */
extern "C" void *func_ov043_0220b864(void *object)
{
    destroy_members(object);
    return object;
}

/*
 * Destroy a controller, free its allocation with Heap_Free, and return the
 * now-invalid original address for ABI compatibility. Resource effects are
 * identical to func_ov043_0220b864 before the final heap release.
 */
extern "C" void *func_ov043_0220b90c(void *object)
{
    destroy_members(object);
    Heap_Free(object);
    return object;
}
