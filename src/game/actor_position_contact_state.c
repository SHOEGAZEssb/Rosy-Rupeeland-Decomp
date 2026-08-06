#include "tingle/types.h"

/* Copy actor position and maintain a byte-counted contact flag. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020050a4(void *, const void *);
#ifdef __cplusplus
}
#endif

/*
 * Clear actor word-0xd0 flag 0x80, set flag 0x200, copy source vector to
 * previous position 0x28, then copy that result to current position 0x18.
 * Returns no value; the value-copy helper may manage SDK object state.
 */
void func_02032a64(void *self, const void *source)
{
    u8 *actor = (u8 *)self;
    void *copied;

    *(u32 *)(actor + 0xd0) =
        (*(u32 *)(actor + 0xd0) & ~0x80) | 0x200;
    copied = func_020050a4(actor + 0x28, source);
    func_020050a4(actor + 0x18, copied);
}

/*
 * When third is zero, increment byte 0x4c and set actor flag one at 0x10.
 * Other inputs are otherwise ignored. Always return one; no helpers run.
 */
s32 func_02032a94(void *self, void *other, s32 third)
{
    u8 *actor = (u8 *)self;
    (void)other;
    if (!third) {
        actor[0x4c]++;
        *(u32 *)(actor + 0x10) |= 1;
    }
    return 1;
}

/*
 * Decrement nonzero byte 0x4c. When it reaches zero, retain zero and clear
 * actor flag one at 0x10. Returns no value and calls no helpers.
 */
void func_02032abc(void *self)
{
    u8 *actor = (u8 *)self;
    if (!actor[0x4c])
        return;
    actor[0x4c]--;
    if (!actor[0x4c])
        *(u32 *)(actor + 0x10) &= ~1;
}
