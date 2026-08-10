#include "tingle/types.h"

/*
 * Recovered interaction-driven motion update for the extended actor owning the
 * transform-like value at +0x29c.
 */
extern s16 data_020c9670[];
extern u8 data_020e0f28[];
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02005058(void *value);
extern void func_020050a4(void *destination, const void *source);
extern void VecFx32_Subtract(void *output, const void *first, const void *second);
extern void *func_02007f0c(void *context, s32 index);
extern s32 func_0204cfa4(s32 x, s32 y);
extern s32 func_020ae024(s32 y, s32 x);
#ifdef __cplusplus
}
#endif

/*
 * Ask actor vtable +0x1d4 whether to reject targetTransform and return early
 * when it does. Otherwise clear +0x298, assign targetTransform to +0x78, and
 * measure its displacement from actor +0x18. Distances above 0x1000 obtain a
 * limit from vtable +0xc8; with +0xd0 bit one, that limit is clamped through
 * the primary world actor and 0x3c-byte data_020e0f28 records indexed by actor
 * +0x256, otherwise the first signed result halfword is used. Positive limits
 * become table-derived +0x3c/+0x40 velocity after vtable +0x1d8 adjustment and
 * enter state five or six. Nonpositive limits enter state two. At shorter
 * distance, state six contributes half velocity to +0x8c/+0x90 before velocity
 * is cleared and state one entered. Finally, +0xd0 bit two and a nonzero vtable
 * +0x30 predicate clear +0x8c/+0x90/+0x94. The temporary displacement is
 * finalized. Actor, transform, virtual, and world-query state may change.
 */
void ActorExtendedTransform_UpdateTargetMotion(void *self, const void *targetTransform)
{
    u8 *actor = (u8 *)self;
    u8 displacement[0x10];
    u8 limits[0x10];
    s32 magnitude;

    if ((*(s32 (**)(void *, const void *))(*(u8 **)actor + 0x1d4))(
            actor, targetTransform) != 0) {
        return;
    }
    *(u16 *)(actor + 0x298) = 0;
    func_020050a4(actor + 0x78, targetTransform);
    VecFx32_Subtract(displacement, actor + 0x78, actor + 0x18);
    magnitude = func_0204cfa4(*(s32 *)(displacement + 4),
                              *(s32 *)(displacement + 8));

    if (magnitude > 0x1000) {
        (*(void (**)(void *, void *))(*(u8 **)actor + 0xc8))(actor, limits);
        if ((*(u32 *)(actor + 0xd0) & 2) != 0) {
            u16 index = *(u16 *)(actor + 0x256) >> 2;
            u8 *root = *(u8 **)data_021052fc;
            u8 *primary = *(u8 **)((u8 *)func_02007f0c(root, 1) + 0x2e7c);
            s16 row = ((*(s32 (**)(void *))(*(u8 **)primary + 0xa8))(primary) != 0)
                          ? *(s16 *)(limits + 4) : *(s16 *)(limits + 2);
            u16 column = *(u16 *)(limits + 6);
            s32 limit = *(u16 *)(data_020e0f28
                + (row + (column << 4)) * 0x3c + index * 2) << 4;
            if (magnitude >= limit)
                magnitude = limit;
        } else {
            magnitude = *(s16 *)limits << 4;
        }
        *(u16 *)(actor + 0xde) = 0x100;
        if (magnitude > 0) {
            s32 angle = func_020ae024(*(s32 *)(displacement + 8),
                                      *(s32 *)(displacement + 4)) >> 4;
            s32 velocityX = (magnitude * data_020c9670[angle * 2 + 1]) >> 12;
            s32 velocityY = (magnitude * data_020c9670[angle * 2]) >> 12;
            (*(void (**)(void *, s32 *, s32 *))(*(u8 **)actor + 0x1d8))(
                actor, &velocityX, &velocityY);
            *(s32 *)(actor + 0x3c) = velocityX;
            *(s32 *)(actor + 0x40) = velocityY;
            *(u16 *)(actor + 0xd6) =
                ((*(u32 *)(actor + 0xd0) & 2) != 0) ? 6 : 5;
        } else {
            *(u16 *)(actor + 0xd6) = 2;
        }
    } else {
        if (*(s16 *)(actor + 0xd8) == 6) {
            s32 x = *(s32 *)(actor + 0x3c);
            s32 y = *(s32 *)(actor + 0x40);
            *(s32 *)(actor + 0x8c) = (x + (s32)((u32)x >> 31)) >> 1;
            *(s32 *)(actor + 0x90) = (y + (s32)((u32)y >> 31)) >> 1;
        }
        *(s32 *)(actor + 0x3c) = 0;
        *(s32 *)(actor + 0x40) = 0;
        *(u16 *)(actor + 0xd6) = 1;
    }
    if ((*(u32 *)(actor + 0xd0) & 4) != 0
        && (*(s32 (**)(void *))(*(u8 **)actor + 0x30))(actor) != 0) {
        *(u32 *)(actor + 0x8c) = 0;
        *(u32 *)(actor + 0x90) = 0;
        *(u32 *)(actor + 0x94) = 0;
    }
    func_02005058(displacement);
}
