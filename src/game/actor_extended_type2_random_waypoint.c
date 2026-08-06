#include "tingle/types.h"

/*
 * Recovered extended type-two actor random-waypoint update. It chooses a point
 * around the saved center and transitions callbacks on arrival or timeout.
 */
extern u8 data_020df9e8[];

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * On signed counter +0x25a equal to zero, use one random word to choose timeout
 * +0x258 from descriptor +0x18 bits 1..4: value two gives 120..239, four gives
 * 240..479, eight gives 180..299, and all other values give 120..239. Different
 * byte slices of that word choose waypoint +0x7c/+0x80 around center
 * +0x230/+0x234 within signed descriptor radius +8. On later calls, timeout
 * installs global member pair +0x210/+0x214 at +0x220/+0x224. Before timeout,
 * reaching squared integer distance 64 installs pair +0x208/+0x20c; otherwise
 * virtual +0xd0 receives transform +0x78. Counter +0x25a always increments and
 * the function returns zero. Actor, random, callback, and virtual state may
 * change; no direct SDK or hardware operation occurs.
 */
s32 func_02041e9c(void *self, const void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    const u8 *record = (const u8 *)descriptorRecord;
    s16 counter = *(s16 *)(actor + 0x25a);

    if (counter == 0) {
        u32 random = genrand_int32() & 0x7fffffff;
        switch (*(const u16 *)(record + 0x18) & 0x1e) {
        case 2:
            *(u16 *)(actor + 0x258) =
                (u16)(func_020ada8c((s32)random, 120) + 120);
            break;
        case 4:
            *(u16 *)(actor + 0x258) =
                (u16)(func_020ada8c((s32)random, 240) + 240);
            break;
        case 8:
            *(u16 *)(actor + 0x258) =
                (u16)(func_020ada8c((s32)random, 120) + 180);
            break;
        default:
            *(u16 *)(actor + 0x258) =
                (u16)(func_020ada8c((s32)random, 120) + 120);
            break;
        }
        {
            s32 radius = *(const s16 *)(record + 8);
            s32 span = radius * 2;
            s32 xOffset = func_020ada8c((s32)random >> 8, span) - radius;
            s32 yOffset = func_020ada8c((s32)random >> 16, span) - radius;
            *(s32 *)(actor + 0x7c) = *(s32 *)(actor + 0x230) + (xOffset << 12);
            *(s32 *)(actor + 0x80) = *(s32 *)(actor + 0x234) + (yOffset << 12);
        }
    } else if (counter >= *(u16 *)(actor + 0x258)) {
        *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x210);
        *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x214);
    } else {
        s32 dy = (*(s32 *)(actor + 0x20) - *(s32 *)(actor + 0x80)) >> 12;
        s32 dx = (*(s32 *)(actor + 0x1c) - *(s32 *)(actor + 0x7c)) >> 12;
        if (dx * dx + dy * dy <= 64) {
            *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x208);
            *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x20c);
        } else {
            (*(void (**)(void *, void *))(*(u8 **)actor + 0xd0))
                (actor, actor + 0x78);
        }
    }
    ++*(s16 *)(actor + 0x25a);
    return 0;
}
