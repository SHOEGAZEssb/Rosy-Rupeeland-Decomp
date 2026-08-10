#include "tingle/types.h"

/* Overlay 36 orbit-controller list, manager, and resource-set teardown. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02206060[];
extern const u8 data_ov036_02205eac[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095308(void *list);
extern void Graphics3DResourceOwner_RemoveManager(void *manager);
extern void func_020720d4(void *resourceSet);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Destroys an orbit controller without freeing it. List +0x11C receives the
 * recovered two-phase common teardown, the object reached through manager
 * +0x100/+0 is released, and resource sets +0xF4/+0xE8/+0xDC/+0xCC are
 * destroyed in that order. Returns controller; list, manager, and resource
 * ownership state change.
 */
extern "C" void *func_ov036_022008e8(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02206060;
    func_02095308((u8 *)controller + 0x11c);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0x100), 0));
    FIELD(const void *, controller, 0x11c) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x11c);
    func_020720d4((u8 *)controller + 0xf4);
    func_020720d4((u8 *)controller + 0xe8);
    func_020720d4((u8 *)controller + 0xdc);
    func_020720d4((u8 *)controller + 0xcc);
    return controller;
}

/*
 * Fully deletes the orbit controller by performing the same list, manager,
 * and resource teardown as func_ov036_022008e8, then freeing it. Returns the
 * now-invalid original pointer, matching the recovered ABI.
 */
extern "C" void *func_ov036_0220094c(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_02206060;
    func_02095308((u8 *)controller + 0x11c);
    Graphics3DResourceOwner_RemoveManager(FIELD(void *, FIELD(void *, controller, 0x100), 0));
    FIELD(const void *, controller, 0x11c) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x11c);
    func_020720d4((u8 *)controller + 0xf4);
    func_020720d4((u8 *)controller + 0xe8);
    func_020720d4((u8 *)controller + 0xdc);
    func_020720d4((u8 *)controller + 0xcc);
    Heap_Free(controller);
    return controller;
}
