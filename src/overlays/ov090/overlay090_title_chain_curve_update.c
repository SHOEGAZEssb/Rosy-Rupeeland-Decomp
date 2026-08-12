#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Curve-following update for the articulated overlay-90 boss-stage chain. */

typedef struct TitlePresentationNode {
    const void *vtable;
    void *resource;
    VecFx32Object position;
} TitlePresentationNode;

typedef struct TitlePresentationChain {
    const void *vtable;
    TitlePresentationNode **items;
    s16 count;
    u16 step;
    void *field_0c;
    fx32 parameter_10;
    s32 scaleHeight;
} TitlePresentationChain;

extern const s16 data_020c9670[];
extern void func_ov090_0221a460(VecFx32Object *result,
                                const VecFx32Object *left,
                                const VecFx32Object *right);
extern void func_ov090_0221a498(VecFx32Object *result,
                                const VecFx32Object *source, fx32 scale);
extern void func_ov090_0221bc0c(TitlePresentationNode *node,
                                s32 targetHeight);
extern void func_ov090_0221c138(VecFx32Object *result,
                                const VecFx32Object *left,
                                const VecFx32Object *right);

/*
 * Move every node except the terminal anchor toward a sine-distributed point
 * between `start` and `end`, applying the retail 0x19A smoothing factor. The
 * last node is anchored exactly to `end`; optional scaling uses chain +0x14.
 */
void func_ov090_0221c184(TitlePresentationChain *self,
                         const VecFx32Object *start,
                         const VecFx32Object *end, s32 unused,
                         s32 updateScale)
{
    VecFx32Object unusedVector;
    VecFx32Object curvePoint;
    s32 i;

    (void)unused;
    VecFx32Object_Init(&unusedVector);
    VecFx32Object_Init(&curvePoint);
    for (i = 0; i < self->count - 1; i++) {
        VecFx32Object endpointDifference;
        VecFx32Object weightedDifference;
        VecFx32Object pointTemporary;
        VecFx32Object nodeDifference;
        VecFx32Object smoothedDifference;
        VecFx32Object nodeTemporary;
        fx32 weight =
            data_020c9670[(((u16)(self->step * i)) >> 4) * 2];

        func_ov090_0221c138(&endpointDifference, end, start);
        func_ov090_0221a498(&weightedDifference, &endpointDifference,
                            weight);
        func_ov090_0221a460(&pointTemporary, start, &weightedDifference);
        VecFx32Object_Assign(&curvePoint, &pointTemporary);
        VecFx32Object_Destroy(&pointTemporary);
        VecFx32Object_Destroy(&weightedDifference);
        VecFx32Object_Destroy(&endpointDifference);

        func_ov090_0221c138(&nodeDifference, &curvePoint,
                            &self->items[i]->position);
        func_ov090_0221a498(&smoothedDifference, &nodeDifference, 0x19a);
        func_ov090_0221a460(&nodeTemporary, &self->items[i]->position,
                            &smoothedDifference);
        VecFx32Object_Assign(&self->items[i]->position, &nodeTemporary);
        VecFx32Object_Destroy(&nodeTemporary);
        VecFx32Object_Destroy(&smoothedDifference);
        VecFx32Object_Destroy(&nodeDifference);
        if (updateScale != 0)
            func_ov090_0221bc0c(self->items[i], self->scaleHeight);
    }
    VecFx32Object_Assign(&self->items[self->count - 1]->position, end);
    if (updateScale != 0)
        func_ov090_0221bc0c(self->items[self->count - 1], self->scaleHeight);
    VecFx32Object_Destroy(&curvePoint);
    VecFx32Object_Destroy(&unusedVector);
}
