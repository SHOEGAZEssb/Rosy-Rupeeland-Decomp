#include "tingle/types.h"

/* Overlay 26 repeated textured-panel renderer and three-panel owner construction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;
extern const u8 data_ov026_0220497c[];
extern const u8 data_ov026_02204a50[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void *func_02071adc(void *, s32);
extern s32 func_02070454(void *);
extern s32 func_02070464(void *);
extern s32 Graphics3DResourceBinding_GetTextureFormat(void *);
extern s32 Graphics3DResourceBinding_GetTextureWidthClass(void *);
extern s32 Graphics3DResourceBinding_GetTextureHeightClass(void *);
extern void func_020948d4(void *, s32);
extern void func_020949ec(void *);
extern void func_02094bbc(void *, s32, s32, s32);
extern void *func_ov026_021fce54(void *, void *, s32, u16);
extern void func_ov026_021fd900(u32, u32, u32, u32, u32, u32, u32, u32);
extern void func_ov026_021fd940(u32, s32);
extern void func_ov026_021fd964(u32, u32, u32, u32, u32, u32);
extern void func_ov026_021fd990(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Draws +0xA0 textured quads from model resource +0x9C. Translation comes from
 * +0x10..+0x30; each panel advances texture parameter +0xA4 and uses color
 * +0xA8/polygon +0xAA. Resource dimensions define the quad size. The routine
 * emits packed vertices and texture/material commands directly to the DS G3
 * FIFO, triggers buffer swap, and returns void.
 */
extern "C" void func_ov026_021fea4c(void *object)
{
    volatile u32 *const matrix = (volatile u32 *)0x04000444;
    *matrix = 0;
    *matrix = FIELD(u32, object, 0x10);
    *matrix = FIELD(u32, object, 0x20);
    *matrix = FIELD(u32, object, 0x30);

    void *resource = FIELD(void *, object, 0x9c);
    s32 a = Graphics3DResourceBinding_GetTextureFormat(resource);
    s32 b = Graphics3DResourceBinding_GetTextureWidthClass(resource);
    s32 c = Graphics3DResourceBinding_GetTextureHeightClass(resource);
    func_ov026_021fd900(a, 1, b, c, 3, 0, 0,
                        FIELD(s32, FIELD(void *, resource, 0x10), 0xc));
    func_ov026_021fd940(FIELD(s32, FIELD(void *, resource, 0x14), 0xc),
                        Graphics3DResourceBinding_GetTextureFormat(resource));
    s32 width = func_02070454(FIELD(void *, resource, 4)) << 12;
    s32 height = func_02070464(FIELD(void *, resource, 4)) << 12;

    for (s32 i = 0; i < FIELD(s32, object, 0xa0); ++i) {
        s16 texture = (s16)(i * FIELD(s32, object, 0xa4));
        func_ov026_021fd964(0, 0, 3, i + 4,
                            FIELD(u16, object, 0xaa), 0);
        *(volatile u32 *)0x04000500 = 1;
        *(volatile u32 *)0x04000480 = FIELD(u16, object, 0xa8);
        *(volatile u32 *)0x04000488 = 0;
        *(volatile u32 *)0x0400048c = (u16)(texture | 0xf000);
        *(volatile u32 *)0x0400048c = 0x1000;
        func_ov026_021fd990(width, 0);
        *(volatile u32 *)0x04000494 = 0x10001000;
        func_ov026_021fd990(width, height);
        *(volatile u32 *)0x04000494 = 0xf0001000;
        func_ov026_021fd990(0, height);
        *(volatile u32 *)0x04000494 = 0xf000f000;
        *(volatile u32 *)0x04000504 = 0;
    }
    *(volatile u32 *)0x04000448 = 1;
}

/*
 * Sets panel count +0xA0, animation/control ID on subobject +0x1C, texture step
 * +0xA4, color +0xA8, and polygon/material value +0xAA. Returns void.
 */
extern "C" void func_ov026_021fec34(void *object, s32 count, s32 control_id,
                                     s32 texture_step, u16 color, u16 polygon)
{
    func_020948d4((u8 *)object + 0x1c, control_id);
    FIELD(s32, object, 0xa0) = count;
    FIELD(s32, object, 0xa4) = texture_step;
    FIELD(u16, object, 0xa8) = color;
    FIELD(u16, object, 0xaa) = polygon;
}

/*
 * Constructs a 0xAC-byte owner containing three allocated 0xB0 geometry-command
 * objects at +0xA0/+0xA4/+0xA8. It loads shared resource 0x5000, constructs
 * model entries 4, 5, and 6 with polygon 0x7FFF, initializes each transform to
 * zero, and selects control value 0x666. Returns `object`; allocations use heap 4.
 */
extern "C" void *func_ov026_021fec6c(void *object)
{
    func_020949ec(object);
    FIELD(const void *, object, 0) = data_ov026_0220497c;
    void *resource = func_02071adc(data_020f4e18, 0x5000);
    FIELD(void *, object, 0x9c) = resource;
    for (s32 i = 0; i < 3; ++i) {
        void *panel = Heap_Alloc(0xb0, data_ov026_02204a50, 4, gHeapContext);
        if (panel)
            panel = func_ov026_021fce54(panel, resource, i + 4, 0x7fff);
        FIELD(void *, object, 0xa0 + i * 4) = panel;
        func_02094bbc(panel, 0, 0, 0);
        func_020948d4((u8 *)panel + 0x6c, 0x666);
    }
    return object;
}
