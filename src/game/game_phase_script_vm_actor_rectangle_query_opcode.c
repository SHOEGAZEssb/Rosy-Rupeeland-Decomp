#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement an actor-position rectangle query and its recovered signed rectangle helpers. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
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
RectS32 *func_02016f14(RectS32 *result, s32 left, s32 top, s32 right,
                      s32 bottom)
{
    result->left = left;
    result->top = top;
    result->right = right;
    result->bottom = bottom;
    return result;
}

/* Return whether x/y lies within the rectangle's half-open bounds. */
s32 func_02016f28(const RectS32 *rect, s32 x, s32 y)
{
    return x >= rect->left && x < rect->right &&
           y >= rect->top && y < rect->bottom;
}

/*
 * Pop bottom, right, top, left, and actor index; resolve that actor from
 * runtime collection 1, copy its fx32 position object at 0x18, convert X/Y to
 * integers, test them against the half-open signed rectangle, push the boolean
 * result, destroy the temporary vector, and return zero.
 */
s32 func_02016e44(GamePhaseActorScriptVm *self)
{
    s32 bottom = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 right = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 top = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 left = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 index = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)ActorCollection_FindActorByDescriptorValue(GamePhaseRuntime_GetActorCollection(data_021052fc, 1), index);
    VecFx32Object position;
    RectS32 rect;

    func_02005030(&position, (const VecFx32Object *)(actor + 0x18));
    func_02016f14(&rect, left, top, right, bottom);
    GamePhaseScriptVm_SetResult(&self->base,
                  func_02016f28(&rect, position.value.x >> 12,
                                position.value.y >> 12) != 0);
    func_02005058(&position);
    return 0;
}
