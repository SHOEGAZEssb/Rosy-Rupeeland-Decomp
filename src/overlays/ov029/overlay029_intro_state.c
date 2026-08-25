#include "tingle/types.h"

/* Overlay 29 initial transition, selection, and overlay-2 handoff state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14[];
extern void *gDebugFont;
extern void *gHeapContext;
extern void *gGamePhaseCurrencyHud;
extern const u8 data_ov029_021fed20[];
extern const s32 data_ov029_021fec70[];
extern const s32 data_ov029_021fec28[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern s32 GamePhaseCurrencyHud_GetCurrency(const void *);
extern void GamePhaseCurrencyHud_SetVisible(void *, s32);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void func_02092260(void *, s32);
extern void DisplayBrightness_StartMaskedTransitions(s32, s32);
extern void *func_ov000_021fb6e0(void *, void *, s32);
extern void func_ov002_021fbdc0(void *);
extern s32 func_ov002_021fbe08(void *);
extern s32 func_ov002_021fbe60(void *);
extern void func_ov029_021fce4c(void *, s32, s32);
extern void func_ov029_021fd644(void *);
extern void func_ov029_021fd6fc(void *);
extern void func_ov029_021fd7a8(void *, s32);
extern s32 func_ov029_021fd850(void *);
extern s32 func_ov045_0220c9e8(s32, s32);
extern void Overlay045_DrawSelectorPreview(s32, s32);
#ifdef __cplusplus
}
#endif

static void Overlay029_NextPhase(void *state)
{
    FIELD(s32, state, 4)++;
    FIELD(s32, state, 8) = 0;
}

/*
 * Runs the five-phase introductory state. Phase 0 commits both fonts, positions
 * and enables global context UI, binds the debug font/manager, updates the
 * external display, sets low scene bit 1, and advances. Phase 1 waits for the
 * transition, acquires external handle +0x70, plays event 0x6D for source value
 * +0x58==5 or 0x69 otherwise, and either takes a special mode-4/context path
 * selecting entry 6/callback pair 0x021FEC70 or selects entry zero and advances.
 * Phase 2 waits for controller input, then fades out. Phase 3 allocates and
 * starts a 0xB4-byte overlay-2 child +0xA8, switches graphics, and fades in.
 * Phase 4 waits for child and fade completion, then plays event 0x3C84, clears
 * scroll +0xE0, and installs callback pair 0x021FEC28; while waiting it stores
 * the negated child offset at +0xE0. The common runtime update always runs and
 * zero is returned. Fonts, transitions, audio, heap, overlays, and graphics
 * SDK state may change.
 */
extern "C" s32 func_ov029_021fd9e0(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14[0]);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        FIELD(u16, gGamePhaseCurrencyHud, 0xbc) = 0xfa;
        FIELD(u16, gGamePhaseCurrencyHud, 0xbe) = 0x1e;
        GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud, 1);
        GraphicsSpriteRenderer_SetFontResource(gDebugFont, FIELD(void *, state, 0x78));
        Overlay045_DrawSelectorPreview(FIELD(s32, state, 0x54), FIELD(s32, state, 0x58));
        FIELD(u32, state, 0x20) = (FIELD(u32, state, 0x20) & ~1u) | 1;
        Overlay029_NextPhase(state);
        break;
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() == 0)
            break;
        FIELD(s32, state, 0x70) = func_ov045_0220c9e8(
            FIELD(s32, state, 0x54), FIELD(s32, state, 0x58));
        func_02092260(state, FIELD(s32, state, 0x58) == 5 ? 0x6d : 0x69);
        if (FIELD(s32, state, 0x5c) == 4 &&
            GamePhaseCurrencyHud_GetCurrency(gGamePhaseCurrencyHud) == 1) {
            FIELD(s32, state, 0x6c) = 0;
            func_ov029_021fd7a8(state, 6);
            func_ov029_021fce4c(state,
                                data_ov029_021fec70[0],
                                data_ov029_021fec70[1]);
            break;
        }
        func_ov029_021fd7a8(state, 0);
        Overlay029_NextPhase(state);
        break;
    case 2:
        if (func_ov029_021fd850(state) != 0) {
            DisplayBrightness_StartMaskedTransitions(1, -0x10);
            Overlay029_NextPhase(state);
        }
        break;
    case 3:
        if (DisplayBrightness_IsMainTransitionComplete() == 0)
            break;
        {
            void *child = Heap_Alloc(0xb4, data_ov029_021fed20,
                                     4, gHeapContext);
            if (child != 0)
                child = func_ov000_021fb6e0(child, data_020f4e14[0], 0);
            FIELD(void *, state, 0xa8) = child;
        }
        func_ov029_021fd644(state);
        DisplayBrightness_StartMaskedTransitions(1, 0);
        func_ov002_021fbdc0(FIELD(void *, state, 0xa8));
        Overlay029_NextPhase(state);
        break;
    case 4:
        if (func_ov002_021fbe08(FIELD(void *, state, 0xa8)) != 0 &&
            DisplayBrightness_IsMainTransitionComplete() != 0) {
            func_02092260(state, 0x3c84);
            FIELD(s32, state, 0xe0) = 0;
            func_ov029_021fce4c(state,
                                data_ov029_021fec28[0],
                                data_ov029_021fec28[1]);
        } else {
            FIELD(s32, state, 0xe0) =
                -func_ov002_021fbe60(FIELD(void *, state, 0xa8));
        }
        break;
    }
    func_ov029_021fd6fc(state);
    return 0;
}
