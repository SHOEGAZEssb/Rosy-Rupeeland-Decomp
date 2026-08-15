#include "tingle/types.h"

/* Overlay 35 3D render-object initialization and its empty virtual hook. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov035_02203b7c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_Init(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Initializes a render object after its common base. The three arguments are
 * stored at +0x9C/+0xA0/+0xA8, +0xA4 and +0xB8 are cleared, the three attribute
 * words +0xAC..+0xB4 start at 31, and color/texture halfwords +0xBC..+0xC2 are
 * initialized to 0x7FFF,0,0,0. Returns `object`; no direct hardware access.
 */
extern "C" void *func_ov035_021fcec4(void *object, void *resource,
                                      s32 resourceIndex, s32 entry)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov035_02203b7c;
    FIELD(void *, object, 0x9c) = resource;
    FIELD(s32, object, 0xa0) = resourceIndex;
    FIELD(s32, object, 0xa4) = 0;
    FIELD(s32, object, 0xa8) = entry;
    FIELD(s32, object, 0xac) = 0x1f;
    FIELD(s32, object, 0xb0) = 0x1f;
    FIELD(s32, object, 0xb4) = 0x1f;
    FIELD(s32, object, 0xb8) = 0;
    FIELD(u16, object, 0xbc) = 0x7fff;
    FIELD(u16, object, 0xbe) = 0;
    FIELD(u16, object, 0xc0) = 0;
    FIELD(u16, object, 0xc2) = 0;
    return object;
}

/* Empty render-object virtual hook. It accepts no recovered inputs or effects. */
extern "C" void func_ov035_021fcf30(void)
{
}

/*
 * Duplicate constructor emitted at a second address for another call-site or
 * class identity. Inputs, field initialization, return value, and effects are
 * identical to func_ov035_021fcec4; the distinct address is preserved.
 */
extern "C" void *func_ov035_021fcf34(void *object, void *resource,
                                      s32 resourceIndex, s32 entry)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov035_02203b7c;
    FIELD(void *, object, 0x9c) = resource;
    FIELD(s32, object, 0xa0) = resourceIndex;
    FIELD(s32, object, 0xa4) = 0;
    FIELD(s32, object, 0xa8) = entry;
    FIELD(s32, object, 0xac) = 0x1f;
    FIELD(s32, object, 0xb0) = 0x1f;
    FIELD(s32, object, 0xb4) = 0x1f;
    FIELD(s32, object, 0xb8) = 0;
    FIELD(u16, object, 0xbc) = 0x7fff;
    FIELD(u16, object, 0xbe) = 0;
    FIELD(u16, object, 0xc0) = 0;
    FIELD(u16, object, 0xc2) = 0;
    return object;
}
