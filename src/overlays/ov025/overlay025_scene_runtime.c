#include "tingle/types.h"

/* Overlay 25 frame maintenance, modal overlay, transient sprite, and choice-row helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const s32 data_ov025_02202ccc[];
extern const u8 data_ov025_022033ac[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void func_02070e0c(s32, s32, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void func_02073ef8(void *);
extern void *func_02073ffc(void *, void *, s32);
extern void func_020740a4(void *);
extern void func_02076428(void *, s32, s32, s32, s32, s32);
extern void func_02092790(void *, s32);
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
 * Performs one maintenance frame for overlay-94 +0x5C0, callback holder +0x4F8,
 * three standalone controllers, three array controllers, both sprite owners,
 * and optional name-entry owner +0x598. Graphics/UI state changes; returns void.
 */
extern "C" void func_ov025_02200178(void *scene)
{
    func_ov094_022196e8(FIELD(void *, scene, 0x5c0));
    func_02095360((u8 *)scene + 0x4f8);
    func_020958d8((u8 *)scene + 0xf0);
    func_020958d8((u8 *)scene + 0x19c);
    func_020958d8((u8 *)scene + 0x248);
    for (s32 i = 0; i < 3; ++i)
        func_020958d8((u8 *)scene + 0x2f4 + i * 0xac);
    func_020740a4(FIELD(void *, scene, 0xb0));
    func_020740a4(FIELD(void *, scene, 0xb4));
    if (FIELD(void *, scene, 0x598))
        func_020740a4(FIELD(void *, FIELD(void *, scene, 0x598), 0));
}

/* Redraws all three record widgets +0xE4/+0xE8/+0xEC at zero offset. */
extern "C" void func_ov025_022001f4(void *scene)
{
    for (s32 i = 0; i < 3; ++i)
        func_ov025_021fdc60(FIELD(void *, scene, 0xe4 + i * 4), 0);
}

/*
 * Opens a 0x2D0-byte modal at +0x59C using `selection` and optional `payload`.
 * Touch mode becomes zero, related BG state is selected, scene display flag
 * bit 1 is enabled, and modal heap/UI state change. Returns void.
 */
extern "C" void func_ov025_02200224(void *scene, s32 selection, void *payload)
{
    func_02092790((u8 *)scene + 0x530, 0);
    func_02070e0c(1, 1, 0);
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
 * Switches touch mode to one, creates transient sprite +0xB8 with animation 1
 * at (56,68), clears recovered font rectangle (48,64)..(208,96), and enables
 * scene display flag bit 1. Sprite/font/touch state change; returns void.
 */
extern "C" void func_ov025_022002f8(void *scene)
{
    func_02092790((u8 *)scene + 0x530, 1);
    func_02070e0c(1, 1, 0);
    void *sprite = func_02073ffc(FIELD(void *, scene, 0xb0),
                                  (u8 *)scene + 0x68, 2);
    FIELD(void *, scene, 0xb8) = sprite;
    func_02073e48(sprite, 1, 0x38, 0x44, 0, 0, 2);
    func_02076428(data_020f4e14, 0x30, 0x40, 0xd0, 0x60, 0);
    FIELD(u32, scene, 0x48) |= 2;
}

/*
 * Variant transient-sprite setup. It selects caller-supplied touch `mode`,
 * creates +0xB8 with animation `animation` at (57,60), clears rectangle
 * (48,56)..(208,128), and enables display flag bit 1.
 */
extern "C" void func_ov025_02200398(void *scene, s32 mode, s32 animation)
{
    func_02092790((u8 *)scene + 0x530, mode);
    func_02070e0c(1, 1, 0);
    void *sprite = func_02073ffc(FIELD(void *, scene, 0xb0),
                                  (u8 *)scene + 0x68, 2);
    FIELD(void *, scene, 0xb8) = sprite;
    func_02073e48(sprite, animation, 0x39, 0x3c, 0, 0, 2);
    func_02076428(data_020f4e14, 0x30, 0x38, 0xd0, 0x80, 0);
    FIELD(u32, scene, 0x48) |= 2;
}

/*
 * Destroys transient sprite +0xB8 and clears its pointer. When `clear_mode` is
 * nonzero, scene display flag bit 1 is also cleared. Sprite/display state changes.
 */
extern "C" void func_ov025_02200438(void *scene, s32 clear_mode)
{
    func_02073ef8(FIELD(void *, scene, 0xb8));
    FIELD(void *, scene, 0xb8) = 0;
    if (clear_mode) FIELD(u32, scene, 0x48) &= ~2u;
}

/* Clears transient sprite +0xB8 selection flag bit 1 when the sprite exists. */
extern "C" void func_ov025_02200468(void *scene)
{
    if (FIELD(void *, scene, 0xb8))
        FIELD(u16, FIELD(void *, scene, 0xb8), 0x24) &= (u16)~2;
}

/* Returns transient sprite completion flag bit 0, or one when +0xB8 is null. */
extern "C" s32 func_ov025_02200480(void *scene)
{
    void *sprite = FIELD(void *, scene, 0xb8);
    return sprite ? (FIELD(u16, sprite, 0x24) & 1) : 1;
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
