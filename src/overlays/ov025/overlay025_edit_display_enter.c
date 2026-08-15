#include "tingle/types.h"

/* Overlay 25 transition into the title scene's confirmed edit display. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void SpritePresentation_Show(void *);
extern void func_ov025_021ff140(void *);
#ifdef __cplusplus
}
#endif

/*
 * Start effect owner +0x508, enable controllers +0xDC/+0xE0, reveal the six
 * edit sprites at +0xC4..+0xD8, and hide sprite +0xC0. The split pointer walk
 * preserves retail's immediate-bit-clear instruction ordering.
 */
extern "C" void func_ov025_0220058c(void *scene)
{
    func_ov025_021ff140(FIELD(void *, scene, 0x508));
    SpritePresentation_Show(FIELD(void *, scene, 0xdc));
    SpritePresentation_Show(FIELD(void *, scene, 0xe0));
    for (s32 i = 0; i < 6; ++i) {
        u8 *entry = (u8 *)scene + i * 4;
        FIELD(u16, FIELD(void *, entry, 0xc4), 0x24) &= ~4;
    }
    FIELD(u16, FIELD(void *, scene, 0xc0), 0x24) |= 4;
}
