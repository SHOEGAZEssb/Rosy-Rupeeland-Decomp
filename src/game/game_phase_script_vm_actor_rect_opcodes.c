#include "tingle/game_phase_script_vm.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/touch_region.h"

/* Implement actor-script opcodes that replace or expand the actor's rectangle at offset 0x68. */

/*
 * Pop bottom, right, top, and left coordinates, store them as signed halfwords
 * in the bound actor's rectangle, and return zero.
 */
s32 func_020159d4(GamePhaseActorScriptVm *self)
{
    RectS16 bounds;
    bounds.bottom = (s16)func_02012704(&self->base);
    bounds.right = (s16)func_02012704(&self->base);
    bounds.top = (s16)func_02012704(&self->base);
    bounds.left = (s16)func_02012704(&self->base);
    func_02008354((u8 *)self->actor_84 + 0x68, &bounds);
    return 0;
}

/* Pop an amount, move the actor rectangle's left edge left by it, and return zero. */
s32 func_02015a34(GamePhaseActorScriptVm *self)
{
    s32 amount = (s32)func_02012704(&self->base);
    RectS16 bounds;
    RectS16_Copy(&bounds, (const RectS16 *)((u8 *)self->actor_84 + 0x68));
    bounds.left -= amount;
    func_02008354((u8 *)self->actor_84 + 0x68, &bounds);
    return 0;
}

/* Pop an amount, move the actor rectangle's top edge upward by it, and return zero. */
s32 func_02015a80(GamePhaseActorScriptVm *self)
{
    s32 amount = (s32)func_02012704(&self->base);
    RectS16 bounds;
    RectS16_Copy(&bounds, (const RectS16 *)((u8 *)self->actor_84 + 0x68));
    bounds.top -= amount;
    func_02008354((u8 *)self->actor_84 + 0x68, &bounds);
    return 0;
}

/* Pop an amount, move the actor rectangle's right edge right by it, and return zero. */
s32 func_02015acc(GamePhaseActorScriptVm *self)
{
    s32 amount = (s32)func_02012704(&self->base);
    RectS16 bounds;
    RectS16_Copy(&bounds, (const RectS16 *)((u8 *)self->actor_84 + 0x68));
    bounds.right += amount;
    func_02008354((u8 *)self->actor_84 + 0x68, &bounds);
    return 0;
}

/* Pop an amount, move the actor rectangle's bottom edge down by it, and return zero. */
s32 func_02015b18(GamePhaseActorScriptVm *self)
{
    s32 amount = (s32)func_02012704(&self->base);
    RectS16 bounds;
    RectS16_Copy(&bounds, (const RectS16 *)((u8 *)self->actor_84 + 0x68));
    bounds.bottom += amount;
    func_02008354((u8 *)self->actor_84 + 0x68, &bounds);
    return 0;
}
