#include "tingle/types.h"

/* Install and clear a gated type-1 actor state vector and its short timers. */
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02035bc8(void *actor);
extern void *func_020050a4(void *destination, const void *source);
extern void Sound_Play(void *context, s32 channel, s32 sound);
#ifdef __cplusplus
}
#endif

/*
 * Return without changes while auxiliary +0x26c exists, object +0x54 flags
 * 0x1c are set, halfword +0x204 or +0x2a2 is nonzero, or func_02035bc8 is
 * false. If timers +0x264/+0x266 are both zero, optionally play packed sound
 * 0x28/0x58/0x61 for kind 2, 0/-2, or 3. If either timer is active, kind three
 * instead returns early. Otherwise copy vector to +0x254, store kind in byte
 * +0x26a, value in +0x264, five in +0x266, and 15 in +0x252. Returns no value;
 * vector-copy and sound calls have observable engine/SDK effects.
 */
void func_02038d38(void *self, const void *vector, s32 value, s32 kind)
{
    u8 *actor = (u8 *)self;
    u16 objectFlags;
    u16 sound = 0;

    if (*(void **)(actor + 0x26c) != 0)
        return;
    objectFlags = *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 0x1c;
    if (objectFlags != 0 || *(u16 *)(actor + 0x204) != 0 ||
        *(u16 *)(actor + 0x2a2) != 0 || func_02035bc8(actor) == 0)
        return;

    if (*(s16 *)(actor + 0x264) == 0 && *(s16 *)(actor + 0x266) == 0) {
        if (kind == 2)
            sound = 0x28;
        else if (kind == 0 || kind == -2)
            sound = 0x58;
        else if (kind == 3)
            sound = 0x61;
        if (sound != 0)
            Sound_Play(gSoundContext, sound >> 7, sound & 0x7f);
    } else if (kind == 3) {
        return;
    }

    actor[0x26a] = (u8)kind;
    func_020050a4(actor + 0x254, vector);
    *(u16 *)(actor + 0x264) = (u16)value;
    *(u16 *)(actor + 0x266) = 5;
    *(u16 *)(actor + 0x252) = 15;
}

/*
 * Clear actor halfwords +0x264, +0x266, and +0x252. Returns no value and
 * calls no helpers.
 */
void func_02038e38(void *self)
{
    u8 *actor = (u8 *)self;
    *(u16 *)(actor + 0x264) = 0;
    *(u16 *)(actor + 0x266) = 0;
    *(u16 *)(actor + 0x252) = 0;
}
