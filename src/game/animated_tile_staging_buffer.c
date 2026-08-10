#include "tingle/types.h"

/*
 * Stage three 0x800-byte tile frames and select among them with a compact
 * four-entry animation schedule. Each schedule halfword packs a signed
 * four-bit frame selector in bits 0-3 and a signed 12-bit delay in bits 4-15.
 */
typedef struct AnimatedTileSchedule {
    u32 enabled_00;
    s16 entries_04[4];
} AnimatedTileSchedule;

typedef struct AnimatedTileSource {
    u8 field_00[4];
    u8 *bytes_04;
} AnimatedTileSource;

typedef struct AnimatedTileStagingBuffer {
    u8 frames_0000[3][0x800];
    u8 field_1800[4];
    s16 schedule_1804[4];
    s32 scheduleIndex_180c;
    s32 delay_1810;
    u8 *selectedFrame_1814;
    u32 flags_1818;
} AnimatedTileStagingBuffer;

#ifdef __cplusplus
extern "C" {
#endif
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);
extern void func_020b4554(void *address, u32 size);
extern void func_020b581c(const void *source, void *destination, u32 size);
void AnimatedTileStagingBuffer_CopyFrom(AnimatedTileStagingBuffer *self,
                                        const AnimatedTileStagingBuffer *source);
#ifdef __cplusplus
}
#endif

/* Initialize the animation cursor to entry three and clear timing, selection, and flags. */
void AnimatedTileStagingBuffer_Init(AnimatedTileStagingBuffer *self)
{
    self->scheduleIndex_180c = 3;
    self->delay_1810 = 0;
    self->selectedFrame_1814 = 0;
    self->flags_1818 = 0;
}

/*
 * Initialize animation state and, when schedule->enabled_00 is nonzero, copy
 * the three source frames from byte offsets 0x6800, 0x7000, and 0x7800,
 * install four packed schedule entries, set flag bit zero, and return self.
 * A disabled schedule returns without an explicit value in the recovered
 * control flow; callers observed in this unit do not consume that path's r0.
 */
AnimatedTileStagingBuffer *AnimatedTileStagingBuffer_InitFromSource(
    AnimatedTileStagingBuffer *self, const AnimatedTileSource *source,
    const AnimatedTileSchedule *schedule)
{
    s32 i;

    AnimatedTileStagingBuffer_Init(self);
    if (!schedule->enabled_00)
        return self;
    self->flags_1818 |= 1;
    MI_CpuCopy8(source->bytes_04 + 0x6800, self->frames_0000[0], 0x800);
    MI_CpuCopy8(source->bytes_04 + 0x7000, self->frames_0000[1], 0x800);
    MI_CpuCopy8(source->bytes_04 + 0x7800, self->frames_0000[2], 0x800);
    for (i = 0; i < 4; i++) {
        /* The retail code writes the low nibble and upper 12 bits separately. */
        self->schedule_1804[i] =
            (self->schedule_1804[i] & ~0x000f) | (schedule->entries_04[i] & 0x000f);
        self->schedule_1804[i] =
            (self->schedule_1804[i] & 0x000f) | (schedule->entries_04[i] & ~0x000f);
    }
    return self;
}

/* Perform no cleanup; all frame and schedule storage is embedded in self. */
void AnimatedTileStagingBuffer_Destroy(AnimatedTileStagingBuffer *self)
{
    (void)self;
}

/* Copy source into self when distinct and return self. */
AnimatedTileStagingBuffer *AnimatedTileStagingBuffer_Assign(
    AnimatedTileStagingBuffer *self, const AnimatedTileStagingBuffer *source)
{
    if (self != source)
        AnimatedTileStagingBuffer_CopyFrom(self, source);
    return self;
}

/*
 * Copy animation state, copy each embedded frame through func_020b581c after
 * applying func_020b4554 to the destination range, and copy the four packed
 * schedule entries using the retail bitfield-preserving operations. The SDK
 * or hardware-facing effects of the two address-derived routines remain
 * unresolved.
 */
void AnimatedTileStagingBuffer_CopyFrom(AnimatedTileStagingBuffer *self,
                                        const AnimatedTileStagingBuffer *source)
{
    s32 i;

    self->scheduleIndex_180c = source->scheduleIndex_180c;
    self->delay_1810 = source->delay_1810;
    self->selectedFrame_1814 = source->selectedFrame_1814;
    self->flags_1818 = source->flags_1818;
    for (i = 0; i < 3; i++) {
        func_020b4554(self->frames_0000[i], 0x800);
        func_020b581c(source->frames_0000[i], self->frames_0000[i], 0x800);
    }
    for (i = 0; i < 4; i++) {
        self->schedule_1804[i] =
            (self->schedule_1804[i] & ~0x000f) | (source->schedule_1804[i] & 0x000f);
        self->schedule_1804[i] =
            (self->schedule_1804[i] & 0x000f) | (source->schedule_1804[i] & ~0x000f);
    }
}

/*
 * Advance the schedule only while enabled (flag bit zero) and unpaused (flag
 * bit one clear). A positive delay is decremented. Otherwise the cursor wraps
 * over four entries, the signed upper 12 bits become the next delay, and the
 * signed low nibble selects an 0x800-byte-relative frame address. Negative or
 * out-of-range selectors are preserved exactly; schedule data is trusted.
 */
void AnimatedTileStagingBuffer_Advance(AnimatedTileStagingBuffer *self)
{
    s16 entry;
    s32 selector;

    if (!(self->flags_1818 & 1) || (self->flags_1818 & 2))
        return;
    if (self->delay_1810 > 0) {
        self->delay_1810--;
        return;
    }
    self->scheduleIndex_180c++;
    if (self->scheduleIndex_180c >= 4)
        self->scheduleIndex_180c = 0;
    entry = self->schedule_1804[self->scheduleIndex_180c];
    self->delay_1810 = entry >> 4;
    selector = (s32)(entry << 28) >> 28;
    self->selectedFrame_1814 = (u8 *)self + selector * 0x800;
}

/* Set flag bit one when paused is nonzero, or clear it otherwise. */
void AnimatedTileStagingBuffer_SetPaused(AnimatedTileStagingBuffer *self, s32 paused)
{
    if (paused)
        self->flags_1818 |= 2;
    else
        self->flags_1818 &= ~2u;
}
