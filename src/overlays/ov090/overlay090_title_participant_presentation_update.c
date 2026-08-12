#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Per-frame chain update for overlay-90 participant presentations. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TitlePresentationNode {
    const void *vtable;
    void *resource;
    VecFx32Object position;
} TitlePresentationNode;

typedef struct TitlePresentationChain {
    const void *vtable;
    TitlePresentationNode **items;
    s16 count;
    /* Retail reloads this phase step for each table lookup. */
    volatile u16 step;
    void *field_0c;
    fx32 parameter_10;
    s32 scale_height_14;
} TitlePresentationChain;

extern const s16 data_020c9670[];
extern void func_ov090_0221c138(VecFx32Object *difference,
                                const VecFx32Object *first,
                                const VecFx32Object *second);
extern s32 func_ov090_0221c350(void *self, VecFx32Object *difference);
extern void func_ov090_0221c170(void *resource, void *value);
extern void func_ov090_0221baec(TitlePresentationNode *node,
                                const VecFx32Object *target);
extern void func_ov090_0221bc0c(TitlePresentationNode *node,
                                s32 targetHeight);
extern void func_ov090_0221b3d0(VecFx32Object *vector, fx32 scale);

/*
 * Advance every presentation node as the retail articulated chain. Difference
 * vectors from the leading target or previous node are filtered by 0221c350;
 * accepted interior corrections are split equally between adjacent nodes.
 * Add the angle/table displacement, update each paired sprite resource, and,
 * when `updateFacing` is set, update facing and depth-derived scale. Anchor the
 * last embedded vector to `endPosition` and destroy the temporary vector.
 */
void func_ov090_0221be40(TitlePresentationChain *self,
                         const VecFx32Object *startPosition,
                         const VecFx32Object *endPosition, void *resourceValue,
                         u16 angle, s32 updateFacing)
{
    VecFx32Object working;
    fx32 directionX;
    fx32 directionY;
    fx32 chainValue;
    s32 i;

    VecFx32Object_Init(&working);
    directionX = data_020c9670[(angle >> 4) * 2];
    directionY = -data_020c9670[(angle >> 4) * 2 + 1];
    for (i = 0; i < self->count; i++) {
        chainValue = data_020c9670[(((u16)(self->step * i)) >> 4) * 2];

        if (i == 0) {
            VecFx32Object difference;
            func_ov090_0221c138(&difference, startPosition,
                                &self->items[i]->position);
            VecFx32Object_Assign(&working, &difference);
            VecFx32Object_Destroy(&difference);
            if (func_ov090_0221c350(self, &working) != 0) {
                VecFx32Object_Add(&self->items[i]->position, &working);
                if (updateFacing != 0)
                    func_ov090_0221baec(self->items[i], startPosition);
            }
        } else if (i < self->count) {
            VecFx32Object difference;
            fx32 previousValue;

            func_ov090_0221c138(&difference,
                                &self->items[i - 1]->position,
                                &self->items[i]->position);
            VecFx32Object_Assign(&working, &difference);
            VecFx32Object_Destroy(&difference);
            previousValue = data_020c9670[
                (((u16)((i - 1) * self->step)) >> 4) * 2];
            working.value.y -= ((previousValue - chainValue) * 3) / 2;
            if (func_ov090_0221c350(self, &working) != 0) {
                func_ov090_0221b3d0(&working, 0x800);
                VecFx32Object_Add(&self->items[i]->position, &working);
                VecFx32Object_Subtract(&self->items[i - 1]->position,
                                       &working);
                if (updateFacing != 0)
                    func_ov090_0221baec(
                        self->items[i], &self->items[i - 1]->position);
            }
        }

        /* Operand order preserves retail's signed 64-bit FX multiply shape. */
        self->items[i]->position.value.x +=
            (fx32)(((s64)directionX * chainValue + 0x800) >> 12);
        self->items[i]->position.value.y +=
            (fx32)(((s64)directionY * chainValue + 0x800) >> 12);
        func_ov090_0221c170(self->items[i]->resource, resourceValue);
        if (updateFacing != 0)
            func_ov090_0221bc0c(self->items[i], self->scale_height_14);
    }

    VecFx32Object_Assign(&self->items[self->count - 1]->position, endPosition);
    if (updateFacing != 0) {
        func_ov090_0221baec(self->items[self->count - 1],
                            &self->items[self->count - 2]->position);
        func_ov090_0221bc0c(self->items[self->count - 1],
                            self->scale_height_14);
    }
    VecFx32Object_Destroy(&working);
}
