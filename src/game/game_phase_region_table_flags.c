#include "tingle/game_phase_region_table.h"
#include "tingle/game_work.h"

/* Bind region indices to consecutive GameWork flags and publish a table globally. */

#ifdef __cplusplus
extern "C" {
#endif
extern GamePhaseRegionTable *data_021055c8;
#ifdef __cplusplus
}
#endif

/*
 * Return one when no GameWork flag range is bound (negative base); otherwise
 * return whether flag gameWorkFlagBase + index is set. No state changes.
 */
s32 func_020119c8(const GamePhaseRegionTable *self, s32 index)
{
    if (self->gameWorkFlagBase < 0)
        return 1;
    return GameWork_TestFlag(gGameWork, self->gameWorkFlagBase + index);
}

/*
 * Set or clear GameWork flag gameWorkFlagBase + index from enabled. A base of
 * exactly -1 disables the operation; other negative values are preserved as
 * recovered because their caller constraints are not yet confirmed.
 */
void func_020119f4(GamePhaseRegionTable *self, s32 index, s32 enabled)
{
    if (self->gameWorkFlagBase == -1)
        return;
    if (enabled)
        GameWork_SetFlag(gGameWork, self->gameWorkFlagBase + index);
    else
        GameWork_ClearFlag(gGameWork, self->gameWorkFlagBase + index);
}

/* Return the number of owned regions without changing state. */
s32 func_02011a3c(const GamePhaseRegionTable *self)
{
    return self->count;
}

/* Replace the consecutive GameWork flag base; no value is returned. */
void func_02011a44(GamePhaseRegionTable *self, s32 flagBase)
{
    self->gameWorkFlagBase = flagBase;
}

/* Publish self through data_021055c8 for consumers of the active phase table. */
void func_02011a4c(GamePhaseRegionTable *self)
{
    data_021055c8 = self;
}
