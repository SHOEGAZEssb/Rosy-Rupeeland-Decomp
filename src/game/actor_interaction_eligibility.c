#include "tingle/types.h"

/* Decide actor interaction eligibility using collection-reference geometry. */
#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetCollection(void *actor);
extern void Actor_BuildWorldInteractionBounds(void *output, void *actor,
                                              const void *position);
extern void func_02005030(void *temporary, const void *source);
extern void func_02005058(void *temporary);
extern void Actor_BuildCollisionRect(void *output, void *actor,
                                     const void *position);
extern void func_02015548(void *output, s32 first, s32 second, s32 third,
                          s32 fourth);
extern s32 func_02056f34(void *state, const void *actorGeometry,
                         const void *referenceGeometry, void *output);
extern s32 func_020573e4(void *resource);
#ifdef __cplusplus
}
#endif

/*
 * Return one only when actor+0x184 is non-null and byte 0xe8 is zero, subject
 * to a reference-geometry test. That test is skipped when either s16 pair
 * +0x70/+0x74 or +0x72/+0x76 is equal, or when collection field 0x2e7c is
 * null. Otherwise actor geometry built by Actor_BuildWorldInteractionBounds is tested against the
 * reference actor geometry built by Actor_BuildCollisionRect; a zero test
 * result rejects
 * the actor. Temporary vector/state helpers may manage SDK-owned values.
 */
s32 func_02034060(void *self)
{
    u8 *actor = (u8 *)self;
    u8 actorGeometry[16];
    u8 referenceVector[16];
    u8 referenceGeometry[16];
    u8 state[16];
    s32 output;
    u8 *collection;
    u8 *reference;

    if (*(s16 *)(actor + 0x70) != *(s16 *)(actor + 0x74) &&
        *(s16 *)(actor + 0x72) != *(s16 *)(actor + 0x76)) {
        collection = (u8 *)Actor_GetCollection(actor);
        reference = *(u8 **)(collection + 0x2e7c);
        if (reference != 0) {
            Actor_BuildWorldInteractionBounds(actorGeometry, actor,
                                              actor + 0x18);
            func_02005030(referenceVector, reference + 0x18);
            Actor_BuildCollisionRect(referenceGeometry, reference,
                                     referenceVector);
            func_02005058(referenceVector);
            func_02015548(state, 0, 0, 0, 0);
            if (func_02056f34(state, actorGeometry, referenceGeometry,
                              &output) == 0) {
                return 0;
            }
        }
    }

    return *(void **)(actor + 0x184) != 0 && actor[0xe8] == 0;
}

/*
 * If actor+0x1e0 is non-null, call its active-state predicate and discard the
 * result. Return zero unconditionally. The retained call may have observable
 * resource/SDK effects despite the confirmed constant return.
 */
s32 func_02034148(void *self)
{
    void *resource = *(void **)((u8 *)self + 0x1e0);

    if (resource != 0) func_020573e4(resource);
    return 0;
}
