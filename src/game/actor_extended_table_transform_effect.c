#include "tingle/types.h"

/* Recovered target-relative transform and effect callback for the table-configured actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *value);
extern void VecFx32_Subtract(void *output, const void *first, const void *second);
extern s32 ActorExtendedType2_GetDescriptorValue2C(const void *actor);
extern s32 Fx32Vector2_Magnitude(s32 x, s32 y);
extern s32 func_020adc90(s32 value, s32 divisor);
extern s32 TrackedResourceActor_SpawnFromKey(s32 mode, void *first, void *second);
#ifdef __cplusplus
}
#endif

/*
 * Copy target actor +0x228 transform +0x18 and actor transform +0x18 to two
 * temporaries. When descriptor value +0x2c is positive, derive their displacement
 * with VecFx32_Subtract and zero its fourth word. If its +4/+8 magnitude exceeds
 * 0x1000, normalize those components with func_020adc90, scale them from that
 * value using rounded fixed-point multiplication, and submit
 * the displacement to actor vtable +0xb8 with argument one. Finalize that
 * temporary when constructed. Then call TrackedResourceActor_SpawnFromKey(mode,actorTransform,
 * targetTransform), finalize both copied transforms, and return its result.
 * Actor, virtual, transform, and effect state may change without direct
 * hardware access.
 */
s32 ActorExtendedTable_ApplyTargetRelativeTransform(void *self, s32 mode)
{
    u8 *actor = (u8 *)self;
    u8 *target = *(u8 **)(actor + 0x228);
    u32 targetTransform[4];
    u32 actorTransform[4];
    u32 displacement[4];
    s32 result;

    VecFx32Object_InitCopy(targetTransform, target + 0x18);
    VecFx32Object_InitCopy(actorTransform, actor + 0x18);
    if (ActorExtendedType2_GetDescriptorValue2C(actor) > 0) {
        s32 magnitude;
        VecFx32_Subtract(displacement, actorTransform, targetTransform);
        displacement[3] = 0;
        magnitude = Fx32Vector2_Magnitude((s32)displacement[1],
                                  (s32)displacement[2]);
        if (magnitude > 0x1000) {
            s32 scale = ActorExtendedType2_GetDescriptorValue2C(actor) << 4;
            s32 x = func_020adc90((s32)displacement[1], magnitude);
            s32 y = func_020adc90((s32)displacement[2], magnitude);
            displacement[1] = (u32)(((s64)x * scale + 0x800) >> 12);
            displacement[2] = (u32)(((s64)y * scale + 0x800) >> 12);
            (*(void (**)(void *, void *, s32))(*(u8 **)actor + 0xb8))(
                actor, displacement, 1);
        }
        VecFx32Object_Destroy(displacement);
    }
    result = TrackedResourceActor_SpawnFromKey(mode, actorTransform, targetTransform);
    VecFx32Object_Destroy(actorTransform);
    VecFx32Object_Destroy(targetTransform);
    return result;
}
