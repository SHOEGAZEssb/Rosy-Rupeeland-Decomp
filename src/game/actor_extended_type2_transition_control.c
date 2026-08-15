#include "tingle/types.h"

/*
 * Recovered extended type-two actor transition controls. These routines clear
 * attachment flags, select descriptor-dependent callback pairs, and advance
 * the actor into either its waiting or active state.
 */
extern u8 data_020e6adc[];
extern u8 data_020df9e8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_RestoreSavedFlags(void *actor);
extern s32 Presentation_InterpolateSmoothStep(s32 start, s32 end, s32 step_count);
#ifdef __cplusplus
}
#endif

/*
 * Reserved transition hook. It accepts an unspecified caller context, changes
 * no observable state, performs no SDK or hardware operation, and returns
 * immediately; the original return register is therefore left unchanged.
 */
void ActorExtendedType2_TransitionNoOp(void)
{
}

/*
 * Reset actor attachment transition state and choose the next state from the
 * descriptor byte indexed by actor +0x4e. The function clears attachment
 * +0x30 and flag 0x4 at +0x24, clears actor +0x260 bits 0x4003, and always
 * returns zero. A nonzero descriptor byte either waits in state 19 until the
 * attachment's bit zero is set or installs callback pair +0x2c8/+0x2cc and
 * enters state two. A zero descriptor byte increments actor +0x24e: before 20
 * ticks it writes the interpolated attachment scale and waits in state 19;
 * at 20 ticks it installs pair +0x2c0/+0x2c4 and enters state two. Callback
 * installation invokes Actor_RestoreSavedFlags; no direct SDK or hardware access occurs.
 */
s32 ActorExtendedType2_UpdateAttachmentScaleTransition(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);

    *(u16 *)(attachment + 0x30) = 0;
    *(u16 *)(attachment + 0x24) &= (u16)~4;
    *(u32 *)(actor + 0x260) &= 0xffffbffc;

    if (data_020e6adc[*(u16 *)(actor + 0x4e)] != 0) {
        *(u16 *)(attachment + 0x32) = 0x100;
        *(u16 *)(attachment + 0x34) = 0x100;
        if ((*(u16 *)(attachment + 0x24) & 1) == 0) {
            *(u16 *)(actor + 0xd6) = 19;
            return 0;
        }

        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x2c8);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x2cc);
        Actor_RestoreSavedFlags(actor);
        *(u32 *)(actor + 0x10) &= ~0x1f0000;
        *(u32 *)(actor + 0x260) |= 4;
        *(u16 *)(actor + 0xd6) = 2;
        *(u32 *)(actor + 0xd0) &= ~0x100;
        *(u32 *)(actor + 0x260) |= 3;
    } else {
        ++*(u16 *)(actor + 0x24e);
        if (*(u16 *)(actor + 0x24e) >= 20) {
            *(u16 *)(attachment + 0x32) = 0x100;
            *(u16 *)(attachment + 0x34) = 0x100;
            *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x2c0);
            *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x2c4);
            Actor_RestoreSavedFlags(actor);
            *(u32 *)(actor + 0x10) &= ~0x1f0000;
            *(u16 *)(actor + 0xd6) = 2;
            *(u32 *)(actor + 0x260) |= 3;
            *(u32 *)(actor + 0xd0) &= ~0x100;
        } else {
            s16 scale = (s16)Presentation_InterpolateSmoothStep(0x20, 0x100, 20);
            *(u16 *)(attachment + 0x32) = scale;
            *(u16 *)(attachment + 0x34) = scale;
            *(u16 *)(actor + 0xd6) = 19;
        }
    }
    return 0;
}
