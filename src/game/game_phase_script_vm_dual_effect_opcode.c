#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement a script opcode that spawns one of two recovered effect variants. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Position_AdjustForTerrainHeight(VecFx32Object *position);
extern void func_0204eb18(s32 kind, s16 first, const VecFx32Object *position,
                          s32 resource0, s32 resource1, s32 resource2,
                          s32 firstSize, s32 secondSize);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/*
 * Pop a fixed-point call operand, Y/X position components, and a variant.
 * Transform the 20.12 position through Position_AdjustForTerrainHeight. Variant 0 dispatches
 * kind 14 with resources 0x1693..0x1695; variant 1 dispatches kind 15 with
 * resources 0x169a..0x169c. Both use size operands 16; other variants halt.
 * Destroy the temporary vector and return zero.
 */
s32 GamePhaseActorScriptVm_SpawnDualVariantEffect(GamePhaseActorScriptVm *self)
{
    VecFx32Object position;
    s32 first;
    s32 variant;
    func_02004fe0(&position);
    first = (s32)GamePhaseScriptVm_Pop(&self->base) << 12;
    position.value.y = (s32)GamePhaseScriptVm_Pop(&self->base) << 12;
    position.value.x = (s32)GamePhaseScriptVm_Pop(&self->base) << 12;
    variant = (s32)GamePhaseScriptVm_Pop(&self->base);
    Position_AdjustForTerrainHeight(&position);
    switch (variant) {
    case 0:
        func_0204eb18(14, (s16)first, &position,
                      0x1693, 0x1694, 0x1695, 16, 16);
        break;
    case 1:
        func_0204eb18(15, (s16)first, &position,
                      0x169a, 0x169b, 0x169c, 16, 16);
        break;
    default:
        OS_Halt();
        break;
    }
    func_02005058(&position);
    return 0;
}
