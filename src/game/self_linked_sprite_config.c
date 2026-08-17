#include "tingle/types.h"

/*
 * Initialize a recovered 0x24-byte sprite/resource configuration with zeroed
 * scalar fields and two self-referential link pointers.
 */
typedef struct SelfLinkedSpriteConfig {
    u16 field00,field02,field04,field06;u32 field08,field0c,field10;
    struct SelfLinkedSpriteConfig *self14;u32 field18;
    struct SelfLinkedSpriteConfig *self1c;u32 field20;
} SelfLinkedSpriteConfig;

/* Zero all recovered values, link offsets 0x14/0x1c to self, set field18 to one, and return no value. */
void SelfLinkedSpriteConfig_Init(SelfLinkedSpriteConfig *self)
{
    self->field00=self->field02=self->field04=self->field06=0;
    self->field08=self->field0c=self->field10=0;self->self14=self;
    self->field18=1;self->self1c=self;self->field20=0;
}
