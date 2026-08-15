#include "tingle/types.h"

/* Overlay 36 ten-phase orbit-controller scripted spawn and animation sequence. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205c2c[];
extern const u8 data_ov036_02205cac[];
extern const s32 data_ov036_02204d7c[];
extern const s32 data_ov036_02204d6c[];
extern const u8 data_ov036_02204e24[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02059278(void *context, s32 id, s32 value);
extern void func_0205929c(void *context, s32 id, s32 value);
extern void Sound_Play(void *context, s32 id, s32 variant);
extern void func_02091b98(void *timer, s32 duration);
extern s32 func_02091c7c(void *timer, s32 mode);
extern void func_02091bac(void *timer, s32 mode, s32 first,
                          s32 second, s32 duration);
extern void func_02091d24(void *cursor, s32 first, s32 second,
                          s32 third, s32 fourth);
extern void func_02091dac(void *cursor);
extern void func_ov036_022009b8(void *controller, const void *config);
extern void func_020956fc(void *object);
extern void func_02095710(void *object);
extern void func_ov036_02200b38(void *owner, void *object,
                                const void *config);
extern s32 func_ov036_021fd28c(void *object);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void GraphicsAnimationInstance_SetAnimation(void *handle, u8 mode);
extern void Presentation_SetScript(void *object, const void *data, s32 mode);
extern s32 Presentation_IsScriptComplete(void *object);
extern void PresentationList_UpdateAndDeleteCompleted(void *list);
extern void GraphicsAnimationInstanceManager_Update(void *manager);
#ifdef __cplusplus
}
#endif

/*
 * Advances the orbit controller's ten phases at +0xA0. Phase 0 starts sound
 * channel 0xAF, an eight-frame timer, and cursor +0x12C. Phase 1 spawns 0x20-byte
 * configurations from data_ov036_02205C2C until cursor completion +0x13C.
 * Phases 2/3 activate and retarget child +0x104 through data_ov036_02205CAC and
 * the same cursor table. Phase 4 activates +0x108/+0xD8 and starts a 30-frame
 * alpha ramp. Phase 5 fans children +0x10C..+0x118 from +0x108 using four
 * position targets and handle bytes in data_ov036_02204D7C/02204D6C, then
 * enables all five handles. Phase 6 disables those handles and starts their
 * shared data_ov036_02204E24 transition; phases 7/8 wait and fade channel 0xAF;
 * phase 9 reports completion. List +0x11C and manager +0x100 update every call.
 * Returns one only in phase 9, otherwise zero; cursor, timers, sound, child
 * transforms/runtime, list, and manager state can change.
 */
extern "C" s32 func_ov036_02200bb0(void *controller)
{
    switch (FIELD(s32, controller, 0xa0)) {
    case 0:
        func_02059278(gSoundContext, 0xaf, 0x7f);
        func_02091b98((u8 *)controller + 0xa4, 8);
        func_02091d24((u8 *)controller + 0x12c, 0, 0, 4, 1);
        FIELD(s32, controller, 0xa0)++;
        /* Fall through into the first timed spawn. */
    case 1:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            s32 index = FIELD(s32, controller, 0x12c);
            func_ov036_022009b8(controller,
                data_ov036_02205c2c + index * 0x20);
            func_02091dac((u8 *)controller + 0x12c);
            if (FIELD(s32, controller, 0x13c) != 0)
                FIELD(s32, controller, 0xa0)++;
        }
        break;

    case 2:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            void *child = FIELD(void *, controller, 0x104);
            func_020956fc(child);
            func_ov036_02200b38(controller, child,
                                data_ov036_02205cac);
            func_02091d24((u8 *)controller + 0x12c, 3, 1, 3, -1);
            FIELD(s32, controller, 0xa0)++;
        }
        break;

    case 3:
        if (func_ov036_021fd28c(FIELD(void *, controller, 0x104)) != 0) {
            s32 index = FIELD(s32, controller, 0x12c);
            func_ov036_02200b38(controller,
                                FIELD(void *, controller, 0x104),
                                data_ov036_02205c2c + index * 0x20);
            func_02091dac((u8 *)controller + 0x12c);
            if (FIELD(s32, controller, 0x13c) != 0)
                FIELD(s32, controller, 0xa0)++;
        }
        break;

    case 4:
        if (func_ov036_021fd28c(FIELD(void *, controller, 0x104)) != 0) {
            func_02095710(FIELD(void *, controller, 0x104));
            func_020956fc(FIELD(void *, controller, 0x108));
            func_020956fc(FIELD(void *, controller, 0xd8));
            func_02091bac((u8 *)controller + 0xa4, 1, 1, 0x1f, 0x1e);
            Sound_Play(gSoundContext, 0x1af, 0);
            func_ov036_02200b38(controller,
                                FIELD(void *, controller, 0x108),
                                data_ov036_02205c2c);
            FIELD(s32, controller, 0xa0)++;
        }
        break;

    case 5:
        if (func_ov036_021fd28c(FIELD(void *, controller, 0x108)) != 0) {
            void *source = FIELD(void *, controller, 0x108);
            for (s32 i = 1; i < 5; ++i) {
                void *child = FIELD(void *, controller, 0x108 + i * 4);
                Presentation_SetPosition(child,
                              FIELD(s32, source, 0x10),
                              FIELD(s32, source, 0x20),
                              FIELD(s32, source, 0x30) - i);
                FIELD(u8, FIELD(void *, child, 0x9c), 0x5b) =
                    (u8)data_ov036_02204d6c[i - 1];
                PresentationScalar_TransitionTo((u8 *)child + 0xc, 2,
                              data_ov036_02204d7c[i - 1]);
                FIELD(s32, child, 0x7c) = 0x3c;
                FIELD(s32, child, 0x80) = 0;
                func_020956fc(child);
            }
            for (s32 i = 0; i < 5; ++i) {
                void *child = FIELD(void *, controller, 0x108 + i * 4);
                GraphicsAnimationInstance_SetAnimation(FIELD(void *, child, 0x9c), 1);
            }
            FIELD(s32, controller, 0xa0)++;
        } else {
            s32 value = func_02091c7c((u8 *)controller + 0xa4, 1);
            void *child = FIELD(void *, controller, 0xd8);
            FIELD(u8, FIELD(void *, child, 0x9c), 0x5b) = (u8)value;
        }
        break;

    case 6:
        if (func_ov036_021fd28c(FIELD(void *, controller, 0x10c)) != 0) {
            for (s32 i = 0; i < 5; ++i) {
                void *child = FIELD(void *, controller, 0x108 + i * 4);
                GraphicsAnimationInstance_SetAnimation(FIELD(void *, child, 0x9c), 0);
                Presentation_SetScript(child, data_ov036_02204e24, 1);
            }
            func_02091b98((u8 *)controller + 0xa4, 0x1e);
            FIELD(s32, controller, 0xa0)++;
        }
        break;

    case 7:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0)
            FIELD(s32, controller, 0xa0)++;
        break;

    case 8:
        if (Presentation_IsScriptComplete(FIELD(void *, controller, 0x108)) != 0) {
            func_0205929c(gSoundContext, 0xaf, 0x10);
            FIELD(s32, controller, 0xa0)++;
        }
        break;

    case 9:
        PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0x11c);
        GraphicsAnimationInstanceManager_Update(FIELD(void *, controller, 0x100));
        return 1;
    }

    PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0x11c);
    GraphicsAnimationInstanceManager_Update(FIELD(void *, controller, 0x100));
    return 0;
}
