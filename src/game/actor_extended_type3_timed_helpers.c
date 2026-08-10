#include "tingle/types.h"

/*
 * Recovered extended type-three actor timed helpers. They wrap a base approach,
 * arm a randomized callback delay, and submit an optional descriptor transform.
 */
extern u8 data_020e0224[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02043958(void *actor);
extern s32 func_020412a8(void *actor, const void *record);
extern u32 genrand_int32(void);
extern s32 ActorExtendedType2_GetDescriptorValue2C(const void *actor);
extern s32 func_0204362c(const void *actor);
extern void func_02005030(void *temporary, const void *source);
extern void func_02005058(void *temporary);
extern void func_02050078(s32 mode, void *destination, const void *source);
#ifdef __cplusplus
}
#endif

/*
 * Decrement signed timer actor +0x29a. At zero or below, invoke func_02043958
 * and return zero; otherwise forward actor and descriptorRecord to
 * func_020412a8 and return its result. Actor/base state may change and no direct
 * SDK or hardware operation occurs.
 */
s32 func_02043b20(void *self, const void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    --*(s16 *)(actor + 0x29a);
    if (*(s16 *)(actor + 0x29a) <= 0) {
        func_02043958(actor);
        return 0;
    }
    return func_020412a8(actor, descriptorRecord);
}

/*
 * Enter state two. When signed counter +0x25a is zero, choose threshold +0x258
 * in [240,479] from genrand_int32. On later calls at or beyond the threshold,
 * install member callback pair data_020e0224+8/+0x0c at +0x220/+0x224. Always
 * increment +0x25a and return zero. Actor, callback, and random state may change;
 * no direct hardware access occurs.
 */
s32 func_02043b54(void *self)
{
    u8 *actor = (u8 *)self;
    *(u16 *)(actor + 0xd6) = 2;
    if (*(s16 *)(actor + 0x25a) == 0) {
        *(u16 *)(actor + 0x258) = (u16)(genrand_int32() % 240 + 240);
    } else if (*(s16 *)(actor + 0x25a) >= *(u16 *)(actor + 0x258)) {
        *(u32 *)(actor + 0x220) = *(u32 *)(data_020e0224 + 8);
        *(u32 *)(actor + 0x224) = *(u32 *)(data_020e0224 + 0x0c);
    }
    ++*(s16 *)(actor + 0x25a);
    return 0;
}

/*
 * Return without action when descriptor halfword +0x2c is nonzero or
 * signed-byte accessor func_0204362c returns -1. Otherwise copy actor
 * transform +0x18 to a temporary, call func_02050078(mode,temporary,temporary)
 * using the signed-byte accessor as mode, then finalize the temporary. The
 * routine has no meaningful return value; transform/helper state may change
 * and no direct SDK or hardware access occurs.
 */
void func_02043bc8(void *self)
{
    u8 *actor = (u8 *)self;
    u32 temporary[4];
    s32 mode;
    if (ActorExtendedType2_GetDescriptorValue2C(actor) != 0)
        return;
    mode = func_0204362c(actor);
    if (mode == -1)
        return;
    func_02005030(temporary, actor + 0x18);
    mode = func_0204362c(actor);
    func_02050078(mode, temporary, temporary);
    func_02005058(temporary);
}
