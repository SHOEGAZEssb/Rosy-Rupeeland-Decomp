#ifndef TINGLE_SYSTEM_H
#define TINGLE_SYSTEM_H

#include "tingle/types.h"

#define PAD_STATE_COUNT 4
#define PAD_KEY_COUNT 12
#define PAD_ALL_MASK 0x2fff
#define PAD_SOFT_RESET_MASK 0x030c

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

typedef struct RuntimeContext {
    u32 unknown00;
    u32 unknown04;
    u32 suppressResetAndSleep;
} RuntimeContext;

extern SystemState gSystemState;
extern RuntimeContext *gRuntimeContext;
extern volatile u16 gPadStates;
extern volatile u16 gPadState0Pressed;
extern volatile u16 gPadState0Released;
extern volatile u16 gPadState0Repeated;

extern s32 gVCountAccumulator;
extern s32 gMaxFrameVCount;
extern s32 gFrameVCount;
extern s32 gAdjustedVCount;
extern s32 gPreviousVCount;

void InitRuntime(void);
void InitHeap(void);
void func_02002ea4(void);
u16 PAD_Read(void);
void UpdateSystemFrame(void);
void UpdateKeyState(u32 keys, int stateIndex);

#endif
