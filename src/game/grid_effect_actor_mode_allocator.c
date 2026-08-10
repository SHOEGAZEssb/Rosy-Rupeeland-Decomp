#include "tingle/types.h"

/* Recovered 12-bit mode allocator used by grid/effect actor departure effects. */

extern u8 gGridEffectActorRuntimeState[];

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Ignore all register inputs. Find the first clear bit among bits 0..11 of the
 * allocation word at gGridEffectActorRuntimeState+4, set it, and return its index sign-extended
 * from eight bits. Return -1 if all 12 bits are occupied. Only allocator state
 * changes; there are no SDK or hardware effects.
 */
s32 func_0204faac(void)
{
    u32 occupied = FIELD(u32, gGridEffectActorRuntimeState, 4);
    s32 index;
    for (index = 0; index < 12; index++) {
        if ((occupied & (1u << index)) == 0) {
            FIELD(u32, gGridEffectActorRuntimeState, 4) |= 1u << index;
            return (s8)index;
        }
    }
    return -1;
}

