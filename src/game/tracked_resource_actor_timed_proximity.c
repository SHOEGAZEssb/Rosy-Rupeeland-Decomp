#include "tingle/types.h"

/* Recovered proximity response and shared update delegation for a timed tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void func_02005058(void *vector);
extern s32 func_02005070(const void *vector);
extern void func_020066a4(void *destination, const void *target,
                          const void *source);
extern s32 func_0203392c(void *actor, u32 argument);
extern void ActorDerivedType1_TrySetStateVector(void *target, const void *position, s32 duration,
                          s32 argument);
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
 * Inputs are a timed actor and an argument forwarded to func_0203392c. Builds a
 * vector between actor position 0x18 and the manager object at offset 0x2EA4.
 * Within distance 0x28000, calls actor virtual slot 0xC4 with that object,
 * derives a scale from the remaining distance, and applies rounded 12-bit
 * fixed-point scaling to fields 0x8C and 0x90. It also sets field 0x44 to
 * 0x3000, timer halfword 0x200 to 10, and calls ActorDerivedType1_TrySetStateVector with duration 10
 * and argument -1. Then delegates to func_0203392c, destroys the temporary,
 * and returns the delegated result. Manager/callback operations can mutate
 * engine state; no hardware is accessed directly. Fixed-point semantics are
 * inferred from the recovered multiply-and-round sequence.
 */
s32 func_0205184c(void *actor, u32 argument)
{
    u8 vector[16];
    void *target;
    s32 distance;
    s32 factor;
    s64 product;
    s32 result;

    target = FIELD(void *, data_021052fc, 0x2ea4);
    func_020066a4(vector, (u8 *)target + 0x18, (u8 *)actor + 0x18);
    FIELD(s32, vector, 0x0c) = 0;
    distance = func_02005070(vector);
    if (distance < 0x28000) {
        virtual_function(actor, 0xc4)(actor, target);
        factor = func_020adae4(0x28000 - distance, 0x28) + 0x2000;
        product = (s64)FIELD(s32, actor, 0x8c) * factor + 0x800;
        FIELD(s32, actor, 0x8c) = (s32)(product >> 12);
        factor = func_020adae4(0x28000 - distance, 0x28) + 0x2000;
        product = (s64)FIELD(s32, actor, 0x90) * factor + 0x800;
        FIELD(s32, actor, 0x90) = (s32)(product >> 12);
        FIELD(s32, actor, 0x44) = 0x3000;
        FIELD(u16, actor, 0x200) = 10;
        ActorDerivedType1_TrySetStateVector(target, (u8 *)actor + 0x18, 10, -1);
    }
    result = func_0203392c(actor, argument);
    func_02005058(vector);
    return result;
}
