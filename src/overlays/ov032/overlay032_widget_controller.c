#include "tingle/types.h"
#include "tingle/heap.h"

/* Overlay 32 controller scale interpolation and detail-widget lifecycle/positioning. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern u8 data_021f5f18[];
extern void *data_020f4e14[];
extern void *data_020f4e18[];
extern const u8 data_ov032_02202350[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020beb18(...);
extern s32 func_020be8c0(...);
extern s32 func_020beb6c(...);
extern s32 func_020beae4(...);
extern s32 func_020adc90(...);
extern void GraphicsArchiveResource_ReleaseAlternateBuffer(void *);
extern void func_020708c4(void *);
extern void func_02070958(...);
extern void GraphicsSpriteRenderer_QueueStatePaletteUploads(...);
extern void Overlay032Controller_CreateObject(...);
extern void func_ov032_0220147c(void *);
extern void func_ov032_022014c0(...);
extern void func_ov032_021fe0c4(void *);
extern void *GraphicsArchive_AcquireVfdResource(...);
extern void GraphicsSpriteRenderer_SetFontResource(...);
extern void *GraphicsSpriteRenderer_GetObjectPaletteAddress(void *);
extern void GraphicsSpriteRenderer_QueuePaletteUploads(void *);
extern void GraphicsArchive_ReleaseResourceE4(...);
extern void GraphicsSpriteRenderer_ClearFontResource(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void Heap_Free(void *);
extern void *func_ov032_02201f80(...);
extern void InventoryScroll_SetSpritePriority(...);
extern void InventoryScroll_UpdatePresentation(void *);
extern void InventoryScroll_DestroyAlternate(void *);
#ifdef __cplusplus
}
#endif

static s32 scale_from_value(s32 value)
{
    s32 angle = func_020beb18(value << 12);
    s32 transformed = value > 0 ? func_020be8c0(0x3f000000, angle)
                                : func_020beb6c(angle, 0x3f000000);
    return func_020beae4(transformed);
}

static void apply_scale(void *controller)
{
    s32 scalar = FIELD(s32, controller, 0x18) >> 12;
    void *map = FIELD(void *, FIELD(void *, controller, 4), 4);
    func_02070958(map, scalar, scalar, scalar);
}

/*
 * Sets the scale target `value` on `controller`. With zero `frames`, it clears
 * +0x20, computes and applies the target immediately, resetting the associated
 * map first. Otherwise it stores duration +0x20 and target +0x24 and computes
 * per-frame fixed-point delta +0x1C from current scale +0x18. A null object at
 * +0x00 makes this a no-op. Returns void.
 */
extern "C" void Overlay032Controller_SetScaleTarget(void *controller, s32 value, s32 frames)
{
    if (FIELD(void *, controller, 0) == 0) return;
    if (frames == 0) {
        FIELD(s32, controller, 0x20) = 0;
        FIELD(s32, controller, 0x18) = scale_from_value(value);
        void *map = FIELD(void *, FIELD(void *, controller, 4), 4);
        GraphicsArchiveResource_ReleaseAlternateBuffer(map);
        func_020708c4(map);
        apply_scale(controller);
        return;
    }
    FIELD(s32, controller, 0x20) = frames;
    FIELD(s32, controller, 0x24) = value;
    FIELD(s32, controller, 0x1c) = func_020adc90(
        scale_from_value(value) - FIELD(s32, controller, 0x18), scale_from_value(frames));
    void *map = FIELD(void *, FIELD(void *, controller, 4), 4);
    GraphicsArchiveResource_ReleaseAlternateBuffer(map);
    func_020708c4(map);
    apply_scale(controller);
}

/*
 * Advances a scale transition from +0x20/+0x1C, applies the scalar to the
 * associated map and refreshes the renderer/object pair at +0x08/+0x00. The
 * final frame snaps to the transformed target +0x24. Returns one when idle or
 * newly complete, zero while frames remain.
 */
extern "C" s32 Overlay032Controller_UpdateScale(void *controller)
{
    s32 frames = FIELD(s32, controller, 0x20);
    if (frames == 0) return 1;
    FIELD(s32, controller, 0x20) = --frames;
    if (frames == 0) FIELD(s32, controller, 0x18) = scale_from_value(FIELD(s32, controller, 0x24));
    else FIELD(s32, controller, 0x18) += FIELD(s32, controller, 0x1c);
    apply_scale(controller);
    GraphicsSpriteRenderer_QueueStatePaletteUploads(FIELD(void *, FIELD(void *, controller, 8), 0), FIELD(void *, controller, 0));
    return frames == 0;
}

