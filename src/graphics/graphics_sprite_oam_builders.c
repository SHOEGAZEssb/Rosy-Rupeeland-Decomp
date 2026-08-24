
/*
 * Portable reconstruction of the assembly-selected unscaled sprite builder
 * at retail address 0x02072EA4 and its two eight-instruction helpers.  This
 * code only builds recovered OAM records and appends recovered deferred VRAM
 * transfers; the SDK boundary performs the eventual hardware upload.
 */
#include "tingle/graphics_render_entry_pool.h"
#include "tingle/graphics_sprite_render_helpers.h"
#include "tingle/graphics_lookup_cache.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/graphics_sprite_state.h"
#include "tingle/graphics_transfer_queue.h"
#include "tingle/graphics_vram_allocator.h"
#include "tingle/types.h"

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
    void *field_14;
    u8 padding_18[0x0c];
    SpriteFrameSequence *sequences;
    SpriteFrameTiming *frames;
    SpriteCellFrame *cellFrames;
    u16 *cells;
} SpriteFrameResource;

typedef struct SpriteGraphicsResource {
    u8 padding_00[0x14];
    void *field_14;
    u8 padding_18[0x0c];
    u8 *pixels;
} SpriteGraphicsResource;

typedef struct SpritePaletteBinding {
    u8 padding_00[0x08];
    struct SpritePaletteBinding *next;
    u8 padding_0c[0x06];
    u8 paletteIndex;
} SpritePaletteBinding;

typedef struct GraphicsSpriteStatePoolPrefix {
    u32 count;
    u32 interruptState;
} GraphicsSpriteStatePoolPrefix;

extern GraphicsSpriteStatePoolPrefix gGraphicsSpriteStatePool;
extern void func_02070418(void *resource);
extern u32 func_0207043c(void *resource);
extern void func_02070d74(void *resource);
extern u32 GX_VBlankIntr(u32 state);
extern const s16 data_020c9670[];

/*
 * Build an unrotated, 1.0-scale OAM chain for the current recovered animation
 * frame.  Coordinates, flip flags, visibility clipping, OBJ mode, priority,
 * palette selection, character-block allocation, transfer coalescing, and
 * first-upload invalidation follow the instruction stream at 0x02072EA4.
 */
