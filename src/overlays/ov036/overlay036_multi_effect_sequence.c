#include "tingle/types.h"

/* Overlay 36 ten-phase multi-effect animation, sound, and particle sequence. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02204e9c[];
extern const u8 data_ov036_02205290[];
extern const u8 data_ov036_022057d0[];
extern const u8 data_ov036_02206148[];
extern void *gHeapContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02059278(void *context, s32 id, s32 value);
extern void func_0205929c(void *context, s32 id, s32 value);
extern s32 func_020594a4(void *context, s32 id, s32 mode);
extern void func_0205940c(void *context, s32 id, s32 value);
extern void Sound_Play(void *context, s32 id, s32 variant);
extern void func_02091b98(void *timer, s32 duration);
extern s32 func_02091c7c(void *timer, s32 mode);
extern void func_02091bac(void *timer, s32 mode, s32 first,
                          s32 second, s32 duration);
extern s32 func_02091bd0(void *timer, s32 mode, s32 first, s32 second);
extern void Presentation_SetScript(void *object, const void *data, s32 mode);
extern s32 Presentation_InterpolateScalar(void *object, s32 mode, s32 first, s32 second);
extern s32 func_ov036_021fd28c(void *object);
extern void func_ov036_021ff778(void *owner, void *child,
                                s32 x, s32 y, s32 z, s32 duration);
extern void func_ov036_021ff7cc(void *controller, s32 range);
extern s32 Presentation_IsScriptSuspended(void *object);
extern s32 Presentation_IsScriptComplete(void *object);
extern s32 func_0209189c(void *random, s32 minimum, s32 maximum);
extern s32 func_020918f4(void *random, s32 maximum);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov036_021fd2a4(void *object, s16 type,
                                 s16 secondDuration, u16 colorA,
                                 u16 colorB, s16 firstDuration,
                                 s32 acceleration);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void func_ov036_021fe968(void *object, s32 x, s32 y, s32 z);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
extern void PresentationList_Append(void *list, void *object);
extern void func_ov036_021ff74c(void *controller);
#ifdef __cplusplus
}
#endif

/*
 * Advances the multi-effect controller's ten phases at +0xA0. The sequence
 * starts sound channel 0xAE and a 60-frame timer; ramps controller coordinates
 * +0x14/+0x18; retargets child +0xF8; drives child objects +0xD8, +0x100,
 * +0xFC, and +0xEC with resource-defined transitions; emits 16 type-0 motion
 * primitives from +0x100 into list +0x128; then fades sound/channel state and
 * completes in phase 9. Common list/manager update func_ov036_021ff74c runs on
 * every call. Returns one only in phase 9, otherwise zero. Timers, sound,
 * random state +0xC0, child visibility/runtime fields, heap, and lists change.
 */
