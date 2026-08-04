#ifndef TINGLE_OVERLAY_MANAGER_H
#define TINGLE_OVERLAY_MANAGER_H

#include "tingle/types.h"

#define OVERLAY_MANAGER_SLOT_COUNT 4

typedef struct OverlaySlot {
    int overlayId;
    int loaded;
    int mode;
} OverlaySlot;

typedef struct OverlayManager {
    OverlaySlot slots[OVERLAY_MANAGER_SLOT_COUNT];
} OverlayManager;

typedef char OverlaySlotSizeCheck[sizeof(OverlaySlot) == 0xC ? 1 : -1];
typedef char OverlayManagerSizeCheck[
    sizeof(OverlayManager) == 0x30 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

OverlayManager *func_020021d0(OverlayManager *manager);
OverlayManager *func_020021fc(OverlayManager *manager);
void func_0200222c(OverlayManager *manager, int slotIndex, int overlayId);
void func_02002290(OverlayManager *manager, int slotIndex);
OverlayManager *func_020022dc(void);

#ifdef __cplusplus
}
#endif

#endif
