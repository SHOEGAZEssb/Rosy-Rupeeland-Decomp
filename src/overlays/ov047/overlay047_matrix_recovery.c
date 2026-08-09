#include "tingle/types.h"

/*
 * Overlay 47 transition interpolation. This recovered routine advances the
 * controller frame and derives four rectangle edges used by the renderer.
 * Exact assembly preserves eight SDK interpolation calls and switch epilogues.
 */

/*
 * If current frame +0x24 has not reached terminal frame +0x28, increment it
 * and update edges +0x10..+0x1C according to transition kind +0x20. Kinds use
 * either func_020919e8 for signed linear interpolation around the half-duration
 * point or func_02091b30 for randomized boundary selection. Origin +8/+0xC
 * and optional GameWork-derived field +0x2C influence selected cases. Return
 * nothing; only controller geometry/random state changes and no MMIO occurs.
 */
extern "C" void func_ov047_0220baa8(void *controller);
