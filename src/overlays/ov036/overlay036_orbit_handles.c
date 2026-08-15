#include "tingle/types.h"

/* Overlay 36 four-handle orbit object lifecycle and positioning helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern const u8 data_ov036_0220607c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_Init(void *object);
extern void *func_ov036_021fcf30(void *object);
extern void Heap_Free(void *allocation);
extern void func_ov036_021fe978(void *handle, s32 x, s32 y, s32 z);
extern s32 Presentation_InterpolateScalar(void *object, s32 mode, s32 first, s32 second);
extern void PresentationScalar_TransitionBy(void *field, s32 mode, s32 value);
extern s32 Presentation_AdvanceTransitions(void *object);
extern void Sound_Play(void *context, s32 id, s32 variant);
#ifdef __cplusplus
}
#endif

extern void *gSoundContext;

/*
 * Constructs a four-handle orbit object. selector is stored at +0xC0; fields
 * +0x9C/+0xB4/+0xB8/+0xBC and four handle slots +0xA0..+0xAC are cleared.
 * Returns object; common render-base and object state change.
 */
extern "C" void *func_ov036_02200234(void *object, s32 selector)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov036_0220607c;
    FIELD(s32, object, 0xc0) = selector;
    FIELD(s32, object, 0xb4) = 0;
    FIELD(s32, object, 0xbc) = 0;
    FIELD(s32, object, 0xb8) = 0;
    FIELD(void *, object, 0x9c) = 0;
    for (s32 i = 0; i < 4; ++i)
        FIELD(void *, object, 0xa0 + i * 4) = 0;
    return object;
}

/*
 * Runs the common render-base destructor without freeing the orbit object.
 * Returns object; base state can change.
 */
extern "C" void *func_ov036_02200288(void *object)
{
    func_ov036_021fcf30(object);
    return object;
}

/*
 * Runs the common base destructor and frees the orbit object. Returns the
 * now-invalid original pointer, matching the recovered ABI.
 */
extern "C" void *func_ov036_0220029c(void *object)
{
    func_ov036_021fcf30(object);
    Heap_Free(object);
    return object;
}

/*
 * Advances angle +0xBC by 0x100, samples the first signed component of
 * data_020c9670 at its low-16-bit angle, truncates the scaled value toward zero
 * into offset +0xB0, and positions handle +0x9C at (base X + offset, base Y,
 * base Z). It returns nothing; angle, offset, and handle position change.
 */
extern "C" void func_ov036_022002b8(void *object)
{
    s32 angle = FIELD(s32, object, 0xbc) + 0x100;
    FIELD(s32, object, 0xbc) = angle;
    s32 index = ((u16)angle >> 4) * 2;
    s32 scaled = data_020c9670[index] << 4;
    s32 offset = (scaled + ((u32)(scaled >> 7) >> 24)) >> 8;
    FIELD(s32, object, 0xb0) = offset;
    func_ov036_021fe978(FIELD(void *, object, 0x9c),
                        FIELD(s32, object, 0x10) + offset,
                        FIELD(s32, object, 0x20),
                        FIELD(s32, object, 0x30));
}

/*
 * Positions all four handles in a horizontal row centered around base X.
 * Mode-2 interpolation supplies a shared X offset from 0 to -0x300, mode 3
 * supplies Y offset -0x180..+0x180, and mode 1 supplies angle -0x4000..0x2000.
 * Flag +0xB8 negates X offset and angle. Each handle receives X spacing 0x400,
 * base Z-0x10, and the same low-16-bit angle at +0x4C. It returns nothing;
 * handle positions/angles and common interpolation state change.
 */
extern "C" void func_ov036_02200318(void *object)
{
    s32 xOffset = Presentation_InterpolateScalar(object, 2, 0, -0x300);
    s32 yOffset = Presentation_InterpolateScalar(object, 3, 0, 0x300) - 0x180;
    s32 angle = Presentation_InterpolateScalar(object, 1, -0x4000, 0x2000);
    if (FIELD(s32, object, 0xb8) != 0) {
        xOffset = -xOffset;
        angle = -angle;
    }
    for (s32 i = 0; i < 4; ++i) {
        void *handle = FIELD(void *, object, 0xa0 + i * 4);
        func_ov036_021fe978(handle,
                            FIELD(s32, object, 0x10) + i * 0x400 - 0x600 + xOffset,
                            FIELD(s32, object, 0x20) + yOffset,
                            FIELD(s32, object, 0x30) - 0x10);
        FIELD(u16, handle, 0x4c) = (u16)angle;
    }
}

/*
 * Advances the orbit object's four-phase loop at +0xB4. Phase 0 starts a
 * mode-4 +0x1C transition toward 0x500, a 60-frame timer, and clears flag bit 2
 * on primary handle +0x9C and all four orbit handles before falling through.
 * Phase 1 updates the primary orbit and, until the timer ends, the four-handle
 * row; completion optionally plays sound 0x1AF variant 1/2 for owner selector
 * +0xC0 equal to 0/1 and starts a 30-frame phase 2. Phases 2 and 3 alternate
 * 60- and 30-frame intervals, with phase 3 repeating the sound and returning
 * to phase 2. Returns zero unconditionally; transforms, timers, handle flags,
 * positions, phase, and sound state can change.
 */
extern "C" s32 func_ov036_022003d4(void *object)
{
    switch (FIELD(s32, object, 0xb4)) {
    case 0:
        PresentationScalar_TransitionBy((u8 *)object + 0x1c, 4, 0x500);
        FIELD(s32, object, 0x7c) = 0x3c;
        FIELD(s32, object, 0x80) = 0;
        FIELD(u16, FIELD(void *, object, 0x9c), 0x50) &= (u16)~4;
        for (s32 i = 0; i < 4; ++i)
            FIELD(u16, FIELD(void *, object, 0xa0 + i * 4), 0x50) &= (u16)~4;
        FIELD(s32, object, 0xb4)++;
        /* Fall through to the opening orbit update. */
    case 1:
        func_ov036_022002b8(object);
        if (Presentation_AdvanceTransitions(object) != 0) {
            s32 selector = FIELD(s32, object, 0xc0);
            if (selector == 0)
                Sound_Play(gSoundContext, 0x1af, 1);
            else if (selector == 1)
                Sound_Play(gSoundContext, 0x1af, 2);
            FIELD(s32, object, 0x7c) = 0x1e;
            FIELD(s32, object, 0x80) = 0;
            FIELD(s32, object, 0xb4)++;
        } else {
            func_ov036_02200318(object);
        }
        break;
    case 2:
        func_ov036_022002b8(object);
        if (Presentation_AdvanceTransitions(object) != 0) {
            FIELD(s32, object, 0x7c) = 0x3c;
            FIELD(s32, object, 0x80) = 0;
            FIELD(s32, object, 0xb4)++;
        }
        break;
    case 3:
        func_ov036_022002b8(object);
        if (Presentation_AdvanceTransitions(object) != 0) {
            s32 selector = FIELD(s32, object, 0xc0);
            if (selector == 0)
                Sound_Play(gSoundContext, 0x1af, 1);
            else if (selector == 1)
                Sound_Play(gSoundContext, 0x1af, 2);
            FIELD(s32, object, 0x7c) = 0x1e;
            FIELD(s32, object, 0x80) = 0;
            FIELD(s32, object, 0xb4)--;
        } else {
            func_ov036_02200318(object);
        }
        break;
    }
    return 0;
}
