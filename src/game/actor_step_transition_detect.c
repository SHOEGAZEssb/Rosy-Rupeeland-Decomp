#include "tingle/types.h"

/* Detect and begin a short actor step/height transition from contact motion. */
typedef struct StepActorVTable {
    u8 field_00[0x3c];
    void (*transition_3c)(void *, s32);
} StepActorVTable;

#ifdef __cplusplus
extern "C" {
#endif
extern u32 func_02034464(void *, s32, s32);
extern s32 func_020343e4(void *, s32, s32);
extern void func_02033ed0(void *);
extern s32 func_020adae4(s32, s32);
#ifdef __cplusplus
}
#endif

static s32 terrainCodeBlocksStep(u32 terrain)
{
    u32 code = (terrain >> 5) & 0x1f;
    return code == 7 || code == 6 || code == 16 || code == 17 ||
           code == 18 || code == 20;
}

/*
 * Require current Z 0x24 to equal baseline 0x1dc and a low contact bit in byte
 * 0x4a or 0x4b. Probe 20 motion units ahead, reject recovered terrain codes,
 * and accept a positive height rise of at most 16 units (32 with flag
 * 0x400000), provided the eight-unit midpoint also stays within that limit.
 * On success store target X/Y/Z at 0xb4/0xb8/0xbc, call func_02033ed0 and the
 * vtable-offset-0x3c transition callback with the rise, derive per-frame X/Y
 * deltas as motion*20/24 at 0xc0/0xc4, clear field 0x44, and return one.
 * Return zero without transition otherwise. Terrain helpers observe world
 * state but no direct hardware is accessed.
 */
s32 func_02031f44(void *self)
{
    u8 *actor = (u8 *)self;
    s32 baseline = *(s32 *)(actor + 0x1dc);
    s32 targetX;
    s32 targetY;
    s32 targetHeight;
    s32 rise;
    s32 limit;
    u32 terrain;

    if (*(s32 *)(actor + 0x24) != baseline ||
        !((actor[0x4a] | actor[0x4b]) & 0x0f))
        return 0;
    targetX = *(s32 *)(actor + 0x1c) + *(s32 *)(actor + 0x3c) * 20;
    targetY = *(s32 *)(actor + 0x20) + *(s32 *)(actor + 0x40) * 20;
    terrain = func_02034464(actor, targetX >> 16, targetY >> 16);
    if (terrainCodeBlocksStep(terrain))
        return 0;
    targetHeight = func_020343e4(actor, targetX >> 16, targetY >> 16) << 4;
    rise = targetHeight - (baseline >> 12);
    limit = (*(u32 *)(actor + 0x14) & 0x400000) ? 32 : 16;
    if (rise <= 0 || rise > limit)
        return 0;
    if ((func_020343e4(
             actor,
             (*(s32 *)(actor + 0x1c) + *(s32 *)(actor + 0x3c) * 8) >> 16,
             (*(s32 *)(actor + 0x20) + *(s32 *)(actor + 0x40) * 8) >> 16)
         << 4) - (baseline >> 12) > limit)
        return 0;
    *(s32 *)(actor + 0xb4) = targetX;
    *(s32 *)(actor + 0xb8) = targetY;
    *(s32 *)(actor + 0xbc) = targetHeight << 12;
    func_02033ed0(actor);
    (*(StepActorVTable **)actor)->transition_3c(actor, rise);
    *(s32 *)(actor + 0xc0) =
        func_020adae4(*(s32 *)(actor + 0x3c) * 20, 24);
    *(s32 *)(actor + 0xc4) =
        func_020adae4(*(s32 *)(actor + 0x40) * 20, 24);
    *(u32 *)(actor + 0x44) = 0;
    return 1;
}
