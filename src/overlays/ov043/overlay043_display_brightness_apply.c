#include "tingle/types.h"

/*
 * Overlay 43 display brightness application. This recovered callback routes
 * brightness through an optional presentation child or the DS display control
 * registers when the controller's display-update flag is enabled.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/*
 * Apply main/sub brightness values +0x48/+0x4C when flag 0x400 at +0x20 is
 * set. If optional child +0x2F4 exists, invoke its virtual slot +0x0C instead;
 * otherwise replace bits 8..12 of registers 0x04000000 and 0x04001000.
 * Returns zero. Hardware register writes or the virtual call are observable.
 */
extern "C" s32 func_ov043_0220b9bc(void *object)
{
    if (FIELD(u32, object, 0x20) & 0x400) {
        void *child = FIELD(void *, object, 0x2f4);
        if (child) {
            void **vtable = FIELD(void **, child, 0);
            ((void (*)(void *))vtable[3])(child);
        } else {
            volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
            volatile u32 *subDisplay = (volatile u32 *)0x04001000;
            *mainDisplay = (*mainDisplay & ~0x1f00) |
                           (FIELD(u32, object, 0x48) << 8);
            *subDisplay = (*subDisplay & ~0x1f00) |
                          (FIELD(u32, object, 0x4c) << 8);
        }
    }
    return 0;
}
