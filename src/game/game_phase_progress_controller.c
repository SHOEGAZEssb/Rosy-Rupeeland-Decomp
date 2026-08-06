#include "tingle/game_work.h"
#include "tingle/types.h"

/*
 * Maintain the global game-phase progress controller.  The recovered state
 * combines a capped tick counter, two stage indices, current and cumulative
 * progress values, per-stage percentage adjustments, persistence in
 * GameWork::unknown5DF0, and timed presentation requests.  Meanings narrower
 * than those observable relationships remain intentionally unnamed.
 */
typedef struct GamePhaseProgressController {
    s32 counter_00;
    s32 transitionRequested_04;
    s32 presentationEnabled_08;
    s32 updateState_0c;
    s32 warningState_10;
    s32 stage_14;
    s32 comparisonStage_18;
    s32 currentProgress_1c;
    s32 cumulativeProgress_20;
    s32 adjustmentCount_24;
    s32 elapsedTicks_28;
    u8 stageAdjustments_2c[11];
    u8 padding_37;
    s32 resetAdjustment_38;
} GamePhaseProgressController;

typedef struct GamePhaseProgressSave {
    s32 counter_00;
    s32 currentProgress_04;
    s32 cumulativeProgress_08;
    u32 packedState_0c;
    s32 elapsedTicks_10;
    u8 stageAdjustments_14[12];
} GamePhaseProgressSave;

#define COUNTER_CAP 0x6e002800
#define PROGRESS_CAP 9999999
#define TICKS_PER_MINUTE 3600

#ifdef __cplusplus
extern "C" {
#endif
extern const s32 data_020c37e8;
extern const s32 data_020c37ec;
extern const s32 data_020c37f0;
extern const s32 data_020c37f4[];
extern const s32 data_020c3820[];
extern u8 data_020d3a59[];
extern u8 data_02105310[];
extern u32 data_02105634;
extern u8 data_02105638[];
extern GamePhaseProgressController data_02105644;
extern u8 data_021f5ebc[];
extern void __register_global_object(void *, void (*)(void *), void *);
extern s32 func_0200b294(void *);
extern void func_0200b164(void *, void *);
extern void func_020828a0(void *, s32);
extern s32 func_020befec(s32, s32);
extern s32 func_020bf1f8(s32, s32);
void func_02027604(GamePhaseProgressController *);
void func_02027650(GamePhaseProgressController *);
void func_02027654(GamePhaseProgressController *);
s32 func_02027788(GamePhaseProgressController *, s32);
s32 func_02027828(GamePhaseProgressController *, s32);
void func_02027864(GamePhaseProgressController *, s32);
void func_020278b4(GamePhaseProgressController *, s32);
void func_020278d4(GamePhaseProgressController *);
void func_02027d7c(GamePhaseProgressController *);
void func_02027f38(GamePhaseProgressController *);
GamePhaseProgressController *func_02027f94(void);
#ifdef __cplusplus
}
#endif

/* Initialize counters, stages, progress, adjustments, and the reset latch. */
void func_02027604(GamePhaseProgressController *self)
{
    s32 i;
    self->counter_00 = 0;
    self->transitionRequested_04 = 0;
    self->warningState_10 = 0;
    self->stage_14 = 0;
    self->comparisonStage_18 = 0;
    self->currentProgress_1c = 0;
    self->cumulativeProgress_20 = 0;
    self->adjustmentCount_24 = 0;
    self->elapsedTicks_28 = 0;
    self->resetAdjustment_38 = 1;
    for (i = 0; i < 11; i++)
        self->stageAdjustments_2c[i] = 0;
}

/* Global-object shutdown hook; this controller owns no dynamic resources. */
void func_02027650(GamePhaseProgressController *self)
{
    (void)self;
}

/*
 * Advance the countdown state machine.  An active stage first arms state one;
 * state one ticks the counter and issues presentation modes as it crosses the
 * two table-derived warning thresholds, then can lower the stage at expiry.
 */
