#include "tingle/types.h"

/*
 * Overlay 5 entry-transition update. This recovered four-phase state machine
 * waits on game-work flags, prepares scene objects, and animates the controller.
 */

typedef struct Overlay005EntryTransitionState {
    u8 bytes[0x84];
} Overlay005EntryTransitionState;

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGameWork;
extern s32 GameWork_TestFlag(void *gameWork, s32 flag);
extern void func_ov005_021fbe1c(void *scene);
extern void AreaInfoPanelPresentation_ShowIndex(void *auxiliary, s32 index);
extern void Presentation_SetScript(void *controller, const void *data, s32 mode);
extern void PresentationScalar_TransitionTo(void *object, s32 mode, s32 value);
extern s32 Presentation_InterpolateScalar(void *controller, s32 mode, s32 first, s32 second);
extern s32 func_ov005_021fc5e4(void *state);
#ifdef __cplusplus
}
#endif

/* Advance phase +0x04 and clear timer +0x08. */
static void overlay005_advance_entry(Overlay005EntryTransitionState *state)
{
    FIELD(s32, state, 0x004)++;
    FIELD(s32, state, 0x008) = 0;
}

/*
 * Execute one phase and return zero after always calling
 * func_ov005_021fc5e4(state). Phase zero advances immediately into phase one.
 * Phase one waits for gGameWork flag 0x3D3, clears controller +0x64 field
 * +0x90, sets the group flag on scene +0x74, calls AreaInfoPanelPresentation_ShowIndex on auxiliary
 * +0x78 with index +0x68, then advances. Phase two waits for flag 0x3D4,
 * applies null/mode 0 through Presentation_SetScript, configures controller members +0x0C
 * and +0x1C in modes 1 and 5 toward cached +0x7C/+0x80, sets controller
 * +0x7C/+0x80 to 60/0, and advances. In phase three, while controller +0x80
 * is less than +0x7C, call Presentation_InterpolateScalar(controller,2,0x200,0x80), sign-extend
 * its low halfword, and write it to +0x32/+0x34 of the draw pointer at
 * controller +0x9C. Flag tests and offsets are confirmed; the visual effect
 * and exact controller field names remain unknown.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov005_021fc638(Overlay005EntryTransitionState *state)
{
    void *controller;

    switch (FIELD(s32, state, 0x004)) {
    case 0:
        overlay005_advance_entry(state);
        /* Intentional same-frame fallthrough into phase one. */
    case 1:
        if (GameWork_TestFlag(gGameWork, 0x3d3)) {
            controller = FIELD(void *, state, 0x064);
            FIELD(s32, controller, 0x090) = 0;
            func_ov005_021fbe1c(FIELD(void *, state, 0x074));
            AreaInfoPanelPresentation_ShowIndex(FIELD(void *, state, 0x078),
                          FIELD(s32, state, 0x068));
            overlay005_advance_entry(state);
        }
        break;

    case 2:
        if (GameWork_TestFlag(gGameWork, 0x3d4)) {
            controller = FIELD(void *, state, 0x064);
            Presentation_SetScript(controller, 0, 0);
            PresentationScalar_TransitionTo((u8 *)controller + 0x0c, 1,
                          FIELD(s32, state, 0x07c));
            PresentationScalar_TransitionTo((u8 *)controller + 0x1c, 5,
                          FIELD(s32, state, 0x080));
            FIELD(s32, controller, 0x07c) = 60;
            FIELD(s32, controller, 0x080) = 0;
            overlay005_advance_entry(state);
        }
        break;

    case 3:
        controller = FIELD(void *, state, 0x064);
        if (FIELD(s32, controller, 0x080) <
            FIELD(s32, controller, 0x07c)) {
            s16 value = (s16)Presentation_InterpolateScalar(controller, 2, 0x200, 0x80);
            void *draw = FIELD(void *, controller, 0x09c);

            FIELD(u16, draw, 0x32) = value;
            FIELD(u16, draw, 0x34) = value;
        }
        break;
    }

    func_ov005_021fc5e4(state);
    return 0;
}

#undef FIELD
