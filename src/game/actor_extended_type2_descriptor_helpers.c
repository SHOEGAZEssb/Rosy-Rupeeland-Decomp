#include "tingle/types.h"

/*
 * Recovered extended type-two actor descriptor helpers. They update query bits
 * from related objects and expose three signed per-descriptor halfwords.
 */
extern u8 data_020e8380[];
extern u8 data_020e83a8[];
extern u8 data_020e83aa[];
extern u8 data_020e83ac[];
extern u8 data_020e35d4[];
extern u8 data_020e363c[];
extern u32 data_021057cc[4];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adcac(const s32 *left, const s32 *right);
extern s32 func_020562cc(void *actor);

/* Apply the retail kind 0x67 resource gate or kind 0x65 age gate. */
s32 func_020562cc(void *self)
{
    u8 *actor = (u8 *)self;
    u16 kind = *(u16 *)(actor + 0x4e);

    if (kind == 0x67) {
        void *resource = *(void **)(actor + 0x1fc);

        if (resource != *(void **)(data_020e35d4 + 0x68))
            return 0;
        return *(void **)(actor + 0x200) ==
                   *(void **)(data_020e363c + 4) ||
               resource == 0;
    }
    if (kind == 0x65)
        return *(s16 *)(actor + 0x1f6) > 60;
    return 0;
}

/*
 * Return the registered interaction candidate when its retail kind-specific
 * eligibility gate passes and its fixed-point distance is below the candidate
 * descriptor radius. The candidate and descriptor storage remain borrowed.
 */
void *func_020536b8(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *candidate = (u8 *)data_021057cc[2];

    if (candidate == 0 || func_020562cc(candidate) == 0)
        return 0;

    {
        s32 distance = func_020adcac((s32 *)(actor + 0x1c),
                                     (s32 *)(candidate + 0x1c));
        s32 radius = *(s16 *)(*(u8 **)(candidate + 0x1f8) + 0x0c) << 12;
        return distance < radius ? candidate : 0;
    }
}

/* Return slot three when its descriptor-radius distance test succeeds. */
void *func_02053728(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *candidate = (u8 *)data_021057cc[3];
    s32 distance;
    s32 radius;

    if (candidate == 0)
        return 0;
    distance = func_020adcac((s32 *)(candidate + 0x1c),
                             (s32 *)(actor + 0x1c));
    radius = *(s16 *)(*(u8 **)(candidate + 0x1f8) + 0x0c) << 12;
    return distance < radius ? candidate : 0;
}

/* Return slot zero when its kind gate and descriptor-radius test both pass. */
void *func_02053780(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *candidate = (u8 *)data_021057cc[0];
    s32 distance;
    s32 radius;

    if (candidate == 0 || func_020562cc(candidate) == 0)
        return 0;
    distance = func_020adcac((s32 *)(candidate + 0x1c),
                             (s32 *)(actor + 0x1c));
    radius = *(s16 *)(*(u8 **)(candidate + 0x1f8) + 0x0c) << 12;
    return distance < radius ? candidate : 0;
}
extern void *func_020536b8(void *actor);
extern void *func_02053728(void *actor);
extern void *func_02053780(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Query three related objects. For func_020536b8's result, compare signed byte
 * +9 of its +0x1f8 object against the signed nibble encoded in descriptor
 * halfword +0x2e bits 4..7 and set actor +0x260 bit 0x100 on success. Any
 * func_02053728 result sets bit 0x200. For func_02053780's result, compare the
 * same nested signed byte against encoded bits 8..11 and set halfword +0x25c
 * to 15 on success. The exact nibble extraction is confirmed; its higher-level
 * meaning remains unknown. The routine has no meaningful return value and may
 * change actor query state; no direct SDK or hardware operation occurs.
 */
void ActorExtendedType2_UpdateDescriptorQueryFlags(void *self)
{
    u8 *actor = (u8 *)self;
    s16 encoded = *(s16 *)(data_020e8380 + *(u16 *)(actor + 0x4e) * 0x30 + 0x2e);
    u8 *object = (u8 *)func_020536b8(actor);
    if (object != 0 &&
        *(s8 *)(*(u8 **)(object + 0x1f8) + 9) >=
            (((s32)((u32)(u16)encoded << 24)) >> 28))
        *(u32 *)(actor + 0x260) |= 0x100;
    if (func_02053728(actor) != 0)
        *(u32 *)(actor + 0x260) |= 0x200;
    object = (u8 *)func_02053780(actor);
    if (object != 0 &&
        *(s8 *)(*(u8 **)(object + 0x1f8) + 9) >=
            (((s32)((u32)(u16)encoded << 20)) >> 28))
        *(u16 *)(actor + 0x25c) = 15;
}

/* Read and return signed descriptor halfword +0x28; state is unchanged. */
s32 ActorExtendedType2_GetDescriptorValue28(const void *self)
{
    const u8 *actor = (const u8 *)self;
    return *(s16 *)(data_020e83a8 + *(u16 *)(actor + 0x4e) * 0x30);
}

/* Read and return signed descriptor halfword +0x2a; state is unchanged. */
s32 ActorExtendedType2_GetDescriptorValue2A(const void *self)
{
    const u8 *actor = (const u8 *)self;
    return *(s16 *)(data_020e83aa + *(u16 *)(actor + 0x4e) * 0x30);
}

/* Read and return signed descriptor halfword +0x2c; state is unchanged. */
s32 ActorExtendedType2_GetDescriptorValue2C(const void *self)
{
    const u8 *actor = (const u8 *)self;
    return *(s16 *)(data_020e83ac + *(u16 *)(actor + 0x4e) * 0x30);
}
