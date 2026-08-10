#include "tingle/types.h"

/* Overlay 18 per-frame UI animation, actor-sprite synchronization, renderer offsets, and debug overlay. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021052fc;
extern void *data_021f3ecc;
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void GamePhaseRuntime_UpdateActorPresentationState(void *, s32);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern s32 GraphicsSpriteRenderer_DrawText(void *, void *, s32, s32, s32, s32, s32);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern void *func_020791e0(void *, u16);
extern void func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
extern void func_020958d8(void *);
extern void func_02095928(void *);
extern void func_02095940(void *);
#ifdef __cplusplus
}
#endif

/*
 * Unless mode +0x54 equals one, hold UI object +0xD8 stopped for 16 frames via
 * counter +0x414, then start it; always update the object. Advance global scene
 * mode 2, mirror signed actor-data halfwords +0x2C/+0x2E from actor +0x184/+0x54
 * into sprite +0xD0, and submit renderers +0xC4/+0xC8. Apply negative camera
 * offsets +0x5C/+0x60 to renderer +0xCC and submit it. When +0x400 is nonzero,
 * update/toggle timer +0x3E0 and flag +0x3FC; the set branch prepares debug font
 * state and draws localized message 0x319 at (0,0), while the clear branch calls
 * the alternate debug-font helper. Returns void. UI, actor-sprite, renderer,
 * timer, and debug-font SDK state change; no direct MMIO occurs.
 */
extern "C" void func_ov018_021fd788(void *state)
{
    if (FIELD(s32, state, 0x54) != 1) {
        if (FIELD(s32, state, 0x414) < 0x10) {
            func_02095940((u8 *)state + 0xd8);
            FIELD(s32, state, 0x414)++;
        } else {
            func_02095928((u8 *)state + 0xd8);
        }
    }
    func_020958d8((u8 *)state + 0xd8);
    GamePhaseRuntime_UpdateActorPresentationState(data_021052fc, 2);

    {
        void *actorData = FIELD(void *, FIELD(void *, state, 0x184), 0x54);
        void *sprite = FIELD(void *, state, 0xd0);
        FIELD(u16, sprite, 0x2c) = FIELD(u16, actorData, 0x2c);
        FIELD(u16, sprite, 0x2e) = FIELD(u16, actorData, 0x2e);
    }
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0xc4));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0xc8));
    FIELD(s32, FIELD(void *, state, 0xcc), 0x18) =
        -FIELD(s32, state, 0x5c);
    FIELD(s32, FIELD(void *, state, 0xcc), 0x1c) =
        -FIELD(s32, state, 0x60);
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0xcc));

    if (FIELD(s32, state, 0x400) != 0) {
        if (func_02091c7c((u8 *)state + 0x3e0, 2)) {
            func_02091b98((u8 *)state + 0x3e0, 0x3c);
            FIELD(s32, state, 0x3fc) = !FIELD(s32, state, 0x3fc);
        }
        if (FIELD(s32, state, 0x3fc) != 0) {
            GraphicsSpriteRenderer_SetFontResource(gDebugFont, (u8 *)state + 0x70);
            GraphicsSpriteRenderer_DrawText(gDebugFont,
                          func_020791e0(data_021f3ecc, 0x319),
                          0, 0, 0xb, 8, -2);
        } else {
            GraphicsSpriteCanvas_FillRect(gDebugFont, 0, 0, 0xff, 0xf, 0);
        }
    }
}
