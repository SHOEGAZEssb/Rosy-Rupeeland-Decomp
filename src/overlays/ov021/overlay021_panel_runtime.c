#include "tingle/types.h"

/* Overlay 21 auxiliary panel construction, saved-selection restoration, and frame update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_021e9ac0;
extern const u8 data_021f5ee8[];
extern const u8 data_ov021_02202fa0[];
extern const u8 data_ov021_02202fa8[];
extern u8 gHeapContext[];
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void OverlaySlot_LoadOverlay(void *, s32);
extern void GamePhaseCurrencyHud_Update(void *);
extern void func_02064d90(void *, s32);
extern void func_0206563c(void *, s32);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void Presentation_BlendPalette16(void *, void *, s32);
extern void InventoryScroll_UpdatePresentation(void *);
extern void func_020958d8(void *);
extern void func_020b1ff0(void *, s32, s32);
extern void func_020b2058(const void *, s32, s32);
extern void *func_ov000_021fbcc4(void *, void *);
extern void func_ov000_021fc164(void *);
extern void func_ov000_021fc59c(void *);
extern void func_ov000_021fc5ec(void *);
extern void *func_ov000_021fcab4(void *, s32);
extern void func_ov000_021fcae8(void *, void *, s32);
extern void func_ov000_021fcb64(void *, void *, s32);
extern void *func_ov001_021fbabc(void *, void *);
extern void func_ov001_021fbf7c(void *);
extern void func_ov001_021fc3b4(void *);
extern void func_ov001_021fc3dc(void *);
extern void *func_ov001_021fc7c0(void *, s32);
extern void func_ov001_021fca38(void *, void *, s32);
extern void func_ov001_021fcaac(void *, void *, s32);
extern void func_ov002_021fba00(void *);
extern void func_ov021_021fea50(void *, u32);
extern void func_ov045_0220b908(void *);
extern void func_ov045_0220c18c(void *);
#ifdef __cplusplus
}
#endif

/*
 * Lazily construct the overlay-0 panel at +0x354. Select global data for mode
 * +0x54, enable associated object +0x41C in mode zero, allocate/construct
 * 0x2B0 bytes, and scan every panel entry. The first entry with two nested
 * nonnull +0x0C links restores snapshot +0x35C; entries lacking the second link
 * receive flag one through 0x021FEA50. If saved index +0x374 and identity
 * +0x378 still match an entry, restore that snapshot explicitly. Apply snapshot
 * +0x35C, finalize the panel, and reset both saved fields to -1. Heap/panel/UI
 * state changes; returns void and performs no direct MMIO.
 */
extern "C" void func_ov021_021fe8e8(void *state)
{
    if (FIELD(void *, state, 0x354) == 0) {
        func_02064d90(data_021e9ac0, FIELD(s32, state, 0x54));
        OverlaySlot_LoadOverlay((u8 *)state + 0x41c, 0);
        void *panel = Heap_Alloc(0x2b0, data_ov021_02202fa0,
                                 4, gHeapContext);
        if (panel != 0)
            panel = func_ov000_021fbcc4(panel, data_020f4e14);
        FIELD(void *, state, 0x354) = panel;

        s32 restored = 0;
        s32 i;
        for (i = 0; i < FIELD(s32, panel, 0x254); i++) {
            void *entry = func_ov000_021fcab4(panel, i);
            void *first = FIELD(void *, entry, 0xc);
            if (first != 0) {
                if (FIELD(void *, first, 0xc) != 0) {
                    if (restored == 0) {
                        func_ov000_021fcb64(panel,
                                            (u8 *)state + 0x35c, i);
                        restored = 1;
                    }
                } else {
                    func_ov021_021fea50(entry, 1);
                }
            }
        }
        s32 saved = FIELD(s32, state, 0x374);
        if (saved >= 0) {
            void *entry = func_ov000_021fcab4(panel, saved);
            void *first = entry != 0 ? FIELD(void *, entry, 0xc) : 0;
            if (first != 0 &&
                FIELD(u16, first, 0) == FIELD(u16, state, 0x378)) {
                func_ov000_021fcb64(panel, (u8 *)state + 0x35c, saved);
            }
        }
        func_ov000_021fcae8(panel, (u8 *)state + 0x35c, 0);
        func_ov000_021fc59c(panel);
        func_ov000_021fc5ec(panel);
    }
    FIELD(s32, state, 0x374) = -1;
    FIELD(s32, state, 0x378) = -1;
}

/*
 * Lazily construct the overlay-1 panel at +0x358. Select its global data via
 * +0x34, enable associated object +0x41C in mode one, allocate/construct
 * 0x210 bytes, scan entries using the same nested-link rule, restore the first
 * valid snapshot into +0x368, and flag entries lacking their second link.
 * Preserve the original cross-panel saved-index check through overlay-0 panel
 * +0x354, then apply +0x368, finalize, and reset +0x374/+0x378 to -1.
 * Heap/panel/UI state changes; returns void and performs no direct MMIO.
 */
