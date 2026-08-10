#include "tingle/game_phase_script_vm.h"

/* Query and set bits in the runtime's row-strided packed-byte grid. */

typedef struct PackedBitGrid {
    u8 *bytes_00;
    u32 field_04;
    s32 stride_08;
} PackedBitGrid;

#ifdef __cplusplus
extern "C" {
#endif
extern PackedBitGrid *func_020275b0(void);
#ifdef __cplusplus
}
#endif

/*
 * Pop a row and column, test the corresponding packed bit, push the masked
 * bit value (zero or a power of two), and return zero.  The byte and bit
 * positions use signed division and remainder, matching the recovered code.
 */
s32 GamePhaseActorScriptVm_GetPackedBitGridMask(GamePhaseActorScriptVm *self)
{
    s32 row = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 column = (s32)GamePhaseScriptVm_Pop(&self->base);
    PackedBitGrid *grid = func_020275b0();
    s32 index = row * grid->stride_08 + column;

    GamePhaseScriptVm_SetResult(&self->base,
                  grid->bytes_00[index / 8] & (1 << (index % 8)));
    return 0;
}

/* Pop a row and column, set the corresponding packed bit, and return zero. */
s32 GamePhaseActorScriptVm_SetPackedBitGridBit(GamePhaseActorScriptVm *self)
{
    s32 row = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 column = (s32)GamePhaseScriptVm_Pop(&self->base);
    PackedBitGrid *grid = func_020275b0();
    s32 index = row * grid->stride_08 + column;

    grid->bytes_00[index / 8] |= (u8)(1 << (index % 8));
    return 0;
}
