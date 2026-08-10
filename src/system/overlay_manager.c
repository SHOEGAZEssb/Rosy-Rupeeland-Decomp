#include "tingle/overlay_manager.h"

/*
 * Four-slot ARM9 overlay lifetime manager. Each slot delegates actual NitroFS
 * overlay loading and unloading to the adjacent recovered slot routines. The
 * process-global manager is constructed lazily and registered for shutdown.
 */

typedef struct OverlayManagerGlobal {
    u32 guard;
    u8 destructorRecord[0xC];
    OverlayManager manager;
} OverlayManagerGlobal;

typedef char OverlayManagerGlobalSizeCheck[
    sizeof(OverlayManagerGlobal) == 0x40 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern OverlaySlot *OverlaySlot_Init(OverlaySlot *slot);
extern OverlaySlot *OverlaySlot_Destroy(OverlaySlot *slot);
extern void OverlaySlot_LoadOverlay(OverlaySlot *slot, int overlayId);
extern void OverlaySlot_UnloadOverlay(OverlaySlot *slot);
extern void OS_Halt(void);
extern void __register_global_object(void *object, void *destructor,
                                     void *record);

#ifdef __cplusplus
}
#endif

OverlayManagerGlobal gOverlayManagerStorage;

/* Initialize all four independent overlay slots and return the manager. */
OverlayManager *OverlayManager_Init(OverlayManager *manager)
{
    OverlaySlot_Init(&manager->slots[0]);
    OverlaySlot_Init(&manager->slots[1]);
    OverlaySlot_Init(&manager->slots[2]);
    OverlaySlot_Init(&manager->slots[3]);
    return manager;
}

/* Destroy the four slots in reverse order, unloading any active overlays. */
OverlayManager *OverlayManager_Destroy(OverlayManager *manager)
{
    OverlaySlot_Destroy(&manager->slots[3]);
    OverlaySlot_Destroy(&manager->slots[2]);
    OverlaySlot_Destroy(&manager->slots[1]);
    OverlaySlot_Destroy(&manager->slots[0]);
    return manager;
}

/*
 * Load an overlay into the selected slot. The slot helper unloads a previous
 * occupant first and performs the CheckedFS/NitroSDK transaction. Retail
 * treats a slot index outside 0..3 as fatal and enters OS_Halt.
 */
void OverlayManager_LoadOverlay(OverlayManager *manager, int slotIndex, int overlayId)
{
    switch (slotIndex) {
    case 0:
        OverlaySlot_LoadOverlay(&manager->slots[0], overlayId);
        return;
    case 1:
        OverlaySlot_LoadOverlay(&manager->slots[1], overlayId);
        return;
    case 2:
        OverlaySlot_LoadOverlay(&manager->slots[2], overlayId);
        return;
    case 3:
        OverlaySlot_LoadOverlay(&manager->slots[3], overlayId);
        return;
    }

    OS_Halt();
}

/* Unload the selected slot; an out-of-range index has no observable effect. */
void OverlayManager_UnloadOverlay(OverlayManager *manager, int slotIndex)
{
    switch (slotIndex) {
    case 0:
        OverlaySlot_UnloadOverlay(&manager->slots[0]);
        return;
    case 1:
        OverlaySlot_UnloadOverlay(&manager->slots[1]);
        return;
    case 2:
        OverlaySlot_UnloadOverlay(&manager->slots[2]);
        return;
    case 3:
        OverlaySlot_UnloadOverlay(&manager->slots[3]);
        return;
    }
}

/*
 * Lazily construct the process-global manager and register its reverse-order
 * slot destructor with the Metrowerks runtime. The guard is not synchronized.
 */
OverlayManager *OverlayManager_GetGlobal(void)
{
    if ((gOverlayManagerStorage.guard & 1) == 0) {
        OverlayManager_Init(&gOverlayManagerStorage.manager);
        __register_global_object(&gOverlayManagerStorage.manager,
                                 (void *)OverlayManager_Destroy,
                                 gOverlayManagerStorage.destructorRecord);
        gOverlayManagerStorage.guard |= 1;
    }
    return &gOverlayManagerStorage.manager;
}
