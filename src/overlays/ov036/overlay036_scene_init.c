#include "tingle/types.h"

/* Overlay 36 top-level graphics scene initialization and controller dispatch. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02206124[];
extern const u8 data_ov036_022061a8[];
extern const u8 data_ov036_022061b0[];
extern const s32 data_ov036_02205af0[];
extern void *data_020f4e14;
extern void *gDebugFont;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02091e28(void *scene);
extern void func_02092364(void *state);
extern void func_ov043_0220b740(void *state);
extern void G3X_Init(void);
extern void func_020923a4(void *state);
extern void func_02075238(void *resource);
extern void GraphicsSpriteRenderer_HideAllSprites(void *resource);
extern void func_020ae6dc(void);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *Graphics3DResourceOwner_Init(void *object, s32 first, s32 second);
extern void func_ov048_0220b7b8(void *state);
extern void func_02092850(s32 value);
extern void func_020b0300(s32, s32, s32, s32, s32);
extern void *func_ov036_021fea14(void *, void *, s32);
extern void *func_ov036_021ff214(void *, void *, s32);
extern void *func_ov036_0220059c(void *, void *, s32);
extern void *func_ov036_0220102c(void *, void *, s32);
extern void *func_ov036_022021b0(void *, void *, s32);
extern void *func_ov036_022029d8(void *, void *, s32);
extern void *func_ov036_02203db0(void *, void *, s32);
extern void func_ov036_022045ac(void *state, s32 value24, s32 value28);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the top-level overlay-36 graphics scene. selector is stored as
 * an absolute value at +0x54, with +0x58 recording whether it was negative.
 * Common scene, transform +0x64, shared state +0x98, G3X, archive/debug-font,
 * and render state are initialized. A 0x624-byte owner/manager object at +0x5C
 * is constructed with parameters 4 and 2.
 *
 * Controller +0x60 is selected by the recovered dispatch. Negative selectors
 * allocate 0x120 bytes and call func_ov036_021fea14. Nonnegative selector
 * 0x258 creates the 0x1A4 ramp controller, 0x259 the 0x148 orbit controller.
 * Values 0x64/67/6A create the 0x160 quad controller; 0x65/68/6B create the
 * 0x1A4 composite controller; 0x66/69/6C create the 0x134 final controller.
 * All other values create the 0x138 multi-effect controller. Allocation tag
 * data_ov036_022061b0 and the scene owner +0x5C are shared by all cases.
 * Scene flag +0x20 bit 0x400 is set and +0x24/+0x28 are initialized from the
 * two-word data_ov036_02205af0 record. Returns scene; heap, archive/font,
 * renderer/GX, owner, controller, flags, and pair state change.
 */
extern "C" void *func_ov036_022045d4(void *scene, s32 selector)
{
    func_02091e28(scene);
    FIELD(const void *, scene, 0) = data_ov036_02206124;
    func_02092364((u8 *)scene + 0x64);
    func_ov043_0220b740((u8 *)scene + 0x98);
    FIELD(s32, scene, 0x54) = selector;
    FIELD(s32, scene, 0x58) = 0;
    if (FIELD(s32, scene, 0x54) < 0) {
        FIELD(s32, scene, 0x54) = -FIELD(s32, scene, 0x54);
        FIELD(s32, scene, 0x58) = 1;
    }
    G3X_Init();
    FIELD(s32, scene, 0x50) = 0;
    func_020923a4((u8 *)scene + 0x64);
    func_02075238(data_020f4e14);
    GraphicsSpriteRenderer_HideAllSprites(data_020f4e14);
    func_02075238(gDebugFont);
    GraphicsSpriteRenderer_HideAllSprites(gDebugFont);
    func_020ae6dc();

    void *owner = Heap_Alloc(0x624, data_ov036_022061a8, 4, gHeapContext);
    if (owner != 0)
        owner = Graphics3DResourceOwner_Init(owner, 4, 2);
    FIELD(void *, scene, 0x5c) = owner;
    func_ov048_0220b7b8((u8 *)scene + 0x98);
    FIELD(s32, scene, 0x48) = 0x11;
    func_02092850(0);
    func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
    FIELD(void *, scene, 0x60) = 0;

    s32 value = FIELD(s32, scene, 0x54);
    void *controller;
    if (FIELD(s32, scene, 0x58) == 1) {
        controller = Heap_Alloc(0x120, data_ov036_022061b0, 4, gHeapContext);
        if (controller != 0)
            controller = func_ov036_021fea14(controller, owner, value);
    } else if (value == 0x258) {
        controller = Heap_Alloc(0x1a4, data_ov036_022061b0, 4, gHeapContext);
        if (controller != 0)
            controller = func_ov036_0220102c(controller, owner, value);
    } else if (value == 0x259) {
        controller = Heap_Alloc(0x148, data_ov036_022061b0, 4, gHeapContext);
        if (controller != 0)
            controller = func_ov036_0220059c(controller, owner, value);
    } else if (value >= 0x64 && value <= 0x6c &&
               ((value - 0x64) % 3) == 0) {
        controller = Heap_Alloc(0x160, data_ov036_022061b0, 4, gHeapContext);
        if (controller != 0)
            controller = func_ov036_022021b0(controller, owner, value);
    } else if (value >= 0x64 && value <= 0x6c &&
               ((value - 0x64) % 3) == 1) {
        controller = Heap_Alloc(0x1a4, data_ov036_022061b0, 4, gHeapContext);
        if (controller != 0)
            controller = func_ov036_022029d8(controller, owner, value);
    } else if (value >= 0x64 && value <= 0x6c &&
               ((value - 0x64) % 3) == 2) {
        controller = Heap_Alloc(0x134, data_ov036_022061b0, 4, gHeapContext);
        if (controller != 0)
            controller = func_ov036_02203db0(controller, owner, value);
    } else {
        controller = Heap_Alloc(0x138, data_ov036_022061b0, 4, gHeapContext);
        if (controller != 0)
            controller = func_ov036_021ff214(controller, owner, value);
    }
    FIELD(void *, scene, 0x60) = controller;
    FIELD(u32, scene, 0x20) |= 0x400;
    func_ov036_022045ac(scene,
                        data_ov036_02205af0[0],
                        data_ov036_02205af0[1]);
    return scene;
}
