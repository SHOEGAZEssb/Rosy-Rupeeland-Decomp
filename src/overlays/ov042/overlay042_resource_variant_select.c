#include "tingle/types.h"

/*
 * Overlay 42 presentation-resource selection. This recovered helper resets and
 * configures one of two linked records according to an address-derived variant
 * selector, then synchronizes its resource and visibility flags.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_0209a07c(void *record);
extern "C" void func_0209a0d8(void *record, s32 resource0, s32 resource1,
                               s32 resource2, s32 ownerValue, s32 mode);
extern "C" void func_02072b68(void *resource, u8 mode);

/*
 * For selector -1, reset record +0x50, configure IDs 0x12FF/0x1300/0x1301
 * with owner+0x48 word zero and mode one, disable its resource, clear resource
 * bit 1, and hide the record. Otherwise reset record +0x4C; selector two uses
 * IDs 0x12FA/0x12FE/0x12FC and selector one uses 0x12FA/0x12FD/0x12FC, both
 * with mode two. Then disable that resource and set bit 1. Other nonnegative
 * selectors skip reconfiguration but receive the latter flag update. SDK and
 * record state change; no value is returned.
 */
extern "C" void func_ov042_02206ff8(void *object, s32 selector)
{
    s32 ownerValue = FIELD(s32, FIELD(void *, object, 0x48), 0);
    if (selector == -1) {
        void *record = FIELD(void *, object, 0x50);
        func_0209a07c(record);
        func_0209a0d8(record, 0x12ff, 0x1300, 0x1301, ownerValue, 1);
        void *resource = FIELD(void *, record, 0xc);
        func_02072b68(resource, 0);
        FIELD(u16, resource, 0x24) &= (u16)~2;
        FIELD(u16, record, 0x42) |= 4;
        return;
    }

    void *record = FIELD(void *, object, 0x4c);
    func_0209a07c(record);
    if (selector == 2)
        func_0209a0d8(record, 0x12fa, 0x12fe, 0x12fc, ownerValue, 2);
    else if (selector == 1)
        func_0209a0d8(record, 0x12fa, 0x12fd, 0x12fc, ownerValue, 2);
    void *resource = FIELD(void *, record, 0xc);
    func_02072b68(resource, 0);
    FIELD(u16, resource, 0x24) |= 2;
}
