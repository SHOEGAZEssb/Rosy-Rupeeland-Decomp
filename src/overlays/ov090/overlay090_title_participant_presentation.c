#include "tingle/graphics_sprite_state.h"
#include "tingle/heap.h"
#include "tingle/types.h"
#include "tingle/util_animation_resource.h"
#include "tingle/vec_fx32.h"

/* Paired-sprite presentation object used by phase-90 title participants. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TitleParticipantPresentation {
    const void *vtable;
    UtilAnimationResource *resource;
    VecFx32Object position;
} TitleParticipantPresentation;

extern const u8 data_ov090_0221cc68[];
extern const char data_ov090_0221cc90[];
extern const u8 data_ov090_0221cc88[];
extern s32 DisplayController_GetVerticalOffset(void);
extern void func_ov090_0221b97c(void *resource, u16 flags);
extern s32 func_020ae024(s32 y, s32 x);

/*
 * Initialize the wrapper vector from the sixth argument, allocate its paired
 * animation resource from the supplied owners and three resource words, set
 * both animation indices from the fifth argument, and set sprite flag bit 1.
 */
TitleParticipantPresentation *func_ov090_0221b9a0(
    TitleParticipantPresentation *self, void *owner0, void *owner1,
    const void *resources, s32 animation, const VecFx32Object *position)
{
    UtilAnimationResource *resource;
    void *resource2;
    void *resource1;
    void *resource0;

    self->vtable = data_ov090_0221cc68;
    VecFx32Object_InitCopy(&self->position, position);
    resource = (UtilAnimationResource *)Heap_Alloc(
        sizeof(UtilAnimationResource), data_ov090_0221cc90, 4,
        &gHeapContext);
    if (resource != 0) {
        /* Retail retains these three words across the display-offset call. */
        resource2 = FIELD(void *, resources, 0x0c);
        resource1 = FIELD(void *, resources, 8);
        resource0 = FIELD(void *, resources, 4);
        resource = UtilAnimationResource_Init(
            resource, 0, owner0, owner1, 2, resource0, resource1, resource2,
            DisplayController_GetVerticalOffset());
    }
    self->resource = resource;
    GraphicsSpriteState_SetAnimationIndex(
        (GraphicsSpriteState *)resource->handles[0], (u8)animation);
    GraphicsSpriteState_SetAnimationIndex(
        (GraphicsSpriteState *)resource->handles[1], (u8)animation);
    func_ov090_0221b97c(self->resource, 2);
    return self;
}

/*
 * Turn both sprites toward the target point, limiting the signed angular
 * change from sprite halfword +0x30 to 0x300 per call.
 */
void func_ov090_0221baec(void *self, const void *target)
{
    s32 deltaY;
    s32 deltaX;
    void *resource;
    s16 current;
    s32 difference;
    s32 angle;

    /* This source order schedules into retail's Y-pair-then-X-pair loads. */
    deltaX = FIELD(s32, self, 0x0c) - FIELD(s32, target, 4);
    deltaY = FIELD(s32, self, 0x10) - FIELD(s32, target, 8);

    if (deltaX == 0 && deltaY == 0)
        return;
    angle = func_020ae024(-deltaY, deltaX);
    /* Retain the resource loaded for the primary handle through both writes. */
    current = FIELD(s16,
                    FIELD(void *, FIELD(void *, self, 4), 4), 0x30);
    resource = FIELD(void *, self, 4);
    if (angle < current)
        angle += 0x10000;
    difference = angle - current;
    if (difference < 0x8000) {
        if (difference > 0x300)
            difference = 0x300;
    } else {
        difference = 0x10000 - difference;
        if (difference > 0x300)
            difference = 0x300;
        difference *= -1;
    }
    FIELD(s16, FIELD(void *, resource, 4), 0x30) =
        (s16)(u16)(current + difference);
    FIELD(s16, FIELD(void *, resource, 8), 0x30) =
        (s16)(u16)(current + difference);
}

/*
 * Convert participant and target fixed-point coordinates to the paired sprite
 * offsets, construct the two retail stack position records using the current
 * NDS display vertical offset, and submit the first record to the resource.
 */
void func_ov090_0221bb84(void *self, const void *target)
{
    TouchPoint positions[2];
    UtilAnimationResource *resource;
    TouchPoint *position;
    s32 x;
    s32 y;
    s32 vertical;

    x = (FIELD(s32, self, 0x0c) >> 12) -
        (FIELD(s32, target, 4) >> 12);
    y =
        ((FIELD(s32, self, 0x10) >> 12) - (FIELD(s32, self, 0x14) >> 12)) -
        (FIELD(s32, target, 8) >> 12);
    FIELD(s32, FIELD(void *, self, 4), 0x18) = x;
    FIELD(s32, FIELD(void *, self, 4), 0x1c) = y;
    vertical = -0xc0 - DisplayController_GetVerticalOffset();
    positions[0].vtable = (TouchPointVTable *)data_ov090_0221cc88;
    positions[0].x = 0;
    positions[0].y = vertical;
    resource = (UtilAnimationResource *)FIELD(void *, self, 4);
    position = &positions[0];
    positions[1].vtable = (TouchPointVTable *)data_ov090_0221cc88;
    positions[1].x = 0;
    positions[1].y = vertical;
    UtilAnimationResource_UpdatePosition(resource, position);
}
