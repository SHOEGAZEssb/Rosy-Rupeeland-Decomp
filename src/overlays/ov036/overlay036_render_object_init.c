#include "tingle/types.h"

/* Overlay 36 common 3D render-object initialization and empty virtual hook. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205fd4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020949ec(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Initializes a render object after its common base. resource, resourceIndex,
 * and entry are stored at +0x9C/+0xA0/+0xA8; +0xA4/+0xB8 are cleared; three
 * attribute words +0xAC..+0xB4 start at 31; and halfwords +0xBC..+0xC2 become
 * 0x7FFF,0,0,0. Returns object with no direct hardware effect.
 */
extern "C" void *func_ov036_021fcec4(void *object, void *resource,
                                      s32 resourceIndex, s32 entry)
{
    func_020949ec(object);
    FIELD(const void *, object, 0) = data_ov036_02205fd4;
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

/* Empty render-object virtual hook with no recovered inputs or effects. */
extern "C" void func_ov036_021fcf30(void)
{
}

/*
 * Address-distinct duplicate of func_ov036_021fcec4. It accepts the same four
 * inputs, performs identical object initialization, and returns object; the
 * separate symbol preserves the original class/call-site identity.
 */
extern "C" void *func_ov036_021fcf34(void *object, void *resource,
                                      s32 resourceIndex, s32 entry)
{
    func_020949ec(object);
    FIELD(const void *, object, 0) = data_ov036_02205fd4;
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
