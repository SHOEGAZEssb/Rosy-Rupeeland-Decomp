#include "tingle/types.h"

/* Recovered record, transform, and presentation setup for an orientation-driven tracked-resource actor. */

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

/*
 * Inputs are an oriented actor, its record, a transform-related argument, and
 * an unused fourth value. Stores the record at 0x1FC, derives a vector at 0x38,
 * clamps a magnitude-derived divisor to at least 4, divides the vector by it,
 * and scales it by signed record halfword 0x0A shifted four bits. It copies that
 * same halfword to presentation offset 0x36, sets actor flag 0x800000, and
 * replaces the low half of field 0x5C with 8. Returns nothing; transform and
 * presentation state change without direct hardware access. The presentation
 * field's higher-level role remains unresolved.
 */
void TrackedResourceActorType28_SetupFromRecord(void *actor, const void *record, u32 argument, u32 unused)
{
    u8 vector[16];
    s32 length;
    s16 scaleControl;
    (void)unused;
    FIELD(const void *, actor, 0x1fc) = record;
    VecFx32_Subtract(vector, argument, (u8 *)actor + 0x18);
    VecFx32Object_Assign((u8 *)actor + 0x38, vector);
    VecFx32Object_Destroy(vector);
    length = VecFx32Object_GetMagnitude((u8 *)actor + 0x38);
    if (length < 4)
        length = 4;
    VecFx32Object_DivideInPlaceByScalar((u8 *)actor + 0x38, length);
    scaleControl = FIELD(s16, record, 0x0a);
    VecFx32Object_ScaleInPlaceRounded((u8 *)actor + 0x38,
                                      (s32)scaleControl << 4);
    FIELD(s16, FIELD(void *, actor, 0x54), 0x36) = scaleControl;
    FIELD(u32, actor, 0x14) |= 0x800000;
    FIELD(u32, actor, 0x5c) = (FIELD(u32, actor, 0x5c) & 0xffff0000) | 8;
}
