#include "tingle/types.h"

/*
 * Overlay 41 per-frame input and subsystem dispatch. This recovered routine
 * samples the touch panel into world coordinates, advances capture thresholds,
 * triggers scene effects, and updates linked controller/render objects.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void TouchPanelManager_GetPoint(void *);
void func_ov041_021fd000(void *);
void func_ov041_021febd4(void *, const void *);
s32 func_020befec(s32, s32);
s32 func_ov041_0220159c(void *);
void func_ov041_022013cc(void *, s32, s32, s32);
u32 genrand_int32(void);
void func_ov041_021ff868(void *);
void func_ov041_02200a38(void *);
void func_ov041_02202c34(void *);
void func_ov070_022103d8(void *);
extern void *gTouchPanelManager;
}

/*
 * Sample touch input when the manager reports pressed/held state, translate it
 * by the camera offsets, and feed the touch tracker. When scene updates are not
 * suppressed, this also advances capture transition thresholds, spawns an
 * inferred mode-dependent motion effect, and updates four linked subsystems.
 * The function returns no value and may consume RNG state.
 */
extern "C" void func_ov041_021fed00(void *owner)
{
    s32 touchState = FIELD(s32, gTouchPanelManager, 4);
    if (touchState == 1 || touchState == 2) {
        s32 point[3];
        s32 worldPoint[3];
        TouchPanelManager_GetPoint(point);
        func_ov041_021fd000(worldPoint);
        worldPoint[1] = FIELD(s32, owner, 0x190) + (point[1] << 12);
        worldPoint[2] = FIELD(s32, owner, 0x194) + (point[2] << 12);
        func_ov041_021febd4(owner, worldPoint);
    } else {
        FIELD(s32, owner, 0x1c8) = 0;
        FIELD(s32, owner, 0x1c4) = 0;
    }

    if (FIELD(s32, owner, 0x1f8) != 0)
        return;

    if (FIELD(s32, owner, 0x1f4) == 0 &&
        FIELD(s32, owner, 0x184) == 0) {
        s32 selection = FIELD(s32, owner, 0x180);
        s32 progress = FIELD(s32, FIELD(void *, owner, 8), 0xd8) >> 12;
        if (selection == 0) {
            s32 threshold = func_020befec(FIELD(s32, owner, 0x174) * 0xc0, 3);
            if (threshold > progress)
                FIELD(s32, owner, 0x184) = 2;
        } else if (selection == 2) {
            s32 threshold = func_020befec(FIELD(s32, owner, 0x174) * 0x60, 3);
            if (threshold > progress)
                FIELD(s32, owner, 0x184) = 2;
        }
    }

    void *effect = FIELD(void *, owner, 0x0c);
    if (effect != 0 && func_ov041_0220159c(effect) == 0) {
        if (FIELD(s32, owner, 0x1cc) == 1) {
            func_ov041_022013cc(effect, 1, 0x32000, 0xb4000);
            FIELD(s32, owner, 0x190) = (s32)0xfffc647e;
            FIELD(s32, owner, 0x1a0) = -0x4e000;
            FIELD(s32, owner, 0x194) += 0xb4000;
            FIELD(s32, owner, 0x1a4) = FIELD(s32, owner, 0x194);
        } else {
            s32 offset = (((genrand_int32() << 31) >> 30) - 1) * 0x5a + 0x80;
            func_ov041_022013cc(effect, 3, offset << 12, 0xc0000);
        }
    }

    func_ov041_021ff868(FIELD(void *, owner, 0x10));
    if (FIELD(s32, owner, 0x1f4) != 1)
        func_ov041_02200a38(FIELD(void *, owner, 0x14));
    if (effect != 0)
        func_ov041_02202c34(effect);
    func_ov070_022103d8(FIELD(void *, owner, 8));
}
