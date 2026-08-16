#include "tingle/graphics_3d_command.h"
#include "tingle/graphics_3d_render_object.h"

/*
 * Direct NDS geometry submission for a textured render object. The routine
 * resets matrix state, configures texture/palette addressing, and emits one
 * fixed-size textured quadrilateral at the object's retained depth.
 */

#define REG_G3_MTX_MODE (*(volatile u32 *)0x04000440)
#define REG_G3_MTX_PUSH (*(volatile u32 *)0x04000444)
#define REG_G3_MTX_POP (*(volatile u32 *)0x04000448)
#define REG_G3_MTX_IDENTITY (*(volatile u32 *)0x04000454)
#define REG_G3_COLOR (*(volatile u32 *)0x04000480)
#define REG_G3_TEXCOORD (*(volatile u32 *)0x04000488)
#define REG_G3_VTX_16 (*(volatile u32 *)0x0400048c)
#define REG_G3_VTX_XY (*(volatile u32 *)0x04000494)
#define REG_G3_TEXIMAGE_PARAM (*(volatile u32 *)0x040004a8)
#define REG_G3_PLTT_BASE (*(volatile u32 *)0x040004ac)
#define REG_G3_BEGIN_VTXS (*(volatile u32 *)0x04000500)
#define REG_G3_END_VTXS (*(volatile u32 *)0x04000504)

#ifdef __cplusplus
extern "C" {
#endif

extern u32 func_02070474(const void *resource);
extern u32 func_020704c8(const void *resource);
extern u32 func_02070580(const void *resource);
#ifndef MATCHING
extern void TingleNativeG3_Push(void);
extern void TingleNativeG3_Pop(u32 count);
extern void TingleNativeG3_SetMatrixMode(u32 mode);
extern void TingleNativeG3_Identity(void);
extern void TingleNativeG3_SetTextureParam(u32 value);
extern void TingleNativeG3_SetPaletteBase(u32 value);
extern void TingleNativeG3_Begin(u32 primitive);
extern void TingleNativeG3_End(void);
extern void TingleNativeG3_Color(u32 color);
extern void TingleNativeG3_TexCoord(u32 coordinate);
extern void TingleNativeG3_Vertex16(u32 xy, u32 z);
extern void TingleNativeG3_VertexXY(u32 xy);
#endif

#ifdef __cplusplus
}
#endif

/*
 * Push and reset the position-vector matrix, submit polygon attributes using
 * polygonId, and configure the bound texture/palette from their
 * region offsets and decoded metadata. Emit a 0x2000-by-0x2000 quadrilateral
 * with texture coordinates spanning 0x1000 by 0x0c00 at the low 16 bits of
 * depth, then end and pop. All volatile geometry writes and metadata calls
 * are ordered observable effects; the binding and regions must be valid.
 */
