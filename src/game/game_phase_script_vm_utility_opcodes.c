#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"

/* Implement miscellaneous script opcodes for notifications, distance, scene creation, and value queries. */

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_020d5b2c[];
extern void *data_021e9ac0;
extern void ActorInteraction_SetDirectionAndMagnitude(u16 directionIndex,
                                                       u16 magnitude);
extern s32 func_020adc40(s32 value);
extern void *func_02028388(s32 phaseIndex);
extern void *GamePhaseApplyScene_Init(void *self, void *area, u32 field28, u32 field2c,
                           u32 extra);
extern s32 func_020be328(s32 value);
extern u32 func_02063670(void *table, u16 value);
#ifdef __cplusplus
}
#endif

/*
 * Pop a magnitude and direction-table index, discard one additional value,
 * publish the interaction input pair, and return zero.
 */
s32 GamePhaseActorScriptVm_SetInteractionDirectionAndMagnitude(GamePhaseActorScriptVm *self)
{
    u16 magnitude = (u16)GamePhaseScriptVm_Pop(&self->base);
    u16 directionIndex = (u16)GamePhaseScriptVm_Pop(&self->base);
    (void)GamePhaseScriptVm_Pop(&self->base);
    ActorInteraction_SetDirectionAndMagnitude(directionIndex, magnitude);
    return 0;
}

/*
 * Pop two integer XYZ triples, calculate their Euclidean distance through
 * func_020adc40, arithmetically divide the result by 64, push it, and return zero.
 */
s32 GamePhaseActorScriptVm_CalculateScaledDistance(GamePhaseActorScriptVm *self)
{
    s32 z1 = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 x1 = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 y1 = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 z2 = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 x2 = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 y2 = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 dx = x1 - x2;
    s32 dy = z1 - z2;
    s32 dz = y1 - y2;
    s32 distance = func_020adc40(dx * dx + dy * dy + dz * dz);
    GamePhaseScriptVm_SetResult(&self->base, (u32)(distance >> 6));
    return 0;
}

/*
 * Pop field2c, field28, and one-based phase ID; allocate a 0x30-byte apply
 * scene with the confirmed heap tag, initialize it when allocation succeeds,
 * pass a zero matching-only fifth argument ignored by the recovered constructor,
 * and return zero.
 */
s32 GamePhaseActorScriptVm_CreateApplyScene(GamePhaseActorScriptVm *self)
{
    u32 field2c = GamePhaseScriptVm_Pop(&self->base);
    u32 field28 = GamePhaseScriptVm_Pop(&self->base);
    s32 phaseId = (s32)GamePhaseScriptVm_Pop(&self->base);
    void *scene = Heap_Alloc(0x30, data_020d5b2c, 4, &gHeapContext);
    if (scene != 0)
        GamePhaseApplyScene_Init(scene, func_02028388(phaseId - 1), field28, field2c, 0);
    return 0;
}

/* Pop a signed value, push its func_020be328 classification, and return zero. */
s32 func_02015e40(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_SetResult(&self->base, (u32)func_020be328(value));
    return 0;
}

/* Pop a u16 key, query the table referenced by data_021e9ac0, push the result, and return zero. */
s32 func_02015e64(GamePhaseActorScriptVm *self)
{
    u16 value = (u16)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_SetResult(&self->base, func_02063670(data_021e9ac0, value));
    return 0;
}
