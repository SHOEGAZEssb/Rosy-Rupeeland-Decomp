#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered type-seven actor contact response. It handles capture resources,
 * type-specific separation, interaction cues, and then delegates to base contact.
 */
extern u8 data_02105310[];
extern u8 data_021f5ebc[];
extern const char data_020e1cfc[];
extern u32 data_020e16d8[];
extern u32 data_020e16b0[];
extern u32 data_020e1708[];
extern void *gGameWork;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0204c74c(void *actor, void *other, s32 context);
extern s32 func_0200b294(void *state);
extern s32 func_020828a0(void *state, s32 mask);
extern void *func_0206c68c(void *resource, void *actor);
extern void func_0206cb04(void *resource, void *other, s32 mode);
extern void func_0206e590(void *resource, s32 mode);
extern void func_0206c978(void *resource);
extern void GameWork_SetFlag(void *work, u32 flag);
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void func_020481dc(void *actor, u32 first, u32 second, s32 third);
extern s32 ActorDerivedType1_IsTargetStateEligible(void *actor);
extern void func_02046e60(void *actor, void *other, s32 value, s32 extra);
extern s32 func_0204cfa4(s32 x, s32 y);
extern s32 func_020adc90(s32 value, s32 divisor);
extern s32 func_020adae4(s32 value, s32 shift);
extern s32 func_02046d8c(void *actor);
extern void func_02005030(void *destination, const void *source);
extern void func_02005058(void *value);
extern void func_020478dc(void *actor, const void *transform, s32 value);
extern s32 ActorDerivedType1_IsSpecialRecordActive(void *actor);
extern void ActorDerivedType1_StartRecord(void *actor, s32 value);
extern void func_0204b7bc(void *actor, s32 mode);
extern void func_020593dc(void *soundContext, s32 group, s32 sound,
                          void *actor, s32 extra, s32 volume);
extern s32 func_02032a94(void *actor, void *other, s32 context);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are actor, other object, and contact context. Custom processing first
 * requires func_0204c74c success, clear global state from func_0200b294 and
 * func_020828a0, nonnull actor target +0x280, and clear actor +0x10 bit
 * 0x01000000. A qualifying type-two object can allocate/construct the 0xb4-byte
 * owned resource at +0x234, install data_020e16d8 through func_020481dc, set
 * GameWork flag 0x3fd, and submit the object to func_0206cb04. Other type-two
 * contacts derive signed extra from +0x27f/+0x29e and optional vtable +0x200;
 * an active resource completion bit releases the resource and clears the flag,
 * otherwise func_02046e60 receives record +0x38 shifted by seven and the extra.
 *
 * Unflagged type-one/type-seven contacts beyond 0x1000 normalize displacement,
 * optionally halve it when actor +0xd0 bit 0x10 is set, and apply separation.
 * Type one may also submit an offset transform through func_020478dc, update
 * both objects' +0x9c/+0xa0, trigger other-object state helpers, install
 * data_020e16b0, and start a ten-frame encoded sound cooldown. Type seven uses
 * actor +0x9c/+0xa0 and other +0x8c/+0x90. Objects with +0x14 bit 0x10 instead
 * use a type-three/subtype-0x18 triple-x separation path, or a constrained
 * type-four subtype range that installs data_020e1708. Every path finally calls
 * func_02032a94(actor,other,context) and returns its result. Actor, other,
 * resource, heap, GameWork, sound, callback, and motion state may change.
 */
