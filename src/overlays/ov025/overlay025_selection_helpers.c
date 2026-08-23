#include "tingle/types.h"

/* Overlay 25 randomized title audio and descriptor-based owner query helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

struct SelectionDescriptor {
    u16 values[11];
};

extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_PlayEffectWithParameters(void *, s32, s32, s32, s32, s32);
extern s32 func_0209189c(void *, s32, s32);
extern s32 TitleRandom_NextBounded(void *, s32);
extern void func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 TitleDialog_UpdateTextPage(void *, const u16 *);
#ifdef __cplusplus
}
#endif

/*
 * When event object +0x618 is in state 2, choose one of the six confirmed local
 * packed IDs 0x3500..0x3505 using random state +0x634, play it through the
 * global sound context at volume 32, advance +0x634 by 10..29, and store that
 * delay in +0x618. Sound, RNG, and event state change. The initializer is the
 * retail source shape that emits the 12-byte template at 0x02202C78.
 */
extern "C" void func_ov025_0220088c(void *scene)
{
    if (func_02091c7c((u8 *)scene + 0x618, 2)) {
        u16 sounds[6] = {0x3500, 0x3501, 0x3502, 0x3503, 0x3504, 0x3505};
        s32 choice = TitleRandom_NextBounded((u8 *)scene + 0x634, 6);
        Sound_PlayEffectWithParameters(gSoundContext, sounds[choice] >> 7,
                      sounds[choice] & 0x7f, 0x20, 0, 0);
        s32 result = func_0209189c((u8 *)scene + 0x634, 10, 30);
        func_02091b98((u8 *)scene + 0x618, result);
    }
}

/*
 * Copy the 11-halfword descriptor pointed to by object +0x2C and test it against
 * owner +0x50C. Return true immediately for owner flag bit 0; otherwise set
 * descriptor bit 0 at halfword 1 when object bit 5 and owner bit 1 are both
 * set, then return bit 0 of TitleDialog_UpdateTextPage's result. The volatile scratch copies
 * preserve confirmed retail stack temporaries but have no external effect.
 */
extern "C" s32 func_ov025_02200940(void *object)
{
    volatile u32 resultStore0;
    volatile u32 flagsStore0;
    volatile u32 flagsStoreConditional;
    volatile u32 flagsStore1;
    volatile u32 resultStore1;
    SelectionDescriptor descriptor =
        *(const SelectionDescriptor *)FIELD(const void *, object, 0x2c);
    u32 flags = FIELD(u32, FIELD(void *, object, 0x50c), 0x38);
    s32 ownerBit0 = (s32)(flags << 31) >> 31;
    flagsStore1 = flags;
    flagsStore0 = flags;
    if (ownerBit0)
        return 1;
    s32 objectBit5 = (s32)(FIELD(u32, object, 0x20) << 26) >> 31;
    if (objectBit5) {
        s32 ownerBit1 = (s32)(flags << 30) >> 31;
        if (ownerBit1)
            descriptor.values[1] |= 1;
        flagsStoreConditional = flags;
    }
    s32 result = TitleDialog_UpdateTextPage(FIELD(void *, object, 0x50c), descriptor.values);
    s32 resultBit0 = (s32)((u32)result << 31) >> 31;
    resultStore1 = result;
    resultStore0 = result;
    return resultBit0 != 0 ? 1 : 0;
}
