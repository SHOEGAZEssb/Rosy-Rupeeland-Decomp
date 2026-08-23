#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement an actor-position rectangle query and its recovered signed rectangle helpers. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void *ActorCollection_FindActorByRuntimeId(void *collection, s32 index);
#ifdef __cplusplus
}
#endif

typedef struct RectS32 {
    s32 left;
    s32 top;
    s32 right;
    s32 bottom;
} RectS32;

/* Store four signed rectangle edges in order and return the result pointer. */
RectS32 *RectS32_Init(RectS32 *result, s32 left, s32 top, s32 right,
                      s32 bottom)
{
    result->left = left;
    result->top = top;
    result->right = right;
    result->bottom = bottom;
    return result;
}

/* Return whether x/y lies within the rectangle's half-open bounds. */
s32 RectS32_ContainsPoint(const RectS32 *rect, s32 x, s32 y)
{
    return x >= rect->left && x < rect->right &&
           y >= rect->top && y < rect->bottom;
}

/*
 * Pop bottom, right, top, left, and actor index; resolve that actor from
 * runtime collection 1, copy its fx32 position object at 0x18, convert X/Y to
 * integers, test them against the half-open signed rectangle, store the Boolean
 * as the VM result, destroy the temporary vector, and return zero.
 */
s32 GamePhaseActorScriptVm_IsCollection1ActorInRectangle(GamePhaseActorScriptVm *self)
{
    s32 bottom = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 right = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 top = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 left = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 index = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)ActorCollection_FindActorByRuntimeId(GamePhaseRuntime_GetActorCollection(data_021052fc, 1), index);
    VecFx32Object position;
    RectS32 rect;

    VecFx32Object_InitCopy(&position, (const VecFx32Object *)(actor + 0x18));
    RectS32_Init(&rect, left, top, right, bottom);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
                  RectS32_ContainsPoint(&rect, position.value.x >> 12,
                                position.value.y >> 12) != 0);
    VecFx32Object_Destroy(&position);
    return 0;
}
