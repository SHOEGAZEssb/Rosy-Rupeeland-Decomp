#include "tingle/types.h"

/*
 * Overlay 8 particle update. This recovered routine advances all active pool
 * objects, applies slot-code-dependent acceleration, and retires expired ones.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0209a2ac(void *object, const void *transform, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Scan slots 59 down to zero. Skip entries whose code at +0x754+index*4 is
 * negative. Add 0x66 to vertical velocity for code zero or codes >=14, and
 * 0x19A otherwise. Decrement timer +0x664+index*4; on expiry set the slot code
 * to -1, set object flag bit 2 at +0x42, and submit the object with null data
 * and mode 1 through func_0209a2ac. In the same frame, add velocities at
 * +0x140/+0x144+index*16 to object coordinates +0x30/+0x34 and add angular
 * delta +0x574+index*4 to halfword +0x4FC+index*2. Return no value. Object
 * submission is delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay008_UpdateParticles(void *state)
{
    s32 index;

    for (index = 59; index >= 0; index--) {
        s32 code = FIELD(s32, state, 0x754 + index * 4);
        void *object;

        if (code < 0) {
            continue;
        }

        if (code == 0 || code >= 14) {
            FIELD(s32, state, 0x144 + index * 16) += 0x66;
        } else {
            FIELD(s32, state, 0x144 + index * 16) += 0x19a;
        }

        FIELD(s32, state, 0x664 + index * 4)--;
        object = FIELD(void *, state, 0x04c + index * 4);
        if (FIELD(s32, state, 0x664 + index * 4) <= 0) {
            FIELD(s32, state, 0x754 + index * 4) = -1;
            FIELD(u16, object, 0x42) |= 4;
            func_0209a2ac(object, 0, 1);
        }

        FIELD(s32, object, 0x30) += FIELD(s32, state, 0x140 + index * 16);
        FIELD(s32, object, 0x34) += FIELD(s32, state, 0x144 + index * 16);
        FIELD(u16, state, 0x4fc + index * 2) =
            (u16)(FIELD(u16, state, 0x4fc + index * 2) +
                  FIELD(s32, state, 0x574 + index * 4));
    }
}
