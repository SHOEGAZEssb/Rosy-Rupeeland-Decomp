#include "tingle/types.h"

/*
 * Overlay 1 primary-sprite flag setting. This recovered helper sets bit 2 of a
 * halfword in the optional sprite stored at state offset 0x20.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay001PrimarySpriteFlagState {
    u8 field_000[0x20];
    void *sprite_020;
} Overlay001PrimarySpriteFlagState;

/*
 * If sprite_020 exists, set mask 0x0004 in its halfword at +0x24. The flag's
 * exact presentation meaning remains unconfirmed. Returns no value, calls no
 * service, and performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fc39c(Overlay001PrimarySpriteFlagState *state)
{
    if (state->sprite_020 != 0) {
        FIELD(u16, state->sprite_020, 0x24) |= 4;
    }
}
