#include "tingle/types.h"

/*
 * Recovered terminal callbacks for the runtime actor variant subclass. They
 * expose two constants and two intentionally empty hooks.
 */

/* Ignore all register inputs and return recovered identifier 0x309. */
u32 RuntimeActorScriptVariantSubclass_GetIdentifier(void)
{
    return 0x309;
}

/* Ignore all register inputs and return zero without changing any state. */
s32 RuntimeActorScriptVariantSubclass_ReturnZeroHook3(void)
{
    return 0;
}

/* Empty recovered callback with no state, SDK, or hardware effects. */
void RuntimeActorScriptVariantSubclass_NoOpHook2(void)
{
}

/* Empty recovered callback with no state, SDK, or hardware effects. */
void RuntimeActorScriptVariantSubclass_NoOpHook3(void)
{
}
