#include "tingle/types.h"

/* Recovered collision exit for an impulse-oriented tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gActorRuntimeCollection;
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *state);
extern void VecFx32Object_SetComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void VecFx32Object_ScaleInPlaceRounded(void *vector, s32 scale);
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
 * Inputs are an impulse actor, optional target, and two unused callback values.
 * When global state permits and a target exists, copy vector 0x38, clear its
 * fourth word, scale it by signed record halfword 0x2A shifted four bits, and
 * pass it with value 1 to target virtual slot 0xB8. Then zero actor vector 0x38,
 * invoke actor slot 0xC8, and clear actor flag 0x800000. Returns nothing; virtual
 * callbacks mutate engine state and this function does not access hardware.
 */
void TrackedResourceActorImpulse_HandleCollision(void *actor, void *target, u32 unused1, u32 unused2)
{
    s32 vector[4];
    (void)unused1;
    (void)unused2;
    if (ActorRuntimeCollection_GetPendingAttachmentFlag(&gActorRuntimeCollection) == 0 && target != 0) {
        VecFx32Object_InitCopy(vector, (u8 *)actor + 0x38);
        vector[3] = 0;
        VecFx32Object_ScaleInPlaceRounded(vector,
                      (s32)FIELD(s16, FIELD(void *, actor, 0x1fc), 0x2a) << 4);
        virtual_function(target, 0xb8)(target, vector, 1);
        VecFx32Object_Destroy(vector);
    }
    VecFx32Object_SetComponents((u8 *)actor + 0x38, 0, 0, 0);
    virtual_function(actor, 0xc8)(actor);
    FIELD(u32, actor, 0x14) &= 0xff7fffff;
}
