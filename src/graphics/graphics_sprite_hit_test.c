
/*
 * Portable reconstruction of the assembly-selected sprite hit tests at
 * 0x02073AA8, 0x0209286C, and 0x02092910.  The first follows the current
 * animation cell chain and rejects transparent pixels; the latter two apply
 * the shared scene visibility/owner guards before testing a rectangular
 * extent or forwarding the touch coordinates.  All coordinates are integer
 * screen pixels and all referenced resource storage remains owned by the
 * recovered graphics caches.
 */
#include "tingle/graphics_sprite_state.h"
#include "tingle/types.h"

typedef struct SpriteOwnerState {
    u8 padding_00[0x18];
    s32 screenX;
    s32 screenY;
    s32 enabled;
} SpriteOwnerState;

typedef struct SpriteGraphicsResource {
    u8 padding_00[0x14];
    void *prepared;
    u8 padding_18[0x0c];
    const u8 *pixels;
} SpriteGraphicsResource;

typedef struct SpriteFrameSequence {
    u16 firstFrame;
    u16 frameCount;
    u16 duration;
    u16 field_06;
} SpriteFrameSequence;

typedef struct SpriteFrameTiming {
    u16 resourceIndex;
    u16 duration;
} SpriteFrameTiming;

typedef struct SpriteCellFrame {
    u16 firstCell;
    u16 cellCount;
} SpriteCellFrame;

typedef struct SpriteFrameResource {
    u8 padding_00[0x14];
    void *prepared;
    u8 padding_18[0x0c];
    SpriteFrameSequence *sequences;
    SpriteFrameTiming *frames;
    SpriteCellFrame *cellFrames;
    u16 *cells;
} SpriteFrameResource;

typedef struct SpriteTouchPoint {
    u32 flags;
    s32 x;
    s32 y;
} SpriteTouchPoint;

extern const s16 data_020c9670[];
extern void func_02070418(void *resource);
extern void func_02070d74(void *resource);

/* Convert a signed 20.12 intermediate to integer with truncation toward zero. */
static s32 Fixed12ToInteger(s32 value)
{
    if (value < 0)
        value += 0xfff;
    return value >> 12;
}

/* Read a possibly flipped local pixel from one 8-byte retail cell record. */
static s32 CellContainsOpaquePixel(const SpriteGraphicsResource *graphics,
                                   const u16 *cell, s32 localX, s32 localY)
{
    u16 attribute0 = cell[0];
    u16 attribute1 = cell[1];
    u16 attribute2 = cell[2];
    u16 metadata = cell[3];
    s32 width = (metadata & 0x0f) << 3;
    s32 height = ((metadata >> 4) & 0x0f) << 3;
    const u8 *pixels;
    u32 tile;
    u32 tileOffset;

    if (localX < 0 || localX >= width || localY < 0 || localY >= height)
        return 0;
    if ((attribute1 & 0x1000) != 0)
        localX = width - localX;
    if ((attribute1 & 0x2000) != 0)
        localY = height - localY;

    pixels = graphics->pixels + (u32)(attribute2 & 0x03ff) * 128U;
    tile = (u32)(localY >> 3) * (u32)(metadata & 0x0f) +
           (u32)(localX >> 3);
    if ((attribute0 & 0x2000) != 0) {
        tileOffset = tile * 64U + (u32)(localY & 7) * 8U +
                     (u32)(localX & 7);
        return pixels[tileOffset] != 0;
    }
    tileOffset = tile * 32U + (u32)(localY & 7) * 4U;
    return ((const u32 *)(const void *)(pixels + tileOffset))[(localX & 7) >> 3] &
           (0x0fU << ((u32)(localX & 7) << 2));
}

/*
 * Test a screen-space point against the currently selected cell frame.  This
 * retains retail inverse rotation/scale order, strict right/bottom bounds,
 * sprite-level flips, per-cell flips, and transparent-pixel rejection.
 */
