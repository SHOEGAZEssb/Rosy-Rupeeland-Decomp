#include "tingle/types.h"

/* Overlay 37 initialization hooks for a parameterized 3D render object. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021fedec[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_Init(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Initializes object through the common 3D-object constructor, installs the
 * overlay vtable, retains arguments at +0x9C/+0xA0/+0xA8, and clears +0xA4
 * and +0xB8. The three color channels at +0xAC..+0xB4 start at 31, while the
 * halfwords at +0xBC..+0xC2 start at 0x7FFF,0,0,0. Returns object; no hardware
 * is touched directly.
 */
extern "C" void *func_ov037_021fceb0(void *object, void *owner, s32 index,
                                      s32 parameter)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov037_021fedec;
    FIELD(void *, object, 0x9c) = owner;
    FIELD(s32, object, 0xa0) = index;
    FIELD(s32, object, 0xa4) = 0;
    FIELD(s32, object, 0xa8) = parameter;
    FIELD(s32, object, 0xac) = 31;
    FIELD(s32, object, 0xb0) = 31;
    FIELD(s32, object, 0xb4) = 31;
    FIELD(s32, object, 0xb8) = 0;
    FIELD(u16, object, 0xbc) = 0x7fff;
    FIELD(u16, object, 0xbe) = 0;
    FIELD(u16, object, 0xc0) = 0;
    FIELD(u16, object, 0xc2) = 0;
    return object;
}

/*
 * No-op virtual hook. It ignores its arguments, changes no state, performs no
 * SDK or hardware operation, and returns immediately.
 */
extern "C" void func_ov037_021fcf1c(void)
{
}
