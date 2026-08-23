#include "tingle/game_phase_script_vm.h"

/* Implement a rectangle helper and actor-script geometry-related opcodes. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorMotionProbe_SetScale(void *actor, s32 valueFx);
extern void GraphicsSpriteState_SetFrameIndex(void *object, u8 value);
extern s32 func_020adc40(s32 value);
#ifdef __cplusplus
}
#endif

/* Store left, top, right, and bottom words in order and return the result pointer. */
u32 *RectS32_Set(u32 *result, s32 left, s32 top, s32 right, s32 bottom)
{
    result[0] = (u32)left;
    result[1] = (u32)top;
    result[2] = (u32)right;
    result[3] = (u32)bottom;
    return result;
}

/*
 * Pop a value, shift it left four, pass it to ActorMotionProbe_SetScale, and
 * return zero.
 */
s32 GamePhaseActorScriptVm_SetMotionProbeScale(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    ActorMotionProbe_SetScale(self->actor, value << 4);
    return 0;
}

/* Pop a byte and pass it to GraphicsSpriteState_SetFrameIndex on actor->0x54, then return zero. */
s32 GamePhaseActorScriptVm_SetAttachmentFrameIndex(GamePhaseActorScriptVm *self)
{
    u8 value = (u8)GamePhaseScriptVm_Pop(&self->base);
    void *object = *(void **)((u8 *)self->actor + 0x54);
    GraphicsSpriteState_SetFrameIndex(object, value);
    return 0;
}

/*
 * Pop integer z, y, and x, calculate their Euclidean distance from the bound
 * actor's fx32 position after converting that position to integers, pass the
 * squared sum through func_020adc40, divide the signed result by 64 with
 * truncation toward zero, store it as the VM result, and return zero.
 */
s32 GamePhaseActorScriptVm_CalculateDistanceToCoordinates(GamePhaseActorScriptVm *self)
{
    s32 z = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 y = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 x = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor;
    s32 dx = x - (*(s32 *)(actor + 0x1c) >> 12);
    s32 dy = y - (*(s32 *)(actor + 0x20) >> 12);
    s32 dz = z - (*(s32 *)(actor + 0x24) >> 12);
    s32 distance = func_020adc40(dx * dx + dy * dy + dz * dz);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, distance / 64);
    return 0;
}
