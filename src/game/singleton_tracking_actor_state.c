#include "tingle/types.h"

/*
 * Recovered state-entry hook for the singleton-tracking derived actor. It
 * performs base state setup and immediately invokes the actor's disable hook.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203b65c(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Input is a singleton-tracking actor. Invoke base helper func_0203b65c, then
 * call actor virtual slot 0x54 with zero. No value is returned. Base and
 * virtual actor state may change; there are no direct SDK or hardware effects.
 */
void func_0204d220(void *self)
{
    void (**vtable)(void *, s32);
    func_0203b65c(self);
    vtable = *(void (***)(void *, s32))self;
    vtable[0x54 / 4](self, 0);
}
