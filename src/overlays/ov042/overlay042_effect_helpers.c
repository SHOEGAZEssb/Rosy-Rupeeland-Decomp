#include "tingle/types.h"

/*
 * Overlay 42 effect-state helpers. These recovered routines configure one
 * presentation record, reset the scene's sampled-value state, derive an
 * offset position, and stop the confirmed group of sounds used by the effect.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void GraphicsSpriteState_SetAnimationIndex(void *resource, u8 mode);
extern "C" void func_0205940c(void *sound, s32 sequence, s32 value);
extern "C" void Sound_StopDirectSequence(void *sound, s32 sequence, s32 value);
extern "C" void func_ov042_021fcf80(void *element);
extern "C" void func_020a1794(void *owner, void *source, void *destination);
extern "C" void func_020a1ec0(void *owner, u16 value);
extern "C" void *gSoundContext;

/*
 * Configure record with three caller words and the sixth argument's low byte.
 * The first argument is unused. Set resource flag bit 1, initialize both scale
 * halfwords to 0x100, and clear +0x40; SDK-owned resource state changes and no
 * value is returned.
 */
extern "C" void func_ov042_02200604(void *unused, void *record,
                                    s32 value0, s32 value1,
                                    s32 value2, u8 mode)
{
    (void)unused;
    void *resource = FIELD(void *, record, 0xc);
    GraphicsSpriteState_SetAnimationIndex(resource, mode);
    FIELD(u16, resource, 0x24) |= 2;
    FIELD(s32, record, 0x30) = value0;
    FIELD(s32, record, 0x34) = value1;
    FIELD(s32, record, 0x38) = value2;
    FIELD(u16, record, 0x3c) = 0x100;
    FIELD(u16, record, 0x3e) = 0x100;
    FIELD(u16, record, 0x40) = 0;
}

/*
 * Reset the scene's effect bookkeeping. Clear the confirmed offset-derived
 * counters and accumulators, set +0x1B4 to 2, +0xE0 to 0x582, +0x1B0 to 1,
 * mark owner+0x48 word +0x1E8, install -0x2EE000 at +0xAC, and then reset the
 * sampled-value arrays through func_ov042_02200950. No value is returned.
 */
extern "C" void func_ov042_02200950(void *object);
extern "C" void func_ov042_022008f8(void *object)
{
    FIELD(s32, object, 0x1bc) = 0;
    FIELD(s32, object, 0x1b4) = 2;
    FIELD(s32, object, 0xbc) = 0;
    FIELD(s32, object, 0xc0) = 0;
    FIELD(s32, object, 0xc4) = 0;
    FIELD(s32, object, 0x1f0) = 0;
    FIELD(s32, object, 0x150) = 0;
    FIELD(s32, object, 0xe0) = 0x582;
    FIELD(s32, object, 0x1b0) = 1;
    FIELD(s32, FIELD(void *, object, 0x48), 0x1e8) = 1;
    FIELD(s32, object, 0xa8) = 0;
    FIELD(s32, object, 0xac) = (s32)0xffd12000;
    func_ov042_02200950(object);
}

/*
 * Reset the sample countdown at +0xE8, set the current sample +0xEC and all
 * 24 history words at +0xF0 to 0x40, then set hidden flag bit 2 on each of the
 * three child records at +0x5C..+0x64. Object and child state change; no value
 * is returned.
 */
extern "C" void func_ov042_02200950(void *object)
{
    FIELD(s32, object, 0xe8) = 0;
    FIELD(s32, object, 0xec) = 0x40;
    for (s32 i = 23; i >= 0; --i)
        FIELD(s32, object, 0xf0 + i * 4) = 0x40;
    for (s32 i = 2; i >= 0; --i)
        FIELD(u16, FIELD(void *, object, 0x5c + i * 4), 0x42) |= 4;
}

/*
 * Initialize destination as an overlay element, then derive its payload
 * coordinates from source offsets +0xA8/+0xAC plus the linked record at +0x54
 * coordinates +0x30/+0x34. Destination changes and no value is returned.
 */
extern "C" void func_ov042_02200afc(void *destination, const void *source)
{
    func_ov042_021fcf80(destination);
    void *record = FIELD(void *, source, 0x54);
    FIELD(s32, destination, 4) = FIELD(s32, source, 0xa8) + FIELD(s32, record, 0x30);
    FIELD(s32, destination, 8) = FIELD(s32, source, 0xac) + FIELD(s32, record, 0x34);
}

/*
 * Apply the recovered sound shutdown sequence to the global sound context:
 * command 0x1D7 with value 7, followed by commands 0xA4, 0xA5, 0xCD, 0xEA,
 * and 0xF0 with value zero. Audio SDK state changes and no value is returned.
 */
extern "C" void func_ov042_02200b38(void)
{
    func_0205940c(gSoundContext, 0x1d7, 7);
    Sound_StopDirectSequence(gSoundContext, 0xa4, 0);
    Sound_StopDirectSequence(gSoundContext, 0xa5, 0);
    Sound_StopDirectSequence(gSoundContext, 0xcd, 0);
    Sound_StopDirectSequence(gSoundContext, 0xea, 0);
    Sound_StopDirectSequence(gSoundContext, 0xf0, 0);
}

/*
 * Reset the larger effect scene's offset-derived runtime state. Set mode fields
 * +0x1B4/+0x1B0 to one, +0xE0 to 3000, two indices +0x224/+0x228 to -1,
 * clear the remaining recovered counters, set base coordinates +0xA8/+0xAC
 * to 0/-0x82000, apply the embedded state at +0xA4 to child +0x4C through the
 * owner at +0x48, set child scales to 0x10, reset sample history, send owner
 * value 0xB481, and store owner mode +0x1C8=4. SDK state changes; no return.
 */
extern "C" void func_ov042_02205cb8(void *object)
{
    FIELD(s32, object, 0x1b4) = 1;
    FIELD(s32, object, 0xc4) = 0;
    FIELD(s32, object, 0xe0) = 3000;
    FIELD(s32, object, 0x150) = 0;
    FIELD(s32, object, 0x1bc) = 0;
    FIELD(s32, object, 0x1c4) = 0;
    FIELD(s32, object, 0xbc) = 0;
    FIELD(s32, object, 0xc0) = 0;
    FIELD(s32, object, 0x1f0) = 0;
    FIELD(s32, object, 0x20c) = 0;
    FIELD(s32, object, 0x228) = -1;
    FIELD(s32, object, 0x224) = -1;
    FIELD(s32, object, 0x230) = 0;
    FIELD(s32, object, 0x22c) = 0;
    FIELD(s32, object, 0x238) = 0;
    FIELD(s32, object, 0x234) = 0;
    FIELD(s32, object, 0x1ec) = 0;
    FIELD(s32, object, 0x1b0) = 1;
    FIELD(s32, object, 0xa8) = 0;
    FIELD(s32, object, 0xac) = -0x82000;
    void *owner = FIELD(void *, object, 0x48);
    void *child = FIELD(void *, object, 0x4c);
    func_020a1794(owner, (u8 *)object + 0xa4, (u8 *)child + 0x2c);
    FIELD(u16, child, 0x3c) = 0x10;
    FIELD(u16, child, 0x3e) = 0x10;
    func_ov042_02200950(object);
    func_020a1ec0(owner, 0xb481);
    FIELD(s32, owner, 0x1c8) = 4;
}
