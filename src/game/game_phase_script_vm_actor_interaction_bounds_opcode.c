#include "tingle/game_phase_script_vm.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/actor_motion.h"

/*
 * Edit the bound actor's secondary four-halfword rectangle at offset 0x60.
 * This rectangle mirrors the collision-bounds operations at offset 0x70 but
 * is copied directly rather than passed through an actor update routine.
 */

typedef struct ActorInteractionBounds {
    s16 left;
    s16 top;
    s16 right;
    s16 bottom;
} ActorInteractionBounds;

typedef struct InteractionBoundsCenter {
    const void *vtable;
    s16 x;
    s16 y;
} InteractionBoundsCenter;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 S16Bounds_GetHeight(const void *bounds);
extern void *S16BoundsCenter_Init(void *center, const void *bounds);
extern void S16Bounds_MoveTo(void *bounds, s16 left, s16 top);
extern s32 S16Bounds_GetWidth(const void *bounds);
extern void S16Bounds_Expand(void *bounds, s32 horizontal, s32 vertical);
#ifdef __cplusplus
}
#endif

/*
 * Pop four signed-16-bit values followed by a command.  Commands 1..9 replace
 * individual edges, resize around the old center, translate, or symmetrically
 * expand the actor rectangle at offset 0x60.  Commands 6/7 preserve the old
 * center while changing width or height.  Unsupported commands do nothing.
 * Return zero.
 */
s32 GamePhaseActorScriptVm_DispatchInteractionBoundsCommand(GamePhaseActorScriptVm *self)
{
    s16 fourth = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 third = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 second = (s16)GamePhaseScriptVm_Pop(&self->base);
    s16 first = (s16)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    ActorInteractionBounds *bounds =
        (ActorInteractionBounds *)((u8 *)self->actor + 0x60);

    switch (command) {
    case 1: {
        ActorInteractionBounds replacement;
        func_020083b0(&replacement, first, second, third, fourth);
        func_02008354(bounds, &replacement);
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
        InteractionBoundsCenter center;
        ActorInteractionBounds replacement;
        S16BoundsCenter_Init(&center, bounds);
        func_020083b0(&replacement, 0, 0, first, height);
        func_02008354(bounds, &replacement);
        S16Bounds_MoveTo(bounds, (s16)(center.x - first / 2),
                      (s16)(center.y - height / 2));
        break;
    }
    case 7: {
        s16 width = (s16)S16Bounds_GetWidth(bounds);
        InteractionBoundsCenter center;
        ActorInteractionBounds replacement;
        S16BoundsCenter_Init(&center, bounds);
        func_020083b0(&replacement, 0, 0, width, first);
        func_02008354(bounds, &replacement);
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
    }
    return 0;
}
