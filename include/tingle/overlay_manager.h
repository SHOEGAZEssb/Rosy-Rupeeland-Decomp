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

OverlayManager *OverlayManager_Init(OverlayManager *manager);
OverlayManager *OverlayManager_Destroy(OverlayManager *manager);
void OverlayManager_LoadOverlay(OverlayManager *manager, int slotIndex, int overlayId);
void OverlayManager_UnloadOverlay(OverlayManager *manager, int slotIndex);
OverlayManager *OverlayManager_GetGlobal(void);
OverlaySlot *OverlaySlot_Init(OverlaySlot *slot);
OverlaySlot *OverlaySlot_Destroy(OverlaySlot *slot);
void OverlaySlot_LoadOverlay(OverlaySlot *slot, int overlayId);
void OverlaySlot_UnloadOverlay(OverlaySlot *slot);

#ifdef __cplusplus
}
#endif

#endif
