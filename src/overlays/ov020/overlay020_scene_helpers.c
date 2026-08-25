#include "tingle/types.h"

/* Overlay 20 record initialization, UI lifecycle, selection dispatch, and display callbacks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_Destroy(void *);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void TitleCharacterResourceCollection_Destroy(void *);
extern void InventoryScroll_UpdatePresentation(void *);
extern void SpriteMotionController_Update(void *);
extern s32 func_ov020_021fd44c(void *, void *, void *);
#ifdef __cplusplus
}
#endif

/* Clear words +0/+4 and halfwords +8/+A. Returns void; only caller memory changes. */
extern "C" void func_ov020_021fce00(void *record)
{
    FIELD(s32, record, 0) = 0;
    FIELD(s32, record, 4) = 0;
    FIELD(u16, record, 8) = 0;
    FIELD(u16, record, 0xa) = 0;
}

/* No-op virtual hook: accepts state and returns void without state, SDK, or hardware effects. */
extern "C" void func_ov020_021fd034(void *state)
{
    (void)state;
}

/*
 * Store four caller layout words at object +0xA4/+0xA8/+0xAC/+0xB0. Returns
 * void; only caller memory changes and no SDK or hardware effects occur.
 */
extern "C" void func_ov020_021fd308(void *object, s32 valueA4, s32 valueA8,
                                     s32 valueAC, s32 valueB0)
{
    FIELD(s32, object, 0xa4) = valueA4;
    FIELD(s32, object, 0xa8) = valueA8;
    FIELD(s32, object, 0xac) = valueAC;
    FIELD(s32, object, 0xb0) = valueB0;
}

/* Invoke virtual destructor slot +4 when the optional object is present. */
static void destroyVirtual(void *object)
{
    if (object != 0) {
        typedef void (*Destructor)(void *);
        FIELD(Destructor *, object, 0)[1](object);
    }
}

/*
 * Destroy optional object +0x4C through its virtual slot +4, release renderer
 * +0xC, tear down manager +0x28, then destroy resource controllers +0x1C and
 * +0x10. Return state without freeing it. UI/resource/SDK ownership changes;
 * no direct hardware access occurs.
 */
extern "C" void *func_ov020_021fd404(void *state)
{
    destroyVirtual(FIELD(void *, state, 0x4c));
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0xc));
    TitleCharacterResourceCollection_Destroy((u8 *)state + 0x28);
    AnimationResourceState_Destroy((u8 *)state + 0x1c);
    AnimationResourceState_Destroy((u8 *)state + 0x10);
    return state;
}

/* No-op scene callback: accepts state and returns void without state, SDK, or hardware effects. */
extern "C" void func_ov020_021fd818(void *state)
{
    (void)state;
}

/*
 * Store caller transition values at +0x24/+0x28 and clear phase/timer +4/+8;
 * the fourth register argument is unused. Returns void; only caller memory
 * changes and no SDK or hardware effects occur.
 */
extern "C" void func_ov020_021fd81c(void *state, s32 value24, s32 value28,
                                     s32 unused)
{
    (void)unused;
    FIELD(s32, state, 0x24) = value24;
    FIELD(s32, state, 0x28) = value28;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 8) = 0;
}

/*
 * Update embedded UI +0x70, update optional selected-provider object +0x1DC/+0x44,
 * then update renderer +0x6C. Returns void. UI/renderer SDK state may change;
 * no direct hardware access occurs.
 */
extern "C" void func_ov020_021fde6c(void *state)
{
    SpriteMotionController_Update((u8 *)state + 0x70);
    if (FIELD(void *, state, 0x1dc) != 0)
        InventoryScroll_UpdatePresentation(FIELD(void *, FIELD(void *, state, 0x1dc), 0x44));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0x6c));
}

/*
 * Clear sprite +0x11C flag bit 2, set its X halfword +0x2C to 0x84, and set Y
 * +0x2E to 24 times the selected provider record's (+0x14 - +0x0C) plus 30.
 * Returns void; sprite memory changes and no SDK or hardware effects occur.
 */
extern "C" void func_ov020_021fde9c(void *state)
{
    void *sprite = FIELD(void *, state, 0x11c);
    void *selected = FIELD(void *, FIELD(void *, state, 0x1dc), 0x44);
    FIELD(u16, sprite, 0x24) &= ~4;
    FIELD(u16, sprite, 0x2c) = 0x84;
    FIELD(u16, sprite, 0x2e) =
        (FIELD(s32, selected, 0x14) - FIELD(s32, selected, 0xc)) * 0x18 +
        0x1e;
}

/*
 * Select state pointer-array entry +0x124 using provider +0x1DC/+0x44 index
 * +0x14, then tail-dispatch 0x021FD44C with control +0x1E0, that entry, and
 * state. Return the callee result. Callee-owned scene/UI state may change; this
 * wrapper performs no direct hardware access.
 */
extern "C" s32 func_ov020_021fdee0(void *state)
{
    void *selected = FIELD(void *, FIELD(void *, state, 0x1dc), 0x44);
    void *entry = FIELD(void *, state, 0x124 + FIELD(s32, selected, 0x14) * 4);
    return func_ov020_021fd44c(FIELD(void *, state, 0x1e0), entry, state);
}

/*
 * Run scene/UI update 0x021FDE6C and return one. UI/renderer SDK state may
 * change; no direct hardware access occurs.
 */
extern "C" s32 func_ov020_021fe3e4(void *state)
{
    func_ov020_021fde6c(state);
    return 1;
}

/*
 * When scene flag bit 10 is set, replace main and sub display-control bits
 * 8..12 with state +0x48/+0x4C respectively. Always return zero. This directly
 * writes Nintendo DS DISPCNT/DISPCNT_SUB; caller memory and SDK state are read
 * only.
 */
extern "C" s32 func_ov020_021fe3f4(void *state)
{
    if (FIELD(u32, state, 0x20) & 0x400) {
        volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
        volatile u32 *subDisplay = (volatile u32 *)0x04001000;
        *mainDisplay = (*mainDisplay & ~0x1f00U) |
                       (FIELD(u32, state, 0x48) << 8);
        *subDisplay = (*subDisplay & ~0x1f00U) |
                      (FIELD(u32, state, 0x4c) << 8);
    }
    return 0;
}
