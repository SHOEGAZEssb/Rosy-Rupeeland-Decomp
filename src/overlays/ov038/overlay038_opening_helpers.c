#include "tingle/types.h"

/* Overlay 38 opening no-op hook and compact presentation-node initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* No-op hook: ignores arguments, changes no state, and returns immediately. */
extern "C" void func_ov038_021fce00(void)
{
}

/*
 * Retains the second and third arguments at +0x24/+0x28 and clears link/state
 * words +4/+8. Returns nothing and performs no SDK or hardware operation. The
 * register-save prologue in the exact implementation is compiler ABI behavior.
 */
extern "C" void func_ov038_021fce04(void *node, void *value24, void *value28)
{
    FIELD(void *, node, 0x24) = value24;
    FIELD(void *, node, 0x28) = value28;
    FIELD(s32, node, 4) = 0;
    FIELD(s32, node, 8) = 0;
}
