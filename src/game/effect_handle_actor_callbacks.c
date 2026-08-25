#include "tingle/types.h"

/* Recovered constant virtual callback for the effect-handle actor subclass. */

/* Ignore all register inputs, return fx32 value 0x100000, and change no state. */
s32 EffectHandleActor_GetGravityAcceleration(void)
{
    return 0x100000;
}