extern "C" void func_ov021_021feb60(void *state)
{
    if (FIELD(void *, state, 0x358) == 0) {
        func_0206563c((u8 *)data_021e9ac0 + 0x34,
                     FIELD(s32, state, 0x54));
        OverlaySlot_LoadOverlay((u8 *)state + 0x41c, 1);
        void *panel = Heap_Alloc(0x210, data_ov021_02202fa8,
                                 4, gHeapContext);
        if (panel != 0)
            panel = func_ov001_021fbabc(panel, data_020f4e14);
        FIELD(void *, state, 0x358) = panel;

        s32 restored = 0;
        s32 i;
        for (i = 0; i < FIELD(s32, panel, 0x1a4); i++) {
            void *entry = func_ov001_021fc7c0(panel, i);
            void *first = FIELD(void *, entry, 0xc);
            if (first != 0) {
                if (FIELD(void *, first, 0xc) != 0) {
                    if (restored == 0) {
                        func_ov001_021fcaac(panel,
                                            (u8 *)state + 0x368, i);
                        restored = 1;
                    }
                } else {
                    func_ov021_021fea50(entry, 1);
                }
            }
        }
        s32 saved = FIELD(s32, state, 0x374);
        if (saved >= 0) {
            void *primary = FIELD(void *, state, 0x354);
            void *entry = func_ov000_021fcab4(primary, saved);
            void *first = entry != 0 ? FIELD(void *, entry, 0xc) : 0;
            if (first != 0 &&
                FIELD(u16, first, 0) == FIELD(u16, state, 0x378)) {
                func_ov000_021fcb64(primary,
                                    (u8 *)state + 0x35c, saved);
            }
        }
        func_ov001_021fca38(panel, (u8 *)state + 0x368, 0);
        func_ov001_021fc3b4(panel);
        func_ov001_021fc3dc(panel);
    }
    FIELD(s32, state, 0x374) = -1;
    FIELD(s32, state, 0x378) = -1;
}

/*
 * Run the shared per-frame scene update: update the global currency HUD, the main
 * input helper +0xA0, both 0xAC-byte helpers, active-list controller/renderer,
 * optional dialog/panels, external object +0x3EC, and renderer +0x94. While the
 * tile-buffer blend timer +0x3F8 is below 16, increment it, interpolate
 * +0x3F0->+0x3F4, clear data_021F5EE8, and when no auxiliary panel is active
 * submit that buffer at scale 0x100. UI/resource/graphics state changes;
 * returns void and performs no direct MMIO.
 */
extern "C" void func_ov021_021feea4(void *state)
{
    GamePhaseCurrencyHud_Update(gGamePhaseCurrencyHud);
    func_020958d8((u8 *)state + 0xa0);
    s32 i;
    for (i = 0; i < 2; i++)
        func_020958d8((u8 *)state + 0x14c + i * 0xac);

    void *list = FIELD(void *, state, 0x2c0);
    if (list != 0) {
        InventoryScroll_UpdatePresentation(FIELD(void *, list, 0x58));
        GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, list, 0x1c));
    }
    if (FIELD(void *, state, 0x38c) != 0)
        func_ov045_0220c18c(FIELD(void *, state, 0x38c));
    if (FIELD(void *, state, 0x390) != 0)
        func_ov002_021fba00(FIELD(void *, state, 0x390));
    void *object = FIELD(void *, state, 0x384);
    if (object != 0) {
        typedef void (*Update)(void *);
        FIELD(Update *, object, 0)[2](object);
    }
    if (FIELD(void *, state, 0x354) != 0)
        func_ov000_021fc164(FIELD(void *, state, 0x354));
    if (FIELD(void *, state, 0x358) != 0)
        func_ov001_021fbf7c(FIELD(void *, state, 0x358));
    func_ov045_0220b908(FIELD(void *, state, 0x3ec));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0x94));

    s32 timer = FIELD(s32, state, 0x3f8);
    if (timer < 0x10) {
        timer++;
        FIELD(s32, state, 0x3f8) = timer;
        Presentation_BlendPalette16(FIELD(void *, state, 0x3f0),
                      FIELD(void *, state, 0x3f4), timer);
        func_020b1ff0((void *)data_021f5ee8, 0, 0x20);
        if (FIELD(void *, state, 0x390) == 0 &&
            FIELD(void *, state, 0x354) == 0 &&
            FIELD(void *, state, 0x358) == 0) {
            func_020b2058(data_021f5ee8, 0x100, 0x20);
        }
    }
}
