#include "tingle/types.h"

/*
 * Recovered extended type-two actor interface helpers. These are small virtual
 * forwards, constants, flag updates, state predicates, and an embedded query.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 AttachmentController_SetEnabled(void *embedded);
#ifdef __cplusplus
}
#endif

/* Return constant 16; no inputs or state are used and no hardware effect occurs. */
s32 ActorExtendedType2_GetConstant16(void)
{
    return 16;
}

/*
 * Forward actor and value to virtual +0x108 with third argument zero. Return
 * the virtual result; virtual actor state may change, with no direct hardware access.
 */
s32 ActorExtendedType2_ForwardVirtual108(void *self, s32 value)
{
    u8 *actor = (u8 *)self;
    return (*(s32 (**)(void *, s32, s32))(*(u8 **)actor + 0x108))
        (actor, value, 0);
}

/*
 * A second interface slot with the same confirmed behavior as
 * ActorExtendedType2_ForwardVirtual108: call virtual +0x108(actor,value,0)
 * and return its result.
 */
s32 ActorExtendedType2_ForwardVirtual108Duplicate(void *self, s32 value)
{
    u8 *actor = (u8 *)self;
    return (*(s32 (**)(void *, s32, s32))(*(u8 **)actor + 0x108))
        (actor, value, 0);
}

/* Return constant zero; no inputs or state are used and no hardware effect occurs. */
s32 ActorExtendedType2_ReturnZero(void)
{
    return 0;
}

/* Set actor +0x260 bit 0x10; no return value or external effect is defined. */
void ActorExtendedType2_SetRuntimeFlag10(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x260) |= 0x10;
}

/* Return one exactly when mode byte +0x24c equals eight; actor is read only. */
s32 ActorExtendedType2_IsMode8(const void *self)
{
    return *((const u8 *)self + 0x24c) == 8;
}

/* Return one exactly when signed current state +0xd6 is five or six. */
s32 ActorExtendedType2_IsCurrentState5Or6(const void *self)
{
    s16 state = *(const s16 *)((const u8 *)self + 0xd6);
    return state == 5 || state == 6;
}

/* Return one exactly when signed previous state +0xd8 is nine or ten. */
s32 ActorExtendedType2_IsPreviousState9Or10(const void *self)
{
    s16 state = *(const s16 *)((const u8 *)self + 0xd8);
    return state == 9 || state == 10;
}

/* Return one exactly when signed current state +0xd6 is nine or ten. */
s32 ActorExtendedType2_IsCurrentState9Or10(const void *self)
{
    s16 state = *(const s16 *)((const u8 *)self + 0xd6);
    return state == 9 || state == 10;
}

/*
 * Pass embedded object actor +0x284 to AttachmentController_SetEnabled and return its result.
 * The embedded query may update engine state; no direct hardware access occurs.
 */
s32 ActorExtendedType2_EnableAttachmentController(void *self)
{
    return AttachmentController_SetEnabled((u8 *)self + 0x284);
}

/* Return constant 0x20000; no inputs or state are used. */
s32 ActorExtendedType2_GetConstant20000(void)
{
    return 0x20000;
}
