#include "tingle/types.h"

/* Derive actor-relative volume and pan, then dispatch packed sound requests. */
extern void *data_021052fc;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorMotionAreaFollower_GetPosition(void *state);
extern s32 SignedAbsoluteValueVariant(s32 value);
extern s32 func_020adae4(s32 dividend, s32 divisor);
extern s32 func_020adc40(s32 value);
extern void Sound_PlayEffectWithParameters(void *soundContext, s32 archive,
                          s32 member, s32 volume, s32 pan, s32 pitch);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are an actor, a zero-extended 16-bit packed archive/member identifier,
 * and signed pitch in 1/64-semitone units. Return without querying the
 * reference position or requesting sound unless actor flag 0x4 at +0x10 is set or
 * pointer +0x58 is nonnull. Resolve the motion-area follower position once,
 * then subtract its X and the fixed 128-pixel horizontal listener offset from
 * actor X.
 * Arithmetic-shift the Q20.12 result into integer pixels, rounding negative
 * fractions down, and clamp it to pan [-96,96]. Volume is 96-|pan|/3, yielding
 * [64,96]. Decode archive=packedSound>>7 in [0,511] and
 * member=packedSound&0x7f, and forward pitch unchanged. Returns no value; the
 * volume division uses Nintendo DS divider MMIO, and the final helper receives
 * the sound request and may change sound state.
 */
void Actor_PlayHorizontalSpatialSound(void *actor, u32 packedSound, s32 pitch)
{
    u8 *actorBytes = (u8 *)actor;
    u8 *soundReferencePosition;
    s32 pan;
    s32 volume;

    if ((*(u32 *)(actorBytes + 0x10) & 4) == 0 &&
        *(void **)(actorBytes + 0x58) == 0) {
        return;
    }
    soundReferencePosition =
        (u8 *)ActorMotionAreaFollower_GetPosition((u8 *)data_021052fc + 0x2fbc);
    pan = (*(s32 *)(actorBytes + 0x1c) -
           *(s32 *)(soundReferencePosition + 4) - 0x80000) >> 12;
    if (pan < -96) pan = -96;
    if (pan > 96) pan = 96;
    volume = 96 - func_020adae4(SignedAbsoluteValueVariant(pan), 3);
    Sound_PlayEffectWithParameters(gSoundContext, packedSound >> 7,
                  packedSound & 0x7f, volume, pan, pitch);
}

/*
 * Inputs use the same actor, packed-sound, and pitch contract as the horizontal
 * helper, with no actor-bit or pointer gate. Resolve the motion-area follower
 * once for X and, only when X is in inclusive range [-255,255], a second
 * independent time for Y; the components may therefore use different follower
 * snapshots. Subtract the fixed 128-pixel horizontal and 116-pixel vertical
 * listener offsets, then arithmetic-shift from Q20.12 into integer pixels and
 * return without requesting sound if either component is outside that range.
 * Otherwise distance=floor(sqrt(X*X+Y*Y)), raw volume=96-distance/3 in
 * [-24,96], and pan=X/2 toward zero in [-127,127]. The downstream sound path
 * clamps volume to [0,127]. Decode the packed archive/member and forward pitch
 * unchanged. Returns no value; it queries the reference once or twice and the
 * final helper receives a request for every accepted position, including
 * effectively silent corners. Distance and volume use Nintendo DS square-root
 * and divider MMIO.
 */
void Actor_PlayRadialSpatialSound(void *actor, u32 packedSound, s32 pitch)
{
    u8 *actorBytes = (u8 *)actor;
    u8 *soundReferencePosition =
        (u8 *)ActorMotionAreaFollower_GetPosition((u8 *)data_021052fc + 0x2fbc);
    s32 relativeX = (*(s32 *)(actorBytes + 0x1c) -
                     *(s32 *)(soundReferencePosition + 4) - 0x80000) >> 12;
    s32 relativeY;
    s32 distance;
    s32 volume;

    if (relativeX < -255 || relativeX > 255) return;
    soundReferencePosition =
        (u8 *)ActorMotionAreaFollower_GetPosition((u8 *)data_021052fc + 0x2fbc);
    relativeY = (*(s32 *)(actorBytes + 0x20) -
                 *(s32 *)(soundReferencePosition + 8) - 0x74000) >> 12;
    if (relativeY < -255 || relativeY > 255) return;

    distance =
        func_020adc40((relativeX * relativeX + relativeY * relativeY) << 12) >> 12;
    volume = 96 - func_020adae4(SignedAbsoluteValueVariant(distance), 3);
    Sound_PlayEffectWithParameters(gSoundContext, packedSound >> 7,
                  packedSound & 0x7f, volume, relativeX / 2, pitch);
}
