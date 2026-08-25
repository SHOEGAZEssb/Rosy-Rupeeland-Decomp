#include "tingle/game_phase_script_vm.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/touch_region.h"

/* Implement actor-script opcodes that replace or expand the actor's rectangle at offset 0x68. */

/*
 * Pop bottom, right, top, and left coordinates, store them as signed halfwords
 * in the bound actor's rectangle, and return zero.
 */
s32 GamePhaseActorScriptVm_SetActorRectangle(GamePhaseActorScriptVm *self)
{
    RectS16 bounds;
    bounds.bottom = (s16)GamePhaseScriptVm_Pop(&self->base);
    bounds.right = (s16)GamePhaseScriptVm_Pop(&self->base);
    bounds.top = (s16)GamePhaseScriptVm_Pop(&self->base);
    bounds.left = (s16)GamePhaseScriptVm_Pop(&self->base);
    RectS16_Assign((RectS16 *)((u8 *)self->actor + 0x68), &bounds);
    return 0;
}

/* Pop an amount, move the actor rectangle's left edge left by it, and return zero. */
s32 GamePhaseActorScriptVm_ExpandActorRectangleLeft(GamePhaseActorScriptVm *self)
{
    s32 expansionAmount = (s32)GamePhaseScriptVm_Pop(&self->base);
    RectS16 bounds;
    RectS16_Copy(&bounds, (const RectS16 *)((u8 *)self->actor + 0x68));
    bounds.left -= expansionAmount;
    RectS16_Assign((RectS16 *)((u8 *)self->actor + 0x68), &bounds);
    return 0;
}

/* Pop an amount, move the actor rectangle's top edge upward by it, and return zero. */
s32 GamePhaseActorScriptVm_ExpandActorRectangleTop(GamePhaseActorScriptVm *self)
{
    s32 expansionAmount = (s32)GamePhaseScriptVm_Pop(&self->base);
    RectS16 bounds;
    RectS16_Copy(&bounds, (const RectS16 *)((u8 *)self->actor + 0x68));
    bounds.top -= expansionAmount;
    RectS16_Assign((RectS16 *)((u8 *)self->actor + 0x68), &bounds);
    return 0;
}

/* Pop an amount, move the actor rectangle's right edge right by it, and return zero. */
s32 GamePhaseActorScriptVm_ExpandActorRectangleRight(GamePhaseActorScriptVm *self)
{
    s32 expansionAmount = (s32)GamePhaseScriptVm_Pop(&self->base);
    RectS16 bounds;
    RectS16_Copy(&bounds, (const RectS16 *)((u8 *)self->actor + 0x68));
    bounds.right += expansionAmount;
    RectS16_Assign((RectS16 *)((u8 *)self->actor + 0x68), &bounds);
    return 0;
}

/* Pop an amount, move the actor rectangle's bottom edge down by it, and return zero. */
s32 GamePhaseActorScriptVm_ExpandActorRectangleBottom(GamePhaseActorScriptVm *self)
{
    s32 expansionAmount = (s32)GamePhaseScriptVm_Pop(&self->base);
    RectS16 bounds;
    RectS16_Copy(&bounds, (const RectS16 *)((u8 *)self->actor + 0x68));
    bounds.bottom += expansionAmount;
    RectS16_Assign((RectS16 *)((u8 *)self->actor + 0x68), &bounds);
    return 0;
}
