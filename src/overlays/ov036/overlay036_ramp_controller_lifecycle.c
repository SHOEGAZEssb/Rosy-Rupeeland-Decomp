#include "tingle/types.h"

/* Overlay 36 ramp-controller teardown and alternating child emission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02206028[];
extern const u8 data_ov036_02205eac[];
extern const u8 data_ov036_02206160[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095308(void *list);
extern void Graphics3DResourceOwner_RemoveManager(void *manager);
extern void GraphicsResourceSetVariant_Destroy(void *resourceSet);
extern void Heap_Free(void *allocation);
extern s32 func_02091c7c(void *timer, s32 mode);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *manager, void *resourceSet);
extern void func_ov036_021ff050(void *handle, s32 mode,
                                s32 x, s32 y, s32 z,
                                s32 byte5A, s32 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_020955d8(void *object, void *handle);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_020956a4(void *object);
extern void func_020948e4(void *field, s32 mode, s32 value);
extern void func_02095274(void *list, void *object);
extern void func_02091b98(void *timer, s32 duration);
#ifdef __cplusplus
}
#endif

/*
 * Destroys a ramp controller without freeing it. Lists +0x148/+0x158 receive
 * two-phase common teardown, the object reached through manager +0x118/+0 is
 * released, and resource sets +0x10C/+0x100/+0xF4/+0xE8/+0xDC/+0xCC are
 * destroyed in that order. Returns controller; list, manager, and resource
 * ownership state change.
 */
extern "C" void *func_ov036_02201350(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02206028;
    func_02095308((u8 *)controller + 0x148);
    func_02095308((u8 *)controller + 0x158);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0x118), 0));
    FIELD(const void *, controller, 0x158) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x158);
    FIELD(const void *, controller, 0x148) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x148);
    const s32 offsets[] = {0x10c, 0x100, 0xf4, 0xe8, 0xdc, 0xcc};
    for (s32 i = 0; i < 6; ++i)
        GraphicsResourceSetVariant_Destroy((u8 *)controller + offsets[i]);
    return controller;
}

/*
 * Fully deletes the controller by performing the same list, manager, and six
 * resource-set teardown as func_ov036_02201350, then freeing it. Returns the
 * now-invalid original pointer, matching the recovered ABI.
 */
extern "C" void *func_ov036_022013dc(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02206028;
    func_02095308((u8 *)controller + 0x148);
    func_02095308((u8 *)controller + 0x158);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0x118), 0));
    FIELD(const void *, controller, 0x158) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x158);
    FIELD(const void *, controller, 0x148) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x148);
    const s32 offsets[] = {0x10c, 0x100, 0xf4, 0xe8, 0xdc, 0xcc};
    for (s32 i = 0; i < 6; ++i)
        GraphicsResourceSetVariant_Destroy((u8 *)controller + offsets[i]);
    Heap_Free(controller);
    return controller;
}

/*
 * When timer +0x184 completes, emits one handle-backed 0xA0-byte child from
 * manager +0x118/resource +0xDC. The handle uses byte 2 and flags 0x42. Toggle
 * +0x1A0 alternates X between -0x700 and +0x700 at Y=-0x800, Z=0. The child is
 * activated, receives a mode-1 +0x1C target 0x1200, duration 0x78, elapsed zero,
 * active +0x88=1, and enters list +0x148; timer +0x184 restarts at 0x1E.
 * It returns nothing; timer, heap, manager, child, list, and toggle state change.
 */
extern "C" void func_ov036_02201470(void *controller)
{
    if (func_02091c7c((u8 *)controller + 0x184, 2) == 0)
        return;
    void *handle = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, controller, 0x118),
                                  (u8 *)controller + 0xdc);
    func_ov036_021ff050(handle, 0, 0, 0, 0, 2, 0x42);
    void *child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = func_020955d8(child, handle);
    if (FIELD(s32, controller, 0x1a0) != 0) {
        FIELD(s32, controller, 0x1a0) = 0;
        func_02094bbc(child, -0x700, -0x800, 0);
    } else {
        FIELD(s32, controller, 0x1a0) = 1;
        func_02094bbc(child, 0x700, -0x800, 0);
    }
    func_020956a4(child);
    func_020948e4((u8 *)child + 0x1c, 1, 0x1200);
    FIELD(s32, child, 0x7c) = 0x78;
    FIELD(s32, child, 0x80) = 0;
    FIELD(s32, child, 0x88) = 1;
    func_02095274((u8 *)controller + 0x148, child);
    func_02091b98((u8 *)controller + 0x184, 0x1e);
}
