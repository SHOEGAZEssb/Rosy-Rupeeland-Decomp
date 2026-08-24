#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/*
 * Recovered convenience spawners for presentation-backed actors. One chooses
 * a type-10 denomination from an amount; the other emits three type-19 actors
 * with rotating velocity vectors.
 */

extern const s16 data_020c3e78[];
extern const s16 gFx32CosSinTable[];
extern u16 gPresentationBackedActorRuntimeState[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *PresentationBackedActor_Spawn(s32 type, u32 value_1f4, u32 value_1f2,
                           const void *position, const void *vector_38,
                           u32 descriptor_arg0, u32 descriptor_arg1,
                           u32 descriptor_arg2, u32 selection,
                           u32 value_1ef, s32 enable_flag_200);
extern s32 func_020adae4(s32 numerator, s32 denominator);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are a playback value, an amount, a position, and a vector source.
 * Select the greatest of seven data_020c3e78 thresholds strictly below the
 * amount (clamped to indices 0..6), then spawn one type-10 actor using resource
 * IDs 0x300D..0x300F, selection equal to that index, value byte 7, and flag
 * selector 1. Return the spawned actor; manager state changes, with no direct
 * hardware effects.
 */
void *PresentationBackedActor_SpawnAmountVariant(u32 playback_value, s32 amount,
                    const void *position, const void *vector)
{
    s32 index = 0;
    while (index < 7) {
        if (amount <= data_020c3e78[index]) {
            index--;
            break;
        }
        index++;
    }
    if (index < 0)
        index = 0;
    else if (index >= 7)
        index = 6;

    return PresentationBackedActor_Spawn(10, playback_value, data_020c3e78[index],
                         position, vector, 0x300d, 0x300e, 0x300f,
                         index, 7, 1);
}

/*
 * Inputs are a playback value, an amount, and a position. Initialize a local
 * vector, take one third of the amount as a signed 16-bit value, and spawn
 * three type-19 actors using resources 0x3010, 0x300E, and 0x3011. Each
 * vector's X/Y payload uses the global angle's table entry scaled by 3/2;
 * advance the angle by a
 * random remainder modulo 0x3000 plus 0x3000 after every spawn. Returns nothing;
 * actor-manager and RNG state change and hardware is not accessed directly.
 */
void PresentationBackedActor_SpawnTripleVariant(u32 playback_value, s32 amount, const void *position)
{
    VecFx32Object velocity;
    s16 divided_amount = (s16)func_020adae4(amount, 3);
    s32 i;

    VecFx32Object_InitComponents(&velocity, 0, 0, 0x2000);
    for (i = 0; i < 3; i++) {
        s32 angle_index = (s16)gPresentationBackedActorRuntimeState[0] >> 4;
        velocity.value.x = func_020adae4(
            gFx32CosSinTable[angle_index * 2 + 1] * 3, 2);
        velocity.value.y = func_020adae4(
            gFx32CosSinTable[angle_index * 2] * 3, 2);
        PresentationBackedActor_Spawn(19, playback_value, divided_amount, position,
                      &velocity, 0x3010, 0x300e, 0x3011, 0, 7, 1);
        gPresentationBackedActorRuntimeState[0] = (u16)(gPresentationBackedActorRuntimeState[0] +
            (genrand_int32() % 0x3000) + 0x3000);
    }
    VecFx32Object_Destroy(&velocity);
}
