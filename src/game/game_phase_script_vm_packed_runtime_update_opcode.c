#include "tingle/game_phase_script_vm.h"

/* Implement the script opcode that replaces one field in a packed runtime value. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void DualLayerTileRenderer_SetPackedTileValue(void *renderer, u32 gridX, u32 gridY, u32 packedTile);
#ifdef __cplusplus
}
#endif

typedef u32 (*RuntimePackedQueryMethod)(void *renderer, u32 gridX, u32 gridY);

/*
 * Pop replacement, second key, first key, and field selector values; query
 * the packed word through runtime object 0x2ed4's virtual method 0x2c;
 * replace signed/unsigned field bits 0..4, 5..9, or 10..13 for selectors
 * 0, 1, or 2; then submit the resulting word through DualLayerTileRenderer_SetPackedTileValue.
 * Unsupported selectors resubmit the unmodified word. Returns zero.
 */
s32 GamePhaseActorScriptVm_SetPackedTileField(GamePhaseActorScriptVm *self)
{
    u32 replacement = GamePhaseScriptVm_Pop(&self->base);
    u32 gridY = GamePhaseScriptVm_Pop(&self->base);
    u32 gridX = GamePhaseScriptVm_Pop(&self->base);
    u32 fieldSelector = GamePhaseScriptVm_Pop(&self->base);
    void *renderer = *(void **)((u8 *)gGamePhaseRuntime + 0x2ed4);
    RuntimePackedQueryMethod *vtable = *(RuntimePackedQueryMethod **)renderer;
    u32 packedTile = vtable[0x2c / sizeof(void *)](renderer, gridX, gridY);

    if (fieldSelector == 0)
        packedTile = (packedTile & ~0x1fu) | (replacement & 0x1f);
    else if (fieldSelector == 1)
        packedTile = (packedTile & ~0x3e0u) | ((replacement & 0x1f) << 5);
    else if (fieldSelector == 2)
        packedTile = (packedTile & ~0x3c00u) | ((replacement & 0xf) << 10);
    DualLayerTileRenderer_SetPackedTileValue(renderer, gridX, gridY, packedTile);
    return 0;
}
