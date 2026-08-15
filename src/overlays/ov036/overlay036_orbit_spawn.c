#include "tingle/types.h"

/* Overlay 36 configured orbit-object allocation and five-handle attachment. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02206178[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_InterpolateLinear(s32, s32, s32, s32);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov036_02200234(void *object, s32 selector);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *manager, void *resourceSet);
extern void func_ov036_021ff050(void *handle, s32 mode,
                                s32 x, s32 y, s32 z,
                                s32 byte5A, s32 flags);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void PresentationList_Append(void *list, void *object);
extern void func_02091b98(void *timer, s32 duration);
#ifdef __cplusplus
}
#endif

/*
 * Allocates one 0xC4-byte orbit object from config {selector,duration}. A
 * grayscale 5:5:5 color is derived through Presentation_InterpolateLinear(31,0,6,selector).
 * Primary handle +0x9C uses mode (selector&1)+2; four handles +0xA0..+0xAC
 * alternate modes 0/1. All are created from manager +0x100/resource +0xDC,
 * use byte +0x5A=selector+0x18, flags 0x46, and receive color at +0x4E. Odd
 * selectors set mirror flag +0xB8, byte +0x59=3, and field +0x34=-0x1000 on
 * the four orbit handles. Position becomes (0,(selector-1)*0x280-0x600,
 * -selector*0x40), the object is appended to +0x11C, and timer +0xA4 starts
 * config duration. It returns nothing; heap, manager handles, list, timer, and
 * object state change. Allocation success is assumed after construction.
 */
extern "C" void func_ov036_022009b8(void *controller, const void *config)
{
    s32 selector = FIELD(s32, config, 0);
    s32 component = Presentation_InterpolateLinear(0x1f, 0, 6, selector);
    u16 color = (u16)(component | (component << 5) | (component << 10));
    void *orbit = Heap_Alloc(0xc4, data_ov036_02206178, 4, gHeapContext);
    if (orbit != 0)
        orbit = func_ov036_02200234(orbit, selector);

    void *handle = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, controller, 0x100),
                                  (u8 *)controller + 0xdc);
    FIELD(void *, orbit, 0x9c) = handle;
    func_ov036_021ff050(handle, (selector & 1) + 2, 0, 0, 0,
                        selector + 0x18, 0x46);
    FIELD(u16, handle, 0x4e) = color;

    for (s32 i = 0; i < 4; ++i) {
        handle = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, controller, 0x100),
                               (u8 *)controller + 0xdc);
        FIELD(void *, orbit, 0xa0 + i * 4) = handle;
        func_ov036_021ff050(handle, i & 1, 0, 0, 0,
                            selector + 0x18, 0x46);
        FIELD(u16, handle, 0x4e) = color;
        if ((selector & 1) != 0) {
            FIELD(s32, orbit, 0xb8) = 1;
            FIELD(u8, handle, 0x59) = 3;
            FIELD(s32, handle, 0x34) = -0x1000;
        }
    }

    Presentation_SetPosition(orbit, 0,
                   (selector - 1) * 0x280 - 0x600,
                   -(selector << 6));
    PresentationList_Append((u8 *)controller + 0x11c, orbit);
    func_02091b98((u8 *)controller + 0xa4, FIELD(s32, config, 4));
}
