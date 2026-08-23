#include "tingle/types.h"

/*
 * Recovered extended type-two actor release/launch helpers. They install the
 * release callbacks, refresh collision state, and initialize randomized motion.
 */
extern u8 data_020df9e8[];
extern s16 data_020c9670[];
extern u16 data_020e6d3c[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern void Actor_SaveAndForceFlags(void *actor);
extern u32 genrand_int32(void);
extern void Actor_PlayHorizontalSpatialSound(void *actor, u32 packedSound, s32 pitch);
#ifdef __cplusplus
}
#endif

/*
 * Set actor +0xd0 bit 0x80, install global pair +0x1e0/+0x1e4 at
 * +0x218/+0x21c, store Actor_GetCachedTerrainHeight(actor) at +0x24, then invoke
 * Actor_SaveAndForceFlags. The routine has no meaningful return value; actor and engine
 * bookkeeping may change, with no direct hardware access.
 */
void ActorExtendedType2_PrepareRelease(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0xd0) |= 0x80;
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x1e0);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x1e4);
    *(s32 *)(actor + 0x24) = Actor_GetCachedTerrainHeight(actor);
    Actor_SaveAndForceFlags(actor);
}

/*
 * Refresh actor bookkeeping with Actor_SaveAndForceFlags, clear +0x14 bits 1, 2, and
 * 0x40, invoke virtual +0x40, set +0x10 mask 0x1f0000, and install global pair
 * +0x1d8/+0x1dc. Unless +0x260 bit 0x8000 is set, a random low-16-bit angle
 * indexes data_020c9670 to set +0x3c/+0x40 velocity at twice table magnitude
 * and +0x44 to 0x3800. Attachment scales +0x32/+0x34 become 0x100, +0x30 and
 * actor +0x25a clear, +0xd0 bit 0x100 is set, and +0x260 bits zero and one clear.
 * Finally the descriptor-indexed data_020e6d3c sound is played unless 0xffff.
 * The routine has no meaningful return value. Actor, attachment, random,
 * virtual, bookkeeping, and sound state may change; Actor_PlayHorizontalSpatialSound crosses the
 * sound boundary.
 */
void ActorExtendedType2_LaunchRandomMotion(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *attachment;
    u16 sound;

    Actor_SaveAndForceFlags(actor);
    *(u32 *)(actor + 0x14) &= ~0x46;
    (*(void (**)(void *))(*(u8 **)actor + 0x40))(actor);
    *(u32 *)(actor + 0x10) |= 0x1f0000;
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x1d8);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x1dc);
    {
        u16 random = (u16)genrand_int32();
        if ((*(u32 *)(actor + 0x260) & 0x8000) == 0) {
            s32 angle = random >> 4;
            *(s32 *)(actor + 0x3c) = data_020c9670[angle * 2 + 1] << 1;
            *(s32 *)(actor + 0x40) = data_020c9670[angle * 2] << 1;
            *(s32 *)(actor + 0x44) = 0x3800;
        }
    }
    attachment = *(u8 **)(actor + 0x54);
    *(u16 *)(attachment + 0x32) = 0x100;
    *(u16 *)(attachment + 0x34) = 0x100;
    *(u16 *)(attachment + 0x30) = 0;
    *(u32 *)(actor + 0xd0) |= 0x100;
    *(u32 *)(actor + 0x260) &= ~3;
    *(u16 *)(actor + 0x25a) = 0;
    sound = data_020e6d3c[*(u16 *)(actor + 0x4e)];
    if (sound != 0xffff)
        Actor_PlayHorizontalSpatialSound(actor, sound, 0);
}
