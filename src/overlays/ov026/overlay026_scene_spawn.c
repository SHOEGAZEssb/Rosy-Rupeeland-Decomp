#include "tingle/types.h"

/* Overlay 26 randomized scene-object spawning and motion initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gHeapContext;
extern const s16 data_020c9670[];
extern const u8 data_ov026_02204acc[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *, void *);
extern s32 func_0209189c(void *, s32, s32);
extern s32 func_020918f4(void *, s32);
extern void PresentationScalar_SetImmediate(void *, s32);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
extern void PresentationScalar_TransitionBy(void *, s32, s32);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern void PresentationList_Append(void *, void *);
extern void *func_020955d8(void *, void *);
extern void func_020956a4(void *);
extern void func_ov026_021fe5c0(void *, s32);
extern void func_ov026_021ff830(void *, u32, s32, s32, s32, u8, u32);
#ifdef __cplusplus
}
#endif

/*
 * Acquires a record from pool +0x6C/descriptor +0x94 and allocates its 0xA0
 * geometry-backed companion. A random angle selects a radius-0x333 position
 * around input Y `height`, radius-0xCD X/Z velocity, downward component -0x333,
 * control IDs 0x19A/0x666, and lifetime 30..50. The record is configured with
 * byte 0x14/flags 0x42, and the companion is registered in list +0x304. Returns
 * void; allocation uses heap 4.
 */
extern "C" void func_ov026_02200e0c(void *scene, s32 height)
{
    void *record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0x6c),
                                  (u8 *)scene + 0x94);
    void *object = Heap_Alloc(0xa0, data_ov026_02204acc, 4, gHeapContext);
    if (object != 0)
        object = func_020955d8(object, record);

    u32 angle = (u32)func_020918f4((u8 *)scene + 0x7a4, 0x1000);
    func_ov026_021ff830(record, 0, 0, 0, 0, 0x14, 0x42);
    FIELD(s32, record, 0x44) = 0x8000;
    s32 index = (angle >> 4) & 0xfff;
    s32 sin_value = data_020c9670[index * 2];
    s32 cos_value = data_020c9670[index * 2 + 1];
    s32 x = (sin_value * 0x333 + 0x800) >> 12;
    s32 z = (cos_value * 0x333 + 0x800) >> 12;
    Presentation_SetPosition(object, x, height, z);
    PresentationScalar_SetImmediate((u8 *)object + 0x6c, 0x19a);
    func_020956a4(object);
    FIELD(s32, object, 0x88) = 1;
    PresentationScalar_TransitionBy((u8 *)object + 0xc, 1,
                  (sin_value * 0xcd + 0x800) >> 12);
    PresentationScalar_TransitionBy((u8 *)object + 0x2c, 1,
                  (cos_value * 0xcd + 0x800) >> 12);
    PresentationScalar_TransitionBy((u8 *)object + 0x1c, 5, -0x333);
    PresentationScalar_TransitionTo((u8 *)object + 0x6c, 3, 0x666);
    func_ov026_021fe5c0(object,
        func_0209189c((u8 *)scene + 0x7a4, 0x1e, 0x32));
    PresentationList_Append((u8 *)scene + 0x304, object);
}
