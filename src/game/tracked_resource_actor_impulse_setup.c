#include "tingle/types.h"

/* Recovered record, transform, and initial callback setup for an impulse-oriented tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Destroy(void *vector);
extern s32 VecFx32Object_GetMagnitude(const void *vector);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32_Subtract(void *destination, u32 argument, const void *position);
extern void VecFx32Object_ScaleInPlaceRounded(void *vector, s32 scale);
extern void VecFx32Object_DivideInPlaceByScalar(void *vector, s32 divisor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))
typedef void (*ActorFunction)(void *);

/*
 * Inputs are an impulse actor, its record, a transform-related argument, and an
 * unused fourth value. Stores the record at 0x1FC, derives a vector at 0x38,
 * applies signed record byte 0x15, clamps a magnitude-derived divisor to at
 * least 4, divides the vector by it, and scales by record halfword 0x0A shifted
 * four bits. It then forces field
 * 0x44 to 0x2800, sets flag 0x800000 at 0x14 and flag 0x2000 at 0xD0, replaces
 * the low half of 0x5C with 8, and invokes actor virtual slot 0xD8. Returns
 * nothing; helpers and the callback mutate engine state without direct hardware
 * access. Record-field semantics remain inferred.
 */
void TrackedResourceActorImpulse_SetupFromRecord(void *actor, const void *record, u32 argument, u32 unused)
{
    u8 vector[16];
    s32 length;
    (void)unused;
    FIELD(const void *, actor, 0x1fc) = record;
    VecFx32_Subtract(vector, argument, (u8 *)actor + 0x18);
    VecFx32Object_Assign((u8 *)actor + 0x38, vector);
    VecFx32Object_Destroy(vector);
    FIELD(s32, actor, 0x44) += (s32)FIELD(s8, record, 0x15) * 0x1000;
    length = VecFx32Object_GetMagnitude((u8 *)actor + 0x38);
    if (length < 4)
        length = 4;
    VecFx32Object_DivideInPlaceByScalar((u8 *)actor + 0x38, length);
    VecFx32Object_ScaleInPlaceRounded((u8 *)actor + 0x38,
                  (s32)FIELD(s16, record, 0x0a) << 4);
    FIELD(s32, actor, 0x44) = 0x2800;
    FIELD(u32, actor, 0x14) |= 0x800000;
    FIELD(u32, actor, 0xd0) |= 0x2000;
    FIELD(u32, actor, 0x5c) = (FIELD(u32, actor, 0x5c) & 0xffff0000) | 8;
    (*(ActorFunction *)((u8 *)FIELD(void *, actor, 0) + 0xd8))(actor);
}
