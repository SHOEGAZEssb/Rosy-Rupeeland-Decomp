#include "tingle/types.h"

/*
 * Recovered extended type-two actor center-waypoint update. It retains the
 * random setup sequence but ultimately targets the saved center coordinates.
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
 * Set actor +0xd0 bit one. On signed counter +0x25a equal to zero, select delay
 * +0x258 in [120,239], calculate random offsets using signed descriptor radius
 * +8, then overwrite waypoint +0x7c/+0x80 with saved center +0x230/+0x234; the
 * random offset calculations are confirmed retail behavior despite not
 * surviving. On later calls, timeout installs global member pair +0x200/+0x204.
 * Before timeout, reaching squared integer distance 64 installs +0x1f8/+0x1fc;
 * otherwise virtual +0xd0 receives transform +0x78. Counter +0x25a increments
 * and the function always returns zero. Actor, random, callback, and virtual
 * state may change; no direct SDK or hardware operation occurs.
 */
s32 func_02042034(void *self, const void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    const u8 *record = (const u8 *)descriptorRecord;
    s16 counter;

    *(u32 *)(actor + 0xd0) |= 2;
    counter = *(s16 *)(actor + 0x25a);
    if (counter == 0) {
        u32 random = genrand_int32() & 0x7fffffff;
        s32 radius = *(const s16 *)(record + 8);
        s32 span = radius * 2;
        *(u16 *)(actor + 0x258) =
            (u16)(func_020ada8c((s32)random, 120) + 120);
        *(s32 *)(actor + 0x7c) = *(s32 *)(actor + 0x230) +
            ((func_020ada8c((s32)random >> 8, span) - radius) << 12);
        *(s32 *)(actor + 0x80) = *(s32 *)(actor + 0x234) +
            ((func_020ada8c((s32)random >> 16, span) - radius) << 12);
        *(s32 *)(actor + 0x7c) = *(s32 *)(actor + 0x230);
        *(s32 *)(actor + 0x80) = *(s32 *)(actor + 0x234);
    } else if (counter >= *(u16 *)(actor + 0x258)) {
        *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x200);
        *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x204);
    } else {
        s32 dy = (*(s32 *)(actor + 0x20) - *(s32 *)(actor + 0x80)) >> 12;
        s32 dx = (*(s32 *)(actor + 0x1c) - *(s32 *)(actor + 0x7c)) >> 12;
        if (dx * dx + dy * dy <= 64) {
            *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x1f8);
            *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x1fc);
        } else {
            (*(void (**)(void *, void *))(*(u8 **)actor + 0xd0))
                (actor, actor + 0x78);
        }
    }
    ++*(s16 *)(actor + 0x25a);
    return 0;
}
