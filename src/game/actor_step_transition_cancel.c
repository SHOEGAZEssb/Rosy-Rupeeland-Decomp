#include "tingle/types.h"

/* Cancel an active actor step transition. */

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_RestoreSavedFlags(void *);
#ifdef __cplusplus
}
#endif

/*
 * If state halfword 0xac is not 0xff, set it to 0xff and notify
 * Actor_RestoreSavedFlags. An already-idle actor is unchanged. Returns no value; the
 * notification helper owns any gameplay effects.
 */
void func_02032208(void *self)
{
    u8 *actor = (u8 *)self;
    if (*(s16 *)(actor + 0xac) == 0xff)
        return;
    *(s16 *)(actor + 0xac) = 0xff;
    Actor_RestoreSavedFlags(actor);
}
