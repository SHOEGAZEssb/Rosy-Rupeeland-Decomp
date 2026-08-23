#include "tingle/paired_entry_manager.h"

/* Frame scheduler and motion update for the fifteen-slot paired-entry manager. */

#ifdef __cplusplus
extern "C" {
#endif

extern u32 genrand_int32(void);
extern const s16 data_020c9670[];

#ifdef __cplusplus
}
#endif

/*
 * Advance the mode scheduler and all active entries. Modes one and two emit
 * moving entries on random or table-driven intervals; mode three emits one
 * centered growing entry while the gate is zero. Active entries update their
 * signed Q20.12 center, sine-scaled half-width, phase, and completion state.
 * Random mode-one timing consumes one value from the global PRNG.
 */
#ifdef __cplusplus
extern "C"
#endif
void PairedEntryManager_Update(PairedEntryManager *manager)
{
    u8 countdowns[PAIRED_ENTRY_MODE2_INTERVAL_COUNT];
    const u8 *countdownSource = gPairedEntryMode2EmissionIntervals;
    u8 *countdownDestination = countdowns;
    s32 index;

    for (index = PAIRED_ENTRY_MODE2_INTERVAL_COUNT; index != 0; index--)
        *countdownDestination++ = *countdownSource++;

    if (manager->spawnGateCounter == 0) {
        if (manager->mode == 3) {
            if (PairedEntryManager_SpawnEntry(manager, 2, 2) != 0)
                manager->spawnGateCounter = 1;
            manager->emissionCountdown = 1;
        }

        if (manager->mode == 2) {
            --manager->emissionCountdown;
            if (manager->emissionCountdown == 0) {
                PairedEntryManager_SpawnEntry(manager, 1, 0);
                PairedEntryManager_SpawnEntry(manager, 1, 1);
                manager->emissionCountdown =
                    countdowns[manager->mode2IntervalIndex];
                ++manager->mode2IntervalIndex;
                if ((u32)manager->mode2IntervalIndex >=
                    PAIRED_ENTRY_MODE2_INTERVAL_COUNT)
                    manager->mode2IntervalIndex =
                        PAIRED_ENTRY_MODE2_INTERVAL_COUNT - 1;
            }
        } else if (manager->mode == 1) {
            --manager->emissionCountdown;
            if (manager->emissionCountdown == 0) {
                PairedEntryManager_SpawnEntry(manager, 0, 0);
                manager->emissionCountdown =
                    (s8)((genrand_int32() & 0x18) + 0x28);
            }
        }
    }

    for (index = PAIRED_ENTRY_CAPACITY - 1; index >= 0; index--) {
        s32 state =
            manager->entryHorizontalVelocityOrGrowthState[index];

        if (state == 0)
            continue;

        if (state == 1) {
            s64 rounding = 0x800;
            manager->entryHalfWidths[index] =
                (s32)(((s64)data_020c9670[
                            (manager->entryWavePhases[index] >> 4) * 2] *
                        manager->entryHalfWidthAmplitudes[index] + rounding) >>
                      12);
            manager->entryWavePhases[index] += 0xb4;
            if (manager->entryWavePhases[index] > 0x4000) {
                manager->entryWavePhases[index] = 0x4000;
                ++manager->spawnGateCounter;
            }
        } else {
            s64 rounding = 0x800;
            manager->entryPoints[index].x += (u32)state;
            manager->entryHalfWidths[index] =
                (s32)(((s64)data_020c9670[
                            (manager->entryWavePhases[index] >> 4) * 2] *
                        manager->entryHalfWidthAmplitudes[index] + rounding) >>
                      12);
            manager->entryWavePhases[index] +=
                (manager->mode == 1) ? 0x96 : 0x12c;
            if (manager->entryWavePhases[index] > 0x7fff)
                manager->entryHorizontalVelocityOrGrowthState[index] = 0;
        }
    }
}
