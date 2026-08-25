#include "tingle/types.h"

/*
 * Overlay 2 value clearing. This recovered helper disables numeric entry,
 * clears the current value, and refreshes the seven-digit display.
 */

typedef struct Overlay002ValueClearState {
    u8 field_000[0x88];
    s32 value_088;
    u8 field_08c[0x04];
    s32 enabled_090;
} Overlay002ValueClearState;

#ifdef __cplusplus
extern "C" {
#endif
extern void Overlay002_SetDisplayedValue(Overlay002ValueClearState *state, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Store zero in enabled_090 and value_088, then tail-call the display updater
 * with value zero. Returns whatever control flow the void updater implies;
 * the only observable changes are the stored fields and sprite-state updates.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov002_021fbe68(Overlay002ValueClearState *state)
{
    state->enabled_090 = 0;
    state->value_088 = 0;
    Overlay002_SetDisplayedValue(state, 0);
}
