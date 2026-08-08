#include "tingle/types.h"

/* Overlay 35 quinary one-shot effect setup and rotated primitive geometry. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern const u8 data_ov035_02202bd4[];
extern const u8 data_ov035_02202ca4[];
extern const u8 data_ov035_02203d48[];
extern const s16 data_020c9670[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov035_021fd4dc(void *list);
extern void Sound_Play(void *soundContext, s32 id, s32 argument);
extern s32 func_02091a70(s32 first, s32 second, s32 third, s32 fourth);
extern void func_02091b98(void *state, s32 duration);
extern void func_02094cf0(void *object, const void *animation, s32 loop);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov035_021fcf34(void *object, void *resource, s32 index,
                                s32 entry);
extern void func_02095274(void *collection, void *object);
extern void func_020948d4(void *field, s32 value);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_ov035_021fd51c(void *list, s32 x0, s32 y0, s32 x1, s32 y1);
#ifdef __cplusplus
}
#endif

/* Converts a signed fixed-point product to the binary's truncating Q15 result. */
static s32 q15_product(s32 product)
{
    return (product + ((u32)(product >> 7) >> 24)) >> 8;
}

/*
 * Starts the quinary one-shot effect. It clears primitive list +0x170, plays
 * sound 0x1CA, derives and starts duration state +0x138 from resource +0xF4
 * and selection +0x134, assigns non-looping animations to sprites +0x104 and
 * +0x100, and creates a model from resource +0xF4 at (0,0x500,0x400). The
 * model is attached to collection +0x128 with field +0x6C set to 0x666.
 * Returns 1 when selection +0x134 equals resource field +0x20->+4, otherwise
 * 0. Sound, list, animation, heap, transform, and renderer state change.
 */
extern "C" s32 func_ov035_022011a8(void *scene)
{
    func_ov035_021fd4dc(FIELD(void *, scene, 0x170));
    Sound_Play(gSoundContext, 0x1ca, 0);

    void *resource = FIELD(void *, scene, 0xf4);
    s32 resourceValue = FIELD(s32, FIELD(void *, resource, 0x20), 4);
    s32 selection = FIELD(s32, scene, 0x134);
    s32 duration = func_02091a70(0x1e, 0x10, resourceValue, selection);
    func_02091b98((u8 *)scene + 0x138, duration);
    func_02094cf0(FIELD(void *, scene, 0x104), data_ov035_02202bd4, 0);
    func_02094cf0(FIELD(void *, scene, 0x100), data_ov035_02202ca4, 0);

    void *model = Heap_Alloc(0xc4, data_ov035_02203d48, 4, gHeapContext);
    if (model != 0)
        model = func_ov035_021fcf34(model, resource, selection, 0x0b);
    func_02095274((u8 *)scene + 0x128, model);
    func_020948d4((u8 *)model + 0x6c, 0x666);
    func_02094bbc(model, 0, 0x500, 0x400);
    return resourceValue == selection;
}

/*
 * Appends one rotated edge to primitive list +0x170. Sprite +0x104 supplies
 * its 16-bit angle at +0x60 and center at +0x10/+0x20. Adjacent entries in
 * data_020c9670 rotate two confirmed local coordinate pairs built from the
 * constants 56, 24, 96, and 32; the resulting two screen points are passed to
 * func_ov035_021fd51c. There is no return value and list geometry changes.
 * The table access and fixed-point arithmetic are confirmed; axis orientation
 * remains an inference from the call shape.
 */
extern "C" void func_ov035_022012ac(void *scene)
{
    void *sprite = FIELD(void *, scene, 0x104);
    s32 tableIndex = (((u16)FIELD(s32, sprite, 0x60)) >> 4) << 1;
    s32 a = data_020c9670[tableIndex];
    s32 b = data_020c9670[tableIndex + 1];
    s32 centerX = FIELD(s32, sprite, 0x10);
    s32 centerY = FIELD(s32, sprite, 0x20);

    s32 x0 = centerX + q15_product(b * 56 + a * 24);
    s32 y0 = centerY + q15_product(a * 56 - b * 24);
    s32 x1 = centerX + q15_product(b * 96 - a * 32);
    s32 y1 = centerY + q15_product(a * 96 + b * 32);
    func_ov035_021fd51c(FIELD(void *, scene, 0x170), x0, y0, x1, y1);
}
