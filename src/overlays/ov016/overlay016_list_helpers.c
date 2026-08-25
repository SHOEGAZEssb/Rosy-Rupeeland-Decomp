#include "tingle/types.h"

/* Overlay 16 descriptor-list initialization, population, and visibility control. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
#ifdef __cplusplus
}
#endif

/*
 * Clear a 0x14-byte descriptor: null its two leading words, clear halfwords
 * +8/+0xA/+0xC, and zero the six-byte payload at +0xE. The descriptor is fully
 * overwritten, the function returns void, and there are no hardware effects.
 */
extern "C" void Overlay016_InitListDescriptor(void *descriptor)
{
    s32 i;

    FIELD(u32, descriptor, 0) = 0;
    FIELD(u32, descriptor, 4) = 0;
    FIELD(u16, descriptor, 8) = 0;
    FIELD(u16, descriptor, 0xa) = 0;
    FIELD(u16, descriptor, 0xc) = 0;
    for (i = 0; i < 6; i++) {
        FIELD(u8, descriptor, 0xe + i) = 0;
    }
}

/*
 * Empty callback used when destroying the descriptor array. It accepts the
 * array element pointer supplied by the runtime, changes no state, returns
 * void, and has no SDK or hardware effects.
 */
extern "C" void Overlay016_ListDescriptor_NoOp(void *descriptor)
{
    (void)descriptor;
}

/*
 * Append one 0x14-byte descriptor when storage +0x4C exists and count +0x54 is
 * below capacity +0x50. Store the caller pointer, clear +8, set +0xA to the
 * count's 0x18-byte vertical stride, OR the low half of flags into +0xC, and
 * optionally copy six payload bytes to +0xE. Increment count and return void;
 * no hardware is accessed.
 */
extern "C" void func_ov016_021fd0e0(void *state, void *value, const u8 *payload, u32 flags)
{
    s32 count = FIELD(s32, state, 0x54);
    void *storage = FIELD(void *, state, 0x4c);
    void *descriptor;
    s32 i;

    if (storage == 0 || count >= FIELD(s32, state, 0x50)) {
        return;
    }
    descriptor = (u8 *)storage + count * 0x14;
    FIELD(void *, descriptor, 0) = value;
    FIELD(u16, descriptor, 8) = 0;
    FIELD(u16, descriptor, 0xa) = (u16)(count * 0x18);
    FIELD(u16, descriptor, 0xc) |= (u16)flags;
    if (payload != 0) {
        for (i = 0; i < 6; i++) {
            FIELD(u8, descriptor, 0xe + i) = payload[i];
        }
    }
    FIELD(s32, state, 0x54) = count + 1;
}

/*
 * Mark the list visible at +0x5C. When populated and the presentation object's
 * current index +8 is below limit +4, set bit/state word +0x20 on its child at
 * +0x50; when empty, reset that child through the SDK. Also set +0x20 on the two
 * objects at +4/+8. Return void; presentation objects change but no MMIO occurs.
 */
extern "C" void func_ov016_021fd188(void *state)
{
    void *presentation = FIELD(void *, state, 0x58);

    FIELD(s32, state, 0x5c) = 1;
    if (FIELD(s32, state, 0x54) != 0) {
        if (FIELD(s32, presentation, 8) < FIELD(s32, presentation, 4)) {
            FIELD(s32, FIELD(void *, presentation, 0x50), 0x20) = 1;
        }
    } else {
        GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, presentation, 0x50));
    }
    FIELD(s32, FIELD(void *, state, 4), 0x20) = 1;
    FIELD(s32, FIELD(void *, state, 8), 0x20) = 1;
}

/*
 * Mark the list hidden at +0x5C and reset the presentation child at +0x58/+0x50
 * plus the two objects at +4/+8 through the SDK. Return void; object visibility
 * state changes and there are no direct hardware effects.
 */
extern "C" void func_ov016_021fd1e0(void *state)
{
    FIELD(s32, state, 0x5c) = 0;
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, FIELD(void *, state, 0x58), 0x50));
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, state, 4));
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, state, 8));
}
