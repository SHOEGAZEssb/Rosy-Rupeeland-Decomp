#include "tingle/types.h"

/* Participant selection helper for the overlay-90 boss-stage/cinematic controller. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TitleParticipantSelectState {
    u8 unknown_000[0x1ef];
    u8 selected_participant_1ef;
    u8 unknown_1f0[4];
    void *participants_1f4[3];
} TitleParticipantSelectState;

/*
 * Select the next participant whose signed state at +0xda is below three.
 * The chosen actor receives flag bit 2 at +0x2f2 and has +0x2c8 cleared. If
 * selection wrapped back to the caller, also increment +0x304 and set +0x306.
 */
void func_ov090_0221b194(TitleParticipantSelectState *self, void *caller)
{
    s32 callerIndex = -1;
    s32 i;
    s32 candidate;
    s32 scanIndex;

    for (i = 0; i < 3; i++) {
        if (self->participants_1f4[i] == caller) {
            callerIndex = i;
            break;
        }
    }

    scanIndex = callerIndex;
    candidate = -1;
    i = 0;
    while (i < 3) {
        scanIndex = (scanIndex + 1) % 3;
        if (FIELD(s16, self->participants_1f4[scanIndex], 0xda) < 3) {
            candidate = scanIndex;
            break;
        }
        i++;
    }

    if (candidate == -1)
        return;

    self->selected_participant_1ef = candidate;
    FIELD(u16, self->participants_1f4[candidate], 0x2f2) |= 4;
    FIELD(u16, self->participants_1f4[candidate], 0x2c8) = 0;
    if (candidate == callerIndex) {
        FIELD(u16, self->participants_1f4[candidate], 0x306) = 1;
        FIELD(u16, self->participants_1f4[candidate], 0x304)++;
    }
}
