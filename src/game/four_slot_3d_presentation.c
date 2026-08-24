#include "tingle/field_effect.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Maintain four display-control slots and draw 3D outline strips associated
 * with persistent game flags.  Each slot's intensity ramps between zero and
 * 0x800; the update configures geometry state and draws either the selected
 * unavailable slot or, for selection 4, every unavailable slot.
 */

typedef struct DisplayControlElement {
    u8 bytes00[0x10];
    s32 width10;
    u8 bytes14[0x08];
} DisplayControlElement;

typedef struct ScreenSegment {
    s16 x0;
    s16 y0;
    s16 x1;
    s16 y1;
} ScreenSegment;

typedef struct FourSlot3DPresentation {
    void **vtable00;
    u32 dispatchState;
    s32 selection08;
    s32 intensity0c[4];
    DisplayControlElement elements1c[4];
    u32 randomSeed8c;
} FourSlot3DPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6934;
extern const u16 data_020d6780[4];
extern const ScreenSegment data_020d67dc[4];
extern const ScreenSegment data_020d67fc[4];
extern const s16 data_020c9670[];
extern void *gGameWork;
extern u8 *gGamePhaseRuntime;

extern void DisplayControlElement_NoOp(DisplayControlElement *);
extern void func_02091b6c(DisplayControlElement *);
extern void func_02091bac(DisplayControlElement *, s32, s32, s32, s32);
extern s32 func_02091c7c(DisplayControlElement *, s32);
extern s32 GameWork_TestFlag(void *, u16);
extern u32 genrand_int32(void);
extern const void *ActorMotionAreaFollower_GetPosition(void *);
extern s32 func_020ae024(s32, s32);
extern void func_020b0a54(s32, s32, s32, s32, s32, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

void FourSlot3DPresentation_DrawSegmentQuad(FourSlot3DPresentation *self,
                   const ScreenSegment *segment, s32 width, s32 color,
                   u16 secondColor);

/*
 * Initialize the FieldEffect base and four display-control elements, store the
 * selection and a random word, then initialize each intensity to zero when its
 * flag is set or 0x800 otherwise.  Configure every element with arguments
 * (3,3,intensity/256,6) and return self.
 */
FourSlot3DPresentation *FourSlot3DPresentation_Init(
    FourSlot3DPresentation *self, s32 selection)
{
    s32 index;
    FieldEffect_Init(self);
    self->vtable00 = (void **)data_020d6934;
    for (index = 0; index < 4; index++) {
        func_02091b6c(&self->elements1c[index]);
    }
    self->selection08 = selection;
    self->randomSeed8c = genrand_int32();
    for (index = 0; index < 4; index++) {
        self->intensity0c[index] =
            GameWork_TestFlag(gGameWork, data_020d6780[index]) ? 0 : 0x800;
        func_02091bac(&self->elements1c[index], 3, 3,
                      self->intensity0c[index] / 0x100, 6);
    }
    return self;
}

/* Destroy all four display-control elements, tear down the FieldEffect base, and return self. */
FourSlot3DPresentation *FourSlot3DPresentation_Destroy(
    FourSlot3DPresentation *self)
{
    s32 index;
    for (index = 3; index >= 0; index--) {
        DisplayControlElement_NoOp(&self->elements1c[index]);
    }
    FieldEffect_DestroyBase(self);
    return self;
}

/* Run the normal teardown, free self, and return its old address. */
FourSlot3DPresentation *FourSlot3DPresentation_DestroyAndFree(
    FourSlot3DPresentation *self)
{
    FourSlot3DPresentation_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * Return zero immediately while global state byte 0x30cc has bit 2 set.
 * Otherwise ramp each slot intensity by 0x10 toward the state selected by its
 * persistent flag and reconfigure an element when func_02091c7c requests it.
 * Establish the confirmed geometry/matrix register state, then draw one missing
 * slot from data_020d67fc or all missing slots from data_020d67dc when selection
 * is 4.  Finish the geometry command sequence and return zero.
 */
s32 FourSlot3DPresentation_Update(FourSlot3DPresentation *self)
{
    const s32 *camera;
    volatile u32 *matrix = (volatile u32 *)0x04000444;
    volatile u32 *geometry = (volatile u32 *)0x04000440;
    volatile u32 *finish = (volatile u32 *)0x04000504;
    s32 index;

    if ((gGamePhaseRuntime[0x30cc] & 4) != 0) {
        return 0;
    }
    camera = (const s32 *)ActorMotionAreaFollower_GetPosition(gGamePhaseRuntime + 0x2fbc);
    for (index = 0; index < 4; index++) {
        if (!GameWork_TestFlag(gGameWork, data_020d6780[index])) {
            self->intensity0c[index] += 0x10;
            if (self->intensity0c[index] > 0x800) self->intensity0c[index] = 0x800;
        } else {
            self->intensity0c[index] -= 0x10;
            if (self->intensity0c[index] < 0) self->intensity0c[index] = 0;
        }
        if (func_02091c7c(&self->elements1c[index], 2)) {
            func_02091bac(&self->elements1c[index], 3, 3,
                          self->intensity0c[index] / 0x100, 6);
        }
    }

    matrix[0] = 0;
    matrix[-1] = 0;
    func_020b0a54(0, 0xc0000, 0, 0x100000, 0, 0x2000, 0x1000, 1, 0);
    geometry[0] = 3;
    geometry[5] = 0;
    geometry[0] = 2;
    geometry[5] = 0;
    geometry[11] = 0x1000000;
    geometry[11] = 0x1000000;
    geometry[11] = 0x1000;
    geometry[25] = 0x3f1f00c0;
    geometry[26] = 0;
    geometry[12] = -(camera[1] >> 12);
    geometry[12] = -(camera[2] >> 12);
    geometry[12] = 0;
    geometry[48] = 1;

    if (self->selection08 == 4) {
        for (index = 0; index < 4; index++) {
            if (!GameWork_TestFlag(gGameWork, data_020d6780[index])) {
                FourSlot3DPresentation_DrawSegmentQuad(
                    self, &data_020d67dc[index],
                    self->elements1c[index].width10, 0x7f18, 0x3ff);
            }
        }
    } else if ((u32)self->selection08 < 4 &&
               !GameWork_TestFlag(gGameWork,
                                  data_020d6780[self->selection08])) {
        index = self->selection08;
        FourSlot3DPresentation_DrawSegmentQuad(
            self, &data_020d67fc[index],
            self->elements1c[index].width10, 0x7f18, 0x3ff);
    }
    finish[0] = 0;
    *(volatile u32 *)0x04000448 = 1;
    return 0;
}

/*
 * Convert the segment direction to a table angle with func_020ae024, scale the
 * adjacent sine-table values by width, and issue a four-vertex quadrilateral
 * around the segment through the geometry color/VTX_16/VTX_XY registers.
 * self is unused; color and secondColor select the two confirmed color writes.
 */
void FourSlot3DPresentation_DrawSegmentQuad(FourSlot3DPresentation *self,
                   const ScreenSegment *segment, s32 width, s32 color,
                   u16 secondColor)
{
    volatile u32 *geometry = (volatile u32 *)0x04000480;
    u32 angle = (u16)(func_020ae024(segment->x1 - segment->x0,
                                    segment->y1 - segment->y0) + 0x4000);
    s32 index = (s32)(angle >> 4);
    s32 yOffset = (width * data_020c9670[index * 2 + 1]) / 0x1000;
    s32 xOffset = (width * data_020c9670[index * 2]) / 0x1000;
    s32 halfY = yOffset / 2;
    s32 halfX = xOffset / 2;
    (void)self;

    geometry[0] = (u32)color;
    geometry[3] = ((u32)(u16)(segment->x0 + halfX) << 16) |
                  (u16)(segment->y0 + halfY);
    geometry[3] = 0xfff0;
    geometry[5] = ((u32)(u16)(segment->x0 - halfX) << 16) |
                  (u16)(segment->y0 - halfY);
    geometry[0] = secondColor;
    geometry[5] = ((u32)(u16)(segment->x1 - xOffset) << 16) |
                  (u16)(segment->y1 - yOffset);
    geometry[5] = ((u32)(u16)(segment->x1 + xOffset) << 16) |
                  (u16)(segment->y1 + yOffset);
}
