#include "tingle/types.h"

/* Overlay 25 mirrored primary-effect resource and animation configuration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_02202c84[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void GraphicsSpriteGroup_ReplaceStateResourcesFromSource(
    void *, void *, void *);
#ifdef __cplusplus
}
#endif

/*
 * Configure mirrored primary sprites +0xE8/+0xF0 from `resourceIndex`,
 * `animation`, and `setupFlag`. Rebind both owners when the current resource
 * differs, clear sprite flag bits 1/2/6, and resubmit preserved signed X/Y
 * coordinates. Graphics resource, flag, and animation state change.
 */
extern "C" void func_ov025_021fe174(void *object, s32 resourceIndex,
                                     s32 animation, s32 setupFlag)
{
    void *mainSprite = FIELD(void *, object, 0xe8);
    const u8 *entry = data_ov025_02202c84 + resourceIndex * 8;

    if (FIELD(u16, entry, 0) !=
        FIELD(u32, FIELD(void *, mainSprite, 0x14), 0x10)) {
        s32 descriptorOffset = resourceIndex * 0xc;
        u8 *descriptors = (u8 *)object + 0xb0;
        GraphicsSpriteGroup_ReplaceStateResourcesFromSource(
            FIELD(void *, object, 0xe0), mainSprite,
            descriptors + descriptorOffset);
        GraphicsSpriteGroup_ReplaceStateResourcesFromSource(
            FIELD(void *, object, 0xe4), FIELD(void *, object, 0xf0),
            descriptors + descriptorOffset);
    }

    FIELD(u16, FIELD(void *, object, 0xe8), 0x24) &= ~0x46;
    void *sprite = FIELD(void *, object, 0xe8);
    func_02073e48(sprite, animation, FIELD(s16, sprite, 0x2c),
                  FIELD(s16, sprite, 0x2e), 3, 0x2000, setupFlag);

    FIELD(u16, FIELD(void *, object, 0xf0), 0x24) &= ~0x46;
    sprite = FIELD(void *, object, 0xf0);
    func_02073e48(sprite, animation, FIELD(s16, sprite, 0x2c),
                  FIELD(s16, sprite, 0x2e), 3, 0x2000, setupFlag);
}
