#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Pairwise separation steering for the three overlay-90 boss-stage participants. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TitleSeparationState {
    u8 unknown_000[0x1f4];
    void *participants_1f4[3];
} TitleSeparationState;

extern s32 func_020adc90(s32 numerator, s32 denominator);
extern u64 func_020befec(s32 dividend, s32 divisor);
extern void func_ov090_0221b3d0(VecFx32Object *vector, fx32 scale);

/*
 * Compare every participant with the other two. A participant whose +0xda
 * state is lower and whose pixel-space position is inside the higher-state
 * participant's `(state * 8 + 50)` radius receives a normalized 0x2000 push
 * in vector +0x88. Clamp the accumulated vector magnitude to 0x3000.
 */
void func_ov090_0221b280(TitleSeparationState *self)
{
    s32 i = 0;

    do {
        void *source = self->participants_1f4[i];
        s32 sourceState = FIELD(s16, source, 0xda);
        s32 radius = sourceState * 8 + 0x32;
        s32 offset = 1;

        do {
            /* Preserve retail's shared signed-divmod call and remainder ABI. */
            s32 otherIndex = (s32)(func_020befec(i + offset, 3) >> 32);
            void *other = self->participants_1f4[otherIndex];
            if (FIELD(s16, other, 0xda) < sourceState) {
                s32 dx = (FIELD(s32, other, 0x1c) >> 12) -
                         (FIELD(s32, source, 0x1c) >> 12);
                s32 dy = (FIELD(s32, other, 0x20) >> 12) -
                         (FIELD(s32, source, 0x20) >> 12);
                s32 distanceSquared = dx * dx + dy * dy;
                if (distanceSquared > 0 &&
                    distanceSquared < radius * radius) {
                    VecFx32Object push;
                    VecFx32Object *velocity;
                    fx32 magnitude;

                    VecFx32Object_InitComponents(&push, dx, dy, 0);
                    VecFx32Object_Normalize(&push);
                    func_ov090_0221b3d0(&push, 0x2000);
                    velocity = (VecFx32Object *)((u8 *)other + 0x88);
                    VecFx32Object_Add(velocity, &push);
                    magnitude = VecFx32Object_GetMagnitude(velocity);
                    if (magnitude > 0x3000) {
                        velocity->value.x =
                            func_020adc90(velocity->value.x, magnitude);
                        velocity->value.y =
                            func_020adc90(velocity->value.y, magnitude);
                        velocity->value.z =
                            func_020adc90(velocity->value.z, magnitude);
                        func_ov090_0221b3d0(velocity, 0x3000);
                    }
                    VecFx32Object_Destroy(&push);
                }
            }
            offset++;
        } while (offset < 3);
        i++;
    } while (i < 3);
}