s32 func_02046660(void *self, void *otherObject, s32 context)
{
    u8 *actor = (u8 *)self;
    u8 *other = (u8 *)otherObject;
    u8 *record;
    s32 type;

    if (func_0204c74c(actor, other, context) == 0
        || func_0200b294(data_02105310) != 0
        || *(void **)(actor + 0x280) == 0
        || func_020828a0(data_021f5ebc, 0x40) != 0
        || (*(u32 *)(actor + 0x10) & 0x01000000) != 0) {
        return func_02032a94(actor, other, context);
    }

    if (*(void **)(actor + 0x280) != 0
        && *(s16 *)(actor + 0x246) == 0
        && (*(u32 *)(actor + 0x268) & 0xe0) == 0
        && other[0x4d] == 2
        && (*(s32 (**)(void *))(*(u8 **)other + 0x1ac))(other) != 0
        && (*(u32 *)(other + 0x10) & 0x01000000) == 0) {
        if (*(void **)(actor + 0x234) == 0) {
            void *resource = Heap_Alloc(0xb4, data_020e1cfc, 4, &gHeapContext);
            if (resource != 0)
                resource = func_0206c68c(resource, actor);
            *(void **)(actor + 0x234) = resource;
            func_020481dc(actor, data_020e16d8[0], data_020e16d8[1], -1);
            GameWork_SetFlag(gGameWork, 0x3fd);
        }
        func_0206cb04(*(void **)(actor + 0x234), other, 1);
        return func_02032a94(actor, other, context);
    }

    if ((*(u32 *)(other + 0x14) & 0x10) == 0) {
        type = other[0x4d];
        if (type != 2 && type != 1 && type != 7)
            return func_02032a94(actor, other, context);
        if (type == 2) {
            s32 extra;
            if (*(s16 *)(actor + 0x246) != 0)
                return func_02032a94(actor, other, context);
            extra = *(s8 *)(other + 0x27f);
            if (ActorDerivedType1_IsTargetStateEligible(other) != 0) {
                extra += *(s16 *)(other + 0x29e);
                if (*(s8 *)(other + 0x27e) == 1)
                    (*(void (**)(void *))(*(u8 **)other + 0x200))(other);
            }
            if (ActorDerivedType1_IsTargetStateEligible(other) != 0 || other[0x24c] == 3) {
                void *resource = *(void **)(actor + 0x234);
                if (resource != 0
                    && (*(u32 *)((u8 *)resource + 0x20) & 0x10000) != 0) {
                    func_0206e590(resource, 0);
                    func_0206c978(resource);
                    Heap_Free(resource);
                    GameWork_ClearFlag(gGameWork, 0x3fd);
                    *(void **)(actor + 0x234) = 0;
                    *(u16 *)(actor + 0x246) = 0;
                    return func_02032a94(actor, other, context);
                }
            }
            record = *(u8 **)(actor + 0x29c);
            func_02046e60(actor, other, *(u16 *)(record + 0x38) >> 7, extra);
            return func_02032a94(actor, other, context);
        }
        {
            s32 dx = *(s32 *)(other + 0x1c) - *(s32 *)(actor + 0x1c);
            s32 dy = *(s32 *)(other + 0x20) - *(s32 *)(actor + 0x20);
            s32 magnitude = func_0204cfa4(dx, dy);
            if (magnitude <= 0x1000)
                return func_02032a94(actor, other, context);
            dx = func_020adc90(dx, magnitude);
            dy = func_020adc90(dy, magnitude);
            if ((*(u32 *)(actor + 0xd0) & 0x10) != 0) {
                dx = func_020adae4(dx, 2);
                dy = func_020adae4(dy, 2);
            }
            if (type == 1) {
                if (context == 0
                    && (*(u32 *)(actor + 0x268) & 4) == 0
                    && func_02046d8c(actor) == 0
                    && (*(u32 *)(actor + 0x268) & 0x8000) != 0) {
                    u32 temporary[4];
                    func_02005030(temporary, actor + 0x18);
                    temporary[1] = (u32)((s32)temporary[1] - dx * 20);
                    temporary[2] = (u32)((s32)temporary[2] - dy * 30);
                    func_020478dc(actor, temporary, 0x4b);
                    func_02005058(temporary);
                }
                if (*(u16 *)(actor + 0x254) == 0) {
                    *(s32 *)(actor + 0x9c) -= dx;
                    *(s32 *)(actor + 0xa0) -= dy;
                }
                if (context == 0) {
                    *(s32 *)(other + 0x9c) += dx;
                    *(s32 *)(other + 0xa0) += dy;
                    if (func_02046d8c(actor) != 0
                        && *(void **)(actor + 0x210) == other
                        && ActorDerivedType1_IsSpecialRecordActive(other) != 0) {
                        ActorDerivedType1_StartRecord(other, 0x88);
                        *(u16 *)(other + 0x268) = 0;
                        func_020481dc(actor, data_020e16b0[0],
                                      data_020e16b0[1], 30);
                        if (*(s16 *)(actor + 0xd6) != 18)
                            func_0204b7bc(actor, 2);
                    }
                }
            } else {
                *(s32 *)(actor + 0x9c) -= dx;
                *(s32 *)(actor + 0xa0) -= dy;
                *(s32 *)(other + 0x8c) += dx;
                *(s32 *)(other + 0x90) += dy;
            }
        }
        if (context == 0
            && (*(u32 *)(actor + 0xd0) & 0x10) == 0
            && *(u16 *)(actor + 0x254) == 0
            && *(u16 *)(actor + 0x252) != 0xffff
            && other[0x4d] == 1
            && (*(s32 (**)(void *))(*(u8 **)other + 0x68))(other) != 0
            && (u16)(*(s16 *)(actor + 0xd6) - 1) <= 1) {
            u16 encoded = *(u16 *)(actor + 0x252);
            func_020593dc(gSoundContext, encoded >> 7, encoded & 0x7f,
                          actor, 0, 0x100);
            *(u16 *)(actor + 0x254) = 10;
        }
        return func_02032a94(actor, other, context);
    }

    type = other[0x4d];
    if (type == 3) {
        s32 dx;
        s32 dy;
        s32 magnitude;
        if (*(u16 *)(other + 0x4e) != 0x18)
            return func_02032a94(actor, other, context);
        dx = *(s32 *)(other + 0x1c) - *(s32 *)(actor + 0x1c);
        dy = *(s32 *)(other + 0x20) - *(s32 *)(actor + 0x20);
        magnitude = func_0204cfa4(dx, dy);
        if (magnitude > 0x1000) {
            dx = func_020adc90(dx, magnitude);
            *(s32 *)(actor + 0x9c) -= dx * 3;
            dy = func_020adc90(dy, magnitude);
            *(s32 *)(actor + 0xa0) -= dy;
        }
    } else if (context == 0
               && *(void **)(actor + 0x234) == 0
               && type == 4
               && *(u16 *)(*(u8 **)(actor + 0x29c) + 0x40) != 0
               && *(s32 *)(other + 0x24) - *(s32 *)(actor + 0x24) >= 0
               && *(u16 *)(actor + 0x4e) != 0x25c
               && *(u16 *)(other + 0x4e) >= 0x15
               && *(u16 *)(other + 0x4e) <= 0x26
               && *(u16 *)(other + 0x4e) != 0x20) {
        func_020481dc(actor, data_020e1708[0], data_020e1708[1], 30);
        if (*(s16 *)(actor + 0xd6) != 18)
            func_0204b7bc(actor, 2);
    }
    return func_02032a94(actor, other, context);
}
