#include "tingle/types.h"

/* Implement small derived-actor virtual overrides by forwarding to recovered base helpers. */
#ifdef __cplusplus
extern "C" {
#endif
extern void func_02032abc(void *actor);
extern s32 func_0203392c(void *actor);
extern s32 func_02033940(void *actor);
extern s32 func_02034148(void *actor);
extern u32 func_02033954(void *actor, const void *query);
#ifdef __cplusplus
}
#endif

/* Forward actor to func_02032abc, ignoring the pair-callback second input; return no value. */
void func_0203baa0(void *actor, void *other)
{
    (void)other;
    func_02032abc(actor);
}

/* Accept recovered virtual inputs, change no known state, and return no value. */
void func_0203baac(void)
{
}

/* Invoke func_0203392c(actor), discard its result, and return one. */
s32 func_0203bab0(void *actor)
{
    (void)func_0203392c(actor);
    return 1;
}

/* Invoke func_02033940 followed by func_02034148 on actor and return the latter result. */
s32 func_0203bac0(void *actor)
{
    (void)func_02033940(actor);
    return func_02034148(actor);
}

/* Forward actor and query to func_02033954 and return its result unchanged. */
u32 func_0203bad8(void *actor, const void *query)
{
    return func_02033954(actor, query);
}
