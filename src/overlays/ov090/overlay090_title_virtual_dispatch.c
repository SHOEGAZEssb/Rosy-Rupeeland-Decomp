#include "tingle/types.h"

/* Virtual update fan-out used by the phase-90 title controller. */

typedef void (*ActorMethod1c)(void *self);

/* Dispatch virtual method +0x1c on the three bound actors and controller. */
extern "C" void func_ov090_0221a504(void *self)
{
    s32 i;
    for (i = 0; i < 3; i++) {
        void *actor = *(void **)((u8 *)self + 0x1f4 + i * 4);
        ((ActorMethod1c)(*(void ***)actor)[7])(actor);
    }
    ((ActorMethod1c)(*(void ***)self)[7])(self);
}
