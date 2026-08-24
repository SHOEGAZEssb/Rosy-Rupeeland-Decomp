#include "tingle/types.h"

/*
 * Overlay 39's second scene type: allocation, model setup, teardown, animation
 * refresh, and helper-hit selection for the later encounter implementation.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_ov039_02208438;
extern void *data_ov039_0220846c;
extern void *gGamePhaseRuntime;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void *Heap_Alloc(s32 size, void *tag, s32 alignment, void *heap);
extern void func_ov039_021fce00(void *object);
extern void func_ov039_021fce40(void *object);
extern void func_ov039_021fce60(void *object);
extern void func_ov039_021fce5c(void *object);
extern void func_ov039_021fd06c(void *object);
extern void func_ov039_0220482c(void *object);
extern void func_ov039_02203ef0(void *object);
extern void VecFx32Object_Init(void *vector);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void func_ov049_0220c124(void *object);
extern void func_ov069_022109c4(void *object);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *object);
extern void func_0209a748(void *resource, s32 mode);
extern void *func_0209a208(void *owner, s32 firstId, s32 secondId,
                           s32 thirdId, void *context, s32 mode);
extern void func_0209a07c(void *object);
extern void func_0209a0d8(void *object, s32 firstId, s32 secondId,
                           s32 thirdId, void *context, s32 mode);
extern void GraphicsSpriteState_SetAnimationIndex(void *object, u8 mode);
extern s32 func_020befec(s32 value, s32 divisor);
extern u32 genrand_int32(void);
extern void func_ov069_02210dc0(void *system, void *position);
extern void func_02099fb0(void *object);
extern s32 func_ov039_02202f34(void *scene, void *result);
extern s32 func_ov039_0220426c(void *scene, void *result);
extern void func_ov039_02200f9c(void *scene, s32 variant);
extern void *func_ov039_02200f4c(void *object);
#ifdef __cplusplus
}
#endif

/* Free allocation and return its original address. Heap state changes. */
extern "C" void *func_ov039_02200cc4(void *allocation)
{
    Heap_Free(allocation);
    return allocation;
}

/*
 * Construct the later encounter scene from owner and variant inputs. This
 * initializes its embedded renderer/effect systems, creates ten 0x20-byte
 * helpers and three 0x148-byte target objects, seeds four eight-entry random
 * phase arrays, establishes the initial fixed-point position and counters, and
 * returns scene. Allocation, RNG, resource, and embedded subsystem state change.
 */
extern "C" void *func_ov039_02200cd8(void *scene, void *owner, s32 variant)
{
    func_ov039_021fce00(scene);
    FIELD(void *, scene, 0) = data_ov039_02208438;
    VecFx32Object_Init((u8 *)scene + 0xac);
    func_ov039_0220482c((u8 *)scene + 0xbc);
    func_ov049_0220c124((u8 *)scene + 0x464);
    func_ov069_022109c4((u8 *)scene + 0xb3c);
    func_ov039_021fce40((u8 *)scene + 0x1ce8);
    FIELD(void *, scene, 0x48) = owner;
    FIELD(void *, scene, 0xb0c) = owner;
    FIELD(void *, scene, 0xbc) = owner;
    func_0209a748(RuntimePresentationManager_GetGraphics3dPresentation((u8 *)FIELD(void *, gGamePhaseRuntime, 0) +
                                0x2f7c), 7);
    FIELD(s32, scene, 0x30) = 0x200000;
    FIELD(s32, scene, 0x34) = 0x118000;
    FIELD(s32, scene, 0x38) = 0;
    FIELD(u16, scene, 0x3c) = FIELD(u16, scene, 0x3e) = 0x100;
    FIELD(u16, scene, 0x40) = 0;
    FIELD(s32, scene, 0x1cf0) = FIELD(s32, scene, 0x1cec) = 0;
    func_ov039_02200f9c(scene, variant);
    FIELD(s16, scene, 0x1ca4) = 60;
    FIELD(u16, scene, 0x1cb0) = 1;
    FIELD(u16, scene, 0x1caa) = FIELD(u16, scene, 0x1ca8) = 0;
    FIELD(u16, scene, 0x42) &= ~4;
    for (s32 i = 9; i >= 0; i--) {
        void *entry = Heap_Alloc(0x20, data_ov039_0220846c, 4, gHeapContext);
        if (entry) func_ov039_021fce60(entry);
        FIELD(void *, scene, 0x74 + i * 4) = entry;
    }
    for (s32 i = 2; i >= 0; i--) {
        void *entry = Heap_Alloc(0x148, data_ov039_0220846c, 4, gHeapContext);
        if (entry) func_ov039_02203ef0(entry);
        FIELD(void *, scene, 0x9c + i * 4) = entry;
    }
    for (s32 i = 7; i >= 0; i--) {
        FIELD(u16, scene, 0x1cf4 + i * 2) = (u16)genrand_int32();
        FIELD(u16, scene, 0x1d04 + i * 2) = (u16)genrand_int32();
        FIELD(u16, scene, 0x1d14 + i * 2) = (u16)genrand_int32();
        FIELD(u16, scene, 0x1d24 + i * 2) = (u16)genrand_int32();
        FIELD(s32, scene, 0x1d34 + i * 4) = 0;
    }
    FIELD(s32, scene, 0x464) = 1;
    func_ov069_02210dc0((u8 *)scene + 0xb3c,
                        (u8 *)FIELD(void *, scene, 0x4c) + 0x2c);
    return scene;
}

