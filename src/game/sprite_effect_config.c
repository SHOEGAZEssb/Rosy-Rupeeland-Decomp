/* Default configuration state for resident sprite effects. */

#include "tingle/sprite_effect.h"

/* Fill a caller-owned configuration with the retail defaults. */
void func_020a32e0(SpriteEffectConfig *config)
{
    config->mode00 = 0;
    config->count02 = 10;
    config->distribution40 = 0;
    config->descriptor1c = 0;
    config->lifetime28 = 100;
    config->lifetimeRange2a = 10;
    config->start2c = 1;
    config->startRange2e = 0;
    config->scale30 = 0x1000;
    config->scaleRange32 = 0;
    config->velocity14 = 0;
    config->velocity18 = 0;
    config->acceleration20 = 0;
    config->angle24 = 0;
    config->angleRange26 = 0;
    config->flags34 = 0;
    config->initialCount3e = 0;
    config->color36 = 0x190;
    config->animation41 = 0;
    config->tiles42 = 1;
    config->palettes43 = 1;
    config->field38 = 0;
    config->field3a = 0;
    config->alpha3c = 0x7fff;
}
