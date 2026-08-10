#include "tingle/game_phase_currency_hud.h"
#include "tingle/game_work.h"

/* Initialize the two-screen currency HUD, its resources, and all sprite rows. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;
extern void func_02071e90(void *state);
extern void func_02071ee0(void *state, void *manager, void *resource0,
                          void *resource1, void *resource2);
extern void GamePhaseCurrencyHud_UpdateDigits(GamePhaseCurrencyHud *self, u32 value);
extern void GamePhaseCurrencyHud_SetVisible(GamePhaseCurrencyHud *self, s32 value);
#ifdef __cplusplus
}
#endif

/* Initialize an unbound animation-resource wrapper and return it. */
AnimationResource *AnimationResource_InitEmpty(AnimationResource *self)
{
    func_02071e90(&self->entries[0]);
    self->vtable = &data_020d4178;
    return self;
}

/*
 * Initialize four resource descriptors, create one sprite group for each DS
 * display, load resource ranges 0x329e-0x32ad, and construct seven digit
 * sprites plus six auxiliary sprites per display. Digit x positions step left
 * by 16 pixels with extra four-pixel gaps after indices 2 and 5. Initializes
 * the off-screen base position to (256, 192), copies the current currency into
 * both tracked values, refreshes the digits, and returns self. Resource and sprite-manager
 * state changes through the graphics helpers; no hardware register is touched.
 */
GamePhaseCurrencyHud *GamePhaseCurrencyHud_Init(GamePhaseCurrencyHud *self)
{
    s32 display;
    s32 digit;

    for (display = 0; display < 4; display++)
        AnimationResource_InitEmpty(&self->resources[display]);
    self->flags = 1;
    self->transitionState = 0;
    self->transitionTimer = 0;
    self->ornamentSpawnTimer = 0;
    self->nextOrnamentIndex = 0;
    self->soundCooldown = 0;
    self->thresholdReminderTimer = 30;
    self->thresholdReminderCount = 0;
    self->groups[0] = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    self->groups[1] = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    self->baseX = 0x100;
    self->baseY = 0xc0;
    for (display = 0; display < 2; display++) {
        self->groups[display]->field_18 = self->baseX;
        self->groups[display]->field_1c = self->baseY;
    }

    func_02071ee0(&self->resources[0].entries[0], data_020f4e18,
                  (void *)0x32a7, (void *)0x32a8, (void *)0x32a9);
    func_02071ee0(&self->resources[1].entries[0], data_020f4e18,
                  (void *)0x32ac, (void *)0x32a8, (void *)0x32ad);
    func_02071ee0(&self->resources[2].entries[0], data_020f4e18,
                  (void *)0x32aa, (void *)0x32a8, (void *)0x32ab);
    func_02071ee0(&self->resources[3].entries[0], data_020f4e18,
                  (void *)0x329e, (void *)0x329f, (void *)0x32a0);

    for (display = 0; display < 2; display++) {
        s16 x = 0;
        for (digit = 0; digit < 7; digit++) {
            GraphicsSpriteState *sprite = GraphicsSpriteState_Create(
                self->groups[display],
                (GraphicsSpriteResourceDescriptor *)&self->resources[0],
                0, 0, 0xc0, 0, 0);
            self->digits[display][digit] = sprite;
            sprite->field_2c = x;
            x -= 16;
            sprite->field_2e = 0;
            if (digit == 2 || digit == 5)
                x -= 4;
        }
        self->marker[display] = GraphicsSpriteState_Create(
            self->groups[display],
            (GraphicsSpriteResourceDescriptor *)&self->resources[1],
            0, 0, 0xc0, 1, 2);
        self->marker[display]->field_2c = -128;
        self->marker[display]->field_2e = -12;
        self->backdrop[display] = GraphicsSpriteState_Create(
            self->groups[display],
            (GraphicsSpriteResourceDescriptor *)&self->resources[2],
            0, 0, 0x100, 1, 2);
        self->backdrop[display]->field_2c = 0;
        self->backdrop[display]->field_2e = 0;
        for (digit = 0; digit < 4; digit++)
            self->ornaments[display][digit] = GraphicsSpriteState_Create(
                self->groups[display],
                (GraphicsSpriteResourceDescriptor *)&self->resources[3],
                2, 0, 0xdf, 4, 2);
    }
    GamePhaseCurrencyHud_UpdateDigits(self, gGameWork->currency);
    self->transitionStartValue = gGameWork->currency;
    self->displayedValue = gGameWork->currency;
    GamePhaseCurrencyHud_SetVisible(self, 0);
    return self;
}
