#include "tingle/touch_panel.h"

#include "tingle/game_work.h"

/*
 * Touch-panel sampling manager. It configures NitroSDK calibration and
 * autosampling, retains consecutive samples, derives press/hold/release
 * transitions, and publishes the SDK sample and transition to GameWork.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void Heap_Free(void *allocation);
extern void OS_Halt(void);
extern int func_020b4138(void);

/* NitroSDK TP entry points, retained under their address-derived symbols. */
extern void func_020baedc(void);                    /* TP_Init */
extern int func_020bae30(TPCalibrateParam *param); /* TP_GetUserInfo */
extern void func_020bace8(const TPCalibrateParam *param); /* TP_SetCalibrateParam */
extern void func_020ba87c(TPData *sample); /* TP_GetLatestCalibratedPointInAuto */
extern void func_020ba89c(TPData *sample); /* TP_GetLatestRawPointInAuto */
extern void func_020bac48(void);           /* TP_RequestSamplingAsync */
extern u32 func_020babc8(TPData *sample);  /* TP_WaitRawResult */
extern void func_020baab4(u16 vcount, u16 frequency, TPData *samples,
                          u16 sampleCount); /* TP_RequestAutoSamplingStartAsync */
extern void func_020baa10(void);            /* TP_RequestAutoSamplingStopAsync */
extern void func_020ba4c4(u32 command);     /* TP_WaitBusy */
extern u32 func_020ba4b0(u32 command);      /* TP_CheckError */

extern SceneManager *gSceneManager;

#ifdef __cplusplus
}
#endif

enum {
    TP_COMMAND_AUTO_ON = 2,
    TP_COMMAND_AUTO_OFF = 4,
    TOUCH_SEQUENCE_FRAME_LIMIT = 14,
};

/* The retail vtable contains only its ordinary and deleting destructors. */
TouchPanelManagerVTable gTouchPanelManagerVTable = {
    TouchPanelManager_Destroy,
    TouchPanelManager_DestroyAndFree,
};

/*
 * Initialize SDK touch input, load firmware calibration when available, and
 * start five-entry autosampling at four samples per frame. Failure to read
 * calibration or complete the SDK request enters the fatal wait routine.
 */
TouchPanelManager *TouchPanelManager_Init(TouchPanelManager *manager)
{
    manager->vtable = &gTouchPanelManagerVTable;
    manager->state = TOUCH_STATE_RELEASED;
    manager->unknown48 = 0;
    manager->counter4C = 0;
    manager->autoSamplingEnabled = 0;

    func_020baedc();
    if (func_020b4138() == 0) {
        if (func_020bae30(&manager->calibration) == 0) {
            OS_Halt();
        }
        func_020bace8(&manager->calibration);
    } else {
        /* The SDK environment probe selects uncalibrated coordinates here. */
        func_020bace8(0);
    }

    TouchPanelManager_SetAutoSampling(manager, 1);
    manager->unknown48 = 0;
    manager->counter4C = 0;
    return manager;
}

/* The manager owns no subordinate heap objects; destruction is a no-op. */
TouchPanelManager *TouchPanelManager_Destroy(TouchPanelManager *manager)
{
    return manager;
}

/* Release a heap-owned manager and return its former address. */
TouchPanelManager *TouchPanelManager_DestroyAndFree(
    TouchPanelManager *manager)
{
    Heap_Free(manager);
    return manager;
}

/*
 * Poll one sample and derive the transition visible to the scene dispatcher.
 * Invalid touched samples are forced idle. Offsets 0x48 and 0x4C implement a
 * four-state, 14-frame sequence tracker whose consumers are not yet known.
 * GameWork offsets 0x23C..0x240 receive the derived state and SDK coordinates.
 */
