#include "tingle/types.h"

/* Enter recovered target-interaction states for the extended type-two actor. */
extern u16 data_020e7318[];
extern u8 data_020df9e8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020349b8(void *actor, u32 sound, s32 extra);
extern void VecFx32Object_Assign(void *destination, const void *source);
#ifdef __cplusplus
}
#endif

/*
 * Clear halfwords +0x25e/+0x25a. Play the descriptor-indexed packed sound from
 * data_020e7318 unless it is 0xffff, forwarding extra as the sound helper's
 * third argument. Clear +0x260 bit zero, store target at +0x228, copy global
 * pair +0x30/+0x34 to +0x218/+0x21c, and enter state seven. Invoke virtual
 * +0xd0 with target vector +0x18. Copy saved vector +0x22c to +0x23c when
 * optional object +0x26c is null, otherwise copy actor position +0x18, then
 * invoke virtual +0xd8. Returns no value; sound, target, state, vector, and
 * virtual callback state change.
 */
void ActorExtendedType2_EnterTargetInteractionState7(void *self, void *target, s32 extra)
{
    u8 *actor = (u8 *)self;
    u16 sound;

    *(u16 *)(actor + 0x25e) = 0;
    *(u16 *)(actor + 0x25a) = 0;
    sound = data_020e7318[*(u16 *)(actor + 0x4e)];
    if (sound != 0xffff)
        func_020349b8(actor, sound, extra);
    *(u32 *)(actor + 0x260) &= ~1;
    *(void **)(actor + 0x228) = target;
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x30);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x34);
    *(s16 *)(actor + 0xd6) = 7;
    (*(void (**)(void *, void *))(*(u8 **)actor + 0xd0))(
        actor, (u8 *)target + 0x18);
    VecFx32Object_Assign(actor + 0x23c,
                  *(void **)(actor + 0x26c) == 0 ? actor + 0x22c
                                                   : actor + 0x18);
    (*(void (**)(void *))(*(u8 **)actor + 0xd8))(actor);
}

/* Accept arbitrary inputs and perform no state changes; returns no value. */
void ActorExtendedType2_InteractionNoOp(void)
{
}

/*
 * Zero halfword +0x25a, clear +0x260 bit zero, store target at +0x228, and
 * copy global pair +0xc0/+0xc4 into +0x218/+0x21c. Returns no value; actor
 * target and recovered callback-pair state change.
 */
void ActorExtendedType2_SetTargetCallbackPairC0(void *self, void *target)
{
    u8 *actor = (u8 *)self;
    *(u16 *)(actor + 0x25a) = 0;
    *(u32 *)(actor + 0x260) &= ~1;
    *(void **)(actor + 0x228) = target;
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0xc0);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0xc4);
}

/*
 * Zero halfword +0x25a, clear +0x260 bit zero, store target at +0x228, and
 * copy global pair +0x48/+0x4c into +0x218/+0x21c. Returns no value; actor
 * target and recovered callback-pair state change.
 */
void ActorExtendedType2_SetTargetCallbackPair48(void *self, void *target)
{
    u8 *actor = (u8 *)self;
    *(u16 *)(actor + 0x25a) = 0;
    *(u32 *)(actor + 0x260) &= ~1;
    *(void **)(actor + 0x228) = target;
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x48);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x4c);
}

/*
 * Zero halfwords +0x25e/+0x256/+0x25a, clear +0x260 bit zero, store target at
 * +0x228, and copy global pair +0x40/+0x44 into +0x218/+0x21c. Returns no
 * value; actor target, countdown, and recovered callback-pair state change.
 */
void ActorExtendedType2_SetTargetCallbackPair40AndResetCounters(void *self, void *target)
{
    u8 *actor = (u8 *)self;
    *(u16 *)(actor + 0x25e) = 0;
    *(u32 *)(actor + 0x260) &= ~1;
    *(u16 *)(actor + 0x256) = 0;
    *(void **)(actor + 0x228) = target;
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x40);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x44);
    *(u16 *)(actor + 0x25a) = 0;
}
