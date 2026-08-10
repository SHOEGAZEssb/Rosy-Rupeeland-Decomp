#include "tingle/types.h"

/*
 * Recovered type-seven special-state controls. These helpers enter, leave, or
 * force an embedded animation state and issue its associated sound request.
 */

extern u8 *gGameWork;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorRuntimeTriple_Assign(void *value, s32 x, s32 y, s32 z);
extern void AttachmentController_SetEnabled(void *state, s32 enabled);
extern s32 Type7Actor_GetStateCode(void *actor);
extern void Type7Actor_UpdateAttachmentControllerAnimation(void *actor);
extern void Type7MarkerPresentation_SelectAnimation(void *state, u32 index);
extern void Type7MarkerPresentation_ReloadResources(void *state);
extern void func_020593dc(void *soundContext, s32 group, s32 index,
                          u32 argument, s32 zero, s32 volume);
extern void GraphicsSpriteState_SetAnimationIndex(void *presentation, u32 index);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. If Type7Actor_GetStateCode reports state zero, set
 * +0x268 bit 0x200000, disable helper +0x2a8, optionally advance the current
 * presentation index +0xd4 by eight, set presentation +0x36 to 0x100 and
 * +0x24 bit 0x20, and zero vector-like fields +0x38, +0x88, and +0x98 through
 * ActorRuntimeTriple_Assign. Otherwise do nothing. No value is returned. Actor and
 * presentation state change, with no direct hardware effects.
 */
void Type7Actor_EnterSpecialPresentationState(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *presentation;
    if (Type7Actor_GetStateCode(actor) != 0)
        return;
    *(u32 *)(actor + 0x268) |= 0x200000;
    AttachmentController_SetEnabled(actor + 0x2a8, 0);
    presentation = *(u8 **)(actor + 0x54);
    if (*(u8 *)(actor + 0xd4) == *(u8 *)(presentation + 0x38))
        GraphicsSpriteState_SetAnimationIndex(presentation, (u8)(*(u8 *)(actor + 0xd4) + 8));
    *(u16 *)(presentation + 0x36) = 0x100;
    *(u16 *)(presentation + 0x24) |= 0x20;
    ActorRuntimeTriple_Assign(actor + 0x38, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x88, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x98, 0, 0, 0);
}

/*
 * Input is a type-seven actor. When +0x268 bit 0x200000 is set, clear it, set
 * +0xd0 bit 0x1000, and refresh animation selection through Type7Actor_UpdateAttachmentControllerAnimation.
 * Always clear presentation +0x24 bit 0x20 and set halfword +0x2a6 to 0x1e.
 * No value is returned; actor/presentation state changes without direct SDK
 * or hardware effects.
 */
void Type7Actor_LeaveSpecialPresentationState(void *self)
{
    u8 *actor = (u8 *)self;
    if ((*(u32 *)(actor + 0x268) & 0x200000) != 0) {
        *(u32 *)(actor + 0x268) &= ~0x200000;
        *(u32 *)(actor + 0xd0) |= 0x1000;
        Type7Actor_UpdateAttachmentControllerAnimation(actor);
    }
    *(u16 *)(*(u8 **)(actor + 0x54) + 0x24) &= (u16)~0x20;
    *(u16 *)(actor + 0x2a6) = 0x1e;
}

/*
 * Input is a type-seven actor. Set +0x268 bit 0x40000 and disable embedded
 * helper +0x2a8. No value is returned and there are no direct hardware effects.
 */
void Type7Actor_EnterFlag40000State(void *self)
{
    u8 *actor = (u8 *)self;
    *(u32 *)(actor + 0x268) |= 0x40000;
    AttachmentController_SetEnabled(actor + 0x2a8, 0);
}

/*
 * Inputs are a type-seven actor, a value stored at +0x110, and a zero/nonzero
 * selector stored canonically at +0x114. Require object +0x294 and actor state
 * code zero. Zero the three motion vectors, invoke actor virtual slot 0x74 with
 * object +0x294, reset an active embedded helper if needed, select animation
 * 0x19, enable it, and immediately invoke helper virtual slot two. No value is
 * returned. Actor-owned objects and animation state change; there are no direct
 * hardware effects.
 */
void Type7Actor_StartAnimation19Interaction(void *self, s32 value, s32 selector)
{
    u8 *actor = (u8 *)self;
    void *helper;
    void (**actorVtable)(void *, void *);
    void (**helperVtable)(void *);
    if (*(void **)(actor + 0x294) == 0 || Type7Actor_GetStateCode(actor) != 0)
        return;
    ActorRuntimeTriple_Assign(actor + 0x38, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x88, 0, 0, 0);
    ActorRuntimeTriple_Assign(actor + 0x98, 0, 0, 0);
    *(s32 *)(actor + 0x110) = value;
    *(s32 *)(actor + 0x114) = selector != 0;
    actorVtable = *(void (***)(void *, void *))actor;
    actorVtable[0x74 / 4](actor, *(void **)(actor + 0x294));
    helper = actor + 0x2a8;
    if (*(s16 *)(actor + 0x2b6) != 0)
        Type7MarkerPresentation_ReloadResources(helper);
    Type7MarkerPresentation_SelectAnimation(helper, 0x19);
    AttachmentController_SetEnabled(helper, 1);
    helperVtable = *(void (***)(void *))helper;
    helperVtable[2](helper);
}

/*
 * Inputs are an opaque sound argument and a 16-bit selector. OR the selector
 * with signed game-work halfword +0x1d0, split the result into a seven-bit
 * index and remaining group bits, and submit it through func_020593dc with
 * zero auxiliary value and volume 0x100. Sound context is read and audio state
 * may change; no value is returned and no hardware is accessed directly.
 */
void Type7Actor_PlayStateSound(u32 argument, u32 selector)
{
    u32 sound = (u16)(selector | *(s16 *)(gGameWork + 0x1d0));
    func_020593dc(gSoundContext, (s32)sound >> 7, sound & 0x7f,
                  argument, 0, 0x100);
}

/*
 * Empty recovered callback. It accepts no inputs, changes no state, returns no
 * value, and has no SDK or hardware effects.
 */
void Type7Actor_NoopTrackedResourceInteraction(void)
{
}
