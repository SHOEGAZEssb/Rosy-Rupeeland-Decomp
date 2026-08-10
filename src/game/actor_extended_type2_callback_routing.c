#include "tingle/types.h"

/*
 * Recovered extended type-two actor callback routing. These helpers install
 * global callback representations and choose descriptor-controlled substates.
 */
extern u8 data_020df9e8[];

/*
 * Install global member-callback pair +0x130/+0x134 at actor +0x220/+0x224,
 * then invoke virtual +0xd0 with actor +0x22c. The virtual call may update the
 * actor and its return value is forwarded unchanged; no direct SDK or hardware
 * operation occurs.
 */
s32 ActorExtendedType2_SetCallbackPair130AndForwardD0(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *vtable = *(u8 **)actor;
    *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x130);
    *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x134);
    return (*(s32 (**)(void *, void *))(vtable + 0xd0))(actor, actor + 0x22c);
}

/*
 * Clear actor +0x260 bit zero and ask virtual +0x134 to consume descriptorRecord.
 * A nonzero virtual result ends processing. When descriptor +0x1a bit one is
 * clear, global callback pair +0x2a8/+0x2ac is copied to +0x218/+0x21c. When
 * set, actor mode byte +0x24d equal to zero selects byte +0x24c value four and
 * state 11, while value one selects byte five and state 12; other byte values
 * leave those fields unchanged. The routine always returns zero, may change
 * actor/virtual state, and performs no direct SDK or hardware operation.
 */
s32 ActorExtendedType2_RouteDescriptorTransition(void *self, void *descriptorRecord)
{
    u8 *actor = (u8 *)self;
    u8 *record = (u8 *)descriptorRecord;
    u8 *vtable = *(u8 **)actor;

    *(u32 *)(actor + 0x260) &= ~1;
    if ((*(s32 (**)(void *, void *))(vtable + 0x134))(actor, record) != 0)
        return 0;

    if ((*(u16 *)(record + 0x1a) & 2) != 0) {
        if (actor[0x24d] == 0) {
            actor[0x24c] = 4;
            *(u16 *)(actor + 0xd6) = 11;
        } else if (actor[0x24d] == 1) {
            actor[0x24c] = 5;
            *(u16 *)(actor + 0xd6) = 12;
        }
    } else {
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x2a8);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x2ac);
    }
    return 0;
}
