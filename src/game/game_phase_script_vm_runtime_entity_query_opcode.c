#include "tingle/game_phase_script_vm.h"

/*
 * Query the active runtime entity, recovered lookup records, or an indexed
 * actor and push the selected value back to the script VM.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern s32 data_020e1964;
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern void *Actor_GetCollection(void *actor);
extern s32 Type7Actor_GetStateCode(void *entity);
extern u8 *Type7Actor_FindSpawnRecord(s32 index);
extern s32 Type7Actor_SelectRandomEligibleRecordId(s32 mode, s32 index);
#ifdef __cplusplus
}
#endif

/*
 * Pop sub-index, record/actor index, and query mode.  Modes 0..15 select
 * active-entity presence or fields, the fallback global, fields in recovered
 * records, mode-specific table values, or indexed-actor offset 0x1fc.  A
 * missing entity and unsupported indexes yield zero where retail does.  Push
 * the result and return zero.
 */
s32 func_02018f10(GamePhaseActorScriptVm *self)
{
    s32 subIndex = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 index = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 mode = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *runtime = (u8 *)data_021052fc;
    u8 *entity;
    s32 result = 0;

    switch (mode) {
    case 0:
        result = *(void **)(runtime + 0x2ea8) != 0;
        break;
    case 1:
        result = data_020e1964;
        break;
    case 2:
        entity = *(u8 **)(runtime + 0x2ea8);
        if (entity)
            result = *(s32 *)(entity + 0x1fc);
        break;
    case 3:
        entity = *(u8 **)(runtime + 0x2ea8);
        if (entity)
            result = Type7Actor_GetStateCode(entity);
        break;
    case 4:
        entity = *(u8 **)(runtime + 0x2ea8);
        if (entity)
            result = *(u16 *)(*(u8 **)(entity + 0x29c) + 0x36);
        break;
    case 5:
        result = *(u16 *)(Type7Actor_FindSpawnRecord(index) + 0x56 + subIndex * 2);
        break;
    case 6:
    case 7:
    case 8: {
        static const u8 groupOffsets[5] = { 2, 8, 14, 20, 26 };
        u8 *record = Type7Actor_FindSpawnRecord(index);
        u16 *group = 0;
        if ((u32)subIndex <= 4)
            group = (u16 *)(record + groupOffsets[subIndex]);
        /* Retail assumes a valid sub-index before dereferencing this group. */
        result = group[mode - 6];
        break;
    }
    case 9:
        result = *(s32 *)(Type7Actor_FindSpawnRecord(index) + 0x60);
        break;
    case 10:
    case 11:
    case 12:
    case 13:
        result = Type7Actor_SelectRandomEligibleRecordId(mode, index);
        break;
    case 14:
        result = *(s32 *)(Type7Actor_FindSpawnRecord(index) + 0x64);
        break;
    case 15: {
        u8 *actor = (u8 *)ActorCollection_FindActorByDescriptorValue(Actor_GetCollection(self->actor_84), index);
        result = *(s32 *)(actor + 0x1fc);
        break;
    }
    }
    GamePhaseScriptVm_SetResult(&self->base, (u32)result);
    return 0;
}
