#include "tingle/types.h"

/*
 * Overlay 47 transition-controller construction. The recovered controller
 * owns a model/animation pair and derives a screen-space quadrilateral used
 * by the overlay's capture and geometry-engine transition effect. Exact
 * assembly retains the original switch layout and SDK resource call schedule.
 */

/*
 * Initialize caller-owned `controller` for transition `kind`, origin `x/y`,
 * and terminal frame count supplied as the fifth argument; return the same
 * pointer. It clears resource/current-state fields, conditionally reads a
 * GameWork halfword for kinds 11..14, loads the appropriate model/animation
 * pair for kinds 1..14, configures their SDK render objects and animation
 * offsets, stores origin +8/+0xC, and chooses initial rectangle endpoints
 * +0x10..+0x1C from the transition kind. Resource-manager and 3D SDK state
 * change; no direct MMIO occurs here. Constants and switch cases are confirmed
 * from control flow, while the semantic names of transition kinds are unknown.
 */
extern "C" void *func_ov047_0220b740(void *controller, s32 kind, s32 x,
                                      s32 y, s32 terminalFrame);
