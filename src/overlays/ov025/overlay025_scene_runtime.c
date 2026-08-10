#include "tingle/types.h"

/* Overlay 25 modal overlay and choice-row helpers not yet selected for matching. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const s32 data_ov025_02202ccc[];
extern const u8 data_ov025_022033ac[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void func_02070e0c(void *, s32, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void GraphicsSpriteState_ReleaseFromGroup(void *);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern void *func_02092790(void *, s32);
extern void func_02095360(void *);
extern void func_02095820(void *, s32, s32);
extern void func_020958d8(void *);
extern void func_02095928(void *);
extern void func_02095940(void *);
extern void func_02095988(void *, s32);
extern void *func_020959d4(void *, s32, s32);
extern void func_02095bec(void *);
extern void func_02095c30(void *, s32);
extern void func_02095f48(void *, void *);
extern void func_ov025_021fdc60(void *, s32);
extern void func_ov094_022196e8(void *);
#ifdef __cplusplus
}
#endif

static void virtual_destroy(void *object)
{
    if (object) {
        typedef void (*Destructor)(void *);
        ((Destructor)FIELD(void *, FIELD(void *, object, 0), 4))(object);
    }
}

/*
 * Opens a 0x2D0-byte modal at +0x59C using `selection` and optional `payload`.
 * Touch mode becomes zero, related BG state is selected, scene display flag
 * bit 1 is enabled, and modal heap/UI state change. Returns void.
 */
extern "C" void func_ov025_02200224(void *scene, s32 selection, void *payload)
{
    func_02070e0c(func_02092790((u8 *)scene + 0x530, 0), 1, 0);
    void *modal = Heap_Alloc(0x2d0, data_ov025_022033ac, 4, gHeapContext);
    if (modal) modal = func_020959d4(modal, 0, 0);
    FIELD(void *, scene, 0x59c) = modal;
    if (payload) func_02095f48(modal, payload);
    func_02095c30(modal, selection);
    FIELD(u32, scene, 0x48) |= 2;
}

/*
 * Closes and virtually destroys optional modal +0x59C, clears its pointer and
 * scene display flag bit 1. Modal/heap/UI state may change; returns void.
 */
extern "C" void func_ov025_022002b0(void *scene)
{
    void *modal = FIELD(void *, scene, 0x59c);
    if (!modal) return;
    func_02095bec(modal);
    virtual_destroy(modal);
    FIELD(void *, scene, 0x59c) = 0;
    FIELD(u32, scene, 0x48) &= ~2u;
}

/*
 * Applies one of three recovered y-coordinate triplets selected by `layout` to
 * controller array +0x2F4, fixes x=212, selects animations 32/34/36, and shows
 * all controllers. Controller position/animation/visibility change.
 */
extern "C" void func_ov025_02200498(void *scene, s32 layout)
{
    const s32 *positions = data_ov025_02202ccc + layout * 3;
    for (s32 i = 0; i < 3; ++i) {
        void *controller = (u8 *)scene + 0x2f4 + i * 0xac;
        func_02095820(controller, 0xd4, (s16)positions[i]);
        func_02095988(controller, 0x20 + i * 2);
        func_02095928(controller);
    }
}
