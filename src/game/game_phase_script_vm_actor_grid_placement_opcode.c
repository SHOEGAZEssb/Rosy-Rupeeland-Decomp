#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement the actor-script opcode that places an actor from grid coordinates and derives byte bounds. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_AdjustPositionForTerrainHeight(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Pop height, width, grid Y, and grid X. Scale dimensions by 16, place the
 * actor at the fixed-point center formed by grid*16 plus half-dimension, copy
 * the position into actor vector objects at 0x28 and 0x18, and notify the actor
 * through Actor_AdjustPositionForTerrainHeight. Finally derive signed byte extents at actor+8..+0xb
 * from the scaled dimensions. Returns zero.
 */
s32 func_02016d60(GamePhaseActorScriptVm *self)
{
    s32 height = (s32)GamePhaseScriptVm_Pop(&self->base) << 4;
    s32 width = (s32)GamePhaseScriptVm_Pop(&self->base) << 4;
    s32 gridY = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 gridX = (s32)GamePhaseScriptVm_Pop(&self->base);
    VecFx32Object position;
    u8 *actor = (u8 *)self->actor;
    s32 left = -width / 2;
    s32 top = -height / 2;

    func_0200500c(&position, (gridX * 16 + width / 2) << 12,
                  (gridY * 16 + height / 2) << 12, 0);
    func_020050a4((VecFx32Object *)(actor + 0x28), &position);
    func_020050a4((VecFx32Object *)(actor + 0x18),
                  (VecFx32Object *)(actor + 0x28));
    func_02005058(&position);
    Actor_AdjustPositionForTerrainHeight(actor);

    actor[8] = (u8)left;
    actor[9] = (u8)top;
    actor[10] = (u8)(left + (s8)width);
    actor[11] = (u8)(top + (s8)height);
    return 0;
}
