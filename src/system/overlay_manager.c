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

extern OverlaySlot *func_02006268(OverlaySlot *slot);
extern OverlaySlot *func_02006280(OverlaySlot *slot);
extern void func_020062a0(OverlaySlot *slot, int overlayId);
extern void func_020062f8(OverlaySlot *slot);
extern void OS_Halt(void);
extern void __register_global_object(void *object, void *destructor,
                                     void *record);

#ifdef __cplusplus
}
#endif

OverlayManagerGlobal data_020f43ac;

/* Initialize all four independent overlay slots and return the manager. */
OverlayManager *func_020021d0(OverlayManager *manager)
{
    func_02006268(&manager->slots[0]);
    func_02006268(&manager->slots[1]);
    func_02006268(&manager->slots[2]);
    func_02006268(&manager->slots[3]);
    return manager;
}

/* Destroy the four slots in reverse order, unloading any active overlays. */
OverlayManager *func_020021fc(OverlayManager *manager)
{
    func_02006280(&manager->slots[3]);
    func_02006280(&manager->slots[2]);
    func_02006280(&manager->slots[1]);
    func_02006280(&manager->slots[0]);
    return manager;
}

/*
 * Load an overlay into the selected slot. The slot helper unloads a previous
 * occupant first and performs the CheckedFS/NitroSDK transaction. Retail
 * treats a slot index outside 0..3 as fatal and enters OS_Halt.
 */
void func_0200222c(OverlayManager *manager, int slotIndex, int overlayId)
{
    switch (slotIndex) {
    case 0:
        func_020062a0(&manager->slots[0], overlayId);
        return;
    case 1:
        func_020062a0(&manager->slots[1], overlayId);
        return;
    case 2:
        func_020062a0(&manager->slots[2], overlayId);
        return;
    case 3:
        func_020062a0(&manager->slots[3], overlayId);
        return;
    }

    OS_Halt();
}

/* Unload the selected slot; an out-of-range index has no observable effect. */
void func_02002290(OverlayManager *manager, int slotIndex)
{
    switch (slotIndex) {
    case 0:
        func_020062f8(&manager->slots[0]);
        return;
    case 1:
        func_020062f8(&manager->slots[1]);
        return;
    case 2:
        func_020062f8(&manager->slots[2]);
        return;
    case 3:
        func_020062f8(&manager->slots[3]);
        return;
    }
}

/*
 * Lazily construct the process-global manager and register its reverse-order
 * slot destructor with the Metrowerks runtime. The guard is not synchronized.
 */
OverlayManager *func_020022dc(void)
{
    if ((data_020f43ac.guard & 1) == 0) {
        func_020021d0(&data_020f43ac.manager);
        __register_global_object(&data_020f43ac.manager,
                                 (void *)func_020021fc,
                                 data_020f43ac.destructorRecord);
        data_020f43ac.guard |= 1;
    }
    return &data_020f43ac.manager;
}
