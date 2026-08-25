/* Immediate-mode 3D setup and primitive submission used by resident effects. */

#include "tingle/types.h"
#include "tingle/vec_fx32.h"

#define REG_G3_MTX_MODE (*(volatile u32 *)0x04000440)
#define REG_G3_MTX_PUSH (*(volatile u32 *)0x04000444)
#define REG_G3_MTX_POP (*(volatile u32 *)0x04000448)
#define REG_G3_MTX_IDENTITY (*(volatile u32 *)0x04000454)
#define REG_G3_MTX_SCALE (*(volatile s32 *)0x0400046c)
#define REG_G3_MTX_TRANS (*(volatile s32 *)0x04000470)
#define REG_G3_COLOR (*(volatile u32 *)0x04000480)
#define REG_G3_VTX_XY (*(volatile u32 *)0x04000494)
#define REG_G3_BEGIN_VTXS (*(volatile u32 *)0x04000500)
#define REG_G3_END_VTXS (*(volatile u32 *)0x04000504)

#ifdef __cplusplus
extern "C" {
#endif

extern const s16 gFx32CosSinTable[];
extern void func_0209b414(u32 format, u32 generation, u32 sizeS, u32 sizeT,
                          u32 repeatS, u32 repeatT, u32 flip, u32 address);
extern void func_0209b494(void *context, s32 resource, s32 polygonId);
extern void func_0209b560(u32 light, u32 polygonMode, u32 cullMode,
                          u32 polygonId, u32 alpha, u32 misc);
extern void G3Command_SubmitTexCoord(s32 s, s32 t);
extern void G3Command_SubmitVertex16(s32 x, s32 y, s32 z);
extern void func_020b0808(s32 sine, s32 cosine);
extern void func_020b0a54(s32 left, s32 right, s32 bottom, s32 top,
                          s32 nearPlane, s32 farPlane, s32 scale,
                          s32 flag, s32 unused);

#ifndef MATCHING
extern void TingleNativeG3_SetMatrixMode(u32 mode);
extern void TingleNativeG3_Identity(void);
extern void TingleNativeG3_Push(void);
extern void TingleNativeG3_Pop(u32 count);
extern void TingleNativeG3_Translate(s32 x, s32 y, s32 z);
extern void TingleNativeG3_Scale(s32 x, s32 y, s32 z);
extern void TingleNativeG3_Begin(u32 primitive);
extern void TingleNativeG3_End(void);
extern void TingleNativeG3_Color(u32 color);
extern void TingleNativeG3_VertexXY(u32 xy);
#endif

/* Pack two signed vertex coordinates into one NDS XY command word. */
static u32 PackSignedXY(s32 x, s32 y)
{
    return (u16)x | ((u32)(u16)y << 16);
}

/* Convert a Q12 world delta to the signed projected integer used by retail. */
static s32 ScreenCoordinate(s32 value)
{
    return (s32)((u32)value << 4) >> 16;
}

/*
 * Establish the orthographic matrix used by resident immediate effects. The
 * context is borrowed for API compatibility but is not inspected. Geometry
 * state changes are submitted synchronously to the NDS or host G3 boundary.
 */
void func_0209c3b4(void *context)
{
    (void)context;
    REG_G3_MTX_MODE = 0;
    REG_G3_MTX_IDENTITY = 0;
#ifndef MATCHING
    TingleNativeG3_SetMatrixMode(0);
    TingleNativeG3_Identity();
#endif
    func_020b0a54(-0x60000, 0x60000, -0x80000, 0x80000,
                  0, 0x2000, 0x1000, 1, 0);
    REG_G3_MTX_MODE = 2;
    REG_G3_MTX_IDENTITY = 0;
    REG_G3_MTX_SCALE = 0x01000000;
    REG_G3_MTX_SCALE = 0x01000000;
    REG_G3_MTX_SCALE = 0x00001000;
#ifndef MATCHING
    TingleNativeG3_SetMatrixMode(2);
    TingleNativeG3_Identity();
    TingleNativeG3_Scale(0x01000000, 0x01000000, 0x00001000);
#endif
}

/*
 * Submit one textured quadrilateral. Position and scale are borrowed vec-fx32
 * objects; texture bounds and vertex region each contain four s32 values.
 * Geometry is culled when its projected depth exceeds 0x200. All G3 writes
 * are synchronous and the final signed parameter supplies vertex depth.
 */
void func_0209c430(void *context, const VecFx32Object *position,
                   const VecFx32Object *scale, u16 angle,
                   const s32 *textureBounds, u32 resource,
                   const s32 *region, u16 color, s32 parameter)
{
    const u8 *bytes = (const u8 *)context;
    s32 originX = *(const s32 *)(bytes + 0x88);
    s32 originY = *(const s32 *)(bytes + 0x8c);
    s32 x = ScreenCoordinate(originX + 0x80000 - position->value.x);
    s32 y = ScreenCoordinate(originY + 0x60000 - position->value.y);
    s32 depth = ScreenCoordinate(position->value.z - originY);
    s32 tableIndex;

    if (depth > 0x200)
        return;

    REG_G3_MTX_PUSH = 0;
    REG_G3_MTX_TRANS = -x;
    REG_G3_MTX_TRANS = -y;
    REG_G3_MTX_TRANS = depth - 0x1000;
    REG_G3_MTX_SCALE = scale->value.x;
    REG_G3_MTX_SCALE = scale->value.y;
    REG_G3_MTX_SCALE = 0x1000;
#ifndef MATCHING
    TingleNativeG3_Push();
    TingleNativeG3_Translate(-x, -y, depth - 0x1000);
    TingleNativeG3_Scale(scale->value.x, scale->value.y, 0x1000);
#endif

    tableIndex = (angle >> 4) * 2;
    func_020b0808(gFx32CosSinTable[tableIndex],
                  gFx32CosSinTable[tableIndex + 1]);
    func_0209b494(context, (s32)resource, 0);

    REG_G3_BEGIN_VTXS = 1;
    REG_G3_COLOR = color;
#ifndef MATCHING
    TingleNativeG3_Begin(1);
    TingleNativeG3_Color(color);
#endif

    G3Command_SubmitTexCoord(textureBounds[0], textureBounds[1]);
    G3Command_SubmitVertex16((s16)region[0], (s16)region[1], (s16)parameter);
    G3Command_SubmitTexCoord(textureBounds[0], textureBounds[3]);
    REG_G3_VTX_XY = PackSignedXY((s16)region[0], (s16)region[3]);
#ifndef MATCHING
    TingleNativeG3_VertexXY(PackSignedXY((s16)region[0], (s16)region[3]));
#endif
    G3Command_SubmitTexCoord(textureBounds[2], textureBounds[3]);
    REG_G3_VTX_XY = PackSignedXY((s16)region[2], (s16)region[3]);
#ifndef MATCHING
    TingleNativeG3_VertexXY(PackSignedXY((s16)region[2], (s16)region[3]));
#endif
    G3Command_SubmitTexCoord(textureBounds[2], textureBounds[1]);
    REG_G3_VTX_XY = PackSignedXY((s16)region[2], (s16)region[1]);
#ifndef MATCHING
    TingleNativeG3_VertexXY(PackSignedXY((s16)region[2], (s16)region[1]));
#endif

    REG_G3_END_VTXS = 0;
    REG_G3_MTX_POP = 1;
#ifndef MATCHING
    TingleNativeG3_End();
    TingleNativeG3_Pop(1);
#endif
}

/*
 * Submit triangle primitives from a caller-owned table. Each triangle stores
 * three signed XY pairs (six s32 values); lastTriangle is the inclusive final
 * index and retail emits entries in descending order. Geometry state changes
 * are synchronous, and parameter supplies the first vertex's signed depth.
 */
void func_0209c614(void *context, const VecFx32Object *position,
                   const VecFx32Object *scale, u16 angle,
                   const s32 *triangles, u32 lastTriangle, u16 color,
                   s32 parameter)
{
    const u8 *bytes = (const u8 *)context;
    s32 originX = *(const s32 *)(bytes + 0x88);
    s32 originY = *(const s32 *)(bytes + 0x8c);
    s32 x = ScreenCoordinate(originX + 0x80000 - position->value.x);
    s32 y = ScreenCoordinate(originY + 0x60000 - position->value.y);
    s32 depth = ScreenCoordinate(position->value.z - originY);
    s32 tableIndex;
    s32 triangle;

    if (depth > 0x200)
        return;

    REG_G3_MTX_PUSH = 0;
    REG_G3_MTX_TRANS = -x;
    REG_G3_MTX_TRANS = -y;
    REG_G3_MTX_TRANS = 0;
    REG_G3_MTX_SCALE = scale->value.x;
    REG_G3_MTX_SCALE = scale->value.y;
    REG_G3_MTX_SCALE = 0x1000;
#ifndef MATCHING
    TingleNativeG3_Push();
    TingleNativeG3_Translate(-x, -y, 0);
    TingleNativeG3_Scale(scale->value.x, scale->value.y, 0x1000);
#endif

    tableIndex = (angle >> 4) * 2;
    func_020b0808(gFx32CosSinTable[tableIndex],
                  gFx32CosSinTable[tableIndex + 1]);
    func_0209b414(0, 0, 0, 0, 0, 0, 0, 0);
    func_0209b560(0, 0, 3, 2, 0x1f, 0);

    REG_G3_BEGIN_VTXS = 0;
    REG_G3_COLOR = color;
#ifndef MATCHING
    TingleNativeG3_Begin(0);
    TingleNativeG3_Color(color);
#endif

    for (triangle = (s32)lastTriangle; triangle >= 0; --triangle) {
        const s32 *vertices = triangles + triangle * 6;

        G3Command_SubmitVertex16((s16)vertices[0], (s16)vertices[1],
                      (s16)parameter);
        REG_G3_VTX_XY = PackSignedXY((s16)vertices[2],
                                     (s16)vertices[3]);
#ifndef MATCHING
        TingleNativeG3_VertexXY(PackSignedXY((s16)vertices[2],
                                             (s16)vertices[3]));
#endif
        REG_G3_VTX_XY = PackSignedXY((s16)vertices[4],
                                     (s16)vertices[5]);
#ifndef MATCHING
        TingleNativeG3_VertexXY(PackSignedXY((s16)vertices[4],
                                             (s16)vertices[5]));
#endif
    }

    REG_G3_END_VTXS = 0;
    REG_G3_MTX_POP = 1;
#ifndef MATCHING
    TingleNativeG3_End();
    TingleNativeG3_Pop(1);
#endif
}

#ifdef __cplusplus
}
#endif
