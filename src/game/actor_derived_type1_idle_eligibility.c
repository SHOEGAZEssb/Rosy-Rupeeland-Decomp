#include "tingle/types.h"

/* Determine whether a type-1 actor is free of active state and owned records. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_IsAtCachedTerrainHeight(void *actor);
extern s32 func_020372b4(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Return one only when virtual +0xa8 is false; +0x26c/+0x270 are null;
 * Actor_IsAtCachedTerrainHeight is true; +0xd0 bits 0x100/0x4000 and +0x230
 * bit 0x20000 are
 * clear; func_020372b4 is false; signed cooldown +0x268 is zero; and owned
 * objects +0x274/+0x278 are null. Otherwise return zero. No fields change;
 * the two predicates and virtual query may inspect wider engine state.
 */
s32 func_020397d4(void *self)
{
    u8 *actor = (u8 *)self;
    if ((*(s32 (**)(void *))(*(u8 **)actor + 0xa8))(actor) != 0)
        return 0;
    if (*(void **)(actor + 0x26c) != 0 || *(void **)(actor + 0x270) != 0)
        return 0;
    if (Actor_IsAtCachedTerrainHeight(actor) == 0 ||
        (*(u32 *)(actor + 0xd0) & 0x100) != 0 ||
        (*(u32 *)(actor + 0x230) & 0x20000) != 0)
        return 0;
    if (func_020372b4(actor) != 0 || *(s16 *)(actor + 0x268) != 0 ||
        (*(u32 *)(actor + 0xd0) & 0x4000) != 0)
        return 0;
    return *(void **)(actor + 0x274) == 0 &&
           *(void **)(actor + 0x278) == 0;
}
