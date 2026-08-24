#include "tingle/types.h"

/*
 * Overlay 45 emitter tick. This recovered update advances the primary timing
 * track, emits transient effects when it crosses configured thresholds, and
 * maintains the elapsed/remainder fields used by the next frame. Matching
 * assembly preserves the original compiler's register and loop layout; this
 * file is its documented portable equivalent.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

struct EmitterCoordinateRange {
    s32 x;
    s32 y;
    s32 horizontalRadius;
    s32 verticalRadius;
};

extern "C" s16 data_ov045_0220d47c[];
extern "C" u8 data_ov045_0220d5d8[];
extern "C" void *gSoundContext;
extern "C" u8 gHeapContext[];
extern "C" s32 func_02091c7c(void *track, s32 mode);
extern "C" void func_02091cf0(void *track);
extern "C" void func_02091b98(void *track, s32 value);
extern "C" s32 func_0209189c(void *seed, s32 minimum, s32 maximum);
extern "C" s32 TitleRandom_NextBounded(void *seed, s32 modulus);
extern "C" void Sound_PlayEffectWithParameters(void *context, s32 first, s32 second,
                               s32 third, s32 fourth, s32 fifth);
extern "C" void *GraphicsSpriteGroup_CreateStateFromSource(void *fontState, void *owner, s32 selector);
extern "C" void GraphicsSpriteState_ApplyRenderConfig(void *sprite, s32 variant, s32 x, s32 y,
                               s32 zero1, s32 zero2, s32 zero3);
extern "C" void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                              void *heap);
extern "C" void *func_ov045_0220b740(void *object, void *argument,
                                      s32 orientation);
extern "C" void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern "C" void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern "C" void PresentationList_Append(void *list, void *object, s32 argument);

/*
 * Advance timing track +0x10 and derive progress relative to saved position
 * +0x58 plus remainder +0x5C. If progress is nonzero, advance track +0x2C;
 * when that track fires, play the confirmed 0x4F/0x7F feedback and reseed its
 * delay to a random 10..20. Classify progress against seven signed thresholds
 * (1,5,10,20,50,100,200), retaining the residual in +0x5C.
 *
 * Use the selected coordinate table +0x68 to create a presentation sprite,
 * allocate a 0xA4-byte transient effect tagged by data_ov045_0220d5d8, and
 * initialize it with orientation +0x60. Randomize coordinates inside the
 * table's horizontal/vertical radii using seed +0x64. Configure the effect's
 * two motion fields in orientation-dependent order, set its lifetime +0x7C to
 * a random value modulo four plus 24, clear +0x80, and append it to list +0x48.
 * Finally store track position +0x20 into +0x58 and finalize track +0x10.
 * Audio, PRNG, sprite, heap, motion, list, and timing state may change.
 */
extern "C" void func_ov045_0220b9b8(void *object)
{
    s32 position = func_02091c7c((u8 *)object + 0x10, 1);
    s32 progress = position - FIELD(s32, object, 0x58)
                   + FIELD(s32, object, 0x5c);

    if (progress != 0) {
        if (func_02091c7c((u8 *)object + 0x2c, 2) != 0) {
            Sound_PlayEffectWithParameters(gSoundContext, 0, 0x4f, 0x7f, 0, 0);
            func_02091b98((u8 *)object + 0x2c,
                           func_0209189c((u8 *)object + 0x64, 10, 20));
        }

        s32 thresholdIndex = 0;
        while (thresholdIndex < 6) {
            if (progress <= data_ov045_0220d47c[thresholdIndex]) {
                if (progress < data_ov045_0220d47c[thresholdIndex]
                    && thresholdIndex != 0)
                    --thresholdIndex;
                FIELD(s32, object, 0x5c) =
                    progress - data_ov045_0220d47c[thresholdIndex];
                break;
            }
            ++thresholdIndex;
        }

        EmitterCoordinateRange *primary =
            FIELD(EmitterCoordinateRange *, object, 0x68);
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 0),
                                      (u8 *)object + 4, 1);
        GraphicsSpriteState_ApplyRenderConfig(sprite, thresholdIndex, primary->x, primary->y,
                       0, 0, 0);

        void *effect = Heap_Alloc(0xa4, data_ov045_0220d5d8,
                                   4, gHeapContext);
        if (effect != 0)
            effect = func_ov045_0220b740(effect, sprite,
                                         FIELD(s32, object, 0x60));

        s32 x = primary->x
                + func_0209189c((u8 *)object + 0x64,
                                 -primary->horizontalRadius,
                                 primary->horizontalRadius);
        s32 y = primary->y
                + func_0209189c((u8 *)object + 0x64,
                                 -primary->verticalRadius,
                                 primary->verticalRadius);
        Presentation_SetPosition(effect, x << 12, y << 12, 0);

        EmitterCoordinateRange *secondary =
            FIELD(EmitterCoordinateRange *, object, 0x6c);
        s32 targetX = secondary->x
                      + func_0209189c((u8 *)object + 0x64,
                                       -secondary->horizontalRadius,
                                       secondary->horizontalRadius);
        s32 targetY = secondary->y
                      + func_0209189c((u8 *)object + 0x64,
                                       -secondary->verticalRadius,
                                       secondary->verticalRadius);
        if (FIELD(s32, object, 0x60) == 0) {
            PresentationScalar_TransitionTo((u8 *)effect + 0x0c, 1, targetX << 12);
            PresentationScalar_TransitionTo((u8 *)effect + 0x1c, 5, targetY << 12);
        } else {
            PresentationScalar_TransitionTo((u8 *)effect + 0x0c, 5, targetX << 12);
            PresentationScalar_TransitionTo((u8 *)effect + 0x1c, 1, targetY << 12);
        }
        FIELD(s32, effect, 0x7c) =
            (s16)(TitleRandom_NextBounded((u8 *)object + 0x64, 4) + 24);
        FIELD(s32, effect, 0x80) = 0;
        PresentationList_Append((u8 *)object + 0x48, effect, 0);
    }

    FIELD(s32, object, 0x58) = FIELD(s32, object, 0x20);
    func_02091cf0((u8 *)object + 0x10);
}
