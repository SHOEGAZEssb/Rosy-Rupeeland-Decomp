#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement script opcodes for angle-table queries and actor-vector reads. */

#ifdef __cplusplus
extern "C" {
#endif
extern const s16 gFx32CosSinTable[];
extern s32 func_020ae024(fx32 first, fx32 second);
#ifdef __cplusplus
}
#endif

/*
 * Pop an eight-bit angle, use its upper-resolution index to read the first
 * signed component of the interleaved table at gFx32CosSinTable, store that
 * component as the VM result, and return zero. The table's precise SDK identity is unconfirmed.
 */
s32 GamePhaseActorScriptVm_LookupAngleFirstComponent(GamePhaseActorScriptVm *self)
{
    u32 angle = GamePhaseScriptVm_Pop(&self->base);
    s32 index = (s16)((angle & 0xff) << 8) >> 4;
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, gFx32CosSinTable[index * 2]);
    return 0;
}

/*
 * Pop an eight-bit angle, read the second signed component of the same
 * interleaved lookup-table entry, store it as the VM result, and return zero.
 */
s32 GamePhaseActorScriptVm_LookupAngleSecondComponent(GamePhaseActorScriptVm *self)
{
    u32 angle = GamePhaseScriptVm_Pop(&self->base);
    s32 index = (s16)((angle & 0xff) << 8) >> 4;
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, gFx32CosSinTable[index * 2 + 1]);
    return 0;
}

/*
 * Pop two integer components, convert both to fx32, pass them to the
 * address-derived fixed-point angle helper, reduce its signed 16-bit result
 * by 256 with truncation toward zero, store the result as the VM result, and return zero.
 */
s32 GamePhaseActorScriptVm_ComputeAngle(GamePhaseActorScriptVm *self)
{
    fx32 second = (s32)GamePhaseScriptVm_Pop(&self->base) << 12;
    fx32 first = (s32)GamePhaseScriptVm_Pop(&self->base) << 12;
    s32 angle = (s16)func_020ae024(first, second);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (angle + ((u32)angle >> 24)) >> 8);
    return 0;
}

/* Copy the actor's vector object at offset 0x18, store integer x as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_GetVectorX(GamePhaseActorScriptVm *self)
{
    VecFx32Object value;
    VecFx32Object_InitCopy(&value, (VecFx32Object *)((u8 *)self->actor + 0x18));
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, value.value.x >> 12);
    VecFx32Object_Destroy(&value);
    return 0;
}

/* Copy the actor's vector object at offset 0x18, store integer y as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_GetVectorY(GamePhaseActorScriptVm *self)
{
    VecFx32Object value;
    VecFx32Object_InitCopy(&value, (VecFx32Object *)((u8 *)self->actor + 0x18));
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, value.value.y >> 12);
    VecFx32Object_Destroy(&value);
    return 0;
}

/* Copy the actor's vector object at offset 0x18, store integer z as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_GetVectorZ(GamePhaseActorScriptVm *self)
{
    VecFx32Object value;
    VecFx32Object_InitCopy(&value, (VecFx32Object *)((u8 *)self->actor + 0x18));
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, value.value.z >> 12);
    VecFx32Object_Destroy(&value);
    return 0;
}
