#include "tingle/types.h"

/* Overlay 25 transition out of the title scene's confirmed edit display. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void func_020954f4(void *);
#ifdef __cplusplus
}
#endif

/*
 * Release the two indexed effect groups owned by +0x508, disable controllers
 * +0xDC/+0xE0, hide the six edit sprites, and reveal sprite +0xC0. The split
 * pointer walk and uncast bit clear reproduce retail's instruction selection.
 */
extern "C" void func_ov025_022005e4(void *scene)
{
    void *effect = FIELD(void *, scene, 0x508);
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, effect, 0xe0));
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, effect, 0xe4));
    func_020954f4(FIELD(void *, scene, 0xdc));
    func_020954f4(FIELD(void *, scene, 0xe0));
    for (s32 i = 0; i < 6; ++i) {
        u8 *entry = (u8 *)scene + i * 4;
        FIELD(u16, FIELD(void *, entry, 0xc4), 0x24) |= 4;
    }
    FIELD(u16, FIELD(void *, scene, 0xc0), 0x24) &= ~4;
}
