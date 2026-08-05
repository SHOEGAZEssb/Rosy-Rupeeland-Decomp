#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/*
 * Implement the script opcode that converts eight operands into two fixed-point
 * vectors and dispatches a tiered recovered effect through func_0204e2ac.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0204e2ac(s32 kind, s16 first, s16 tierSource,
                          const VecFx32Object *position,
                          const VecFx32Object *secondary,
                          s32 resource0, s32 resource1, s32 resource2,
                          s32 tier, s32 count, s32 trailing);
#ifdef __cplusplus
}
#endif

/*
 * Pop eight values. The first and eighth become signed 16-bit call operands;
 * the middle six form one 20.12 vector and one vector scaled by 16. Convert
 * the eighth operand to tier 0..6 at thresholds 5, 10, 20, 50, 100, and 200,
 * then call func_0204e2ac with kind 10, resources 0x300d..0x300f, count 7,
 * and trailing zero. Destroy both temporary vectors and return zero.
 */
s32 func_020171f0(GamePhaseActorScriptVm *self)
{
    VecFx32Object position;
    VecFx32Object secondary;
    s32 first;
    s32 tierSource;
    s32 tier;

    func_02004fe0(&position);
    func_02004fe0(&secondary);
    first = (s32)func_02012704(&self->base);
    secondary.value.z = (s32)func_02012704(&self->base) << 4;
    secondary.value.y = (s32)func_02012704(&self->base) << 4;
    secondary.value.x = (s32)func_02012704(&self->base) << 4;
    position.value.z = (s32)func_02012704(&self->base) << 12;
    position.value.y = (s32)func_02012704(&self->base) << 12;
    position.value.x = (s32)func_02012704(&self->base) << 12;
    tierSource = (s32)func_02012704(&self->base);

    if (tierSource >= 200)
        tier = 6;
    else if (tierSource >= 100)
        tier = 5;
    else if (tierSource >= 50)
        tier = 4;
    else if (tierSource >= 20)
        tier = 3;
    else if (tierSource >= 10)
        tier = 2;
    else if (tierSource >= 5)
        tier = 1;
    else
        tier = 0;

    func_0204e2ac(10, (s16)first, (s16)tierSource, &position, &secondary,
                  0x300d, 0x300e, 0x300f, tier, 7, 0);
    func_02005058(&secondary);
    func_02005058(&position);
    return 0;
}
