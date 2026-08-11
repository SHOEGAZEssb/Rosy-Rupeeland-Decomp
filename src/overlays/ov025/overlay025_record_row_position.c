#include "tingle/types.h"

/* Overlay 25 record-row vertical positioning and redraw dispatch. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov025_021fdc60(void *widget, s32 offset);
#ifdef __cplusplus
}
#endif

/*
 * Move the row owner to `offset + 0x28 + 60*index`, then tail-dispatch the
 * row redraw with the same offset. The owner and its graphics state change;
 * returns void.
 */
extern "C" void func_ov025_021fdea0(void *widget, s32 offset)
{
    s32 rowOffset = FIELD(s32, widget, 0x78) * 0x3c;
    rowOffset += 0x28;
    void *owner = FIELD(void *, widget, 0xc);
    s32 position = offset;
    position += rowOffset;
    FIELD(s32, owner, 0x1c) = position;
    return func_ov025_021fdc60(widget, offset);
}