void func_02072ea4(GraphicsSpriteState *state, GraphicsRenderEntry *entry,
                   GraphicsTransferQueue *queue)
{
    SpriteFrameResource *animation =
        (SpriteFrameResource *)state->animationResource;
    SpriteFrameSequence *sequence;
    SpriteFrameTiming *timing;
    SpriteCellFrame *cellFrame;
    const u16 *cell;
    SpritePaletteBinding *palette;
    GraphicsVramRangeNode *binding =
        (GraphicsVramRangeNode *)state->graphicsVramBinding;
    SpriteGraphicsResource *graphics =
        (SpriteGraphicsResource *)state->graphicsResource;
    u32 paletteIndices[16] = {0};
    u32 expectedTile = 0xffffffffU;
    u32 tileDestination;
    u32 interruptState;
    s32 paletteCount = 0;
    s32 cellIndex;

    if (animation->field_14 == 0) {
        func_02070d74(animation);
    }
    sequence = &animation->sequences[state->animationIndex];
    timing = &animation->frames[sequence->firstFrame + state->frameIndex];
    cellFrame = &animation->cellFrames[timing->resourceIndex];
    cell = animation->cells + (u32)cellFrame->firstCell * 4U;

    for (palette = (SpritePaletteBinding *)state->indexedPaletteBinding;
         palette != 0;
         palette = palette->next) {
        paletteIndices[paletteCount++] = palette->paletteIndex;
    }

    tileDestination = binding->blockStart;
    interruptState = GX_VBlankIntr(0);
    gGraphicsSpriteStatePool.interruptState = interruptState;

    if ((state->resourceControlFlags & 1) != 0) {
        if (binding->field_0c == 0) {
            if (graphics->field_14 == 0) {
                func_02070418(graphics);
            }
            GraphicsTransferQueue_Enqueue(
                queue, 1, graphics->pixels, tileDestination << 7,
                func_0207043c(graphics));
        }
    } else if (binding->field_0c == 0 && graphics->field_14 == 0) {
        func_02070418(graphics);
    }

    entry->sortKey = (s32)((u32)state->sortOrder |
                           ((u32)state->oamPriority << 16));
    for (cellIndex = 0; cellIndex < cellFrame->cellCount; ++cellIndex) {
        u16 *attributes = (u16 *)&entry->field_10;
        u16 metadata;
        u32 sourceTile;
        u32 tileCount;
        s32 x;
        s32 y;
        s32 finalX;
        s32 finalY;

        GraphicsSpriteRecord8_Copy((GraphicsSpriteRecord8 *)attributes,
                                   (const GraphicsSpriteRecord8 *)cell);
        y = (s32)(cell[0] & 0xff);
        x = (s32)(cell[1] & 0x1ff);
        if ((y & 0x80) != 0) {
            y -= 0x100;
        }
        if ((x & 0x100) != 0) {
            x -= 0x200;
        }

        metadata = cell[3];
        if ((state->flags & 0x40) != 0) {
            x = -(x + (s32)((metadata & 0x0f) << 3));
            attributes[1] ^= 0x1000;
        }
        if ((state->flags & 0x80) != 0) {
            y = -(y + (s32)(((metadata >> 4) & 0x0f) << 3));
            attributes[1] ^= 0x2000;
        }

        finalX = x + state->screenX +
                 state->group->screenOffsetX;
        finalY = y + state->screenY +
                 state->group->screenOffsetY;
        attributes[1] = (u16)((attributes[1] & 0xfe00U) |
                              ((u32)finalX & 0x1ffU));
        attributes[0] = (u16)((attributes[0] & 0xff00U) |
                              ((u32)finalY & 0xffU));
        attributes[0] = (u16)((attributes[0] & ~0x0c00U) |
                              ((state->objectMode & 3U) << 10));
        attributes[2] = (u16)((attributes[2] & ~0x0c00U) |
                              (((u16)state->oamPriority & 3U) << 10));
        attributes[2] = (u16)((attributes[2] & ~0xf000U) |
                              ((paletteIndices[(cell[2] >> 12) & 0x0f] &
                                0x0fU) << 12));

        if ((state->flags & 0x200) == 0 &&
            (finalX < -64 || finalX > 256 || finalY < -64 || finalY > 192)) {
            attributes[0] = (u16)((attributes[0] & ~0x0300U) | 0x0200U);
        }

        sourceTile = cell[2] & 0x03ffU;
        tileCount = metadata >> 8;
        if ((state->resourceControlFlags & 1) != 0) {
            attributes[2] = (u16)((attributes[2] & 0xfc00U) |
                                  ((tileDestination + sourceTile) & 0x03ffU));
        } else {
            if (binding->field_0c == 0) {
                if (expectedTile == sourceTile) {
                    GraphicsRenderEntryPool_AddToTailPayload(
                        (GraphicsRenderEntryPool *)queue, tileCount << 7);
                    expectedTile += tileCount;
                } else {
                    GraphicsTransferQueue_Enqueue(
                        queue, 1, graphics->pixels + (sourceTile << 7),
                        tileDestination << 7, tileCount << 7);
                    expectedTile = sourceTile + tileCount;
                }
            }
            attributes[2] = (u16)((attributes[2] & 0xfc00U) |
                                  (tileDestination & 0x03ffU));
            tileDestination += tileCount;
        }

        entry = entry->chainNext;
        cell += 4;
    }

    binding->field_0c = 1;
    GX_VBlankIntr(gGraphicsSpriteStatePool.interruptState);
}

/* Divide a signed fixed-point numerator using the retail integer division
 * semantics. Valid sprite scales are nonzero; retaining a defined zero-scale
 * result prevents a host exception for malformed resource state. */
static s16 DivideAffineComponent(s32 numerator, s32 scale)
{
    return scale != 0 ? (s16)(numerator / scale) : 0;
}

/* Scale a cell origin around the center of its unscaled extent. The first
 * division is an arithmetic shift in the ARM instruction stream, while the
 * final division truncates toward zero. */
static s32 ScaleCellOrigin(s32 origin, s32 extent, s32 scale)
{
    s32 half_delta = (extent * (0x100 - scale)) >> 1;
    return (origin * scale - half_delta) / 0x100;
}

/*
 * Portable reconstruction of retail 0x02073340, the affine/scaled counterpart
 * to func_02072EA4. It builds the same OAM and character-transfer chains, then
 * interns up to four flip-specific affine matrices in the renderer's recovered
 * lookup cache. The cache owns no storage: its records point into shadow OAM.
 */