/*
 * Destroy an embedded 0x398-byte target object: release its two vectors and
 * invoke the no-op element destructors over its 39-element arrays. Returns the
 * same object; vector/destructor state changes.
 */
extern "C" void *func_ov039_02200f4c(void *object)
{
    VecFx32Object_Destroy((u8 *)object + 0x388);
    VecFx32Object_Destroy((u8 *)object + 0x378);
    for (s32 i = 38; i >= 0; i--) func_ov039_021fce5c((u8 *)object + 0x13c + i * 12);
    for (s32 i = 38; i >= 0; i--) func_ov039_021fd06c((u8 *)object + 4 + i * 8);
    return object;
}

/* Configure one loaded scene object and its underlying renderer flags. */
extern "C" void func_ov039_02201234(void *scene, void *object, s32 x, s32 y,
                                     u8 mode, u8 rendererByte)
{
    (void)scene;
    void *render = FIELD(void *, object, 0x0c);
    GraphicsSpriteState_SetAnimationIndex(render, mode);
    FIELD(u16, render, 0x24) |= 2;
    FIELD(u8, render, 0x3a) = rendererByte;
    FIELD(s32, object, 0x30) = x;
    FIELD(s32, object, 0x34) = y;
    FIELD(s32, object, 0x38) = 0;
    FIELD(u16, object, 0x3c) = FIELD(u16, object, 0x3e) = 0x100;
    FIELD(u16, object, 0x40) = 0;
}

/*
 * Load the principal object, eight indexed objects, and one final object from
 * resource IDs selected by variant. It applies positions, orientation indices,
 * per-object +0x44 table values, visibility bit 4, and renderer byte flags.
 */
extern "C" void func_ov039_02200f9c(void *scene, s32 variant)
{
    static const s32 values[8] = {0, 1, 2, 3, 4, 5, 6, 7};
    void *object = func_0209a208(scene, 0x128b, 0x128c, 0x128d,
                                 (void *)variant, 1);
    FIELD(void *, scene, 0x4c) = object;
    func_ov039_02201234(scene, object, 0x200000, 0x118000, 1, 1);
    FIELD(s32, object, 0x44) = 10;
    FIELD(u16, object, 0x42) |= 4;
    for (s32 i = 7; i >= 0; i--) {
        object = func_0209a208(scene, 0x128e, 0x128f, 0x1290,
                               (void *)variant, 1);
        FIELD(void *, scene, 0x50 + i * 4) = object;
        func_ov039_02201234(scene, object, 0x200000, 0x118000, 1, 1);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0x0c), (u8)i);
        FIELD(s32, object, 0x44) = values[i];
        FIELD(u16, object, 0x42) |= 4;
    }
    object = func_0209a208(scene, 0x13bd, 0x13be, 0x13bf,
                           (void *)variant, 2);
    FIELD(void *, scene, 0x70) = object;
    func_ov039_02201234(scene, object, 0x200000, 0x118000, 1, 1);
}

