#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/*
 * Recovered type-seven boundary transition. It releases an optional attached
 * object, tests three cells along a requested map edge, relocates actor vector
 * state, and enters the associated boundary-transition presentation state.
 */

extern void *gGameWork;
extern u8 *data_021052fc;
extern const u32 data_020e17e8[2];

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void Heap_Free(void *allocation);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
extern s32 func_02034568(void *actor, s32 x, s32 y, s32 height);
extern s32 func_02034718(void *actor, s32 x, s32 y, s32 height);
extern void ActorDerivedType1_SetSpecialModeEnabled(void *object, s32 value);
extern void func_020481dc(void *actor, u32 value0, u32 value1, s32 index);
extern void func_0206c978(void *object);
extern void func_0206e590(void *object, s32 value);
extern s32 func_020adae4(s32 value, s32 divisor);
extern s32 func_020be328(s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are a type-seven actor, a VecFx32Object destination, and a direction
 * index (zero through three correspond to the four map edges). First detach
 * and free optional object +0x234, clear game-work flag 0x3fd, and clear flag
 * +0xd0 bit 0x80. A boundary move is attempted only when +0x268 bit 0x10 is
 * set and bit 0x40000 is clear.
 *
 * The active edge is compared with map dimensions recovered through global
 * state +0x2ed4. Three cells centered across that edge are queried: the center
 * uses func_02034568 and must be nonzero, while its two neighbors use
 * func_02034718 and must return at most one. If all three pass, actor vector
 * fields +0x18, +0x28, and +0x284 are positioned at the edge with a 0x20-cell
 * inset; otherwise they are based on the supplied destination with a
 * 0x30-cell clearance derived from actor extents +0x68..+0x6e. The unexplained
 * fixed-point spacing 0xdfd7 is retained from the retail code.
 *
 * On a completed attempt, set +0x268 bits 0x4/0x80000, update +0x14, launch
 * the descriptor at data_020e17e8, clear a presentation flag through +0x54,
 * clear +0x246, and notify the global object at +0x2ea4. Finally clear +0x2a6
 * for every call. The function returns no value. It mutates actor, global
 * game-work, heap-owned attachment, collision/presentation, and vector state;
 * there are no direct hardware effects.
 */
void func_0204a988(void *self, const VecFx32Object *destination, s32 direction)
{
    u8 *actor = (u8 *)self;
    void *attachment = *(void **)(actor + 0x234);

    if (attachment != 0) {
        func_0206e590(attachment, 0);
        attachment = *(void **)(actor + 0x234);
        if (attachment != 0) {
            func_0206c978(attachment);
            Heap_Free(attachment);
        }
        *(void **)(actor + 0x234) = 0;
        GameWork_ClearFlag(gGameWork, 0x3fd);
        *(u32 *)(actor + 0xd0) &= ~0x80;
    }

    if ((*(u32 *)(actor + 0x268) & 0x10) != 0
        && (*(u32 *)(actor + 0x268) & 0x40000) == 0) {
        u8 *map = *(u8 **)(data_021052fc + 0x2ed4);
        u32 packedDimensions = *(u32 *)(map + 0x20);
        s32 rightEdge = (s32)((packedDimensions & 0xffff) << 4);
        s32 bottomEdge = (s32)(packedDimensions >> 16) << 4;
        s32 gridX = *(s32 *)(actor + 0x1c) >> 12;
        s32 gridY = *(s32 *)(actor + 0x20) >> 12;
        s32 halfWidth = func_020adae4(
            (s16)(*(s16 *)(actor + 0x6c) - *(s16 *)(actor + 0x68)), 2);
        s32 height = Actor_GetCachedTerrainHeight(actor) >> 16;
        s32 clearCount = 0;
        s32 edgeClear = 0;
        s32 offset;

        if (direction == 0) {
            if (gridX - halfWidth < 0x40) {
                for (offset = -1; offset <= 1; ++offset) {
                    s32 y = (*(s32 *)(actor + 0x20) + offset * 0x4000) >> 16;
                    s32 result = offset == 0
                        ? func_02034568(actor, 2, y, height)
                        : func_02034718(actor, 2, y, height);
                    if ((offset == 0 && result != 0)
                        || (offset != 0 && result <= 1))
                        ++clearCount;
                }
                edgeClear = clearCount == 3;
            }
        } else if (direction == 1) {
            if (gridX + halfWidth > rightEdge - 0x40) {
                s32 x = func_020adae4(rightEdge, 0x10) - 2;
                for (offset = -1; offset <= 1; ++offset) {
                    s32 y = (*(s32 *)(actor + 0x20) + offset * 0x4000) >> 16;
                    s32 result = offset == 0
                        ? func_02034568(actor, x, y, height)
                        : func_02034718(actor, x, y, height);
                    if ((offset == 0 && result != 0)
                        || (offset != 0 && result <= 1))
                        ++clearCount;
                }
                edgeClear = clearCount == 3;
            }
        } else if (direction == 2) {
            s32 extent = func_020be328(*(s16 *)(actor + 0x6a));
            if (gridY - extent < 0x40) {
                for (offset = -1; offset <= 1; ++offset) {
                    s32 x = (*(s32 *)(actor + 0x1c) + offset * 0xdfd7) >> 16;
                    s32 result = offset == 0
                        ? func_02034568(actor, x, 2, height)
                        : func_02034718(actor, x, 2, height);
                    if ((offset == 0 && result != 0)
                        || (offset != 0 && result <= 1))
                        ++clearCount;
                }
                edgeClear = clearCount == 3;
            }
        } else {
            s32 extent = func_020be328(*(s16 *)(actor + 0x6e));
            if (gridY + extent > bottomEdge - 0x40) {
                s32 y = func_020adae4(bottomEdge, 0x10) - 2;
                for (offset = -1; offset <= 1; ++offset) {
                    s32 x = (*(s32 *)(actor + 0x1c) + offset * 0xdfd7) >> 16;
                    s32 result = offset == 0
                        ? func_02034568(actor, x, y, height)
                        : func_02034718(actor, x, y, height);
                    if ((offset == 0 && result != 0)
                        || (offset != 0 && result <= 1))
                        ++clearCount;
                }
                edgeClear = clearCount == 3;
            }
        }

        if (edgeClear) {
            VecFx32Object edgePosition;
            VecFx32Object currentPosition;
            func_02004fe0(&edgePosition);
            func_02005030(&currentPosition,
                          (const VecFx32Object *)(actor + 0x18));
            func_020050a4(&edgePosition,
                          (const VecFx32Object *)(actor + 0x18));

            if (direction == 0) {
                edgePosition.value.x = destination->value.x;
                currentPosition.value.x = destination->value.x
                    + (gridX - 0x20) * 0x1000;
            } else if (direction == 1) {
                edgePosition.value.x = destination->value.x;
                currentPosition.value.x = destination->value.x
                    - ((rightEdge - 0x20) - gridX) * 0x1000;
            } else if (direction == 2) {
                edgePosition.value.y = destination->value.y;
                currentPosition.value.y = destination->value.y
                    + (gridY - 0x20) * 0x1000;
            } else {
                edgePosition.value.y = destination->value.y;
                currentPosition.value.y = destination->value.y
                    - ((bottomEdge - 0x20) - gridY) * 0x1000;
            }

            func_020050a4((VecFx32Object *)(actor + 0x28), &currentPosition);
            func_020050a4((VecFx32Object *)(actor + 0x18),
                          (VecFx32Object *)(actor + 0x28));
            func_020050a4((VecFx32Object *)(actor + 0x284), &edgePosition);
            if (direction == 2)
                *(s32 *)(actor + 0x28c) += 0x2000;
            if (direction == 3)
                *(s32 *)(actor + 0x28c) -= 0x2000;
            func_02005058(&currentPosition);
            func_02005058(&edgePosition);
        } else {
            VecFx32Object position;
            func_02005030(&position, destination);
            if (direction == 0) {
                position.value.x += (halfWidth + 0x30) * 0x1000;
            } else if (direction == 1) {
                position.value.x -= (halfWidth + 0x30) * 0x1000;
            } else if (direction == 2) {
                s32 extent = func_020be328(*(s16 *)(actor + 0x6a));
                position.value.y += (extent + 0x30) * 0x1000;
            } else {
                s32 extent = func_020be328(*(s16 *)(actor + 0x6e));
                position.value.y -= (extent + 0x30) * 0x1000;
            }
            func_020050a4((VecFx32Object *)(actor + 0x28), &position);
            func_020050a4((VecFx32Object *)(actor + 0x18),
                          (VecFx32Object *)(actor + 0x28));
            func_020050a4((VecFx32Object *)(actor + 0x284), destination);
            if (direction == 2)
                *(s32 *)(actor + 0x28c) += 0x1000;
            func_02005058(&position);
        }

        *(u32 *)(actor + 0x268) |= 0x80004;
        *(u32 *)(actor + 0x14) =
            (*(u32 *)(actor + 0x14) | 6) & ~0x02000000;
        func_020481dc(actor, data_020e17e8[0], data_020e17e8[1], -1);
        *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) &= (u16)~0x10;
        *(u16 *)(actor + 0x246) = 0;
        ActorDerivedType1_SetSpecialModeEnabled(*(void **)(data_021052fc + 0x2ea4), 1);
    }
    *(u16 *)(actor + 0x2a6) = 0;
}