void func_02027654(GamePhaseProgressController *self)
{
    if (self->updateState_0c == 0) {
        if (self->stage_14 > 0 && self->transitionRequested_04 == 0) {
            self->transitionRequested_04 = 1;
            self->updateState_0c++;
        }
        return;
    }
    if (self->updateState_0c != 1)
        return;

    func_020828a0(data_021f5ebc, 0x100);
    self->elapsedTicks_28++;
    self->counter_00--;
    if (self->counter_00 == 0 && self->warningState_10 == 2 &&
        func_02027788(self, self->warningState_10)) {
        func_02027d7c(self);
        return;
    }
    if (self->counter_00 < data_020c37ec * 60 &&
        self->warningState_10 == 1 &&
        func_02027788(self, self->warningState_10)) {
        self->warningState_10++;
        return;
    }
    if (self->counter_00 < data_020c37f0 * 60 &&
        self->warningState_10 == 0 &&
        func_02027788(self, self->warningState_10))
        self->warningState_10++;
}

/*
 * If presentation requests are enabled and the shared actor collection is
 * idle, queue the mode, persist it at GameWork offset 0x1e2, and return one.
 * Mode three also sets game flag 0x401 once.
 */
s32 func_02027788(GamePhaseProgressController *self, s32 mode)
{
    if (!self->presentationEnabled_08 || func_0200b294(data_02105310))
        return 0;
    if (mode == 3 && !GameWork_TestFlag(gGameWork, 0x401))
        GameWork_SetFlag(gGameWork, 0x401);
    *(u16 *)((u8 *)gGameWork + 0x1e2) = (u16)mode;
    func_0200b164(data_02105310, data_020d3a59);
    return 1;
}

/* Return the unadjusted progress threshold at the supplied table index. */
s32 func_02027818(GamePhaseProgressController *self, s32 index)
{
    (void)self;
    return data_020c37f4[index];
}

/* Return a threshold increased by the indexed per-stage percentage. */
s32 func_02027828(GamePhaseProgressController *self, s32 index)
{
    s32 base = data_020c3820[index];
    return base + func_020befec(base * self->stageAdjustments_2c[index], 100);
}

/* Return the adjusted threshold for the controller's current stage. */
s32 func_02027854(GamePhaseProgressController *self)
{
    return func_02027828(self, self->stage_14);
}

/*
 * Add the input divided by ten in minute-sized tick units, saturate the
 * counter, and recompute which warning thresholds have already been crossed.
 */
void func_02027864(GamePhaseProgressController *self, s32 value)
{
    s64 total = (s64)self->counter_00 +
                (s64)func_020bf1f8(value, 10) * TICKS_PER_MINUTE;
    if (total >= COUNTER_CAP)
        total = COUNTER_CAP;
    self->counter_00 = (s32)total;
    func_020278d4(self);
}

/* Set and cap the tick counter, then recompute its warning state. */
void func_020278b4(GamePhaseProgressController *self, s32 value)
{
    self->counter_00 = value;
    if ((u32)value >= (u32)COUNTER_CAP)
        self->counter_00 = COUNTER_CAP;
    func_020278d4(self);
}

/* Classify the counter as above, at, or below the two warning thresholds. */
void func_020278d4(GamePhaseProgressController *self)
{
    self->warningState_10 = 0;
    if (self->counter_00 <= data_020c37f0 * 60)
        self->warningState_10++;
    if (self->counter_00 < data_020c37ec * 60)
        self->warningState_10++;
}

/*
 * Load controller state from GameWork offset 0x5df0, unpack its bit fields,
 * copy eleven adjustment bytes, and mirror selected values to runtime fields.
 */
void func_02027930(GamePhaseProgressController *self)
{
    GamePhaseProgressSave *save =
        (GamePhaseProgressSave *)((u8 *)gGameWork + 0x5df0);
    u32 packed = save->packedState_0c;
    s32 i;
    self->counter_00 = save->counter_00;
    self->transitionRequested_04 = (s32)(packed << 31) >> 31;
    self->presentationEnabled_08 = (s32)(packed << 30) >> 31;
    self->updateState_0c = (s32)(packed << 27) >> 29;
    self->warningState_10 = (s32)(packed << 24) >> 29;
    self->currentProgress_1c = save->currentProgress_04;
    self->cumulativeProgress_20 = save->cumulativeProgress_08;
    self->stage_14 = (packed >> 8) & 0xf;
    self->comparisonStage_18 = (packed >> 12) & 0xf;
    self->adjustmentCount_24 = (packed >> 16) & 0x1f;
    self->elapsedTicks_28 = save->elapsedTicks_10;
    for (i = 0; i < 11; i++)
        self->stageAdjustments_2c[i] = save->stageAdjustments_14[i];
    *(u16 *)((u8 *)gGameWork + 0x1ce) = (u16)self->stage_14;
    *(u16 *)((u8 *)gGameWork + 0x12e) = (u16)self->comparisonStage_18;
    *(s32 *)((u8 *)gGameWork + 0x7f8) = self->cumulativeProgress_20;
}

