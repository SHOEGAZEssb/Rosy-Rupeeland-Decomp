#include "tingle/random.h"
#include "tingle/types.h"

/* Advance optional position data and reset actor position with randomized offsets. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02045364(void *object);
extern s32 *func_0204539c(void *object);
extern s32 *func_020453b0(void *object);
extern void func_020050a4(void *destination, const void *source);
extern void Actor_RefreshTerrainHeight(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Return without changes while halfword +0x26a is nonzero. Otherwise advance
 * optional object +0x26c through func_02045364, query its two coordinates into
 * fixed-point words +0x230/+0x234, and zero halfword +0x25a. Returns no value;
 * path/object and actor position-target state change. Retail assumes +0x26c is
 * valid on this path.
 */
void ActorExtendedType2_AdvancePositionTarget(void *self)
{
    u8 *actor = (u8 *)self;
    void *object;

    if (*(u16 *)(actor + 0x26a) != 0)
        return;
    object = *(void **)(actor + 0x26c);
    func_02045364(object);
    *(s32 *)(actor + 0x230) = *func_0204539c(object) << 12;
    *(s32 *)(actor + 0x234) = *func_020453b0(object) << 12;
    *(u16 *)(actor + 0x25a) = 0;
}

/*
 * Restore actor position +0x18 from saved vector +0x22c. If recovered flags
 * +0x272 contain 0x04/0x08/0x10, add independent random X/Y offsets with spans
 * [-31,32], [-63,64], or [-127,128] respectively, choosing the first set bit
 * in that order. Refresh terrain height, copy +0x1dc to Z +0x24, copy position
 * +0x18 to vector +0x28, and zero motion words +0x3c/+0x40/+0x44. Returns no
 * value; RNG, actor transform, and motion state change.
 */
void ActorExtendedType2_RestoreRandomizedPosition(void *self)
{
    u8 *actor = (u8 *)self;
    u16 flags;
    s32 xOffset;
    s32 yOffset;

    func_020050a4(actor + 0x18, actor + 0x22c);
    flags = *(u16 *)(actor + 0x272);
    if ((flags & 0x1c) != 0) {
        if ((flags & 4) != 0) {
            xOffset = 32 - (s32)(genrand_int32() & 0x3f);
            yOffset = 32 - (s32)(genrand_int32() & 0x3f);
        } else if ((flags & 8) != 0) {
            xOffset = 64 - (s32)(genrand_int32() & 0x7f);
            yOffset = 64 - (s32)(genrand_int32() & 0x7f);
        } else {
            xOffset = 128 - (s32)(genrand_int32() & 0xff);
            yOffset = 128 - (s32)(genrand_int32() & 0xff);
        }
        *(s32 *)(actor + 0x1c) += xOffset << 12;
        *(s32 *)(actor + 0x20) += yOffset << 12;
    }
    Actor_RefreshTerrainHeight(actor);
    *(s32 *)(actor + 0x24) = *(s32 *)(actor + 0x1dc);
    func_020050a4(actor + 0x28, actor + 0x18);
    *(s32 *)(actor + 0x44) = 0;
    *(s32 *)(actor + 0x40) = 0;
    *(s32 *)(actor + 0x3c) = 0;
}
