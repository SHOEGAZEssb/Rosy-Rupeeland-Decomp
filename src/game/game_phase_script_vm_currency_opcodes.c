#include "tingle/game_phase_currency_hud.h"
#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that change or directly set the player's currency HUD value. */

/*
 * Pop a signed currency delta, apply it through GamePhaseCurrencyHud_AddCurrency with no forced
 * duration, and return zero. This also has the GameWork, HUD, sound, and
 * threshold effects documented by GamePhaseCurrencyHud_AddCurrency.
 */
s32 GamePhaseActorScriptVm_AddCurrency(GamePhaseActorScriptVm *self)
{
    s32 delta = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseCurrencyHud_AddCurrency(gGamePhaseCurrencyHud, delta, 0);
    return 0;
}

/*
 * Pop a currency value, set it through GamePhaseCurrencyHud_SetCurrency, and return zero. The
 * callee updates GameWork and refreshes the HUD subject to its actor guard.
 */
s32 GamePhaseActorScriptVm_SetCurrency(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseCurrencyHud_SetCurrency(gGamePhaseCurrencyHud, value);
    return 0;
}

/*
 * Pop height, width, and visibility values; apply visibility through
 * GamePhaseCurrencyHud_SetVisible; store the two dimensions in HUD halfwords 0xbc/0xbe; and
 * return zero.
 */
s32 GamePhaseActorScriptVm_SetCurrencyHudVisibleAndPosition(GamePhaseActorScriptVm *self)
{
    s32 baseY = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 baseX = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 visible = (s32)GamePhaseScriptVm_Pop(&self->base);
    GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud, visible);
    gGamePhaseCurrencyHud->baseX = (s16)baseX;
    gGamePhaseCurrencyHud->baseY = (s16)baseY;
    return 0;
}

/* Read the current GameWork currency, store it as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_GetCurrency(GamePhaseActorScriptVm *self)
{
    s32 value = GamePhaseCurrencyHud_GetCurrency(gGamePhaseCurrencyHud);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, value);
    return 0;
}
