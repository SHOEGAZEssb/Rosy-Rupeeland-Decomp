#include "tingle/types.h"

/* Recovered constant virtual callback for the grid/effect actor subsystem. */

/* Ignore all register inputs, return fx32 value 0x100000, and change no state. */
s32 GridEffectActor_ReturnFx100000(void)
{
    return 0x100000;
}
