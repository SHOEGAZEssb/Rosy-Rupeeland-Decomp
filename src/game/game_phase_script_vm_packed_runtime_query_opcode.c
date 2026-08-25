#include "tingle/game_phase_script_vm.h"

/* Implement the script opcode that queries a packed value from the runtime object at offset 0x2ed4. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
#ifdef __cplusplus
}
#endif

typedef u32 (*RuntimePackedQueryMethod)(void *renderer, u32 gridX, u32 gridY);

/*
 * Pop second, first, and field selector values; invoke virtual method 0x2c on
 * runtime object 0x2ed4 with first and second; then store either the signed
 * low five bits (selector 0), bits 5..9 (selector 1), or bits 10..13
 * (selector 2) as the VM result. Other selectors store no VM result. Returns zero.
 */
s32 GamePhaseActorScriptVm_QueryPackedTileField(GamePhaseActorScriptVm *self)
{
    u32 gridY = GamePhaseScriptVm_Pop(&self->base);
    u32 gridX = GamePhaseScriptVm_Pop(&self->base);
    u32 fieldSelector = GamePhaseScriptVm_Pop(&self->base);
    void *renderer = *(void **)((u8 *)gGamePhaseRuntime + 0x2ed4);
    RuntimePackedQueryMethod *vtable = *(RuntimePackedQueryMethod **)renderer;
    u32 packedTile = vtable[0x2c / sizeof(void *)](renderer, gridX, gridY);

    if (fieldSelector == 0)
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)((s32)(packedTile << 27) >> 27));
    else if (fieldSelector == 1)
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (packedTile >> 5) & 0x1f);
    else if (fieldSelector == 2)
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (packedTile >> 10) & 0xf);
    return 0;
}
