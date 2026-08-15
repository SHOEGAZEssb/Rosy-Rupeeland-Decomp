#include "tingle/types.h"

/* Overlay 36 timed segment-effect construction and per-frame color/size update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02206044[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_Init(void *object);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern s32 func_020ae024(s32 x, s32 y);
extern s32 Presentation_InterpolateScalar(void *object, s32 mode, s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a timed segment effect. duration is sign-extended into +0x7C;
 * endpoints (x0,y0)/(x1,y1) are stored at +0x9C..+0xA8. initialZ initializes
 * transform +0x2C. The endpoint delta is converted to an angle, offset by
 * 0x4000, truncated to 16 bits, and stored through transform +0x5C. Initial
 * 5-bit red/green/blue values are stored at +0xB0/+0xB2/+0xB4 and packed at
 * +0xB6. Size +0xAC and elapsed +0x80 start at zero; active +0x88 is one.
 * Returns object; common renderer, transform, timing, and object state change.
 */
extern "C" void *func_ov036_021fd834(void *object, s16 duration,
                                      s32 x0, s32 y0, s32 x1, s32 y1,
                                      s32 initialZ, u16 red, u16 green,
                                      u16 blue)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov036_02206044;
    FIELD(s32, object, 0x9c) = x0;
    FIELD(s32, object, 0xa0) = y0;
    FIELD(s32, object, 0xa4) = x1;
    FIELD(s32, object, 0xa8) = y1;
    PresentationScalar_SetImmediate((u8 *)object + 0x2c, initialZ);
    u16 angle = (u16)(func_020ae024(x1 - x0, y1 - y0) + 0x4000);
    PresentationScalar_SetImmediate((u8 *)object + 0x5c, angle);
    FIELD(s32, object, 0xac) = 0;
    FIELD(u16, object, 0xb0) = red;
    FIELD(u16, object, 0xb2) = green;
    FIELD(u16, object, 0xb4) = blue;
    FIELD(u16, object, 0xb6) = red | (green << 5) | (blue << 10);
    FIELD(s32, object, 0x7c) = duration;
    FIELD(s32, object, 0x80) = 0;
    FIELD(s32, object, 0x88) = 1;
    return object;
}

/*
 * Updates a segment effect. Transform +0x2C is reset to current Z +0x30 minus
 * two. Size +0xAC is derived through common mode 4 with target 0x80. Blue,
 * red, and green components are independently derived through mode 3 and
 * repacked as 5:5:5 at +0xB6. It has no return value; transform, size, color,
 * and common interpolation state change.
 */
extern "C" void func_ov036_021fd8f8(void *object)
{
    PresentationScalar_SetImmediate((u8 *)object + 0x2c,
                  FIELD(s32, object, 0x30) - 2);
    FIELD(s32, object, 0xac) = Presentation_InterpolateScalar(object, 4, 0, 0x80);
    s32 blue = Presentation_InterpolateScalar(object, 3, 0,
                             FIELD(u16, object, 0xb4));
    s32 red = Presentation_InterpolateScalar(object, 3, 0,
                            FIELD(u16, object, 0xb0));
    s32 green = Presentation_InterpolateScalar(object, 3, 0,
                              FIELD(u16, object, 0xb2));
    FIELD(u16, object, 0xb6) = red | (green << 5) | (blue << 10);
}
