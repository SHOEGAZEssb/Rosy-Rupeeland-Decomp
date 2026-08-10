#include "tingle/types.h"

/* Recovered setup, coordinate adjustment, and retry callbacks for the transform-owning actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorRuntimeTriple_Assign(void *vector, s32 x, s32 y, s32 z);
extern s32 Actor_IsAtCachedTerrainHeight(void *actor, ...);
extern s32 ActorExtendedType2_GetDescriptorValue2A(const void *actor);
extern void ActorExtendedType2_ApplyMotionImpulseIfEnabled(void *actor, void *first, void *second);
#ifdef __cplusplus
}
#endif

/*
 * Clear halfword +0x298 and word +0x44, zero the value at +0x29c, then forward
 * actor and both remaining inputs to
 * ActorExtendedType2_ApplyMotionImpulseIfEnabled. Returns no value; actor and
 * descriptor-related state may change.
 */
void ActorExtendedTransform_ResetMotionImpulseState(void *self, void *first, void *second)
{
    u8 *actor = (u8 *)self;
    *(u16 *)(actor + 0x298) = 0;
    *(u32 *)(actor + 0x44) = 0;
    ActorRuntimeTriple_Assign(actor + 0x29c, 0, 0, 0);
    ActorExtendedType2_ApplyMotionImpulseIfEnabled(actor, first, second);
}

/*
 * Query Actor_IsAtCachedTerrainHeight(actor,x,y). When nonzero, set +0x29c
 * from *x and *y,
 * then set +0x44 to descriptor value +0x2a shifted left by four. Otherwise
 * replace *x and *y with
 * truncating halves added to truncating halves of actor +0x2a0/+0x2a4.
 * Returns no value; actor or caller-owned coordinates may change.
 */
void ActorExtendedTransform_AdjustTerrainCoordinates(void *self, s32 *x, s32 *y)
{
    u8 *actor = (u8 *)self;
    if (Actor_IsAtCachedTerrainHeight(actor, x, y) != 0) {
        ActorRuntimeTriple_Assign(actor + 0x29c, *x, *y, 0);
        *(s32 *)(actor + 0x44) = ActorExtendedType2_GetDescriptorValue2A(actor) << 4;
    } else {
        s32 ax = *(s32 *)(actor + 0x2a0);
        s32 ay = *(s32 *)(actor + 0x2a4);
        *x = (*x + (s32)((u32)*x >> 31)) / 2
            + (ax + (s32)((u32)ax >> 31)) / 2;
        *y = (*y + (s32)((u32)*y >> 31)) / 2
            + (ay + (s32)((u32)ay >> 31)) / 2;
    }
}

/*
 * When Actor_IsAtCachedTerrainHeight succeeds and signed retry counter +0x298
 * is below signed
 * limit +0x29a, increment the counter, enter state one at +0xd6, zero +0x29c
 * and +0x44, and return one. Otherwise return zero without those changes.
 */
s32 ActorExtendedTransform_AdvanceTerrainRetry(void *self)
{
    u8 *actor = (u8 *)self;
    if (Actor_IsAtCachedTerrainHeight(actor) != 0
        && *(s16 *)(actor + 0x298) < *(s16 *)(actor + 0x29a)) {
        ++*(s16 *)(actor + 0x298);
        *(u16 *)(actor + 0xd6) = 1;
        ActorRuntimeTriple_Assign(actor + 0x29c, 0, 0, 0);
        *(u32 *)(actor + 0x44) = 0;
        return 1;
    }
    return 0;
}
