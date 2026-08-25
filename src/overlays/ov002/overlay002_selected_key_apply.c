#include "tingle/types.h"

/*
 * Overlay 2 selected-key application. This recovered helper applies the
 * selected numeric keypad icon to the editable value display.
 */

typedef struct Overlay002SelectedKeyState {
    u8 field_000[0x84];
    s32 maximum_084;
    s32 value_088;
    s32 selectedIndex_08c;
    s32 enabled_090;
} Overlay002SelectedKeyState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern void Overlay002_SetDisplayedValue(Overlay002SelectedKeyState *state, s32 value);
extern void Sound_Play(void *context, s32 channel, s32 soundId);
#ifdef __cplusplus
}
#endif

/*
 * For selected indices zero through nine, enable entry and append that decimal
 * digit; when the current value is already at least one million, discard its
 * lowest digit first. Clamp the result to maximum_084, refresh the display, and
 * play sound 3 on channel 0x79. Index ten performs decimal backspace with the
 * same refresh/sound. Index eleven disables and clears the value without sound.
 * Return one for handled indices and zero otherwise. The sound and display
 * callees own their external effects; integer division uses the runtime helper.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay002_ApplySelectedKey(Overlay002SelectedKeyState *state)
{
    switch (state->selectedIndex_08c) {
    case 0: case 1: case 2: case 3: case 4:
    case 5: case 6: case 7: case 8: case 9:
        state->enabled_090 = 1;
        if (state->value_088 >= 1000000) {
            state->value_088 /= 10;
        }
        state->value_088 = state->value_088 * 10 + state->selectedIndex_08c;
        if (state->value_088 > state->maximum_084) {
            state->value_088 = state->maximum_084;
        }
        Overlay002_SetDisplayedValue(state, state->value_088);
        Sound_Play(gSoundContext, 0x79, 3);
        return 1;
    case 10:
        state->value_088 /= 10;
        Overlay002_SetDisplayedValue(state, state->value_088);
        Sound_Play(gSoundContext, 0x79, 3);
        return 1;
    case 11:
        state->enabled_090 = 0;
        state->value_088 = 0;
        Overlay002_SetDisplayedValue(state, 0);
        return 1;
    default:
        return 0;
    }
}
