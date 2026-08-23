#include "tingle/game_phase_script_vm.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/actor_motion.h"
#include "tingle/point_2d_s16.h"

/*
 * Implement the actor-script collision-bounds dispatcher and its local
 * rectangle helpers.  Bounds use four signed halfwords in left, top, right,
 * bottom order; semantic actor types beyond that layout remain unconfirmed.
 */

typedef struct ActorBounds {
    s16 left;
    s16 top;
    s16 right;
    s16 bottom;
} ActorBounds;

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorCollection_FindActorByRuntimeId(void *collection, s32 index);
extern void *Actor_GetOwningCollection(void *actor);
extern void Actor_BuildWorldInteractionBounds(void *destination, void *actor,
                                              void *actorField18);
extern void Actor_SetInteractionBounds(void *actor, const ActorBounds *bounds);
extern s32 func_02056f34(void *result, const void *first, const void *second,
                         void *scratch);
#ifdef __cplusplus
}
#endif

s32 S16Bounds_GetHeight(const ActorBounds *bounds);
CPoint2DS16 *CPoint2DS16_InitFromRectangle(CPoint2DS16 *center,
                                           const void *bounds);
void S16Bounds_MoveTo(ActorBounds *bounds, s16 left, s16 top);
s32 S16Bounds_GetWidth(const ActorBounds *bounds);
void S16Bounds_Expand(ActorBounds *bounds, s32 horizontal, s32 vertical);

/*
 * Pop four signed-16-bit values followed by a command.  Commands replace or
 * edit the bound actor's rectangle at offset 0x70, translate/expand it, or
 * query overlap between two indexed actors and store the Boolean as the VM result.
 * Commands 6/7 preserve the old center while changing one dimension and call
 * the actor bounds-application routine.  Unsupported commands do nothing.
 * Return zero.
 */
s32 GamePhaseActorScriptVm_DispatchActorBoundsCommand(GamePhaseActorScriptVm *self)
{
    s16 fourth = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 third = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 second = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 first = (s16)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor;
    ActorBounds *bounds = (ActorBounds *)(actor + 0x70);

    switch (command) {
    case 1: {
        ActorBounds replacement;
        func_020083b0(&replacement, first, second, third, fourth);
        Actor_SetInteractionBounds(actor, &replacement);
        break;
    }
    case 2:
        bounds->left = (s16)-first;
        break;
    case 3:
        bounds->top = (s16)-first;
        break;
    case 4:
        bounds->right = first;
        break;
    case 5:
        bounds->bottom = first;
        break;
    case 6: {
        s16 height = (s16)S16Bounds_GetHeight(bounds);
        CPoint2DS16 center;
        ActorBounds replacement;
        CPoint2DS16_InitFromRectangle(&center, bounds);
        func_020083b0(&replacement, 0, 0, first, height);
        Actor_SetInteractionBounds(actor, &replacement);
        S16Bounds_MoveTo(bounds, (s16)(center.x - first / 2),
                      (s16)(center.y - height / 2));
        break;
    }
    case 7: {
        s16 width = (s16)S16Bounds_GetWidth(bounds);
        CPoint2DS16 center;
        ActorBounds replacement;
        CPoint2DS16_InitFromRectangle(&center, bounds);
        func_020083b0(&replacement, 0, 0, width, first);
        Actor_SetInteractionBounds(actor, &replacement);
        S16Bounds_MoveTo(bounds, (s16)(center.x - width / 2),
                      (s16)(center.y - first / 2));
        break;
    }
    case 8:
        S16Rectangle_Translate((s16 *)bounds, first, second);
        break;
    case 9:
        S16Bounds_Expand(bounds, first, second);
        break;
    case 10: {
        u32 firstState[4];
        u32 secondState[4];
        u32 result[4];
        u32 scratch[7];
        u8 *firstActor = (u8 *)ActorCollection_FindActorByRuntimeId(Actor_GetOwningCollection(actor), first);
        u8 *secondActor = (u8 *)ActorCollection_FindActorByRuntimeId(Actor_GetOwningCollection(actor), second);
        Actor_BuildWorldInteractionBounds(secondState, secondActor,
                                          secondActor + 0x18);
        Actor_BuildWorldInteractionBounds(firstState, firstActor,
                                          firstActor + 0x18);
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
                      func_02056f34(result, secondState, firstState, scratch)
                          != 0);
        break;
    }
    }
    return 0;
}

/* Return the bounds height (bottom minus top), truncated to signed 16 bits. */
s32 S16Bounds_GetHeight(const ActorBounds *bounds)
{
    return (s16)(bounds->bottom - bounds->top);
}

/*
 * Initialize center with the recovered vtable and the midpoint of each bounds
 * axis, using signed division rounded toward zero.  Return center.
 */
CPoint2DS16 *CPoint2DS16_InitFromRectangle(CPoint2DS16 *center,
                                            const void *rectangle)
{
    const ActorBounds *bounds = (const ActorBounds *)rectangle;

    center->vtable = gCPoint2DS16VTable;
    center->x = (s16)(bounds->left + (s16)(bounds->right - bounds->left) / 2);
    center->y = (s16)(bounds->top + (s16)(bounds->bottom - bounds->top) / 2);
    return center;
}

/* No-op destructor for a temporary signed-16 bounds-center value. */
void CPoint2DS16_Destroy(CPoint2DS16 *center)
{
    (void)center;
}

/* Move bounds to left/top while preserving its current width and height. */
void S16Bounds_MoveTo(ActorBounds *bounds, s16 left, s16 top)
{
    s16 width = (s16)(bounds->right - bounds->left);
    s16 height = (s16)S16Bounds_GetHeight(bounds);
    bounds->left = left;
    bounds->right = (s16)(left + width);
    bounds->top = top;
    bounds->bottom = (s16)(top + height);
}

/* Return the bounds width (right minus left), truncated to signed 16 bits. */
s32 S16Bounds_GetWidth(const ActorBounds *bounds)
{
    return (s16)(bounds->right - bounds->left);
}

/* Expand bounds symmetrically by horizontal and vertical script units. */
void S16Bounds_Expand(ActorBounds *bounds, s32 horizontal, s32 vertical)
{
    bounds->left = (s16)(bounds->left - horizontal);
    bounds->right = (s16)(bounds->right + horizontal);
    bounds->top = (s16)(bounds->top - vertical);
    bounds->bottom = (s16)(bounds->bottom + vertical);
}
