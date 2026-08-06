#include "tingle/types.h"

/* Recovered proximity-interaction eligibility predicate for the grid/effect actor. */

extern void *data_021052fc;
extern const u8 data_02105310[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0200b04c(const void *state);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is an actor. Return one only when the low two state bits at 0x1F0 equal
 * one, the global gate queried with data_02105310 is clear, and bit 0x100 is
 * absent from the primary global actor's word 0xD0; otherwise return zero.
 * No actor, SDK, or hardware state is changed.
 */
s32 func_0204f478(void *actor)
{
    if ((FIELD(u16, actor, 0x1f0) & 3) == 1 &&
        func_0200b04c(data_02105310) == 0) {
        void *primary = FIELD(void *, data_021052fc, 0x2ea4);
        if ((FIELD(u32, primary, 0xd0) & 0x100) == 0)
            return 1;
    }
    return 0;
}

