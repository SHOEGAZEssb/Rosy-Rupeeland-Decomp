#include "tingle/types.h"

/*
 * Overlay 2 control flag query. This recovered helper exposes bit zero from
 * the status halfword of the control sprite stored at offset 0x78.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay002ControlFlagState {
    u8 field_000[0x78];
    void *control_078;
} Overlay002ControlFlagState;

/*
 * Return bit zero of control_078's halfword at +0x24. State is unchanged and
 * no SDK or hardware service is called; the semantic flag name is unconfirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov002_021fbdb0(const Overlay002ControlFlagState *state)
{
    return FIELD(u16, state->control_078, 0x24) & 1;
}
