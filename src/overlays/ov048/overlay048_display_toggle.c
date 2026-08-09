#include "tingle/types.h"

/*
 * Overlay 48 display-selection toggle. This recovered helper flips the
 * object's offset-derived main/sub display selector.
 */

/*
 * Replace integer field +0 with one when it is zero, otherwise with zero.
 * Return nothing; only the object changes and no SDK or MMIO access occurs.
 */
extern "C" void func_ov048_0220bad4(void *object)
{
    s32 *selector = (s32 *)object;
    *selector = *selector == 0 ? 1 : 0;
}
