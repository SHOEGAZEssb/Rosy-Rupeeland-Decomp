#include "tingle/game_phase_region_table.h"
#include "tingle/game_work.h"

/* Bind region indices to consecutive reveal flags and publish a table globally. */

#ifdef __cplusplus
extern "C" {
#endif
extern GamePhaseRegionTable *gActiveGamePhaseRegionTable;
#ifdef __cplusplus
}
#endif

/*
 * Return one when no GameWork reveal-flag range is bound (negative base);
 * otherwise return whether revealFlagBase + index is set. No state changes.
 */
s32 GamePhaseRegionTable_IsRegionRevealed(const GamePhaseRegionTable *self,
                                         s32 index)
{
    if (self->revealFlagBase < 0)
        return 1;
    return GameWork_TestFlag(gGameWork, self->revealFlagBase + index);
}

/*
 * Set or clear reveal flag revealFlagBase + index from revealed. A base of
 * exactly -1 disables the operation; other negative values are preserved as
 * recovered because their caller constraints are not yet confirmed.
 */
void GamePhaseRegionTable_SetRegionRevealed(GamePhaseRegionTable *self,
                                            s32 index, s32 revealed)
{
    if (self->revealFlagBase == -1)
        return;
    if (revealed)
        GameWork_SetFlag(gGameWork, self->revealFlagBase + index);
    else
        GameWork_ClearFlag(gGameWork, self->revealFlagBase + index);
}

/* Return the number of owned regions without changing state. */
s32 GamePhaseRegionTable_GetRegionCount(const GamePhaseRegionTable *self)
{
    return self->count;
}

/* Replace the consecutive GameWork reveal-flag base; no value is returned. */
void GamePhaseRegionTable_SetRevealFlagBase(GamePhaseRegionTable *self,
                                            s32 revealFlagBase)
{
    self->revealFlagBase = revealFlagBase;
}

/* Publish self for consumers of the active phase table. */
void GamePhaseRegionTable_PublishActive(GamePhaseRegionTable *self)
{
    gActiveGamePhaseRegionTable = self;
}
