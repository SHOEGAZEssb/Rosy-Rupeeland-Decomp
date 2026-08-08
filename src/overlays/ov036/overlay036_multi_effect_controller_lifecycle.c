#include "tingle/types.h"

/* Overlay 36 multi-effect controller teardown and per-frame owned-list update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_022060ec[];
extern const u8 data_ov036_02205eac[];
extern void *data_020f4e18;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0205940c(void *context, s32 id, s32 value);
extern void func_02095308(void *list);
extern void func_02071e04(void *archive, void *resource);
extern void func_02077688(void *manager);
extern void func_020720d4(void *resourceSet);
extern void Heap_Free(void *allocation);
extern void func_02095360(void *list);
extern void func_020773a8(void *manager);
#ifdef __cplusplus
}
#endif

/*
 * Destroys a multi-effect controller without freeing it. Sound 0x1AE is
 * stopped/reset, lists +0x108/+0x118/+0x128 receive two-phase common teardown,
 * archive resources +0xF0/+0xF4 are released, the object reached through
 * manager +0xE8/+0 is released, and resource sets +0xDC/+0xCC are destroyed.
 * Returns controller; sound, list, archive, manager, and resource state change.
 */
extern "C" void *func_ov036_021ff5bc(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_022060ec;
    func_0205940c(gSoundContext, 0x1ae, 0);
    func_02095308((u8 *)controller + 0x108);
    func_02095308((u8 *)controller + 0x118);
    func_02095308((u8 *)controller + 0x128);
    func_02071e04(data_020f4e18, FIELD(void *, controller, 0xf0));
    func_02071e04(data_020f4e18, FIELD(void *, controller, 0xf4));
    func_02077688(FIELD(void *, FIELD(void *, controller, 0xe8), 0));
    FIELD(const void *, controller, 0x128) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x128);
    FIELD(const void *, controller, 0x118) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x118);
    FIELD(const void *, controller, 0x108) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x108);
    func_020720d4((u8 *)controller + 0xdc);
    func_020720d4((u8 *)controller + 0xcc);
    return controller;
}

/*
 * Fully deletes the controller by performing the same sound, list, archive,
 * manager, and resource teardown as func_ov036_021ff5bc, then freeing it.
 * Returns the now-invalid original pointer, matching the recovered ABI.
 */
extern "C" void *func_ov036_021ff680(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov036_022060ec;
    func_0205940c(gSoundContext, 0x1ae, 0);
    func_02095308((u8 *)controller + 0x108);
    func_02095308((u8 *)controller + 0x118);
    func_02095308((u8 *)controller + 0x128);
    func_02071e04(data_020f4e18, FIELD(void *, controller, 0xf0));
    func_02071e04(data_020f4e18, FIELD(void *, controller, 0xf4));
    func_02077688(FIELD(void *, FIELD(void *, controller, 0xe8), 0));
    FIELD(const void *, controller, 0x128) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x128);
    FIELD(const void *, controller, 0x118) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x118);
    FIELD(const void *, controller, 0x108) = data_ov036_02205eac;
    func_02095308((u8 *)controller + 0x108);
    func_020720d4((u8 *)controller + 0xdc);
    func_020720d4((u8 *)controller + 0xcc);
    Heap_Free(controller);
    return controller;
}

/*
 * Advances all three embedded object lists (+0x108/+0x118/+0x128) and manager
 * +0xE8 once. It returns nothing; child, list, and manager runtime state change.
 */
extern "C" void func_ov036_021ff74c(void *controller)
{
    func_02095360((u8 *)controller + 0x108);
    func_02095360((u8 *)controller + 0x118);
    func_02095360((u8 *)controller + 0x128);
    func_020773a8(FIELD(void *, controller, 0xe8));
}
