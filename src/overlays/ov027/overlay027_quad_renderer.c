#include "tingle/types.h"

/* Overlay 27 textured-quad submission through Nintendo DS geometry registers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Graphics3DResourceBinding_GetTextureFormat(void *);
extern s32 Graphics3DResourceBinding_GetTextureWidthClass(void *);
extern s32 Graphics3DResourceBinding_GetTextureHeightClass(void *);
extern s32 func_02070454(void *);
extern s32 func_02070464(void *);
extern void func_ov027_021fd0b0(u32, u32, u32, u32, u32, u32, u32, u32);
extern void func_ov027_021fd0f0(u32, u32, u32, u32, u32, u32);
extern void func_ov027_021fd11c(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Draws the textured quad owned through object +0x9C. Translation comes from
 * +0x10/+0x20/+0x30; scale is fixed at (0x10000,0x10000,0x1000). Resource
 * accessors provide texture/polygon command fields and the resource at +4
 * supplies quad width/height. The routine emits four texture coordinates and
 * four packed vertices, brackets them with geometry begin/end writes, then
 * pops the matrix. Returns void and directly drives registers 0x04000444-
 * 0x04000504.
 */
extern "C" void func_ov027_021fcefc(void *object)
{
    volatile u32 *const matrix = (volatile u32 *)0x04000444;
    matrix[0] = 0;
    matrix[11] = FIELD(u32, object, 0x10);
    matrix[11] = FIELD(u32, object, 0x20);
    matrix[11] = FIELD(u32, object, 0x30);
    matrix[10] = 0x10000;
    matrix[10] = 0x10000;
    matrix[10] = 0x1000;

    void *resource = FIELD(void *, object, 0x9c);
    s32 field0 = Graphics3DResourceBinding_GetTextureFormat(resource);
    s32 field1 = Graphics3DResourceBinding_GetTextureWidthClass(resource);
    s32 field2 = Graphics3DResourceBinding_GetTextureHeightClass(resource);
    func_ov027_021fd0b0(field0, 1, field1, field2, 3, 0, 0,
                         FIELD(u32, FIELD(void *, resource, 0x10), 0xc));

    s32 shift = Graphics3DResourceBinding_GetTextureFormat(resource) == 2 ? 3 : 4;
    *(volatile u32 *)0x040004ac =
        FIELD(u32, FIELD(void *, resource, 0x14), 0xc) >> shift;

    void *dimensions = FIELD(void *, resource, 4);
    s32 width = func_02070454(dimensions) << 12;
    s32 height = func_02070464(dimensions) << 12;
    func_ov027_021fd0f0(0, 0, 3, 0x10, 0x1f, 0);

    *(volatile u32 *)0x04000500 = 1;
    *(volatile u32 *)0x04000480 = 0x7fff;
    func_ov027_021fd11c(0, height);
    *(volatile u32 *)0x0400048c = 0xff00ff80;
    *(volatile u32 *)0x0400048c = 0xe000;
    func_ov027_021fd11c(width, height);
    *(volatile u32 *)0x04000494 = 0xff000080;
    func_ov027_021fd11c(width, 0);
    *(volatile u32 *)0x04000494 = 0x01000080;
    func_ov027_021fd11c(0, 0);
    *(volatile u32 *)0x04000494 = 0x0100ff80;
    *(volatile u32 *)0x04000504 = 0;
    *(volatile u32 *)0x04000448 = 1;
}
