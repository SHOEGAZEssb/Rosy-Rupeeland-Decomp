#include "tingle/types.h"

/*
 * Overlay 8 particle rendering. This recovered routine builds rotated quads
 * for active pool objects and submits them with code-indexed texture regions.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay008Point {
    s32 x;
    s32 y;
} Overlay008Point;

#ifdef __cplusplus
extern "C" {
#endif
extern const s32 data_ov008_021fc25c[22];
extern const s16 gFx32CosSinTable[];
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *member);
extern void func_0209a2ac(void *object, const void *transform, s32 mode);
extern void Graphics3dPresentation_BindImmediateTexture(void *resource, s32 value, s32 zero);
extern void func_0209c7e8(void *resource, s32 value);
extern void func_0209c87c(void *resource, const Overlay008Point *vertices,
                          const s32 *region, u16 color, s32 sentinel);
#ifdef __cplusplus
}
#endif

/*
 * Submit state with null transform/mode 1 and copy the input transform into a
 * temporary member. Configure the resource at owner +0x48, member +0x18 with
 * value 28. Scan slots 59 down to zero. For codes >=1, use the confirmed size
 * table data_ov008_021fc25c (adding a timer-bit animation offset for codes
 * >=10), angle halfword +0x4FC, and the shared sine/cosine table to build four
 * rotated vertices around object coordinates +0x30/+0x34. Configure resource
 * value 28 for codes below 10 or zero otherwise, then submit the quad with the
 * code-indexed four-word region, color +0x844, and sentinel -1. For code zero,
 * submit the corresponding object with the copied transform and mode 1.
 * Negative codes are inactive. Destroy the temporary and return no value.
 * Rendering and transform effects are delegated; no direct hardware access
 * occurs. The region constants are confirmed, while their atlas semantics are
 * inferred from their use by func_0209c87c.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay008_RenderParticles(void *state, const void *transform)
{
    static const s32 regions[22][4] = {
        {0x20000, 0x10000, 0x2f000, 0x1f000},
        {0x60000, 0x00000, 0x7f000, 0x1f000},
        {0x30000, 0x00000, 0x47000, 0x17000},
        {0x48000, 0x00000, 0x5f000, 0x17000},
        {0x00000, 0x00000, 0x0f000, 0x0f000},
        {0x10000, 0x00000, 0x1f000, 0x0f000},
        {0x20000, 0x00000, 0x2f000, 0x0f000},
        {0x00000, 0x10000, 0x0f000, 0x1f000},
        {0x10000, 0x10000, 0x1f000, 0x1f000},
        {0x20000, 0x10000, 0x2f000, 0x1f000},
        {0xd0000, 0x00000, 0xdf000, 0x0f000},
        {0xe0000, 0x00000, 0xf0000, 0x0f000},
        {0xd0000, 0x10000, 0xdf000, 0x1f000},
        {0xe0000, 0x10000, 0xdf000, 0x1f000},
        {0xd0000, 0x00000, 0xdf000, 0x0f000},
        {0xe0000, 0x00000, 0xf0000, 0x0f000},
        {0xd0000, 0x10000, 0xdf000, 0x1f000},
        {0xe0000, 0x10000, 0xdf000, 0x1f000},
        {0xd0000, 0x00000, 0xdf000, 0x0f000},
        {0xe0000, 0x00000, 0xf0000, 0x0f000},
        {0xd0000, 0x10000, 0xdf000, 0x1f000},
        {0xe0000, 0x10000, 0xdf000, 0x1f000}
    };
    u8 temporary[0x10];
    void *resource = FIELD(void *, FIELD(void *, state, 0x48), 0x18);
    s32 index;

    func_0209a2ac(state, 0, 1);
    VecFx32Object_InitCopy(temporary, transform);
    func_0209c7e8(resource, 28);

    for (index = 59; index >= 0; index--) {
        s32 code = FIELD(s32, state, 0x754 + index * 4);
        void *object;

        if (code >= 1) {
            Overlay008Point vertices[4];
            u32 angle = FIELD(u16, state, 0x4fc + index * 2) >> 4;
            s32 cosine = gFx32CosSinTable[angle * 2];
            s32 sine = gFx32CosSinTable[angle * 2 + 1];
            s32 size = data_ov008_021fc25c[code];
            s32 x;
            s32 y;

            if (code >= 10) {
                size += (FIELD(s32, state, 0x664 + index * 4) & 4) >> 1;
            }
            object = FIELD(void *, state, 0x04c + index * 4);
            x = FIELD(s32, object, 0x30);
            y = FIELD(s32, object, 0x34);
            vertices[0].x = (x + size * (sine + cosine)) >> 12;
            vertices[0].y = (y + size * (sine - cosine)) >> 12;
            vertices[1].x = (x + size * (cosine - sine)) >> 12;
            vertices[1].y = (y + size * (cosine + sine)) >> 12;
            vertices[2].x = (x - size * (sine + cosine)) >> 12;
            vertices[2].y = (y + size * (cosine - sine)) >> 12;
            vertices[3].x = (x + size * (sine - cosine)) >> 12;
            vertices[3].y = (y - size * (cosine + sine)) >> 12;

            Graphics3dPresentation_BindImmediateTexture(resource, code < 10 ? 28 : 0, 0);
            func_0209c87c(resource, vertices, regions[code],
                          FIELD(u16, state, 0x844 + index * 2), -1);
        } else if (code == 0) {
            object = FIELD(void *, state, 0x04c + index * 4);
            func_0209a2ac(object, temporary, 1);
        }
    }

    VecFx32Object_Destroy(temporary);
}
