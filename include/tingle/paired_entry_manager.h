#ifndef TINGLE_PAIRED_ENTRY_MANAGER_H
#define TINGLE_PAIRED_ENTRY_MANAGER_H

#include "tingle/scene_touch.h"
#include "tingle/types.h"
#include "tingle/vec_fx32.h"

#define PAIRED_ENTRY_CAPACITY 15
#define PAIRED_ENTRY_MODE2_INTERVAL_COUNT 10

struct Graphics3dPresentation;

/*
 * Value-only manager for fifteen paired presentation entries. The owning
 * Graphics3dPresentation supplies the render context and owns this allocation;
 * the manager owns only its embedded vector and TouchPoint values. Parallel
 * entry arrays share the same slot index. A motion state of zero is inactive,
 * one selects centered width growth, and every other value is a signed Q20.12
 * horizontal velocity. Render pages toggle between zero and one; an entry is
 * skipped on its excluded page, while sentinel two therefore draws every
 * frame.
 */
typedef struct PairedEntryManager {
    struct Graphics3dPresentation *renderContext;
    s8 mode;
    s8 emissionCountdown;
    s8 mode2IntervalIndex;
    s8 renderParity;
    s32 spawnGateCounter;
    VecFx32Object origin;
    TouchPoint entryPoints[PAIRED_ENTRY_CAPACITY];
    s32 entryWavePhases[PAIRED_ENTRY_CAPACITY];
    fx32 entryHalfWidths[PAIRED_ENTRY_CAPACITY];
    fx32 entryHalfWidthAmplitudes[PAIRED_ENTRY_CAPACITY];
    s32 entryHorizontalVelocityOrGrowthState[PAIRED_ENTRY_CAPACITY];
    s32 entryExcludedRenderPages[PAIRED_ENTRY_CAPACITY];
} PairedEntryManager;

typedef char PairedEntryManagerSizeCheck[
    sizeof(PairedEntryManager) == 0x1fc ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern const u16 gPairedEntryGradientColors[4];
extern const u8
    gPairedEntryMode2EmissionIntervals[PAIRED_ENTRY_MODE2_INTERVAL_COUNT];
extern const char gPairedEntryManagerAllocationTag[];

PairedEntryManager *PairedEntryManager_Init(
    PairedEntryManager *self,
    struct Graphics3dPresentation *renderContext);
PairedEntryManager *PairedEntryManager_Destroy(PairedEntryManager *self);
s32 PairedEntryManager_SetModeAndOrigin(PairedEntryManager *self, s32 mode,
                                        s32 originX, s32 originY);
void PairedEntryManager_Clear(PairedEntryManager *self);
s32 PairedEntryManager_SpawnEntry(PairedEntryManager *self, s32 pattern,
                                  s32 excludedRenderPage);
void PairedEntryManager_Update(PairedEntryManager *self);
void PairedEntryManager_Render(PairedEntryManager *self);
void PairedEntryManager_SubmitColoredQuad(
    PairedEntryManager *self, const s32 coordinates[8],
    const u16 colors[4]);

#ifdef __cplusplus
}
#endif

#endif