void func_02073340(GraphicsSpriteState *state, GraphicsRenderEntry *entry,
                   GraphicsTransferQueue *queue,
                   GraphicsAffineMatrixCache *affineMatrixCache)
{
    SpriteFrameResource *animation =
        (SpriteFrameResource *)state->animationResource;
    SpriteFrameSequence *sequence;
    SpriteFrameTiming *timing;
    SpriteCellFrame *cellFrame;
    const u16 *cell;
    SpritePaletteBinding *palette;
    GraphicsVramRangeNode *binding =
        (GraphicsVramRangeNode *)state->graphicsVramBinding;
    SpriteGraphicsResource *graphics =
        (SpriteGraphicsResource *)state->graphicsResource;
    GraphicsRenderEntry *firstEntry = entry;
    GraphicsAffineMatrixCacheEntry *matrixEntries[4] = {0};
    u32 paletteIndices[16] = {0};
    u8 matrixUsed[4] = {0};
    u32 expectedTile = 0xffffffffU;
    u32 tileDestination;
    u32 interruptState;
    s32 paletteCount = 0;
    s32 affineMode;
    s32 cellIndex;

    if (animation->field_14 == 0)
        func_02070d74(animation);
    sequence = &animation->sequences[state->animationIndex];
    timing = &animation->frames[sequence->firstFrame + state->frameIndex];
    cellFrame = &animation->cellFrames[timing->resourceIndex];
    cell = animation->cells + (u32)cellFrame->firstCell * 4U;

    affineMode = state->rotationAngle != 0 || state->scaleX > 0x100 ||
                 state->scaleX < -0x100 || state->scaleY > 0x100 ||
                 state->scaleY < -0x100 ? 3 : 1;

    for (palette = (SpritePaletteBinding *)state->indexedPaletteBinding;
         palette != 0; palette = palette->next)
        paletteIndices[paletteCount++] = palette->paletteIndex;

    tileDestination = binding->blockStart;
    interruptState = GX_VBlankIntr(0);
    gGraphicsSpriteStatePool.interruptState = interruptState;

    if ((state->resourceControlFlags & 1) != 0) {
        if (binding->field_0c == 0) {
            if (graphics->field_14 == 0)
                func_02070418(graphics);
            GraphicsTransferQueue_Enqueue(
                queue, 1, graphics->pixels, tileDestination << 7,
                func_0207043c(graphics));
        }
    } else if (binding->field_0c == 0 && graphics->field_14 == 0) {
        func_02070418(graphics);
    }

    entry->sortKey = (s32)((u32)state->sortOrder |
                           ((u32)state->oamPriority << 16));
    for (cellIndex = 0; cellIndex < cellFrame->cellCount; ++cellIndex) {
        u16 *attributes = (u16 *)&entry->field_10;
        u16 metadata = cell[3];
        u32 sourceTile;
        u32 tileCount;
        u32 matrixVariant;
        s32 width = (s32)(metadata & 0x0fU) << 3;
        s32 height = (s32)((metadata >> 4) & 0x0fU) << 3;
        s32 x = (s32)(cell[1] & 0x01ffU);
        s32 y = (s32)(cell[0] & 0x00ffU);
        s32 finalX;
        s32 finalY;

        GraphicsSpriteRecord8_Copy((GraphicsSpriteRecord8 *)attributes,
                                   (const GraphicsSpriteRecord8 *)cell);
        if ((x & 0x100) != 0) x -= 0x200;
        if ((y & 0x80) != 0) y -= 0x100;

        if (state->scaleX != 0x100)
            x = ScaleCellOrigin(x, width, state->scaleX);
        if ((state->flags & 0x40) != 0)
            x = -(x + width);
        if (state->scaleY != 0x100)
            y = ScaleCellOrigin(y, height, state->scaleY);
        if ((state->flags & 0x80) != 0)
            y = -(y + height);

        if (state->rotationAngle != 0) {
            u32 angle = ((u16)state->rotationAngle >> 4) << 1;
            s32 sine = data_020c9670[angle];
            s32 cosine = data_020c9670[angle + 1];
            s32 centerX = x + width / 2;
            s32 centerY = y + height / 2;
            s32 rotatedX = (centerY * sine + centerX * cosine) >> 12;
            s32 rotatedY = (centerY * cosine - centerX * sine) >> 12;
            x = rotatedX - width / 2;
            y = rotatedY - height / 2;
        }
        if (affineMode == 3) {
            x -= width / 2;
            y -= height / 2;
        }

        finalX = x + state->screenX +
                 state->group->screenOffsetX;
        finalY = y + state->screenY +
                 state->group->screenOffsetY;

        matrixVariant = ((cell[1] >> 12) & 1U) ^
                        (((state->flags & 0x40) != 0) ? 1U : 0U);
        matrixVariant |= ((((cell[1] >> 13) & 1U) ^
                           (((state->flags & 0x80) != 0) ? 1U : 0U)) << 1);
        matrixUsed[matrixVariant] = 1;
        attributes[1] = (u16)((attributes[1] & ~0x3e00U) |
                              (matrixVariant << 9));
        attributes[1] = (u16)((attributes[1] & 0xfe00U) |
                              ((u32)finalX & 0x01ffU));
        attributes[0] = (u16)((attributes[0] & 0xff00U) |
                              ((u32)finalY & 0x00ffU));

        if ((state->flags & 0x200) == 0 &&
            (finalX < -64 || finalX > 256 ||
             finalY < -64 || finalY > 192)) {
            attributes[0] = (u16)((attributes[0] & ~0x0300U) | 0x0200U);
        } else {
            attributes[0] = (u16)((attributes[0] & ~0x0300U) |
                                  ((u32)affineMode << 8));
        }
        attributes[0] = (u16)((attributes[0] & ~0x0c00U) |
                              ((state->objectMode & 3U) << 10));
        attributes[2] = (u16)((attributes[2] & ~0x0c00U) |
                              (((u16)state->oamPriority & 3U) << 10));
        attributes[2] = (u16)((attributes[2] & ~0xf000U) |
                              ((paletteIndices[(cell[2] >> 12) & 0x0fU] &
                                0x0fU) << 12));

        sourceTile = cell[2] & 0x03ffU;
        tileCount = metadata >> 8;
        if ((state->resourceControlFlags & 1) != 0) {
            attributes[2] = (u16)((attributes[2] & 0xfc00U) |
                                  ((tileDestination + sourceTile) & 0x03ffU));
        } else {
            if (binding->field_0c == 0) {
                if (expectedTile == sourceTile) {
                    GraphicsRenderEntryPool_AddToTailPayload(
                        (GraphicsRenderEntryPool *)queue, tileCount << 7);
                    expectedTile += tileCount;
                } else {
                    GraphicsTransferQueue_Enqueue(
                        queue, 1, graphics->pixels + (sourceTile << 7),
                        tileDestination << 7, tileCount << 7);
                    expectedTile = sourceTile + tileCount;
                }
            }
            attributes[2] = (u16)((attributes[2] & 0xfc00U) |
                                  (tileDestination & 0x03ffU));
            tileDestination += tileCount;
        }

        entry = entry->chainNext;
        cell += 4;
    }

    for (cellIndex = 0; cellIndex < 4; ++cellIndex) {
        s16 matrix[4];
        GraphicsAffineMatrixCacheEntry *cacheEntry;
        s32 scaleX;
        s32 scaleY;
        u32 angle;
        s32 sine;
        s32 cosine;

        if (matrixUsed[cellIndex] == 0)
            continue;
        scaleX = (cellIndex & 1) != 0 ? -state->scaleX : state->scaleX;
        scaleY = (cellIndex & 2) != 0 ? -state->scaleY : state->scaleY;
        angle = ((u16)state->rotationAngle >> 4) << 1;
        sine = (s32)data_020c9670[angle] << 4;
        cosine = (s32)data_020c9670[angle + 1] << 4;
        matrix[0] = DivideAffineComponent(cosine, scaleX);
        matrix[1] = DivideAffineComponent(-sine, scaleX);
        matrix[2] = DivideAffineComponent(sine, scaleY);
        matrix[3] = DivideAffineComponent(cosine, scaleY);

        cacheEntry = GraphicsAffineMatrixCache_FindMatrix(affineMatrixCache,
                                                          matrix);
        if (cacheEntry == 0) {
            cacheEntry = GraphicsAffineMatrixCache_Allocate(affineMatrixCache);
            if (cacheEntry != 0) {
                cacheEntry->affineParameters[0] = matrix[0];
                cacheEntry->affineParameters[4] = matrix[1];
                cacheEntry->affineParameters[8] = matrix[2];
                cacheEntry->affineParameters[12] = matrix[3];
            }
        }
        matrixEntries[cellIndex] = cacheEntry;
    }

    for (entry = firstEntry; entry != 0; entry = entry->chainNext) {
        u16 *attribute1 = (u16 *)&entry->field_10 + 1;
        u32 variant = (*attribute1 >> 9) & 0x1fU;
        GraphicsAffineMatrixCacheEntry *cacheEntry = matrixEntries[variant & 3U];
        if (cacheEntry != 0) {
            *attribute1 = (u16)((*attribute1 & ~0x3e00U) |
                                ((cacheEntry->oamAffineIndex & 0x1fU) << 9));
        }
    }

    binding->field_0c = 1;
    GX_VBlankIntr(gGraphicsSpriteStatePool.interruptState);
}

