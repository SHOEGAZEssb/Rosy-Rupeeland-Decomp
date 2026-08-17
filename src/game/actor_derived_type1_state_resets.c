#include "tingle/heap.h"
#include "tingle/types.h"

/* Tear down type-1 auxiliary ownership and enter either base or disabled state. */
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void AuxiliaryInteraction_Destroy(void *resource);
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void Type7AuxiliaryPresentation_Reset(void *object);
extern void Type7AuxiliaryPresentation_EnterRaisedState(void *object);
extern void Actor_RefreshTerrainHeight(void *actor);
#ifdef __cplusplus
}
#endif

/* Destroy/free actor resource +0x26c and clear GameWork flag 0x3ee if owned. */
static void releaseResource(u8 *actor)
{
    void *resource = *(void **)(actor + 0x26c);
    if (resource != 0) {
        AuxiliaryInteraction_Destroy(resource);
        Heap_Free(resource);
        *(void **)(actor + 0x26c) = 0;
        GameWork_ClearFlag(gGameWork, 0x3ee);
    }
}

/*
 * Release auxiliary +0x26c, clear actor +0x10 bits 0x1f0000, enter state and
 * previous-state value one at +0xd6/+0xd8, and clear substates +0xda/+0xdc.
 * Call virtual +0x5c, notify optional object +0x270 through Type7AuxiliaryPresentation_Reset,
 * zero motion +0x3c/+0x40/+0x44 and byte +0x26b, refresh terrain height, then
 * clear +0x230 bit 0x800000. Returns no value; resource, heap, GameWork,
 * virtual, and optional-object calls have observable engine state.
 */
void ActorDerivedType1_ResetToBaseState(void *self)
{
    u8 *actor = (u8 *)self;
    releaseResource(actor);
    *(u32 *)(actor + 0x10) &= ~0x1f0000;
    *(u16 *)(actor + 0xd8) = 1;
    *(u16 *)(actor + 0xd6) = 1;
    *(u16 *)(actor + 0xdc) = 0;
    *(u16 *)(actor + 0xda) = 0;
    (*(void (**)(void *))(*(u8 **)actor + 0x5c))(actor);
    if (*(void **)(actor + 0x270) != 0)
        Type7AuxiliaryPresentation_Reset(*(void **)(actor + 0x270));
    *(s32 *)(actor + 0x44) = 0;
    *(s32 *)(actor + 0x40) = 0;
    *(s32 *)(actor + 0x3c) = 0;
    actor[0x26b] = 0;
    Actor_RefreshTerrainHeight(actor);
    *(u32 *)(actor + 0x230) &= ~0x800000;
}

/*
 * Release auxiliary +0x26c, enter state/previous-state eight at +0xd6/+0xd8,
 * clear substates +0xda/+0xdc, and call virtual +0x5c. Set +0xd0 bits 0x18,
 * clear +0x230 bit 0x800000, notify optional object +0x270 through
 * Type7AuxiliaryPresentation_EnterRaisedState, and zero vectors +0x8c..+0x94 and +0x3c..+0x44. Returns no
 * value and has the same resource/heap/GameWork/virtual effects as the base
 * reset plus the optional-object notification.
 */
void ActorDerivedType1_ResetToDisabledState(void *self)
{
    u8 *actor = (u8 *)self;
    releaseResource(actor);
    *(u16 *)(actor + 0xd8) = 8;
    *(u16 *)(actor + 0xd6) = 8;
    *(u16 *)(actor + 0xdc) = 0;
    *(u16 *)(actor + 0xda) = 0;
    (*(void (**)(void *))(*(u8 **)actor + 0x5c))(actor);
    *(u32 *)(actor + 0xd0) |= 0x18;
    *(u32 *)(actor + 0x230) &= ~0x800000;
    if (*(void **)(actor + 0x270) != 0)
        Type7AuxiliaryPresentation_EnterRaisedState(*(void **)(actor + 0x270));
    *(s32 *)(actor + 0x94) = 0;
    *(s32 *)(actor + 0x90) = 0;
    *(s32 *)(actor + 0x8c) = 0;
    *(s32 *)(actor + 0x44) = 0;
    *(s32 *)(actor + 0x40) = 0;
    *(s32 *)(actor + 0x3c) = 0;
}
