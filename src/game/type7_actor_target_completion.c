#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered type-seven target-completion states. They initialize a timed
 * approach, detect a specific related-object subtype, notify both actors, and
 * create the associated presentation effect.
 */
extern char gType7ActorPresentationEffectAllocationTag[];

#ifdef __cplusplus
extern "C" {
#endif
extern void AuxiliaryTimedSpritePresentation_Init(void *allocation, const void *transform, u32 value,
                          s32 firstId, s32 centerId, s32 lastId, s32 zero,
                          s32 presentation, s32 variant, s32 enabled);
extern void Actor_PlayRadialSpatialSound(void *actor, u32 packedSound, s32 pitch);
extern void Type7Actor_SelectRandomCallback(void *actor);
extern void Type7Actor_SelectRandomCallbackPair01(void *actor);
extern void Type7Actor_DispatchCurrentCallback(void *actor);
extern void Type7Actor_PlayStateSound(void *actor, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor whose related object has completed the recovered
 * subtype-0x68 interaction. Request radial packed sounds 0x36 and 0x47 at neutral pitch,
 * invoke related object +0x210 virtual callback +0xe8 in mode zero, then
 * allocate and initialize the 0x162b..0x162d presentation effect. If allocation
 * fails, retain the audio requests and callback without an effect. Actor,
 * related-object, audio, and heap-owned presentation state may change; Heap_Alloc is the
 * SDK-facing allocator effect. No value is returned.
 */
static void complete_related_interaction(u8 *actor)
{
    u8 *related = *(u8 **)(actor + 0x210);
    void *allocation;
    typedef void (*RelatedModeCallback)(void *object, s32 mode);
    RelatedModeCallback callback;

    Actor_PlayRadialSpatialSound(actor, 0x36, 0);
    Actor_PlayRadialSpatialSound(actor, 0x47, 0);
    callback = *(RelatedModeCallback *)(*(u8 **)related + 0xe8);
    callback(related, 0);
    allocation = Heap_Alloc(20, gType7ActorPresentationEffectAllocationTag, 4, &gHeapContext);
    if (allocation != 0) {
        AuxiliaryTimedSpritePresentation_Init(allocation, actor + 0x18,
                      **(u32 **)(actor + 0x54),
                      0x162b, 0x162c, 0x162d, 0, 4, 2, 1);
    }
}

/*
 * Input is a type-seven actor. Set duration-like halfword +0x2a0 to 180,
 * signed field +0x250 to -60, and adjustment +0x2a2 to zero. Configure shared
 * state with Type7Actor_PlayStateSound mode four, then install the randomized two-choice
 * callback through Type7Actor_SelectRandomCallbackPair01. Actor timing, mode, random, and callback
 * state may change; there is no return value or direct hardware access.
 */
void Type7Actor_StartTargetCompletion(void *self)
{
    u8 *actor = (u8 *)self;
    *(u16 *)(actor + 0x2a0) = 180;
    *(s16 *)(actor + 0x250) = -60;
    *(u16 *)(actor + 0x2a2) = 0;
    Type7Actor_PlayStateSound(actor, 4);
    Type7Actor_SelectRandomCallbackPair01(actor);
}

/*
 * Input is a type-seven actor. Clear actor flag 0x8000, set +0xd0 bit one,
 * and select presentation 16. When object +0x54 halfword +0x24 bit zero is
 * set, dispatch the installed callback. Otherwise increment signed elapsed
 * counter +0x248; after 15 ticks, if related object +0x210 has subtype byte
 * four and halfword ID 0x68, complete the related interaction and spawn its
 * effect. Always return zero. Actor, target, audio, callback, and heap-owned
 * presentation state may change; Heap_Alloc is the SDK-facing effect.
 */
s32 Type7Actor_UpdateTargetCompletion(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *related;

    *(u32 *)(actor + 0x268) &= ~0x8000;
    *(u32 *)(actor + 0xd0) |= 2;
    *(u16 *)(actor + 0xd6) = 16;
    if ((*(u16 *)(*(u8 **)(actor + 0x54) + 0x24) & 1) != 0) {
        Type7Actor_DispatchCurrentCallback(actor);
        return 0;
    }
    ++*(s16 *)(actor + 0x248);
    related = *(u8 **)(actor + 0x210);
    if (*(s16 *)(actor + 0x248) > 15 && related != 0
        && related[0x4d] == 4 && *(u16 *)(related + 0x4e) == 0x68)
        complete_related_interaction(actor);
    return 0;
}

/*
 * Input is a type-seven actor. If related object +0x210 has subtype byte four
 * and halfword ID 0x68, perform the same audio requests, virtual callback, and effect
 * creation as Type7Actor_UpdateTargetCompletion. Then always select a fresh randomized callback
 * through Type7Actor_SelectRandomCallback. Actor, target, audio, random, callback, and heap-owned
 * presentation state may change; Heap_Alloc is the SDK-facing effect. No value
 * is returned.
 */
void Type7Actor_FinishTargetCompletion(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *related = *(u8 **)(actor + 0x210);
    if (related != 0 && related[0x4d] == 4
        && *(u16 *)(related + 0x4e) == 0x68)
        complete_related_interaction(actor);
    Type7Actor_SelectRandomCallback(actor);
}
