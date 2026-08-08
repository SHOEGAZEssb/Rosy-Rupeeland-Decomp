#include "tingle/types.h"

/* Overlay 35 parameterized burst-model allocation and motion setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov035_02203d70[];
extern void *gSoundContext;
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov035_02201584(void *object, void *resource,
                                s32 resourceIndex);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_020948e4(void *field, s32 mode, s32 value);
extern void func_02095274(void *collection, void *object);
extern void Sound_Play(void *soundContext, s32 id, s32 argument);
#ifdef __cplusplus
}
#endif

/*
 * Allocates a 0xC8-byte burst model from scene resource +0xFC. The first three
 * explicit values provide its initial X/Y/Z position; targetX, targetY,
 * targetZ, and targetScale configure mode-1 transitions at +0x0C/+0x1C/+0x2C
 * and +0x5C. resourceIndex selects the model constructor resource entry. A
 * 16-frame timing window is started and the object is attached to collection
 * +0x11C. While scene counter +0x164 is below 0x2B, object flag +0x88 is set.
 * Sound 0x1CB is played with argument 1. There is no defined return value;
 * heap, sound, transform, animation, collection, and object state change.
 */
extern "C" void func_ov035_02201d10(void *scene, s32 x, s32 y, s32 z,
                                      s32 targetX, s32 targetY, s32 targetZ,
                                      s32 targetScale, s32 resourceIndex)
{
    void *object = Heap_Alloc(0xc8, data_ov035_02203d70, 4, gHeapContext);
    if (object != 0)
        object = func_ov035_02201584(object, FIELD(void *, scene, 0xfc),
                                    resourceIndex);
    func_02094bbc(object, x, y, z);
    func_020948e4((u8 *)object + 0x0c, 1, targetX);
    func_020948e4((u8 *)object + 0x1c, 1, targetY);
    func_020948e4((u8 *)object + 0x2c, 1, targetZ);
    func_020948e4((u8 *)object + 0x5c, 1, targetScale);
    FIELD(s32, object, 0x7c) = 16;
    FIELD(s32, object, 0x80) = 0;
    func_02095274((u8 *)scene + 0x11c, object);
    if (FIELD(s32, scene, 0x164) < 0x2b)
        FIELD(s32, object, 0x88) = 1;
    Sound_Play(gSoundContext, 0x1cb, 1);
}