s32 func_02073aa8(GraphicsSpriteState *state, s32 pointX, s32 pointY)
{
    SpriteOwnerState *owner = (SpriteOwnerState *)state->field_00;
    SpriteGraphicsResource *graphics =
        (SpriteGraphicsResource *)state->field_14;
    SpriteFrameResource *animation =
        (SpriteFrameResource *)state->animationResource;
    SpriteFrameSequence *sequence;
    SpriteFrameTiming *timing;
    SpriteCellFrame *frame;
    const u16 *cell;
    s32 centerX = state->screenX + owner->screenX;
    s32 centerY = state->screenY + owner->screenY;
    s32 index;

    if (state->field_30 != 0) {
        u16 angle = (u16)(-state->field_30);
        s32 sine = data_020c9670[((u32)angle >> 4) * 2U + 1U];
        s32 cosine = data_020c9670[((u32)angle >> 4) * 2U];
        s32 deltaX = pointX - centerX;
        s32 deltaY = pointY - centerY;
        s32 rotatedX = deltaX * sine + deltaY * cosine;
        s32 rotatedY = -deltaX * cosine + deltaY * sine;
        pointX = centerX + Fixed12ToInteger(rotatedX);
        pointY = centerY + Fixed12ToInteger(rotatedY);
    }
    if (state->scaleX != 0x100)
        pointX = centerX + ((pointX - centerX) << 8) / state->scaleX;
    if (state->scaleY != 0x100)
        pointY = centerY + ((pointY - centerY) << 8) / state->scaleY;

    if (graphics->prepared == 0)
        func_02070418(graphics);
    if (animation->prepared == 0)
        func_02070d74(animation);
    sequence = &animation->sequences[state->animationIndex];
    timing = &animation->frames[sequence->firstFrame + state->frameIndex];
    frame = &animation->cellFrames[timing->resourceIndex];
    cell = animation->cells + (u32)frame->firstCell * 4U;

    for (index = 0; index < frame->cellCount; ++index, cell += 4) {
        s32 x = (s32)(cell[1] & 0x01ff);
        s32 y = (s32)(cell[0] & 0x00ff);
        s32 width = (cell[3] & 0x0f) << 3;
        s32 height = ((cell[3] >> 4) & 0x0f) << 3;
        u16 adjusted[4];

        adjusted[0] = cell[0];
        adjusted[1] = cell[1];
        adjusted[2] = cell[2];
        adjusted[3] = cell[3];

        if ((x & 0x100) != 0)
            x -= 0x200;
        if ((y & 0x80) != 0)
            y -= 0x100;
        if ((state->flags & 0x40) != 0) {
            x = -(x + width);
            adjusted[1] ^= 0x1000;
        }
        if ((state->flags & 0x80) != 0) {
            y = -(y + height);
            adjusted[1] ^= 0x2000;
        }
        x += centerX;
        y += centerY;
        if (CellContainsOpaquePixel(graphics, adjusted,
                                    pointX - x, pointY - y))
            return 1;
    }
    return 0;
}

/*
 * Test whether a touch point lies within inclusive horizontal and vertical
 * radii of the sprite's owner-relative center.  Hidden sprites, detached
 * states, and disabled owners cannot be hit.  The point flags are not read.
 */
s32 func_0209286c(GraphicsSpriteState *state, const SpriteTouchPoint *point,
                  s32 horizontalRadius, s32 verticalRadius)
{
    SpriteOwnerState *owner;
    s32 centerX;
    s32 centerY;

    if (state == 0 || (state->flags & 0x0c) != 0)
        return 0;
    owner = (SpriteOwnerState *)state->field_00;
    if (owner->enabled == 0)
        return 0;

    centerX = state->screenX + owner->screenX;
    centerY = state->screenY + owner->screenY;
    if (centerX - horizontalRadius > point->x ||
        centerX + horizontalRadius < point->x ||
        centerY - verticalRadius > point->y ||
        centerY + verticalRadius < point->y)
        return 0;
    return 1;
}

/* Apply the shared hidden/inactive guards used by scene touch callers. */
s32 func_02092910(GraphicsSpriteState *state, const SpriteTouchPoint *point)
{
    SpriteOwnerState *owner;

    if (state == 0 || (state->flags & 0x0c) != 0)
        return 0;
    owner = (SpriteOwnerState *)state->field_00;
    if (owner->enabled == 0)
        return 0;
    return func_02073aa8(state, point->x, point->y);
}