/*
 * Constructs the detail widget at `widget` for `scene`: retains the complete
 * history count while clamping the last initially visible row to four, creates
 * its sprite controller at +0x18, loads archive resource 0x7006 at +0x48,
 * patches three confirmed tilemap halfwords, allocates the 0x80-byte list
 * object at +0x4C, and initializes it for every history row. Returns void.
 */
extern "C" void func_ov032_0220173c(void *widget, void *scene)
{
    FIELD(void *, widget, 0) = scene;
    FIELD(s32, widget, 0x10) = 0;
    FIELD(s32, widget, 8) = 0;
    s32 last = FIELD(s32, data_021f5f18, 0x460) - 1;
    s32 visibleLast = last + 1 >= 5 ? 4 : last;
    FIELD(s32, widget, 0xc) = last;
    FIELD(s32, widget, 0x14) = visibleLast;
    Overlay032Controller_CreateObject((u8 *)widget + 0x18, FIELD(void *, scene, 0), (u8 *)scene + 0x28);
    func_ov032_022014c0((u8 *)widget + 0x18, 0x15, 0x15, 0x78, 0x24, 2, 0, 4, 0);
    FIELD(u16, FIELD(void *, widget, 0x18), 0x24) &= ~4;
    FIELD(s32, widget, 4) = 0;
    FIELD(void *, widget, 0x48) = GraphicsArchive_AcquireVfdResource(data_020f4e18[0], 0x7006);
    GraphicsSpriteRenderer_SetFontResource(data_020f4e14[0], FIELD(void *, widget, 0x48));
    u8 *map = (u8 *)GraphicsSpriteRenderer_GetObjectPaletteAddress(data_020f4e14[0]);
    FIELD(u16, map, 4) = 0x4210;
    FIELD(u16, map, 6) = 0x4a52;
    FIELD(u16, map, 8) = 0x294a;
    void *list = Heap_Alloc(0x80, (const char *)data_ov032_02202350, 4,
                            &gHeapContext);
    if (list != 0) list = func_ov032_02201f80(list, data_020f4e14[0], last + 1, 5, 0xd4, 0x28, 0);
    FIELD(void *, widget, 0x4c) = list;
    InventoryScroll_SetSpritePriority(list, 2);
    InventoryScroll_UpdatePresentation(list);
}

/*
 * Tears down the detail widget: clears the shared canvas, detaches controller
 * +0x18, releases archive resource +0x48, resets the canvas, and virtually
 * destroys list object +0x4C when present. Returns void; fields are not cleared.
 */
extern "C" void func_ov032_022018ac(void *widget)
{
    GraphicsSpriteRenderer_QueuePaletteUploads(data_020f4e14[0]);
    func_ov032_0220147c((u8 *)widget + 0x18);
    GraphicsArchive_ReleaseResourceE4(data_020f4e18[0], FIELD(void *, widget, 0x48));
    GraphicsSpriteRenderer_ClearFontResource(data_020f4e14[0]);
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14[0]);
    void *list = FIELD(void *, widget, 0x4c);
    if (list != 0) {
        typedef void (*VirtualDestructor)(void *);
        void **vtable = FIELD(void **, list, 0);
        ((VirtualDestructor)vtable[1])(list);
    }
}

/* Runs SDK destructor 0x02094494, frees `object` from the heap, and returns the original pointer. */
extern "C" void *func_ov032_02201914(void *object)
{
    InventoryScroll_DestroyAlternate(object);
    Heap_Free(object);
    return object;
}

/* Positions widget sprite +0x18 at X=120 and Y=36+24*([+0x4C]+0x14-[+0x4C]+0x0C); returns void. */
extern "C" void func_ov032_02201930(void *widget)
{
    void *list = FIELD(void *, widget, 0x4c);
    void *object = FIELD(void *, widget, 0x18);
    FIELD(u16, object, 0x2c) = 0x78;
    FIELD(u16, object, 0x2e) = (u16)(0x24 +
        (FIELD(s32, list, 0x14) - FIELD(s32, list, 0xc)) * 0x18);
}
