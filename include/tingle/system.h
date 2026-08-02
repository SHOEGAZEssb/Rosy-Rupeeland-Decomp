#ifndef TINGLE_SYSTEM_H
#define TINGLE_SYSTEM_H

#include "tingle/types.h"

#define PAD_STATE_COUNT 4
#define PAD_KEY_COUNT 12

typedef struct PadState {
    u16 held;
    u16 pressed;
    u16 released;
    u16 repeated;
    u8 repeatStartDelay;
    u8 repeatInterval;
    u8 repeatTimers[PAD_KEY_COUNT];
} PadState;

typedef struct SystemState {
    u32 flags;
    PadState pads[PAD_STATE_COUNT];
    u16 enabledKeyMask;
    u8 unknown5E;
    u8 language;
    u16 unknown60;
    u16 padding62;
    u32 frameCounter;
    u32 unknown68;
} SystemState;

typedef char PadStateSizeCheck[sizeof(PadState) == 0x16 ? 1 : -1];
typedef char SystemStateSizeCheck[sizeof(SystemState) == 0x6c ? 1 : -1];

extern SystemState gSystemState;

void InitRuntime(void);
void InitHeap(void);
void UpdateSystemFrame(void);
void UpdateKeyState(u16 keys, int stateIndex);

#endif
