/* Owned-slot teardown for the resident 30-entry sprite-effect manager. */

#include "tingle/heap.h"
#include "tingle/sprite_effect.h"

/* Destroy, free, and clear one caller-selected owned slot. Empty slots are
 * accepted unchanged; retail requires the index to be in the 30-slot range. */
void SpriteEffectManager_RemoveEffectAt(SpriteEffectManager *manager,
                                        u32 effectIndex)
{
    SpriteEffectInstance *effect = manager->effects[effectIndex];

    if (effect == 0)
        return;
    if (effect != 0) {
        SpriteEffectInstance_Destroy(effect);
        Heap_Free(effect);
    }
    manager->effects[effectIndex] = 0;
}
