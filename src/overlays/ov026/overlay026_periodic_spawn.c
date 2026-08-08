#include "tingle/types.h"

/* Overlay 26 periodic spawning of geometry-backed motion objects. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gHeapContext;
extern const s16 data_020c9670[];
extern const u8 data_ov026_02204ad4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern s32 func_020918f4(void *, s32);
extern void func_02095274(void *, void *);
extern void *func_ov026_021fe5d8(void *, void *, s32, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/* Returns a random table direction scaled by `radius` in `x` and `z`. */
static void random_circle(void *scene, s32 radius, s32 *x, s32 *z)
{
    u32 angle = (u32)func_020918f4((u8 *)scene + 0x7a4, 0x1000);
    s32 index = (angle >> 4) & 0xfff;
    *x = (data_020c9670[index * 2] * radius + 0x800) >> 12;
    *z = (data_020c9670[index * 2 + 1] * radius + 0x800) >> 12;
}

/* Allocates the shared 0xB4 motion-object storage on heap 4. */
static void *allocate_motion(void)
{
    return Heap_Alloc(0xb4, data_ov026_02204ad4, 4, gHeapContext);
}

/*
 * Every second call, resets counter +0x324 and spawns a motion object around a
 * radius-0x385 circle. It uses constructor control 0x52, two random 16.12
 * parameters, model resource +0x15C, and registers the result in list +0x314.
 * Returns void.
 */
extern "C" void func_ov026_02200ff4(void *scene)
{
    if (++FIELD(s32, scene, 0x324) <= 1)
        return;
    FIELD(s32, scene, 0x324) = 0;
    s32 x, z;
    random_circle(scene, 0x385, &x, &z);
    void *object = allocate_motion();
    if (object != 0) {
        s32 random0 = func_020918f4((u8 *)scene + 0x7a4, 0x1000) << 4;
        s32 random1 = func_020918f4((u8 *)scene + 0x7a4, 0x1000) << 4;
        object = func_ov026_021fe5d8(object, FIELD(void *, scene, 0x15c),
                                     x, 0x52, z, random0, random1);
    }
    func_02095274((u8 *)scene + 0x314, object);
}

/*
 * Every third call, spawns a radius-0x19A motion object at the composite's Y
 * position minus its accumulated tube length and 0x19A. Two random parameters
 * are supplied and the result is registered in list +0x314. Returns void.
 */
extern "C" void func_ov026_0220112c(void *scene)
{
    if (++FIELD(s32, scene, 0x324) <= 2)
        return;
    FIELD(s32, scene, 0x324) = 0;
    s32 x, z;
    random_circle(scene, 0x19a, &x, &z);
    void *object = allocate_motion();
    if (object != 0) {
        void *effect = FIELD(void *, scene, 0x160);
        s32 y = FIELD(s32, effect, 0x20) -
                (FIELD(s32, effect, 0x13c) << 10) - 0x19a;
        s32 random0 = func_020918f4((u8 *)scene + 0x7a4, 0x1000) << 4;
        s32 random1 = func_020918f4((u8 *)scene + 0x7a4, 0x1000) << 4;
        object = func_ov026_021fe5d8(object, FIELD(void *, scene, 0x15c),
                                     x, y, z, random0, random1);
    }
    func_02095274((u8 *)scene + 0x314, object);
}

/*
 * Every third call, spawns a radius-0x1C2 motion object using `control` as the
 * constructor's fourth argument, two random parameters, and model resource
 * +0x15C. Registers it in list +0x314 and returns void.
 */
extern "C" void func_ov026_02201284(void *scene, s32 control)
{
    if (++FIELD(s32, scene, 0x324) <= 2)
        return;
    FIELD(s32, scene, 0x324) = 0;
    s32 x, z;
    random_circle(scene, 0x1c2, &x, &z);
    void *object = allocate_motion();
    if (object != 0) {
        s32 random0 = func_020918f4((u8 *)scene + 0x7a4, 0x1000) << 4;
        s32 random1 = func_020918f4((u8 *)scene + 0x7a4, 0x1000) << 4;
        object = func_ov026_021fe5d8(object, FIELD(void *, scene, 0x15c),
                                     x, control, z, random0, random1);
    }
    func_02095274((u8 *)scene + 0x314, object);
}
