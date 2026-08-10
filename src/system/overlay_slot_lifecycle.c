#include "tingle/checked_fs.h"
#include "tingle/overlay_manager.h"

/*
 * Construction, destruction, and loading for one ARM9 overlay slot. The slot
 * records its overlay ID, active state, and a recovered default mode value.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern s32 func_020b9194(s32 token);
extern void OS_Halt(void);

#ifdef __cplusplus
}
#endif

/* Clear the overlay identity and loaded flag, set mode to three, and return. */
OverlaySlot *OverlaySlot_Init(OverlaySlot *slot)
{
    slot->overlayId = 0;
    slot->loaded = 0;
    slot->mode = 3;
    return slot;
}

/* Unload an active slot if necessary, leave an inactive slot alone, and return. */
OverlaySlot *OverlaySlot_Destroy(OverlaySlot *slot)
{
    if (slot->loaded != 0)
        OverlaySlot_UnloadOverlay(slot);
    return slot;
}

/*
 * Replace any active overlay, acquire the recovered SDK transaction token,
 * and load overlayId for ARM9. Success records the ID and loaded flag; failure
 * halts the system. The transaction token is restored afterward. Returns no
 * value and may change executable overlay memory through CheckedFS/NitroSDK.
 */
void OverlaySlot_LoadOverlay(OverlaySlot *slot, int overlayId)
{
    s32 token;

    if (slot->loaded != 0)
        OverlaySlot_UnloadOverlay(slot);

    token = func_020b9194(-1);
    if (CheckedFS_LoadOverlay(0, (u32)overlayId) != 0) {
        slot->loaded = 1;
        slot->overlayId = overlayId;
    } else {
        OS_Halt();
    }
    func_020b9194(token);
}
