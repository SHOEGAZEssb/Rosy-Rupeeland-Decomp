#include "tingle/types.h"

/* Overlay 94 position synchronization for the paired title sprite effect. */

typedef struct Overlay094SpriteStatePosition {
    u8 unknown_00[0x2c];
    s16 x;
    s16 y;
} Overlay094SpriteStatePosition;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095508(void *effect);
#ifdef __cplusplus
}
#endif

/*
 * Runs inherited paired-effect maintenance, then copies the first state's
 * signed +0x2C/+0x2E coordinates into the second state. Returns no value and
 * performs no direct hardware access.
 */
extern "C" void func_ov094_02219540(void *effect)
{
    func_02095508(effect);
    Overlay094SpriteStatePosition *firstState =
        *(Overlay094SpriteStatePosition **)((u8 *)effect + 0x9c);
    s16 y = firstState->y;
    Overlay094SpriteStatePosition *secondState =
        *(Overlay094SpriteStatePosition **)((u8 *)effect + 0xa4);
    s16 x = firstState->x;
    secondState->x = x;
    secondState->y = y;
}