#ifndef MATCHING
void Graphics3DRenderObject_Draw(Graphics3DRenderObject *object)
{
    Graphics3DResourceBinding *binding = object->binding;
    u32 format;
    u32 width;
    u32 height;
    u32 paletteShift;

    REG_G3_MTX_PUSH = 0;
    REG_G3_MTX_MODE = 0;
    REG_G3_MTX_IDENTITY = 0;
#ifndef MATCHING
    TingleNativeG3_Push();
    TingleNativeG3_SetMatrixMode(0);
    TingleNativeG3_Identity();
    TingleNativeG3_SetMatrixMode(2);
    TingleNativeG3_Identity();
#endif
    REG_G3_MTX_MODE = 2;
    REG_G3_MTX_IDENTITY = 0;

    Graphics3DCommand_SetPolygonAttr(0, 0, 3, object->polygonId, 0x1f, 0);

    height = Graphics3DResourceBinding_GetTextureHeightClass(binding);
    width = Graphics3DResourceBinding_GetTextureWidthClass(binding);
    format = Graphics3DResourceBinding_GetTextureFormat(binding);
    REG_G3_TEXIMAGE_PARAM =
        (format << 26) | (binding->textureRegion->offset >> 3) |
        0x40000000 | (width << 20) | (height << 23) | 0x30000 |
        (object->field_04 << 29);
#ifndef MATCHING
    TingleNativeG3_SetTextureParam(REG_G3_TEXIMAGE_PARAM);
#endif

    paletteShift = format == 2 ? 3 : 4;
    REG_G3_PLTT_BASE = binding->paletteRegion->offset >> paletteShift;
#ifndef MATCHING
    TingleNativeG3_SetPaletteBase(REG_G3_PLTT_BASE);
    TingleNativeG3_Begin(1);
#endif

    REG_G3_BEGIN_VTXS = 1;
    REG_G3_COLOR = object->color;
#ifndef MATCHING
    TingleNativeG3_Color(object->color);
#endif

    REG_G3_TEXCOORD = 0;
    REG_G3_VTX_16 = 0x1000f000;
    REG_G3_VTX_16 = object->depth & 0xffff;
#ifndef MATCHING
    TingleNativeG3_TexCoord(0);
    TingleNativeG3_Vertex16(0x1000f000, object->depth & 0xffff);
#endif

    REG_G3_TEXCOORD = 0x00001000;
    REG_G3_VTX_XY = 0x10001000;
#ifndef MATCHING
    TingleNativeG3_TexCoord(0x00001000);
    TingleNativeG3_VertexXY(0x10001000);
#endif
    REG_G3_TEXCOORD = 0x0c001000;
    REG_G3_VTX_XY = 0xf0001000;
#ifndef MATCHING
    TingleNativeG3_TexCoord(0x0c001000);
    TingleNativeG3_VertexXY(0xf0001000);
#endif
    REG_G3_TEXCOORD = 0x0c000000;
    REG_G3_VTX_XY = 0xf000f000;
#ifndef MATCHING
    TingleNativeG3_TexCoord(0x0c000000);
    TingleNativeG3_VertexXY(0xf000f000);
#endif

    REG_G3_END_VTXS = 0;
    REG_G3_MTX_POP = 1;
#ifndef MATCHING
    TingleNativeG3_End();
    TingleNativeG3_Pop(1);
#endif
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void Graphics3DRenderObject_Draw(Graphics3DRenderObject *object)
{
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #8
    /* Load the trailing matrix-push register address. */
    DCD 0xE59F314C
    mov r4, r0
    mov r0, #0
    str r0, [r3]
    sub r2, r3, #4
    str r0, [r2]
    str r0, [r3, #0x10]
    mov r1, #2
    str r1, [r2]
    str r0, [r3, #0x10]
    mov r1, #0x1f
    str r1, [sp]
    str r0, [sp, #4]
    ldrh r3, [r4, #0xe]
    mov r1, r0
    mov r2, #3
    bl Graphics3DCommand_SetPolygonAttr
    ldmia r4, {r0, r7}
    ldr r1, [r0, #0x10]
    ldr r0, [r0, #4]
    ldr r8, [r1, #0xc]
    bl func_02070580
    ldr r1, [r4]
    mov r6, r0
    ldr r0, [r1, #4]
    bl func_020704c8
    ldr r1, [r4]
    mov r5, r0
    ldr r0, [r1, #4]
    bl func_02070474
    mov r0, r0, lsl #0x1a
    orr r0, r0, r8, lsr #3
    orr r0, r0, #0x40000000
    orr r0, r0, r5, lsl #0x14
    orr r0, r0, r6, lsl #0x17
    orr r1, r0, #0x30000
    /* Load the trailing texture-image register address. */
    DCD 0xE59F00C0
    orr r1, r1, r7, lsl #0x1d
    str r1, [r0]
    ldr r0, [r4]
    ldr r0, [r0, #4]
    bl func_02070474
    cmp r0, #2
    ldr r0, [r4]
    moveq r2, #1
    ldr r0, [r0, #0x14]
    /* Load the trailing palette-base register address. */
    DCD 0xE59FC09C
    movne r2, #0
    ldr r1, [r0, #0xc]
    rsb r0, r2, #4
    mov r0, r1, lsr r0
    str r0, [r12]
    mov r3, #1
    str r3, [r12, #0x54]
    ldrh r2, [r4, #0xc]
    sub r1, r12, #0x24
    /* Load the trailing packed first-vertex literal. */
    DCD 0xE59F0078
    str r2, [r12, #-0x2c]
    mov r2, #0
    str r2, [r1]
    ldr r4, [r4, #8]
    sub r5, r12, #0x20
    mov r4, r4, lsl #0x10
    mov r4, r4, asr #0x10
    mov r4, r4, lsl #0x10
    str r0, [r5]
    mov r4, r4, lsr #0x10
    str r4, [r5]
    mov r6, #0x1000
    str r6, [r1]
    sub r4, r6, #0xf0000000
    sub r5, r12, #0x18
    str r4, [r5]
    sub r4, r6, #0xf4000000
    str r4, [r1]
    sub r4, r6, #0x10000000
    str r4, [r5]
    mov r4, #0xc000000
    str r4, [r1]
    sub r0, r0, #0x20000000
    str r0, [r5]
    str r2, [r12, #0x58]
    str r3, [r12, #-0x64]
    add sp, sp, #8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
graphics_3d_render_object_draw_literals:
    DCD 0x04000444
    DCD 0x040004a8
    DCD 0x040004ac
    DCD 0x1000f000
}
#endif
