#include "tingle/types.h"

/* Recovered collision-state transition for the second tracked-resource actor variant. */

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
 * Inputs are a variant actor, an optional target, and two unused callback
 * arguments. When global state permits and a target exists, copies the vector
 * at actor offset 0x38, clears its fourth word, rotates it by record halfword
 * 0x2A shifted four bits, and sends it to target virtual slot 0xB8. It then
 * zeroes the actor vector, enters low state 2 while preserving state bit 15,
 * enables flags 0x1F0000, resets timer 0x1F8, clears actor flag 0x800000, and
 * invokes notification, effect, and interaction helpers. Returns nothing;
 * engine state can change, but this function does not access hardware directly.
 */
void func_020511a4(void *actor, void *target, u32 unused1, u32 unused2)
{
    u8 vector[16];
    (void)unused1;
    (void)unused2;
    if (func_0200b04c(&data_02105310) == 0 && target != 0) {
        func_02005030(vector, (u8 *)actor + 0x38);
        FIELD(s32, vector, 0x0c) = 0;
        func_020328d0(vector,
                      (s32)FIELD(s16, FIELD(void *, actor, 0x1fc), 0x2a) << 4);
        virtual_function(target, 0xb8)(target, vector);
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
