#include "tingle/types.h"

/* Apply a shared presentation state to every member of an overlay-90 chain. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void func_ov090_0221bb84(void *member, s32 state);

/* Call the participant presentation-state setter for each chain member. */
void func_ov090_0221c318(void *self, s32 state)
{
    s32 i;

    for (i = 0; i < FIELD(s16, self, 8); i++)
        func_ov090_0221bb84(FIELD(void **, self, 4)[i], state);
}
