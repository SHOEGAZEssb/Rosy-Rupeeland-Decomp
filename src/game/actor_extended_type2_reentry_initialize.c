#include "tingle/types.h"

/*
 * Recovered extended type-two actor re-entry initialization. It clears motion
 * accumulators, selects one of two launch paths, and rebuilds state-20 context.
 */
extern u8 data_020df9e8[];
extern s16 data_020c9670[];
extern u16 gActorExtendedType2ReentryAngleAccumulator;
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SetPosition(void *actor, const void *position);
extern void ActorRuntimeTriple_Assign(void *value, s32 x, s32 y, s32 z);
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Destroy(void *vector);
extern void *ActorMotionAreaFollower_GetPosition(void *manager);
#ifdef __cplusplus
}
#endif

/*
 * Apply position through Actor_SetPosition, clear +0x264, and zero vector-like
 * fields +0x38, +0x88, and +0x98. If countdown +0x1fc is nonpositive, invoke
 * virtual +0x100 and only clear +0xd0 bit 0x20000. Otherwise clear attachment
 * +0x24 bit two and install global pair +0x1d0/+0x1d4. With variant zero, set
 * +0x3c to a random signed horizontal value, +0x40 to zero, and +0x44 to a
 * random value in [0x2000,0x2fff]. With nonzero variant, advance global angle
 * gActorExtendedType2ReentryAngleAccumulator by 0x1999 plus a random 12-bit value, wrap values above 0x8000,
 * derive a fixed-point 0x2800 vector through data_020c9670, construct a temporary
 * vector, pass it to virtual +0xb8 with mode one, and finalize it. Then set
 * +0x25a to 120, enter state 20, invoke virtual +0x5c, resolve the manager
 * resource at data_021052fc+0x2fbc and pass it with actor to virtual +0x58 using
 * 12 bytes of output storage. Finally set +0x10 bits 0x90000, clear +0x14 bits
 * one and two, and clear +0xd0 bit 0x20000. The routine has no meaningful return
 * value. Actor, attachment, global angle, random, virtual, vector, and manager
 * state may change; no direct hardware access occurs.
 */
void ActorExtendedType2_InitializeReentryState(void *self, const void *position, s32 variant)
{
    u8 *actor = (u8 *)self;
    u8 output[12];

    Actor_SetPosition(actor, position);
    *(u32 *)(actor + 0x264) = 0;
    ActorRuntimeTriple_Assign(actor + 0x38, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x88, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x98, 0, 0, 0);
    if (*(s32 *)(actor + 0x1fc) <= 0) {
        (*(void (**)(void *))(*(u8 **)actor + 0x100))(actor);
    } else {
        u8 *attachment = *(u8 **)(actor + 0x54);
        *(u16 *)(attachment + 0x24) &= (u16)~4;
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x1d0);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x1d4);
        if (variant == 0) {
            s32 random = (s32)(genrand_int32() & 0x7fffffff);
            *(s32 *)(actor + 0x3c) = (8 - func_020ada8c(random, 16)) << 11;
            *(s32 *)(actor + 0x40) = 0;
            *(s32 *)(actor + 0x44) = (genrand_int32() & 0xfff) + 0x2000;
        } else {
            u32 angle = gActorExtendedType2ReentryAngleAccumulator + (genrand_int32() & 0xfff) + 0x1999;
            gActorExtendedType2ReentryAngleAccumulator = (u16)angle;
            if (gActorExtendedType2ReentryAngleAccumulator > 0x8000)
                gActorExtendedType2ReentryAngleAccumulator -= 0x8000;
            {
                s32 index = gActorExtendedType2ReentryAngleAccumulator >> 4;
                s32 x = (s32)(((s64)data_020c9670[index * 2 + 1] * 0x2800 + 0x800) >> 12);
                s32 y = (s32)(((s64)data_020c9670[index * 2] * 0x2800 + 0x800) >> 12);
                s32 vector[4];
                VecFx32Object_InitComponents(vector, x, y, 0);
                (*(void (**)(void *, void *, s32))(*(u8 **)actor + 0xb8))
                    (actor, vector, 1);
                VecFx32Object_Destroy(vector);
            }
        }
        *(u16 *)(actor + 0x25a) = 120;
        *(u16 *)(actor + 0xd6) = 20;
        (*(void (**)(void *))(*(u8 **)actor + 0x5c))(actor);
        {
            void *resource = ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc);
            (*(void (**)(void *, void *, void *))(*(u8 **)actor + 0x58))
                (output, actor, resource);
        }
        *(u32 *)(actor + 0x10) |= 0x90000;
        *(u32 *)(actor + 0x14) &= ~6;
    }
    *(u32 *)(actor + 0xd0) &= ~0x20000;
}
