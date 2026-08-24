#include "tingle/types.h"

/* Recovered three-slot registry populated from type-seven actors in the primary world list. */
extern u8 *gGamePhaseRuntime;
extern void *gType7ActorRegistry[3];

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseRuntime_GetActorCollection(void *context, s32 index);
#ifdef __cplusplus
}
#endif

/*
 * Scan entries in world list GamePhaseRuntime_GetActorCollection(*gGamePhaseRuntime,1), whose count is at
 * returned object +0x2e74, until three actors with type byte +0x4d equal to
 * seven are found or the list ends. Store those actor pointers in
 * gType7ActorRegistry, assign their halfword +0x27c the sequence 0,5,10, and clear
 * any unused registry slots. Returns no value; actor and registry state change,
 * while the world query has no direct hardware effect.
 */
void Type7ActorRegistry_Populate(void)
{
    s32 found = 0;
    s32 index = 0;
    void *context = *(void **)gGamePhaseRuntime;
    while (index < *(s32 *)((u8 *)GamePhaseRuntime_GetActorCollection(context, 1) + 0x2e74)
           && found < 3) {
        u8 *actor = ((u8 **)GamePhaseRuntime_GetActorCollection(context, 1))[index];
        if (actor != 0 && actor[0x4d] == 7) {
            *(u16 *)(actor + 0x27c) = (u16)(found * 5);
            gType7ActorRegistry[found++] = actor;
        }
        ++index;
    }
    while (found < 3)
        gType7ActorRegistry[found++] = 0;
}

/* Clear all three type-seven actor registry slots; return no value. */
void Type7ActorRegistry_Clear(void)
{
    s32 i;
    for (i = 0; i < 3; ++i)
        gType7ActorRegistry[i] = 0;
}
