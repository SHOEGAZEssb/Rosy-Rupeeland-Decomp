#include "tingle/types.h"

/* Sound-balance helpers used by overlay 90's boss-stage/cinematic states. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TitleBounds8 {
    s8 left;
    s8 top;
    s8 right;
    s8 bottom;
} TitleBounds8;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern s32 func_02059344(void *sound, s32 id);
extern void func_02059278(void *sound, s32 id, s32 value);
extern void func_02059320(void *sound, s32 id, s32 parameter, u16 value);
#ifdef __cplusplus
}
#endif

/* Store four signed byte bounds; `bottom` is the fifth ABI argument. */
extern "C" void func_ov090_0221b7e0(TitleBounds8 *bounds, s32 left, s32 top,
                                     s32 right, s32 bottom)
{
    bounds->left = left;
    bounds->top = top;
    bounds->right = right;
    bounds->bottom = bottom;
}

/*
 * Adjust and clamp boss-stage field +0x244 to 0..127, then apply complementary
 * parameters 0x2330 and 0x7200 to active sound 0x54. If sound 0x55 is active
 * while 0x54 is absent, leave the balance unchanged.
 */
extern "C" void func_ov090_0221b7f8(void *self, s16 amount)
{
    if (!func_02059344(gSoundContext, 0x54)) {
        if (func_02059344(gSoundContext, 0x55))
            return;
        func_02059278(gSoundContext, 0x54, 0x7f);
    }

    FIELD(s16, self, 0x244) += amount;
    if (FIELD(s16, self, 0x244) < 0)
        FIELD(s16, self, 0x244) = 0;
    else if (FIELD(s16, self, 0x244) > 0x7f)
        FIELD(s16, self, 0x244) = 0x7f;
    func_02059320(gSoundContext, 0x54, 0x2330, FIELD(u16, self, 0x244));
    func_02059320(gSoundContext, 0x54, 0x7200,
                  (u16)(0x7f - FIELD(s16, self, 0x244)));
}