/* Pack the controller fields back into GameWork offset 0x5df0. */
void func_02027a7c(GamePhaseProgressController *self)
{
    GamePhaseProgressSave *save =
        (GamePhaseProgressSave *)((u8 *)gGameWork + 0x5df0);
    u32 packed = save->packedState_0c;
    s32 i;
    save->counter_00 = self->counter_00;
    packed = (packed & ~1u) | ((u32)self->transitionRequested_04 & 1);
    packed = (packed & ~2u) | (((u32)self->presentationEnabled_08 & 1) << 1);
    packed = (packed & ~0x1cu) | (((u32)self->updateState_0c & 7) << 2);
    packed = (packed & ~0xe0u) | (((u32)self->warningState_10 & 7) << 5);
    save->currentProgress_04 = self->currentProgress_1c;
    save->cumulativeProgress_08 = self->cumulativeProgress_20;
    packed = (packed & ~0xf00u) | (((u32)self->stage_14 & 0xf) << 8);
    packed = (packed & ~0xf000u) |
             (((u32)self->comparisonStage_18 & 0xf) << 12);
    packed = (packed & ~0x1f0000u) |
             (((u32)self->adjustmentCount_24 & 0x1f) << 16);
    save->packedState_0c = packed;
    save->elapsedTicks_10 = self->elapsedTicks_28;
    for (i = 0; i < 11; i++)
        save->stageAdjustments_14[i] = self->stageAdjustments_2c[i];
}

/* Clear all known fields in a supplied 0x20-byte persistence record. */
void func_02027bd4(GamePhaseProgressController *unused,
                   GamePhaseProgressSave *save)
{
    s32 i;
    (void)unused;
    save->counter_00 = 0;
    save->packedState_0c &= ~0x1fffffu;
    save->currentProgress_04 = 0;
    save->cumulativeProgress_08 = 0;
    save->elapsedTicks_10 = 0;
    for (i = 0; i < 12; i++)
        save->stageAdjustments_14[i] = 0;
}

/*
 * Advance one stage, deduct its full threshold or one fifth when catching up,
 * reset timer/adjustment accounting, and mirror both stage indices.
 */
void func_02027c34(GamePhaseProgressController *self)
{
    s32 oldStage = self->stage_14;
    s32 newStage = oldStage + 1;
    s32 threshold = data_020c37f4[oldStage];
    if (oldStage < self->comparisonStage_18)
        threshold = func_020befec(threshold, 5);
    else
        self->comparisonStage_18 = newStage;
    self->currentProgress_1c -= threshold;
    if (self->currentProgress_1c < 0)
        self->currentProgress_1c = 0;
    self->stage_14 = newStage;
    func_020278b4(self, data_020c37e8 * 60);
    func_02027864(self, self->currentProgress_1c);
    func_02027f38(self);
    self->adjustmentCount_24 = 0;
    self->elapsedTicks_28 = 0;
    *(u16 *)((u8 *)gGameWork + 0x1ce) = (u16)self->stage_14;
    *(u16 *)((u8 *)gGameWork + 0x12e) = (u16)self->comparisonStage_18;
}

/* Return whether current progress is enough to advance a stage. */
s32 func_02027d14(GamePhaseProgressController *self)
{
    s32 threshold;
    if (self->stage_14 >= 10)
        return 0;
    threshold = data_020c37f4[self->stage_14];
    if (self->stage_14 < self->comparisonStage_18)
        threshold = func_020befec(threshold, 5);
    return self->currentProgress_1c >= threshold;
}

