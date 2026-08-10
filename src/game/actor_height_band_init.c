#include "tingle/types.h"

/* Initialize actor height-band fields by scanning terrain rows. */
extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adae4(s32, s32);
extern s32 func_020343e4(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Interpret input words 0x04/0x08 in sixteenth-unit coordinates. Derive the
 * top scan row from global object 0x2ed4 field 0x20, clamp it to inputY/16+16,
 * and scan downward. At the first row where inputY/16 equals row minus the
 * func_020343e4 height, store inputX<<12 at actor 0x7c, height<<16 at 0x84,
 * and that height plus inputY<<12 at 0x80. If no row through zero matches,
 * leave these fields unchanged. Returns no value; terrain queries observe
 * world state without direct hardware access.
 */
void Actor_TryInitializeHeightBandFromPoint(void *self,
                                           const void *inputPointer)
{
    u8 *actor = (u8 *)self;
    const u8 *input = (const u8 *)inputPointer;
    u8 *world = *(u8 **)((u8 *)data_021052fc + 0x2ed4);
    s32 x = *(s32 *)(input + 0x04) >> 4;
    s32 y = *(s32 *)(input + 0x08) >> 4;
    s32 row = func_020adae4(
                  (s32)((*(u32 *)(world + 0x20) >> 16) << 4), 16) -
              1;

    if (row > y + 16)
        row = y + 16;
    for (; row >= 0; row--) {
        s32 height = func_020343e4(actor, x, row);
        if (y == row - height) {
            *(s32 *)(actor + 0x7c) = *(s32 *)(input + 0x04) << 12;
            *(s32 *)(actor + 0x84) = height << 16;
            *(s32 *)(actor + 0x80) =
                (height << 16) + (*(s32 *)(input + 0x08) << 12);
            return;
        }
    }
}
