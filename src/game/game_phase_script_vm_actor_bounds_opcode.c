#include "tingle/game_phase_script_vm.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/actor_motion.h"

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

typedef struct BoundsCenter {
    const void *vtable;
    s16 x;
    s16 y;
} BoundsCenter;

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_020d5b10;
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern void *Actor_GetCollection(void *actor);
extern void Actor_BuildWorldInteractionBounds(void *destination, void *actor,
                                              void *actorField18);
extern void Actor_SetInteractionBounds(void *actor, const ActorBounds *bounds);
extern s32 func_02056f34(void *result, const void *first, const void *second,
                         void *scratch);
#ifdef __cplusplus
}
#endif

s32 func_020188e4(const ActorBounds *bounds);
BoundsCenter *func_020188fc(BoundsCenter *center, const ActorBounds *bounds);
void func_02018958(BoundsCenter *center);
void func_0201895c(ActorBounds *bounds, s16 left, s16 top);
s32 func_02018998(const ActorBounds *bounds);
void func_020189b0(ActorBounds *bounds, s32 horizontal, s32 vertical);

/*
 * Pop four signed-16-bit values followed by a command.  Commands replace or
 * edit the bound actor's rectangle at offset 0x70, translate/expand it, or
 * query overlap between two indexed actors and push the Boolean result.
 * Commands 6/7 preserve the old center while changing one dimension and call
 * the actor bounds-application routine.  Unsupported commands do nothing.
 * Return zero.
 */
s32 func_0201863c(GamePhaseActorScriptVm *self)
{
    s16 fourth = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 third = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 second = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 first = (s16)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor_84;
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
        s16 height = (s16)func_020188e4(bounds);
        BoundsCenter center;
        ActorBounds replacement;
        func_020188fc(&center, bounds);
        func_020083b0(&replacement, 0, 0, first, height);
        Actor_SetInteractionBounds(actor, &replacement);
        func_0201895c(bounds, (s16)(center.x - first / 2),
                      (s16)(center.y - height / 2));
        break;
    }
    case 7: {
        s16 width = (s16)func_02018998(bounds);
        BoundsCenter center;
        ActorBounds replacement;
        func_020188fc(&center, bounds);
        func_020083b0(&replacement, 0, 0, width, first);
        Actor_SetInteractionBounds(actor, &replacement);
        func_0201895c(bounds, (s16)(center.x - width / 2),
                      (s16)(center.y - first / 2));
        break;
    }
    case 8:
        S16Rectangle_Translate((s16 *)bounds, first, second);
        break;
    case 9:
        func_020189b0(bounds, first, second);
        break;
    case 10: {
        u32 firstState[4];
        u32 secondState[4];
        u32 result[4];
        u32 scratch[7];
        u8 *firstActor = (u8 *)ActorCollection_FindActorByDescriptorValue(Actor_GetCollection(actor), first);
        u8 *secondActor = (u8 *)ActorCollection_FindActorByDescriptorValue(Actor_GetCollection(actor), second);
        Actor_BuildWorldInteractionBounds(secondState, secondActor,
                                          secondActor + 0x18);
        Actor_BuildWorldInteractionBounds(firstState, firstActor,
                                          firstActor + 0x18);
        GamePhaseScriptVm_SetResult(&self->base,
                      func_02056f34(result, secondState, firstState, scratch)
                          != 0);
        break;
    }
    }
    return 0;
}

/* Return the bounds height (bottom minus top), truncated to signed 16 bits. */
s32 func_020188e4(const ActorBounds *bounds)
{
    return (s16)(bounds->bottom - bounds->top);
}

/*
 * Initialize center with the recovered vtable and the midpoint of each bounds
 * axis, using signed division rounded toward zero.  Return center.
 */
BoundsCenter *func_020188fc(BoundsCenter *center, const ActorBounds *bounds)
{
    center->vtable = data_020d5b10;
    center->x = (s16)(bounds->left + (s16)(bounds->right - bounds->left) / 2);
    center->y = (s16)(bounds->top + (s16)(bounds->bottom - bounds->top) / 2);
    return center;
}

/* No-op destructor for the temporary recovered bounds-center value. */
void func_02018958(BoundsCenter *center)
{
    (void)center;
}

/* Move bounds to left/top while preserving its current width and height. */
void func_0201895c(ActorBounds *bounds, s16 left, s16 top)
{
    s16 width = (s16)(bounds->right - bounds->left);
    s16 height = (s16)func_020188e4(bounds);
    bounds->left = left;
    bounds->right = (s16)(left + width);
    bounds->top = top;
    bounds->bottom = (s16)(top + height);
}

/* Return the bounds width (right minus left), truncated to signed 16 bits. */
s32 func_02018998(const ActorBounds *bounds)
{
    return (s16)(bounds->right - bounds->left);
}

/* Expand bounds symmetrically by horizontal and vertical script units. */
void func_020189b0(ActorBounds *bounds, s32 horizontal, s32 vertical)
{
    bounds->left = (s16)(bounds->left - horizontal);
    bounds->right = (s16)(bounds->right + horizontal);
    bounds->top = (s16)(bounds->top - vertical);
    bounds->bottom = (s16)(bounds->bottom + vertical);
}
