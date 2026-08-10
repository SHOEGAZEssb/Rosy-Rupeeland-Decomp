#include "tingle/types.h"

/* Recovered record-sensitive collision transition for an orientation-driven tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_02105310;
extern s32 func_0200b04c(void *state);
extern void func_0200b2c0(void *vector, s32 x, s32 y, s32 z);
extern void func_02005030(void *destination, const void *source);
extern void func_02005058(void *vector);
extern void func_0202d494(void *handle, void *actor);
extern void func_020328d0(void *vector, s32 angle);
extern void *Actor_GetCollection(void *actor);
extern void func_02050260(void *actor);
extern void func_02050560(void *actor, void *target, ...);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))
typedef s32 (*VirtualFunction)(void *, ...);

static VirtualFunction virtual_function(void *actor, u32 offset)
{
    return *(VirtualFunction *)((u8 *)FIELD(void *, actor, 0) + offset);
}

/*
 * Inputs are an oriented actor, optional target, and two unused callback values.
 * When global state permits and a target exists, copy vector 0x38, clear its
 * fourth word, and rotate it by signed record halfword 0x2A shifted four bits.
 * Pass it to target slot 0xB8 with a boolean derived from whether record
 * halfword 0x0C is positive for target type 1, or halfword 0x0E is positive for
 * other types. Then zero actor vector 0x38, enter low state 2 while preserving
 * state bit 15, add flags 0x1F0000, reset timer 0x1F8, clear actor flag
 * 0x800000, and invoke notification, effect, and interaction helpers. Returns
 * nothing; callbacks mutate engine state without direct hardware access.
 */
void func_02052464(void *actor, void *target, u32 unused1, u32 unused2)
{
    s32 vector[4];
    const void *record = FIELD(const void *, actor, 0x1fc);
    s16 value;
    (void)unused1;
    (void)unused2;
    if (func_0200b04c(&data_02105310) == 0 && target != 0) {
        func_02005030(vector, (u8 *)actor + 0x38);
        vector[3] = 0;
        func_020328d0(vector, (s32)FIELD(s16, record, 0x2a) << 4);
        value = FIELD(u8, target, 0x4d) == 1
                    ? FIELD(s16, record, 0x0c)
                    : FIELD(s16, record, 0x0e);
        virtual_function(target, 0xb8)(target, vector, value > 0);
        func_02005058(vector);
    }
    func_0200b2c0((u8 *)actor + 0x38, 0, 0, 0);
    FIELD(u16, actor, 0x1f0) = (FIELD(u16, actor, 0x1f0) & 0x8000) | 2;
    FIELD(u32, actor, 0x10) |= 0x1f0000;
    FIELD(u16, actor, 0x1f8) = 0;
    FIELD(u32, actor, 0x14) &= 0xff7fffff;
    func_0202d494(Actor_GetCollection(actor), actor);
    func_02050260(actor);
    func_02050560(actor, target);
}