/*
 * Destroy all heap helpers and targets, four embedded vector-array regions,
 * the target object, scene position, and base scene state. Returns scene.
 */
extern "C" void *func_ov039_02201118(void *scene)
{
    FIELD(void *, scene, 0) = data_ov039_02208438;
    for (s32 i = 9; i >= 0; i--) if (FIELD(void *, scene, 0x74 + i * 4))
        Heap_Free(FIELD(void *, scene, 0x74 + i * 4));
    for (s32 i = 2; i >= 0; i--) {
        void *target = FIELD(void *, scene, 0x9c + i * 4);
        if (target) { func_ov039_02200f4c(target); Heap_Free(target); }
    }
    func_ov039_02200f4c((u8 *)scene + 0xbc);
    VecFx32Object_Destroy((u8 *)scene + 0xac);
    func_02099fb0(scene);
    return scene;
}

/* Set one model's orientation and renderer-enable byte; returns no value. */
extern "C" void func_ov039_02201290(void *scene, void *object, u8 orientation,
                                     u8 rendererByte)
{
    (void)scene;
    void *render = FIELD(void *, object, 0x0c);
    GraphicsSpriteState_SetAnimationIndex(render, orientation);
    FIELD(u16, render, 0x24) |= 2;
    FIELD(u8, render, 0x3a) = rendererByte;
}

/*
 * At scripted timer decades two and four, reload all eight indexed models from
 * the corresponding 0x1294 or 0x1291 resource triple. Always restores each
 * object's index orientation and renderer byte one. Resource/model state changes.
 */
extern "C" void func_ov039_022012c4(void *scene)
{
    s32 decade = func_020befec(FIELD(s16, scene, 0x1ca4), 10);
    s32 baseId = decade == 2 ? 0x1294 : (decade == 4 ? 0x1291 : 0);
    if (baseId) for (s32 i = 7; i >= 0; i--) {
        void *object = FIELD(void *, scene, 0x50 + i * 4);
        func_0209a07c(object);
        func_0209a0d8(object, baseId, baseId + 1, baseId + 2,
                       FIELD(void *, scene, 0x48), 1);
    }
    for (s32 i = 7; i >= 0; i--)
        func_ov039_02201290(scene, FIELD(void *, scene, 0x50 + i * 4),
                            (u8)i, 1);
}

/*
 * Select a hit result. While +0x1CA8 is zero, scan the ten idle helper entries
 * against the supplied point's narrow fixed-point rectangle; a hit marks the
 * helper state four and copies its +0x10/+0x14 payload to result. Otherwise try
 * the two later subsystem hit tests in order. Returns one on any hit, else zero.
 */
extern "C" s32 func_ov039_022013e8(void *scene, const void *point, void *result)
{
    if (FIELD(u16, scene, 0x1ca8) != 0) return 0;
    for (s32 i = 9; i >= 0; i--) {
        void *entry = FIELD(void *, scene, 0x74 + i * 4);
        if (FIELD(s32, entry, 0x18) != 0) continue;
        s32 dx = FIELD(s32, entry, 4) - FIELD(s32, point, 4);
        s32 dy = FIELD(s32, entry, 8) -
                 (FIELD(s32, point, 8) - FIELD(s32, point, 0x0c) - 0xb000);
        if (dx < 0x6000 && dx > -0x6000 && dy < 0x7000 && dy > -0x7000) {
            FIELD(s32, entry, 0x18) = 4;
            FIELD(s32, result, 4) = FIELD(s32, entry, 0x10);
            FIELD(s32, result, 8) = FIELD(s32, entry, 0x14);
            FIELD(s32, result, 0x0c) = 0;
            return 1;
        }
    }
    if (func_ov039_02202f34(scene, result)) return 1;
    return func_ov039_0220426c(scene, result) != 0;
}
