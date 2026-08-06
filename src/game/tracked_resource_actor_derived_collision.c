#include "tingle/types.h"

/* Recovered collision-state transition for a tracked-resource actor subclass. */

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
extern void *func_020337d4(void *actor);
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
 * Inputs are a subclass actor, an optional target, and two unused callback
 * arguments. If global state permits and the target is below the actor, copy
 * and record-rotate the actor vector at 0x38 and pass it to target virtual slot
 * 0xB8. Then zero that actor vector, enter low state 2 while preserving state
 * bit 15, enable flags 0x1F0000, reset timer 0x1F8, and clear actor flag mask
 * 0x00800040. It notifies func_0202d494 and, for a lower target, invokes the
 * recovered effect and interaction helpers. Returns nothing; actor and target
 * engine state can change, with no direct hardware access. “Below” is confirmed
 * only as target field 0x24 being numerically less than the actor field.
 */
void func_02050d0c(void *actor, void *target, u32 unused1, u32 unused2)
{
    u8 vector[16];
    bool lower;
    (void)unused1;
    (void)unused2;
    lower = target != 0 &&
            FIELD(s32, target, 0x24) < FIELD(s32, actor, 0x24);

    if (func_0200b04c(&data_02105310) == 0 && lower) {
        func_02005030(vector, (u8 *)actor + 0x38);
        FIELD(s32, vector, 0x0c) = 0;
        func_020328d0(vector,
                      (s32)FIELD(s16, FIELD(void *, actor, 0x1fc), 0x2a) << 4);
        virtual_function(target, 0xb8)(target, vector, 1);
        func_02005058(vector);
    }
    func_0200b2c0((u8 *)actor + 0x38, 0, 0, 0);
    FIELD(u16, actor, 0x1f0) = (FIELD(u16, actor, 0x1f0) & 0x8000) | 2;
    FIELD(u32, actor, 0x10) |= 0x1f0000;
    FIELD(u16, actor, 0x1f8) = 0;
    FIELD(u32, actor, 0x14) &= 0xff7fffbf;
    func_0202d494(func_020337d4(actor), actor);
    if (lower) {
        func_02050260(actor);
        func_02050560(actor, target);
    }
}
