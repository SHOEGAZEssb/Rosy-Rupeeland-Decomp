#include "tingle/types.h"

/*
 * Overlay 5 presentation destruction. This recovered non-deleting destructor
 * releases the presentation's controller, context, scene, helper, and resource
 * while restoring sub-display hardware state.
 */

typedef struct Overlay005Presentation {
    u8 bytes[0x84];
} Overlay005Presentation;

typedef void (*Overlay005VirtualRelease)(void *object);

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_ov005_021fcad4[];
extern void func_0207419c(void *context);
extern void func_020280d8(void *object);
extern void Heap_Free(void *memory);
extern void *func_ov005_021fbb78(void *scene);
extern void func_020925dc(s32 value);
extern void func_02071eb8(void *resource);
#ifdef __cplusplus
}
#endif

/* Invoke the confirmed controller vtable slot at +0x04. */
static void overlay005_release_controller(void *controller)
{
    void *vtable = FIELD(void *, controller, 0x00);
    Overlay005VirtualRelease release =
        FIELD(Overlay005VirtualRelease, vtable, 0x04);

    release(controller);
}

/*
 * Restore data_ov005_021fcad4 as the vtable and clear +0x20 bit 10. Invoke
 * controller +0x64's vtable slot +0x04 when non-null, release context +0x60,
 * and for auxiliary +0x78 call func_020280d8 then Heap_Free. For scene +0x74,
 * call func_ov005_021fbb78 then Heap_Free. Submit zero to func_020925dc, clear
 * the halfword at sub BLDCNT 0x04001050, clear bits 13..15 in sub DISPCNT
 * 0x04001000, destroy resource +0x54, and return state. The state object itself
 * is not freed. Ownership order and MMIO effects are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay005Presentation *func_ov005_021fc110(Overlay005Presentation *state)
{
    void *object;

    FIELD(const void *, state, 0x000) = data_ov005_021fcad4;
    FIELD(u32, state, 0x020) &= ~0x400;
    object = FIELD(void *, state, 0x064);
    if (object != 0) {
        overlay005_release_controller(object);
    }
    func_0207419c(FIELD(void *, state, 0x060));
    object = FIELD(void *, state, 0x078);
    if (object != 0) {
        func_020280d8(object);
        Heap_Free(object);
    }
    object = FIELD(void *, state, 0x074);
    if (object != 0) {
        func_ov005_021fbb78(object);
        Heap_Free(object);
    }
    func_020925dc(0);
    *(volatile u16 *)0x04001050 = 0;
    *(volatile u32 *)0x04001000 &= ~0xe000;
    func_02071eb8((u8 *)state + 0x54);
    return state;
}

#undef FIELD
