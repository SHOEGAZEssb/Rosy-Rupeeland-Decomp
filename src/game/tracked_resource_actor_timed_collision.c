#include "tingle/types.h"

/* Recovered cooldown-gated collision response for a timed tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_02105310;
extern s32 func_0200b04c(void *state);
extern void func_02005030(void *destination, const void *source);
extern void func_02005058(void *vector);
extern s32 func_02005070(const void *vector);
extern void func_020050a4(void *destination, const void *source);
extern void VecFx32_Subtract(void *destination, const void *target,
                          const void *source);
extern void func_020328d0(void *vector, s32 angle);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern void func_02050260(void *actor);
extern void func_02050560(void *actor, void *target, ...);
extern void func_02050b34(void *vector, s32 length);
extern s32 func_020adae4(s32 value, s32 divisor);
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
 * Inputs are a timed actor, optional target, and two unused callback arguments.
 * A positive halfword cooldown at 0x200 suppresses all work. Otherwise, when
 * global state permits and a target exists, copy vector 0x88, divide its two
 * recovered components by -8, clear its fourth word, and send it to target slot
 * 0xB8. Rebuild vector 0x88 from actor and target positions, clamp its length to
 * at least 4, rotate by record halfword 0x0A, and set field 0x44 to 0x2000 when
 * field 0x24 is within 0x8000 of Actor_GetCachedTerrainHeight. Finally zero fields 0x3C/0x40,
 * enter low state 0 while preserving state bit 15, reset timer 0x1F8, set flag
 * 0x800000, and invoke effect and interaction helpers. Returns nothing; engine
 * callbacks can mutate state, and no hardware is accessed directly.
 */
void func_02051b48(void *actor, void *target, u32 unused1, u32 unused2)
{
    s32 response[4];
    u8 direction[16];
    s32 length;
    (void)unused1;
    (void)unused2;
    if (FIELD(s16, actor, 0x200) >= 1)
        return;

    if (func_0200b04c(&data_02105310) == 0 && target != 0) {
        func_02005030(response, (u8 *)actor + 0x88);
        response[1] = func_020adae4(response[1], -8);
        response[2] = func_020adae4(response[2], -8);
        response[3] = 0;
        virtual_function(target, 0xb8)(target, response);
        VecFx32_Subtract(direction, (u8 *)actor + 0x18, (u8 *)target + 0x18);
        func_020050a4((u8 *)actor + 0x88, direction);
        func_02005058(direction);
        length = func_02005070((u8 *)actor + 0x88);
        if (length < 4)
            length = 4;
        func_02050b34((u8 *)actor + 0x88, length);
        func_020328d0((u8 *)actor + 0x88,
                      (s32)FIELD(s16, FIELD(void *, actor, 0x1fc), 0x0a) << 4);
        if (FIELD(s32, actor, 0x24) <= Actor_GetCachedTerrainHeight(actor) + 0x8000)
            FIELD(s32, actor, 0x44) = 0x2000;
        func_02005058(response);
    }
    FIELD(s32, actor, 0x40) = 0;
    FIELD(s32, actor, 0x3c) = 0;
    FIELD(u16, actor, 0x1f0) &= 0x8000;
    FIELD(u16, actor, 0x1f8) = 0;
    FIELD(u32, actor, 0x14) |= 0x800000;
    func_02050260(actor);
    func_02050560(actor, target);
}