extern "C" s32 func_ov036_021ff9d0(void *controller)
{
    switch (FIELD(s32, controller, 0xa0)) {
    case 0:
        func_02059278(gSoundContext, 0xae, 0x7f);
        func_02091b98((u8 *)controller + 0xa4, 0x3c);
        FIELD(s32, controller, 0xa0)++;
        /* Fall through to the opening timer ramp. */
    case 1:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            Sound_Play(gSoundContext, 0x1ae, 0);
            func_02091bac((u8 *)controller + 0xa4,
                          1, 0x30, 0x40, 0x78);
            Presentation_SetScript(FIELD(void *, controller, 0xd8),
                           data_ov036_02204e9c, 1);
            FIELD(s32, controller, 0xa0)++;
        } else {
            FIELD(s32, controller, 0x14) =
                func_02091bd0((u8 *)controller + 0xa4,
                               2, 0x3c00, 0x1400);
            FIELD(s32, controller, 0x18) =
                func_02091bd0((u8 *)controller + 0xa4,
                               2, 0x1400, 0x2800);
        }
        break;

    case 2:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            func_ov036_021ff778(controller,
                                FIELD(void *, controller, 0xf8),
                                0, 0, 0, 4);
            FIELD(s32, controller, 0xa0)++;
        } else {
            void *child = FIELD(void *, controller, 0xd8);
            FIELD(u8, FIELD(void *, child, 0x9c), 0x5b) =
                (u8)Presentation_InterpolateScalar(child, 1, 1, 0x1f);
            func_ov036_021ff7cc(controller,
                                FIELD(s32, controller, 0xb4));
        }
        break;

    case 3:
        if (func_ov036_021fd28c(FIELD(void *, controller, 0xf8)) != 0) {
            Sound_Play(gSoundContext, 0x1ae, 1);
            FIELD(s32, FIELD(void *, controller, 0xd8), 0x90) = 0;
            FIELD(s32, FIELD(void *, controller, 0xf8), 0xa0) = 0;
            Presentation_SetScript(FIELD(void *, controller, 0x100),
                           data_ov036_02205290, 1);
            Presentation_SetScript(FIELD(void *, controller, 0xfc),
                           data_ov036_02205290, 1);
            func_02091bac((u8 *)controller + 0xa4,
                          3, 0, 0x40, 0x3c);
            FIELD(s32, controller, 0xa0)++;
        }
        break;

    case 4: {
        s32 range = func_02091c7c((u8 *)controller + 0xa4, 1);
        func_ov036_021ff7cc(controller, range);
        if (Presentation_IsScriptSuspended(FIELD(void *, controller, 0x100)) != 0) {
            func_0205940c(gSoundContext, 0x1ae, 0);
            FIELD(s32, FIELD(void *, controller, 0x100), 0x90) = 0;
            FIELD(s32, FIELD(void *, controller, 0xfc), 0x90) = 0;
            FIELD(s32, controller, 0xa0)++;
        } else if (Presentation_IsScriptComplete(FIELD(void *, controller, 0xd8)) == 0) {
            void *child = FIELD(void *, controller, 0xd8);
            FIELD(u8, FIELD(void *, child, 0x9c), 0x5b) =
                (u8)Presentation_InterpolateScalar(child, 1, 0x1f, 1);
        }
        break;
    }

    case 5:
        if (Presentation_IsScriptSuspended(FIELD(void *, controller, 0x100)) != 0) {
            Presentation_SetScript(FIELD(void *, controller, 0xec),
                           data_ov036_022057d0, 1);
            FIELD(s32, controller, 0xa0)++;
        }
        break;

    case 6:
        if (Presentation_IsScriptSuspended(FIELD(void *, controller, 0xec)) != 0) {
            Sound_Play(gSoundContext, 0x1ae, 4);
            for (s32 i = 0; i < 0x10; ++i) {
                s32 red = func_0209189c((u8 *)controller + 0xc0,
                                        0x10, 0x1f);
                s32 blue = func_0209189c((u8 *)controller + 0xc0, 0, red);
                u16 color = (u16)(red | ((red / 2) << 5) | (blue << 10));
                void *particle = Heap_Alloc(0xb8, data_ov036_02206148,
                                            4, gHeapContext);
                if (particle != 0)
                    particle = func_ov036_021fd2a4(
                        particle, 0, 0x1e, color, color, 0, 0);

                void *source = FIELD(void *, controller, 0x100);
                s32 x = FIELD(s32, source, 0x10) +
                    func_0209189c((u8 *)controller + 0xc0, -0x100, 0x100);
                Presentation_SetPosition(particle, x,
                              FIELD(s32, source, 0x20),
                              FIELD(s32, source, 0x30));
                func_ov036_021fe968(
                    particle, FIELD(s32, particle, 0x10) << 7,
                    func_0209189c((u8 *)controller + 0xc0,
                                   0x4000, 0x8000), 0);
                PresentationScalar_SetImmediate((u8 *)particle + 0x5c,
                              func_020918f4((u8 *)controller + 0xc0,
                                            0x1000) << 4);
                PresentationList_Append((u8 *)controller + 0x128, particle);
            }
            FIELD(s32, FIELD(void *, controller, 0xec), 0x90) = 0;
            FIELD(s32, FIELD(void *, controller, 0x100), 0x90) = 0;
            FIELD(s32, FIELD(void *, controller, 0xfc), 0x90) = 0;
            FIELD(s32, controller, 0xa0)++;
        }
        break;

    case 7:
        if (Presentation_IsScriptSuspended(FIELD(void *, controller, 0xec)) != 0) {
            Sound_Play(gSoundContext, 0x1ae, 0);
            FIELD(s32, FIELD(void *, controller, 0xf8), 0xa0) = 2;
            FIELD(u16, FIELD(void *, controller, 0x100), 0x98) |= 1;
            FIELD(s32, FIELD(void *, controller, 0xec), 0x90) = 0;
            FIELD(s32, controller, 0xa0)++;
        }
        break;

    case 8:
        if (Presentation_IsScriptComplete(FIELD(void *, controller, 0xec)) != 0) {
            func_0205929c(gSoundContext, 0xae, 0x10);
            FIELD(s32, controller, 0xa0)++;
        } else {
            func_ov036_021ff7cc(controller, 0x100);
            if (func_020594a4(gSoundContext, 0x1ae, 2) == 0)
                Sound_Play(gSoundContext, 0x1ae, 2);
        }
        break;

    case 9:
        func_ov036_021ff74c(controller);
        return 1;
    }

    func_ov036_021ff74c(controller);
    return 0;
}
