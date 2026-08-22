#include "tingle/types.h"

/* Overlay 36 seven-state randomized particle-effect update sequence. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern const u8 data_ov036_02206148[];
extern void *gHeapContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_AdvanceTransitions(void *object);
extern s32 func_0209189c(void *random, s32 minimum, s32 maximum);
extern s32 TitleRandom_NextBounded(void *random, s32 maximum);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov036_021fd2a4(void *object, s16 type,
                                 s16 secondDuration, u16 colorA,
                                 u16 colorB, s16 firstDuration,
                                 s32 acceleration);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void PresentationList_Append(void *list, void *object);
extern void PresentationList_UpdateAndDeleteCompleted(void *list);
extern s32 Presentation_InterpolateScalar(void *object, s32 mode, s32 first, s32 second);
extern void func_ov036_021fe968(void *object, s32 x, s32 y, s32 z);
extern void func_ov036_021fe978(void *object, s32 x, s32 y, s32 z);
extern void Sound_Play(void *context, s32 id, s32 variant);
extern void PresentationScalar_TransitionBy(void *field, s32 mode, s32 value);
#ifdef __cplusplus
}
#endif

/* Multiplies signed Q12 values and rounds by 0x800 before shifting. */
static s32 mul_q12_round(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/* Packs three unmasked 5-bit-style components into a low 16-bit color. */
static u16 pack_color(s32 red, s32 green, s32 blue)
{
    return (u16)(red | (green << 5) | (blue << 10));
}

/*
 * Advances the randomized effect's seven-state sequence at +0xAC. States 0/1
 * emit intermittent single motion primitives until the common timer ends;
 * state 2 waits four frames; state 3 emits a 16-way radial burst using
 * data_020c9670; state 4 updates an optional handle and starts a sound/scale
 * transition; state 5 fades that handle and sets its flag bit 2; state 6
 * reports completion. The embedded list +0x9C is updated on every nonterminal
 * return. Returns one only in state 6, otherwise zero. It advances RNG/timers,
 * allocates and links particles, can play sound, and changes object/handle
 * state. Allocation results are used without a later null guard, matching the
 * original assumption that these small effect allocations succeed.
 */
extern "C" s32 func_ov036_021fe3c0(void *object)
{
    s32 state = FIELD(s32, object, 0xac);

    switch (state) {
    case 0:
        FIELD(s32, object, 0xac) = 1;
        /* Fall through into the initial emission state. */
    case 1:
        if (Presentation_AdvanceTransitions(object)) {
            FIELD(s32, object, 0x7c) = 0x1e;
            FIELD(s32, object, 0x80) = 0;
            FIELD(s32, object, 0xac)++;
            break;
        }
        if ((FIELD(s32, object, 0x80) & 1) != 0) {
            s32 x = FIELD(s32, object, 0x10) +
                    func_0209189c((u8 *)object + 0xc8, -0x10, 0x10);
            PresentationScalar_SetImmediate((u8 *)object + 0xc, x);

            s32 first = func_0209189c((u8 *)object + 0xc8, 0x10, 0x1f);
            s32 third = func_0209189c((u8 *)object + 0xc8, 0, first);
            u16 color = pack_color(first, first / 2, third);
            void *particle = Heap_Alloc(0xb8, data_ov036_02206148,
                                        4, gHeapContext);
            if (particle != 0)
                particle = func_ov036_021fd2a4(particle, 0, 0x14,
                                               color, color, 0, 0);
            x = FIELD(s32, object, 0x10) +
                func_0209189c((u8 *)object + 0xc8, -0x10, 0x10);
            Presentation_SetPosition(particle, x, FIELD(s32, object, 0x20), 0);
            FIELD(s32, particle, 0xa4) = 0;
            FIELD(s32, particle, 0xa8) =
                func_0209189c((u8 *)object + 0xc8, -0x1000, 0);
            FIELD(s32, particle, 0xac) = 0;
            PresentationScalar_SetImmediate((u8 *)particle + 0x5c,
                          TitleRandom_NextBounded((u8 *)object + 0xc8, 0x1000) << 4);
            PresentationScalar_SetImmediate((u8 *)particle + 0x6c, 0x333);
            PresentationList_Append((u8 *)object + 0x9c, particle);
        }
        break;

    case 2:
        if (Presentation_AdvanceTransitions(object)) {
            FIELD(s32, object, 0x7c) = 4;
            FIELD(s32, object, 0x80) = 0;
            FIELD(s32, object, 0xac)++;
        }
        break;

    case 3: {
        if (Presentation_AdvanceTransitions(object)) {
            void *handle = FIELD(void *, object, 0xcc);
            if (handle != 0) {
                func_ov036_021fe978(handle,
                                    FIELD(s32, object, 0x10),
                                    FIELD(s32, object, 0x20),
                                    FIELD(s32, object, 0x30));
                FIELD(u16, handle, 0x50) &= (u16)~4;
                FIELD(s32, handle, 0x38) = 0;
                FIELD(s32, handle, 0x34) = 0;
            }
            FIELD(s32, object, 0x7c) = 0x1e;
            FIELD(s32, object, 0x80) = 0;
            FIELD(s32, object, 0xac)++;
            break;
        }

        (void)TitleRandom_NextBounded((u8 *)object + 0xc8, 0x1000);
        s32 speed = Presentation_InterpolateScalar(object, 1, 0xc000, 0x2000);
        s32 duration = Presentation_InterpolateScalar(object, 1, 0, 0x1e);
        s32 red = Presentation_InterpolateScalar(object, 1,
                                FIELD(s32, object, 0xb0),
                                FIELD(s32, object, 0xbc));
        s32 green = Presentation_InterpolateScalar(object, 1,
                                  FIELD(s32, object, 0xb4),
                                  FIELD(s32, object, 0xc0));
        s32 blue = Presentation_InterpolateScalar(object, 1,
                                 FIELD(s32, object, 0xb8),
                                 FIELD(s32, object, 0xc4));
        s32 scale = Presentation_InterpolateScalar(object, 1, 0x1800, 0x1000);
        u16 color = pack_color(red, green, blue);
        u16 halfColor = pack_color(red / 2, green / 2, blue / 2);

        for (s32 i = 0; i < 0x10; ++i) {
            void *particle = Heap_Alloc(0xb8, data_ov036_02206148,
                                        4, gHeapContext);
            if (particle != 0) {
                particle = func_ov036_021fd2a4(
                    particle, 2, 0x19, color, halfColor,
                    (s16)(duration + ((i & 1) << 2)), -0x19a);
            }
            Presentation_SetPosition(particle, FIELD(s32, object, 0x10),
                          FIELD(s32, object, 0x20), 0);
            u16 angle = (u16)(i << 9);
            s32 index = (angle >> 4) * 2;
            func_ov036_021fe968(particle,
                                mul_q12_round(speed, data_020c9670[index]),
                                mul_q12_round(speed, data_020c9670[index + 1]),
                                0);
            PresentationScalar_SetImmediate((u8 *)particle + 0x5c, (u16)-angle);
            PresentationScalar_SetImmediate((u8 *)particle + 0x6c, scale);
            PresentationList_Append((u8 *)object + 0x9c, particle);
        }
        break;
    }

    case 4:
        if (Presentation_AdvanceTransitions(object)) {
            s32 variant = FIELD(s32, object, 0xd0);
            Sound_Play(gSoundContext, 0x1cc,
                       variant == 0 ? 2 : (variant == 1 ? 1 : 0));
            PresentationScalar_TransitionBy((u8 *)object + 0x1c, 5, -0x100);
            FIELD(s32, object, 0x7c) = 0x10;
            FIELD(s32, object, 0x80) = 0;
            FIELD(s32, object, 0xac)++;
        } else if (FIELD(void *, object, 0xcc) != 0) {
            void *handle = FIELD(void *, object, 0xcc);
            FIELD(s32, handle, 0x24) = FIELD(s32, object, 0x20);
            s32 value = Presentation_InterpolateScalar(object, 1, 0, 0x1800);
            FIELD(s32, handle, 0x38) = value;
            FIELD(s32, handle, 0x34) = value;
        }
        break;

    case 5:
        if (Presentation_AdvanceTransitions(object) && FIELD(s32, object, 0xa8) == 0) {
            void *handle = FIELD(void *, object, 0xcc);
            if (handle != 0)
                FIELD(u16, handle, 0x50) |= 4;
            FIELD(s32, object, 0xac)++;
            break;
        }
        if (FIELD(void *, object, 0xcc) != 0) {
            void *handle = FIELD(void *, object, 0xcc);
            FIELD(s32, handle, 0x24) = FIELD(s32, object, 0x20);
            FIELD(u8, handle, 0x5b) =
                (u8)Presentation_InterpolateScalar(object, 1, 0x1f, 1);
        }
        break;

    case 6:
        return 1;
    }

    PresentationList_UpdateAndDeleteCompleted((u8 *)object + 0x9c);
    return 0;
}

/*
 * Stores a signed three-component vector at object +0xA4/+0xA8/+0xAC.
 * It returns nothing and changes only those fields.
 */
extern "C" void func_ov036_021fe968(void *object, s32 x, s32 y, s32 z)
{
    FIELD(s32, object, 0xa4) = x;
    FIELD(s32, object, 0xa8) = y;
    FIELD(s32, object, 0xac) = z;
}

/*
 * Stores a signed three-component vector at object +0x20/+0x24/+0x28.
 * It returns nothing and changes only those fields.
 */
extern "C" void func_ov036_021fe978(void *object, s32 x, s32 y, s32 z)
{
    FIELD(s32, object, 0x20) = x;
    FIELD(s32, object, 0x24) = y;
    FIELD(s32, object, 0x28) = z;
}
