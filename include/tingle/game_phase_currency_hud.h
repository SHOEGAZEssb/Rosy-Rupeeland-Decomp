#ifndef TINGLE_GAME_PHASE_CURRENCY_HUD_H
#define TINGLE_GAME_PHASE_CURRENCY_HUD_H

#include "tingle/graphics_sprite_create.h"

typedef struct CurrencyHudResource {
    const void *vtable;
    GraphicsSpriteSource3 source;
} CurrencyHudResource;

/* Two-screen sprite composition that displays the player's stored currency. */
typedef struct GamePhaseCurrencyHud {
    GraphicsSpriteGroup *groups[2];
    CurrencyHudResource resources[4];
    GraphicsSpriteState *digits[2][7];
    GraphicsSpriteState *marker[2];
    GraphicsSpriteState *backdrop[2];
    GraphicsSpriteState *ornaments[2][4];
    u16 field_b0;
    u16 field_b2;
    u16 field_b4;
    u16 field_b6;
    u16 field_b8;
    u16 field_ba;
    s16 width_bc;
    s16 height_be;
    u32 displayedValue_c0;
    u32 targetValue_c4;
    u32 field_c8;
    u16 field_cc;
    u16 field_ce;
} GamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
CurrencyHudResource *func_02010854(CurrencyHudResource *self);
GamePhaseCurrencyHud *func_02010878(GamePhaseCurrencyHud *self);
u32 func_02010b64(void);
void func_02010b78(GamePhaseCurrencyHud *self, s32 value);
void func_02010c00(GamePhaseCurrencyHud *self, s32 delta,
                   s32 forcedDuration);
void func_02010e68(GamePhaseCurrencyHud *self);
void func_020112f0(GamePhaseCurrencyHud *self, u32 value);
void func_0201140c(GamePhaseCurrencyHud *self, s32 visible);
#ifdef __cplusplus
}
#endif

#endif
