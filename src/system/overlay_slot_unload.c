#include "tingle/checked_fs.h"
#include "tingle/overlay_manager.h"

/* ARM9 overlay-slot release operation used by the slot lifecycle helpers. */

/*
 * If active, unload the recorded ARM9 overlay and clear its ID and loaded flag.
 * Inactive slots cause no SDK call. The mode field is preserved.
 */
void func_020062f8(OverlaySlot *slot)
{
    if (slot->loaded == 0)
        return;

    CheckedFS_UnloadOverlay(0, (u32)slot->overlayId);
    slot->loaded = 0;
    slot->overlayId = 0;
}