/* Lower the stage, reset its timer/progress state, and mirror the new stage. */
void func_02027d7c(GamePhaseProgressController *self)
{
    s32 stage = self->stage_14 - 1;
    if (stage <= 0) {
        stage = 0;
        self->transitionRequested_04 = 0;
        self->updateState_0c = 0;
    } else {
        func_020278b4(self, data_020c37e8 * 60);
    }
    self->warningState_10 = 0;
    self->stage_14 = stage;
    self->adjustmentCount_24 = 0;
    self->elapsedTicks_28 = 0;
    self->currentProgress_1c = 0;
    *(u16 *)((u8 *)gGameWork + 0x1ce) = (u16)stage;
}

/* Return one when the current stage trails the comparison stage. */
s32 func_02027df0(GamePhaseProgressController *self)
{
    return self->stage_14 < self->comparisonStage_18;
}

/*
 * Add to current and cumulative progress with saturation. The first addition
 * after a reset also increments the adjustment count; active stages extend
 * the counter using the same value divided by ten.
 */
void func_02027e08(GamePhaseProgressController *self, s32 value)
{
    if (self->resetAdjustment_38) {
        self->resetAdjustment_38 = 0;
        self->adjustmentCount_24++;
    }
    self->currentProgress_1c += value;
    if (self->currentProgress_1c > PROGRESS_CAP)
        self->currentProgress_1c = PROGRESS_CAP;
    self->cumulativeProgress_20 += value;
    if (self->cumulativeProgress_20 > PROGRESS_CAP)
        self->cumulativeProgress_20 = PROGRESS_CAP;
    if (self->stage_14 > 0)
        func_02027864(self, value);
    *(s32 *)((u8 *)gGameWork + 0x7f8) = self->cumulativeProgress_20;
}

/* Return the current stage index. */
s32 func_02027e8c(GamePhaseProgressController *self)
{
    return self->stage_14;
}

/* Set the current stage index without other state changes. */
void func_02027e94(GamePhaseProgressController *self, s32 stage)
{
    self->stage_14 = stage;
}

/* Return the comparison-stage index. */
s32 func_02027e9c(GamePhaseProgressController *self)
{
    return self->comparisonStage_18;
}

/* Set the comparison-stage index without other state changes. */
void func_02027ea4(GamePhaseProgressController *self, s32 stage)
{
    self->comparisonStage_18 = stage;
}

/*
 * Classify current progress into below 50%, 50..84%, or at least 85% of the
 * applicable stage threshold; catch-up stages use one fifth of the threshold.
 */
s32 func_02027eac(GamePhaseProgressController *self)
{
    s32 threshold = data_020c37f4[self->stage_14];
    if (self->stage_14 < self->comparisonStage_18)
        threshold = func_020befec(threshold, 5);
    if (self->currentProgress_1c >= func_020befec(threshold * 85, 100))
        return 2;
    return self->currentProgress_1c >=
           func_020befec(threshold * 50, 100);
}

/* Arm the next progress addition to increment the adjustment count. */
void func_02027f2c(GamePhaseProgressController *self)
{
    self->resetAdjustment_38 = 1;
}

/*
 * Recompute the current stage's adjustment byte from the clamped adjustment
 * count and elapsed whole minutes, then clamp the result to 0..20 percent.
 */
void func_02027f38(GamePhaseProgressController *self)
{
    s32 count = self->adjustmentCount_24;
    s32 adjustment;
    if (count < 0)
        count = 0;
    else if (count > 20)
        count = 20;
    adjustment = count +
                 func_020befec(200 - func_020befec(self->elapsedTicks_28,
                                                   TICKS_PER_MINUTE),
                               10);
    if (adjustment < 0)
        adjustment = 0;
    else if (adjustment > 20)
        adjustment = 20;
    self->stageAdjustments_2c[self->stage_14] = (u8)adjustment;
}

/* Lazily construct/register the global progress controller and return it. */
GamePhaseProgressController *func_02027f94(void)
{
    if (!(data_02105634 & 1)) {
        func_02027604(&data_02105644);
        __register_global_object(&data_02105644,
                                 (void (*)(void *))func_02027650,
                                 data_02105638);
        data_02105634 |= 1;
    }
    return &data_02105644;
}
