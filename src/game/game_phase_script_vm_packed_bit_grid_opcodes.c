#include "tingle/game_phase_script_vm.h"

/* Query and set bits in the runtime's row-strided packed-byte grid. */

typedef struct PackedBitGrid {
    u8 *packedBits;
    u32 reserved04;
    s32 rowStrideBits;
} PackedBitGrid;

#ifdef __cplusplus
extern "C" {
#endif
extern PackedBitGrid *PackedBitGrid_GetOrCreateGlobal(void);
#ifdef __cplusplus
}
#endif

/*
 * Pop a row and column, test the corresponding packed bit, store the masked
 * bit value (zero or a power of two) as the VM result, and return zero.  The byte and bit
 * positions use signed division and remainder, matching the recovered code.
 */
s32 GamePhaseActorScriptVm_GetPackedBitGridMask(GamePhaseActorScriptVm *self)
{
    s32 row = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 column = (s32)GamePhaseScriptVm_Pop(&self->base);
    PackedBitGrid *grid = PackedBitGrid_GetOrCreateGlobal();
    s32 bitIndex = row * grid->rowStrideBits + column;

    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base,
                  grid->packedBits[bitIndex / 8] & (1 << (bitIndex % 8)));
    return 0;
}

/* Pop a row and column, set the corresponding packed bit, and return zero. */
s32 GamePhaseActorScriptVm_SetPackedBitGridBit(GamePhaseActorScriptVm *self)
{
    s32 row = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 column = (s32)GamePhaseScriptVm_Pop(&self->base);
    PackedBitGrid *grid = PackedBitGrid_GetOrCreateGlobal();
    s32 bitIndex = row * grid->rowStrideBits + column;

    grid->packedBits[bitIndex / 8] |= (u8)(1 << (bitIndex % 8));
    return 0;
}
