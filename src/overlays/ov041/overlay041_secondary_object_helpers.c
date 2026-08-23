#include "tingle/types.h"

/*
 * Overlay 41 secondary scene-object helpers. These recovered methods configure
 * render children, set a mode-adjusted vertical threshold with audio feedback,
 * and classify that threshold into one of three owner-relative bands.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void GraphicsSpriteState_SetAnimationIndex(void *, s32);
s32 Sound_IsEffectPlaying(void *, s32, s32);
void Sound_Play(void *, s32, s32);
s32 func_020befec(s32, s32);
extern void *gSoundContext;
}

/*
 * Configure render with placement (x,y,z), initialize its linked resource from
 * the final byte argument, set object and linked visibility flags, reset scale
 * and rotation, and return no value. The first object argument is unused.
 */
extern "C" void func_ov041_02200910(void *, void *render, s32 x, s32 y,
                                     s32 z, u8 resourceMode)
{
    void *linked = FIELD(void *, render, 0x0c);
    GraphicsSpriteState_SetAnimationIndex(linked, resourceMode);
    FIELD(u16, linked, 0x24) |= 2;
    FIELD(s32, render, 0x30) = x;
    FIELD(s32, render, 0x34) = y;
    FIELD(s32, render, 0x38) = z;
    FIELD(u16, render, 0x3c) = 0x100;
    FIELD(u16, render, 0x3e) = 0x100;
    FIELD(u16, render, 0x40) = 0;
    FIELD(u8, linked, 0x3a) = 1;
}

/*
 * Store input rows as a 20.12 vertical threshold. Mode two adds 0x50000;
 * other modes add 0xC0000 and ensure sound 0x12D is playing on channels 8 and
 * 12 when the queried channel is idle. No value is returned.
 */
extern "C" void func_ov041_02200970(void *object, s32 rows)
{
    s32 value = rows << 12;
    if (FIELD(s32, FIELD(void *, object, 0x48), 0x1f4) == 2) {
        FIELD(s32, object, 0x15c) = value + 0x50000;
        return;
    }
    FIELD(s32, object, 0x15c) = value + 0xc0000;
    if (Sound_IsEffectPlaying(gSoundContext, 0x12d, 8) == 0) {
        Sound_Play(gSoundContext, 0x12d, 8);
        Sound_Play(gSoundContext, 0x12d, 12);
    }
}

/*
 * Classify object+0x15C against one-third of owner row spans. Returns zero
 * below the 0x60-per-row threshold, one before the 0xC0-per-row threshold, and
 * two at or beyond it. The object is unchanged.
 */
extern "C" s32 func_ov041_022009e8(void *object)
{
    s32 value = FIELD(s32, object, 0x15c) >> 12;
    s32 rows = FIELD(s32, FIELD(void *, object, 0x48), 0x174);
    if (func_020befec(rows * 0x60, 3) > value)
        return 0;
    return value < func_020befec(rows * 0xc0, 3) ? 1 : 2;
}
