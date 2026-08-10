#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement actor-script field setters and runtime actor query opcodes. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern const s8 data_020d5af8[];
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern u32 func_02029a00(void *object, u32 first, u32 second, u32 third);
extern s32 func_020ae024(fx32 first, fx32 second);
#ifdef __cplusplus
}
#endif

/* Pop a value into the low halfword of actor offset 0x5c, preserving its high half. */
s32 GamePhaseActorScriptVm_SetField5cLowHalfword(GamePhaseActorScriptVm *self)
{
    s16 value = (s16)GamePhaseScriptVm_Pop(&self->base);
    u32 *field = (u32 *)((u8 *)self->actor + 0x5c);
    *field = (*field & 0xffff0000) | (u16)value;
    return 0;
}

/*
 * Pop three operands, pass them in reverse pop order to func_02029a00 on the
 * global runtime object at offset 0x2ed4, push its result, and return zero.
 */
s32 func_0201350c(GamePhaseActorScriptVm *self)
{
    u32 third = GamePhaseScriptVm_Pop(&self->base);
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    void *object = *(void **)((u8 *)data_021052fc + 0x2ed4);
    GamePhaseScriptVm_SetResult(&self->base, func_02029a00(object, first, second, third));
    return 0;
}

/* Pop a word into actor offset 0x3c and return zero. */
s32 GamePhaseActorScriptVm_SetField3c(GamePhaseActorScriptVm *self)
{
    *(u32 *)((u8 *)self->actor + 0x3c) = GamePhaseScriptVm_Pop(&self->base);
    return 0;
}

/* Pop a word into actor offset 0x40 and return zero. */
s32 GamePhaseActorScriptVm_SetField40(GamePhaseActorScriptVm *self)
{
    *(u32 *)((u8 *)self->actor + 0x40) = GamePhaseScriptVm_Pop(&self->base);
    return 0;
}

/*
 * Pop target y and x integer coordinates, form the horizontal fx32 delta from
 * the bound actor, derive an angle through func_020ae024, use bits 12-15 to
 * index the signed-byte direction table at data_020d5af8, push it, and return
 * zero. The table's semantic labels remain unconfirmed.
 */
s32 GamePhaseActorScriptVm_LookupDirectionTowardCoordinates(GamePhaseActorScriptVm *self)
{
    s32 targetY = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 targetX = (s32)GamePhaseScriptVm_Pop(&self->base);
    VecFx32Object *position = (VecFx32Object *)((u8 *)self->actor + 0x18);
    s32 angle = func_020ae024((targetX << 12) - position->value.x,
                             (targetY << 12) - position->value.y);
    GamePhaseScriptVm_SetResult(&self->base, data_020d5af8[((u32)angle << 4) >> 16]);
    return 0;
}

/* Resolve runtime collection 1's actor at offset 0x2e7c and push integer x. */
s32 GamePhaseActorScriptVm_GetCollection1ActorVectorX(GamePhaseActorScriptVm *self)
{
    u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
    VecFx32Object value;
    void *actor = *(void **)(collection + 0x2e7c);
    func_02005030(&value, (VecFx32Object *)((u8 *)actor + 0x18));
    GamePhaseScriptVm_SetResult(&self->base, value.value.x >> 12);
    func_02005058(&value);
    return 0;
}

/* Resolve runtime collection 1's actor at offset 0x2e7c and push integer y. */
s32 GamePhaseActorScriptVm_GetCollection1ActorVectorY(GamePhaseActorScriptVm *self)
{
    u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
    VecFx32Object value;
    void *actor = *(void **)(collection + 0x2e7c);
    func_02005030(&value, (VecFx32Object *)((u8 *)actor + 0x18));
    GamePhaseScriptVm_SetResult(&self->base, value.value.y >> 12);
    func_02005058(&value);
    return 0;
}

/* Resolve runtime collection 1's actor at offset 0x2e7c and push integer z. */
s32 GamePhaseActorScriptVm_GetCollection1ActorVectorZ(GamePhaseActorScriptVm *self)
{
    u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
    VecFx32Object value;
    void *actor = *(void **)(collection + 0x2e7c);
    func_02005030(&value, (VecFx32Object *)((u8 *)actor + 0x18));
    GamePhaseScriptVm_SetResult(&self->base, value.value.z >> 12);
    func_02005058(&value);
    return 0;
}
