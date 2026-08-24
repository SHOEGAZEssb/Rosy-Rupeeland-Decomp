#include "tingle/game_phase_script_vm.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/actor_motion.h"
#include "tingle/point_2d_s16.h"
#include "tingle/touch_region.h"

/*
 * Edit the bound actor's secondary four-halfword rectangle at offset 0x60.
 * This rectangle mirrors the collision-bounds operations at offset 0x70 but
 * is copied directly rather than passed through an actor update routine.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 S16Bounds_GetHeight(const void *bounds);
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
    RectS16 *bounds = (RectS16 *)((u8 *)self->actor + 0x60);

    switch (command) {
    case 1: {
        RectS16 replacement;
        RectS16_InitComponents(&replacement, first, second, third, fourth);
        RectS16_Assign(bounds, &replacement);
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
        RectS16 replacement;
        CPoint2DS16_InitFromRectangle(&center, bounds);
        RectS16_InitComponents(&replacement, 0, 0, first, height);
        RectS16_Assign(bounds, &replacement);
        S16Bounds_MoveTo(bounds, (s16)(center.x - first / 2),
                      (s16)(center.y - height / 2));
        break;
    }
    case 7: {
        s16 width = (s16)S16Bounds_GetWidth(bounds);
        CPoint2DS16 center;
        RectS16 replacement;
        CPoint2DS16_InitFromRectangle(&center, bounds);
        RectS16_InitComponents(&replacement, 0, 0, width, first);
        RectS16_Assign(bounds, &replacement);
        S16Bounds_MoveTo(bounds, (s16)(center.x - width / 2),
                      (s16)(center.y - first / 2));
        break;
    }
    case 8:
        RectS16_Translate(bounds, first, second);
        break;
    case 9:
        S16Bounds_Expand(bounds, first, second);
        break;
    }
    return 0;
}
