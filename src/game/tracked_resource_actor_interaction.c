#include "tingle/types.h"

/* Recovered target-type interaction dispatcher for the tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedType1_DispatchInteractionAmount(void *target, s32 value);
extern void func_0204b818(void *target, s32 value, const void *record,
                          u32 argument);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are a source actor, optional target actor, an unused third register
 * value, and an opaque fourth argument. Ignore null targets and targets with
 * flag 0x1000000. For target type byte 1, call ActorDerivedType1_DispatchInteractionAmount with signed record
 * halfword 0x0C. For target type 7, call func_0204b818 with signed record
 * halfword 0x0E, the source record at 0x1FC, and the fourth argument. Other
 * target types are ignored. Returns nothing; target engine state may change
 * and hardware is not accessed directly.
 */
void func_02050560(void *actor, void *target, u32 unused, u32 argument)
{
    const void *record;
    (void)unused;
    if (target == 0 || (FIELD(u32, target, 0x10) & 0x1000000) != 0)
        return;
    record = FIELD(const void *, actor, 0x1fc);
    if (FIELD(u8, target, 0x4d) == 1) {
        ActorDerivedType1_DispatchInteractionAmount(target, FIELD(s16, record, 0x0c));
    } else if (FIELD(u8, target, 0x4d) == 7) {
        func_0204b818(target, FIELD(s16, record, 0x0e), record, argument);
    }
}

