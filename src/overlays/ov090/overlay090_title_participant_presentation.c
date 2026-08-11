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

typedef struct TitlePresentationPositionPair {
    const void *firstVtable;
    s32 firstX;
    s32 firstY;
    const void *secondVtable;
    s32 secondX;
    s32 secondY;
} TitlePresentationPositionPair;

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

    self->vtable = data_ov090_0221cc68;
    VecFx32Object_InitCopy(&self->position, position);
    resource = (UtilAnimationResource *)Heap_Alloc(
        sizeof(UtilAnimationResource), data_ov090_0221cc90, 4,
        &gHeapContext);
    if (resource != 0) {
        resource = UtilAnimationResource_Init(
            resource, 0, owner0, owner1, 2, FIELD(void *, resources, 4),
            FIELD(void *, resources, 8), FIELD(void *, resources, 0x0c),
            DisplayController_GetVerticalOffset());
    }
    self->resource = resource;
    GraphicsSpriteState_SetAnimationIndex(
        (GraphicsSpriteState *)resource->handles[0], (u8)animation);
    GraphicsSpriteState_SetAnimationIndex(
        (GraphicsSpriteState *)resource->handles[1], (u8)animation);
    func_ov090_0221b97c(resource, 2);
    return self;
}

/*
 * Turn both sprites toward the target point, limiting the signed angular
 * change from sprite halfword +0x30 to 0x300 per call.
 */
void func_ov090_0221baec(void *self, const void *target)
{
    s32 selfY = FIELD(s32, self, 0x10);
    s32 targetY = FIELD(volatile s32, target, 8);
    s32 selfX = FIELD(s32, self, 0x0c);
    s32 targetX = FIELD(volatile s32, target, 4);
    s32 deltaY = selfY - targetY;
    s32 deltaX = selfX - targetX;
    s32 angle;
    s32 difference;
    s16 current;
    void *resource;

    if (deltaX == 0 && deltaY == 0)
        return;
    angle = func_020ae024(-deltaY, deltaX);
    resource = FIELD(void *, self, 4);
    current = FIELD(s16, FIELD(void *, resource, 4), 0x30);
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
 * Convert the participant and target fixed-point coordinates to the paired
 * sprite offsets, then submit two identical position records using the current
 * NDS display vertical offset.
 */
void func_ov090_0221bb84(void *self, const void *target)
{
    TitlePresentationPositionPair positions;
    s32 vertical;
    void *resource = FIELD(void *, self, 4);

    FIELD(s32, resource, 0x18) =
        (FIELD(s32, self, 0x0c) >> 12) - (FIELD(s32, target, 4) >> 12);
    FIELD(s32, resource, 0x1c) =
        ((FIELD(s32, self, 0x10) >> 12) - (FIELD(s32, self, 0x14) >> 12)) -
        (FIELD(s32, target, 8) >> 12);
    vertical = -0xc0 - DisplayController_GetVerticalOffset();
    positions.firstVtable = data_ov090_0221cc88;
    positions.firstX = 0;
    positions.firstY = vertical;
    positions.secondVtable = data_ov090_0221cc88;
    positions.secondX = 0;
    positions.secondY = vertical;
    UtilAnimationResource_UpdatePosition((UtilAnimationResource *)resource,
                                         (const TouchPoint *)&positions);
}

/* Scale both sprites from height delta, clamped to the retail 0x20..0x200 range. */
void func_ov090_0221bc0c(void *self, s32 targetHeight)
{
    s32 scale = (s16)((((FIELD(s32, self, 0x14) - targetHeight) >> 12) * 4) +
                      0x100);
    void *resource;
    void *sprite;

    if (scale < 0x20)
        scale = 0x20;
    else if (scale > 0x200)
        scale = 0x200;
    resource = FIELD(void *, self, 4);
    sprite = FIELD(void *, resource, 4);
    FIELD(u16, sprite, 0x32) = scale;
    FIELD(u16, sprite, 0x34) = scale;
    sprite = FIELD(void *, resource, 8);
    FIELD(u16, sprite, 0x32) = scale;
    FIELD(u16, sprite, 0x34) = scale;
}
