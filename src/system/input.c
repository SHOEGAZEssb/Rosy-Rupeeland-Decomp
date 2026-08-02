#include "tingle/system.h"

#define REG_VCOUNT (*(volatile u16 *)0x04000006)
#define REG_KEYINPUT (*(volatile u16 *)0x04000130)
#define REG_EXTKEYIN (*(volatile u16 *)0x027fffa8)
#define RESET_PARAMETER (*(volatile u32 *)0x027ffc20)

#define HW_LCD_LINES 263
#define EXTKEYIN_LID_CLOSED 0x8000
#define PM_TRIGGER_COVER_OPEN_CARD 0x0c

extern void OS_WaitVBlankIntr(void);
extern void OS_ResetSystem(u32 parameter);
extern void PM_GoSleepMode(u32 trigger, u32 logic, u16 keyPattern);

u16 PAD_Read(void)
{
    return ((REG_KEYINPUT | REG_EXTKEYIN) ^ PAD_ALL_MASK) & PAD_ALL_MASK;
}

void UpdateSystemFrame(void)
{
    s32 previousVCount = gPreviousVCount;

    gAdjustedVCount = REG_VCOUNT;
    if (gAdjustedVCount < previousVCount) {
        gAdjustedVCount += HW_LCD_LINES;
    }

    gFrameVCount = (gAdjustedVCount - previousVCount) +
                   gVCountAccumulator * HW_LCD_LINES;
    if (gMaxFrameVCount < gFrameVCount) {
        gMaxFrameVCount = gFrameVCount;
    }

    OS_WaitVBlankIntr();

    gPreviousVCount = REG_VCOUNT;
    gVCountAccumulator = 0;
    gSystemState.frameCounter++;

    UpdateKeyState(PAD_Read(), 0);

    if (gSystemState.pads[0].held == 0) {
        gSystemState.flags &= ~4U;
    }

    {
        u32 suppressResetAndSleep =
            gRuntimeContext->suppressResetAndSleep != 0;
        if (suppressResetAndSleep != 0) {
            return;
        }
    }

    {
        u16 held = gSystemState.pads[0].held;
        if ((gSystemState.flags & 4U) == 0 &&
            (held & PAD_SOFT_RESET_MASK) == PAD_SOFT_RESET_MASK) {
            OS_ResetSystem(RESET_PARAMETER + 1);
        }
    }

    if ((REG_EXTKEYIN & EXTKEYIN_LID_CLOSED) >> 15) {
        PM_GoSleepMode(PM_TRIGGER_COVER_OPEN_CARD, 0, 0);
    }
}

void UpdateKeyState(u16 keys, int stateIndex)
{
    int byteOffset = stateIndex * sizeof(PadState);
    volatile u8 *heldBase = (volatile u8 *)&gPadStates;
    SystemState *system =
        (SystemState *)((u8 *)&gSystemState + byteOffset);
    u16 held = *(volatile u16 *)(heldBase + byteOffset);
    volatile u8 *pressedBase = (volatile u8 *)&gPadState0Pressed;
    u16 repeated = 0;
    u32 invertedKeys;
    volatile u8 *releasedBase;
    u16 mask;
    u8 zero;
    int i;

    *(volatile u16 *)(pressedBase + byteOffset) = keys & ~held;

    held = *(volatile u16 *)(heldBase + byteOffset);
    invertedKeys = ~keys;
    releasedBase = (volatile u8 *)&gPadState0Released;
    *(volatile u16 *)(releasedBase + byteOffset) = invertedKeys & held;

    i = 0;
    mask = 1;
    zero = 0;

    for (; i < PAD_KEY_COUNT; i++, mask <<= 1) {
        if ((keys & mask) != 0) {
            if ((system->pads[0].held & mask) == 0) {
                repeated |= mask;
                system->pads[0].repeatTimers[i] =
                    system->pads[0].repeatStartDelay;
            } else {
                system->pads[0].repeatTimers[i]--;
                if (system->pads[0].repeatTimers[i] == 0) {
                    repeated |= mask;
                    system->pads[0].repeatTimers[i] =
                        system->pads[0].repeatInterval;
                }
            }
        } else {
            system->pads[0].repeatTimers[i] = zero;
        }
    }

    *(volatile u16 *)((u8 *)&gPadState0Repeated + byteOffset) = repeated;
    *(volatile u16 *)(heldBase + byteOffset) = keys;
}
