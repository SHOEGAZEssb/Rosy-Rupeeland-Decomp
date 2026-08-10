#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Participant-state summary helper for the phase-90 title controller. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TitleParticipantSummaryState {
    u8 unknown_000[0x1ec];
    u8 state_1ec;
    u8 unknown_1ed[7];
    void *participants_1f4[3];
    u8 unknown_200[0x22];
    u8 flags_222;
    u8 unknown_223;
    VecFx32Object vector_224;
    u8 unknown_234[2];
    u16 delay_236;
    u8 unknown_238[0xe];
    u8 state_sum_246;
} TitleParticipantSummaryState;

extern void *gSoundContext;
extern void func_02059278(void *sound, s32 id, s32 value);
extern void func_0205929c(void *sound, s32 id, s32 duration);

/*
 * Copy the participant position, total the three +0xda states with each value
 * capped at three, and select the retail delay for totals zero through nine.
 * In controller state 0x10, a completed caller also hands sound 0x54 to 0x55.
 */
void func_ov090_0221b03c(TitleParticipantSummaryState *self, void *caller)
{
    s32 completed = 0;
    s32 i;

    VecFx32Object_Assign(&self->vector_224,
                         (const VecFx32Object *)((const u8 *)caller + 0x18));
    self->flags_222 |= 1;
    self->state_sum_246 = 0;
    for (i = 0; i < 3; i++) {
        s16 state = FIELD(s16, self->participants_1f4[i], 0xda);
        if (state >= 3) {
            completed++;
            state = 3;
        }
        self->state_sum_246 += state;
    }

    if (completed >= 3) {
        self->flags_222 |= 2;
    } else {
        switch (self->state_sum_246) {
        case 0:
            self->delay_236 = 300;
            break;
        case 1:
        case 2:
        case 3:
            self->delay_236 = 100;
            break;
        case 4:
        case 5:
        case 6:
            self->delay_236 = 70;
            break;
        case 7:
        case 8:
        case 9:
            self->delay_236 = 50;
            break;
        }
    }

    if (self->state_1ec == 0x10 && FIELD(s16, caller, 0xda) >= 3) {
        func_0205929c(gSoundContext, 0x54, 0);
        func_02059278(gSoundContext, 0x55, 0x7f);
    }
}
