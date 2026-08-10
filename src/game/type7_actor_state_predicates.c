#include "tingle/types.h"

/*
 * Recovered type-seven state predicates. They compare an optional actor index
 * with global state and expose whether a target-backed flag condition is set.
 */
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseState_GetConfiguration(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Return true immediately when signed halfword
 * +0x27e is -1. Otherwise call GamePhaseState_GetConfiguration on global state
 * data_021052fc+0x24 and compare the signed low halfword of its first result
 * word with actor +0x27e, returning whether they match. Global state is read;
 * actor state is unchanged and there are no direct SDK or hardware effects.
 */
s32 Type7Actor_MatchesGlobalRecordIndex(void *self)
{
    u8 *actor = (u8 *)self;
    s16 expected = *(s16 *)(actor + 0x27e);
    u32 *record;
    if (expected == -1)
        return 1;
    record = (u32 *)GamePhaseState_GetConfiguration(data_021052fc + 0x24);
    return expected == (s16)record[0];
}

/*
 * Input is a type-seven actor. Return true exactly when target pointer +0x280
 * is non-null and actor +0x10 flag four is set; otherwise return false. Actor
 * and target state are only observed, with no SDK or hardware effects.
 */
s32 Type7Actor_HasFlag4Target(void *self)
{
    u8 *actor = (u8 *)self;
    return *(void **)(actor + 0x280) != 0
        && (*(u32 *)(actor + 0x10) & 4) != 0;
}
