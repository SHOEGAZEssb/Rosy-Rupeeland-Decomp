#include "tingle/types.h"

/* Manage actor resource slots and snapshot/restore primary attachment state. */
typedef struct ResourceStateVTable {
    u8 field_00[0x78];
    void (*activate_78)(void *, s32);
} ResourceStateVTable;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Set actor flag 0x08, store resource at slot 0x180, call vtable offset 0x78
 * with zero, then set flag 0x01000000. Returns no value; the virtual callback
 * may change resource or presentation state.
 */
void Actor_AssignPrimaryResource(void *self, void *resource)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x10) |= 8;
    *(void **)(actor + 0x180) = resource;
    (*(ResourceStateVTable **)actor)->activate_78(actor, 0);
    *(u32 *)(actor + 0x10) |= 0x01000000;
}

/* Store value in resource slot 0x180+index*4 and return no value. */
void Actor_SetResourceSlot(void *self, s32 index, void *value)
{
    *(void **)((u8 *)self + 0x180 + index * 4) = value;
}

/*
 * Snapshot primary attachment byte 0x38 to actor 0x194, byte 0x3a to 0x195,
 * and halfword flags 0x24 to 0x196, then set actor flag 0x200. Returns no value.
 */
void Actor_SavePrimaryAttachmentState(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);
    actor[0x194] = attachment[0x38];
    actor[0x195] = attachment[0x3a];
    *(u16 *)(actor + 0x196) = *(u16 *)(attachment + 0x24);
    *(u32 *)(actor + 0x10) |= 0x200;
}

/*
 * Restore attachment animation byte 0x38 through GraphicsSpriteState_SetAnimationIndex and byte 0x3a
 * directly from actor 0x194/0x195. Set attachment flag two, clear flags one
 * and 0x20, then clear actor flag 0x200. The saved halfword at 0x196 is not
 * read by the retail body. Returns no value; the animation helper may mutate
 * presentation state.
 */
void Actor_RestorePrimaryAttachmentState(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);
    GraphicsSpriteState_SetAnimationIndex(attachment, actor[0x194]);
    attachment[0x3a] = actor[0x195];
    *(u16 *)(attachment + 0x24) |= 2;
    *(u16 *)(attachment + 0x24) &= ~1;
    *(u16 *)(attachment + 0x24) &= ~0x20;
    *(u32 *)(actor + 0x10) &= ~0x200;
}

/* Set or clear actor flag 0x100 according to enabled and return no value. */
void Actor_SetActive(void *self, s32 enabled)
{
    u32 *flags = (u32 *)((u8 *)self + 0x10);
    if (enabled)
        *flags |= 0x100;
    else
        *flags &= ~0x100;
}