void TouchPanelManager_Update(TouchPanelManager *manager)
{
    TPData sample;

    /* Keep halfword copies explicit; this is how the original C was lowered. */
    manager->previousSample.x = manager->currentSample.x;
    manager->previousSample.y = manager->currentSample.y;
    manager->previousSample.touch = manager->currentSample.touch;
    manager->previousSample.validity = manager->currentSample.validity;

    if (manager->autoSamplingEnabled != 0) {
        if (func_020b4138() == 0) {
            func_020ba87c(&sample);
        } else {
            func_020ba89c(&sample);
        }
    } else {
        func_020bac48();
        func_020babc8(&sample);
    }

    if (sample.touch == 1 && (sample.validity & 3) != 0) {
        manager->state = TOUCH_STATE_RELEASED;
        sample.touch = 0;
    }

    /* The return value is unused, but the retail update performs this lookup. */
    SceneManager_GetCurrent(gSceneManager);

    if (sample.touch == 1 && manager->previousSample.touch == 0) {
        manager->state = TOUCH_STATE_PRESSED;
    } else if (sample.touch == 0 && manager->previousSample.touch == 1) {
        manager->state = TOUCH_STATE_RELEASED;
    } else if (sample.touch == 1 && manager->previousSample.touch == 1) {
        manager->state = TOUCH_STATE_HELD;
    }

    switch (manager->unknown48) {
    case 0:
        if (sample.touch == 0 || manager->previousSample.touch == 1) {
            break;
        }
        manager->counter4C = 0;
        manager->unknown48 = 1;
        /* Fall through. */
    case 1:
        manager->counter4C++;
        if (manager->counter4C > TOUCH_SEQUENCE_FRAME_LIMIT) {
            manager->unknown48 = 0;
        }
        if (sample.touch == 1) {
            break;
        }
        manager->counter4C = 0;
        manager->unknown48 = 2;
        /* Fall through. */
    case 2:
        manager->counter4C++;
        if (manager->counter4C > TOUCH_SEQUENCE_FRAME_LIMIT) {
            manager->unknown48 = 0;
        }
        if (sample.touch != 0) {
            manager->counter4C = 0;
            manager->unknown48 = 3;
        }
        break;
    case 3:
        manager->unknown48 = 0;
        break;
    }

    manager->currentSample.touch = sample.touch;
    if (sample.touch == 1) {
        manager->currentSample.x = sample.x;
        manager->currentSample.y = sample.y;
    } else {
        manager->currentSample.x = manager->previousSample.x;
        manager->currentSample.y = manager->previousSample.y;
    }

    *(u16 *)((u8 *)gGameWork + 0x23C) = (u16)manager->state;
    *(u16 *)((u8 *)gGameWork + 0x23E) = sample.x;
    *(u16 *)((u8 *)gGameWork + 0x240) = sample.y;
}

/* Initialize a callback point from the manager's last retained coordinates. */
#ifndef MATCHING
TouchPoint *TouchPanelManager_GetPoint(TouchPoint *point,
                                      TouchPanelManager *manager)
{
    point->vtable = &gSceneTouchInitialData.pointVTable;
    point->x = manager->currentSample.x;
    point->y = manager->currentSample.y;
    return point;
}
#else
/* MWCC does not recover the retail three-register aggregate store from C. */
asm TouchPoint *TouchPanelManager_GetPoint(TouchPoint *point,
                                          TouchPanelManager *manager)
{
    ldrh r3, [r1, #0x42]
    ldrh r2, [r1, #0x40]
    ldr r1, =gSceneTouchInitialData
    stmia r0, {r1, r2, r3}
    bx lr
}
#endif

/*
 * Start or stop NitroSDK autosampling. Repeated requests are ignored; SDK
 * command errors enter the same fatal wait routine used during construction.
 */
void TouchPanelManager_SetAutoSampling(TouchPanelManager *manager, int enabled)
{
    if (enabled == 1) {
        if (manager->autoSamplingEnabled != 0) {
            return;
        }
        func_020baab4(0, 4, manager->autoSamples, 5);
        func_020ba4c4(TP_COMMAND_AUTO_ON);
        if (func_020ba4b0(TP_COMMAND_AUTO_ON) != 0) {
            OS_Halt();
        }
        manager->autoSamplingEnabled = 1;
    } else {
        if (manager->autoSamplingEnabled == 0) {
            return;
        }
        func_020baa10();
        func_020ba4c4(TP_COMMAND_AUTO_OFF);
        if (func_020ba4b0(TP_COMMAND_AUTO_OFF) != 0) {
            OS_Halt();
        }
        manager->autoSamplingEnabled = 0;
    }
}
