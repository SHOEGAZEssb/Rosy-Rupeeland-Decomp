#include "tingle/types.h"

/*
 * Overlay 47 controller completion query. The recovered predicate compares
 * the controller's current step against its configured terminal step.
 */

/*
 * Return true when signed field +0x24 is greater than or equal to signed field
 * +0x28. The controller, SDK, and hardware state are unchanged.
 */
extern "C" bool func_ov047_0220c338(const void *controller)
{
    const u8 *bytes = (const u8 *)controller;
    return *(const s32 *)(bytes + 0x24) >= *(const s32 *)(bytes + 0x28);
}
