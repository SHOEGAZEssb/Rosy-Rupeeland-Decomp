#include "tingle/types.h"

/* Recovered three-slot registry populated from type-seven actors in the primary world list. */
extern u8 *data_021052fc;
extern void *data_0210577c[3];

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseRuntime_GetActorCollection(void *context, s32 index);
#ifdef __cplusplus
}
#endif

/*
 * Scan entries in world list GamePhaseRuntime_GetActorCollection(*data_021052fc,1), whose count is at
 * returned object +0x2e74, until three actors with type byte +0x4d equal to
 * seven are found or the list ends. Store those actor pointers in
 * data_0210577c, assign their halfword +0x27c the sequence 0,5,10, and clear
 * any unused registry slots. Returns no value; actor and registry state change,
 * while the world query has no direct hardware effect.
 */
void Type7ActorRegistry_Populate(void)
{
    s32 found = 0;
    s32 index = 0;
    void *context = *(void **)data_021052fc;
    while (index < *(s32 *)((u8 *)GamePhaseRuntime_GetActorCollection(context, 1) + 0x2e74)
           && found < 3) {
        u8 *actor = ((u8 **)GamePhaseRuntime_GetActorCollection(context, 1))[index];
        if (actor != 0 && actor[0x4d] == 7) {
            *(u16 *)(actor + 0x27c) = (u16)(found * 5);
            data_0210577c[found++] = actor;
        }
        ++index;
    }
    while (found < 3)
        data_0210577c[found++] = 0;
}

/* Clear all three type-seven actor registry slots; return no value. */
void Type7ActorRegistry_Clear(void)
{
    s32 i;
    for (i = 0; i < 3; ++i)
        data_0210577c[i] = 0;
}
