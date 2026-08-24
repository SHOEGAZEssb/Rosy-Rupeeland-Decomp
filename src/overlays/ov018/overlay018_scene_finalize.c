#include "tingle/types.h"

/* Overlay 18 raster-result upload and completion-transition callback. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_021052fc;
extern const s32 data_ov018_021ffc08[2];
extern const s32 data_ov018_021ffc30[2];
extern void *gDebugFont;
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02003e38(void *);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void GamePhaseCurrencyHud_SetVisible(void *, s32);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void func_020b1ccc(void *, s32, s32);
extern void func_020b1ff0(void *, s32, s32);
extern void *func_ov003_021fb804(void *);
extern void func_ov018_021fcf40(void *, s32, s32, s32);
extern void func_ov018_021fd788(void *);
extern void func_ov018_021fd90c(void *);
extern void func_ov018_021fdb7c(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Run the two-phase result-finalization callback selected by state +4. Phase 0
 * enables currency-HUD mode 1, commits two font/resource objects, sets global
 * scene flag bit 1 at data_021052FC+0x2F6C, converts raster object +0x190,
 * submits it with constants 0/0x600, flushes its 0x20-by-0x20 storage, frees
 * the temporary conversion, sets state flag bit 0, and advances. Phase 1 waits
 * for SDK readiness and sprite +0xD0 completion bit 0, converts that bit to bit
 * 1, restores the base animation, optionally runs dialog setup when mode +0x54
 * is one, and selects transition pair 0x021FFC30 or 0x021FFC08. Always run the
 * frame/UI synchronizer and return zero. Heap, graphics, sprite, scene, and SDK
 * state may change; no direct hardware access occurs.
 */
extern "C" s32 func_ov018_021fe6f0(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0: {
        GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud, 1);
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
        FIELD(u32, (u8 *)data_021052fc + 0x2000, 0xf6c) |= 2;

        void *temporary = func_ov003_021fb804(FIELD(void *, state, 0x190));
        func_020b1ccc(temporary, 0, 0x600);
        func_020b1ff0((u8 *)FIELD(void *, state, 0x190) + 4, 0x20, 0x20);
        func_02003e38(temporary);
        FIELD(u32, state, 0x20) |= 1;
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        break;
    }
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0 &&
            (FIELD(u16, FIELD(void *, state, 0xd0), 0x24) & 1)) {
            void *sprite = FIELD(void *, state, 0xd0);
            FIELD(u16, sprite, 0x24) |= 2;
            FIELD(u16, sprite, 0x24) &= ~1;
            func_ov018_021fdb7c(state, 0);
            if (FIELD(s32, state, 0x54) == 1) {
                func_ov018_021fd90c(state);
                func_ov018_021fcf40(state, data_ov018_021ffc30[0],
                                    data_ov018_021ffc30[1], 0);
            } else {
                func_ov018_021fcf40(state, data_ov018_021ffc08[0],
                                    data_ov018_021ffc08[1], 0);
            }
        }
        break;
    }
    func_ov018_021fd788(state);
    return 0;
}
