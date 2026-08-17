#include "tingle/types.h"

/*
 * Recovered setup helpers for the presentation-backed actor. They resolve
 * three descriptor resources, create and configure a presentation object, and
 * retain the actor's playback-selection parameters at their known offsets.
 */

extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorCollection_GetSpriteOwner(void *collection);
extern void *Actor_GetCollection(void *actor);
extern void *func_02071e60(void *archive, u32 resource_id);
extern void *func_02071e70(void *archive, u32 resource_id);
extern void *func_02071e80(void *archive, u32 resource_id);
extern void GraphicsSpriteState_SetAnimationIndex(void *presentation, u32 selection);
extern void *GraphicsSpriteGroup_CreateState(void *context, void *resource0, void *resource1,
                           void *resource2, u32 mode);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are an actor and a descriptor whose resource IDs occupy words
 * 0x04/0x08/0x0C and whose mode bytes occupy 0x10/0x11. Resolve the resources
 * from data_020f4e18, prepare the actor, create its presentation at offset
 * 0x54, select the descriptor's initial entry, and set presentation flags 1
 * and 2 at offset 0x24. Returns nothing; resource/presentation state changes,
 * but no hardware is accessed directly here.
 */
void PresentationBackedActor_InitPresentation(void *actor, const void *descriptor)
{
    void *resource0 = func_02071e60(data_020f4e18,
                                    FIELD(u32, descriptor, 0x04));
    void *resource1 = func_02071e70(data_020f4e18,
                                    FIELD(u32, descriptor, 0x08));
    void *resource2 = func_02071e80(data_020f4e18,
                                    FIELD(u32, descriptor, 0x0c));

    void *collection = Actor_GetCollection(actor);
    FIELD(void *, actor, 0x54) =
        GraphicsSpriteGroup_CreateState(ActorCollection_GetSpriteOwner(collection), resource0, resource1, resource2,
                      FIELD(u8, descriptor, 0x10));
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, actor, 0x54), FIELD(u8, descriptor, 0x11));
    FIELD(u16, FIELD(void *, actor, 0x54), 0x24) |= 6;
}

/*
 * Inputs are an actor, two 16-bit values, a byte selection, and a fifth byte
 * argument. Store them at offsets 0x1F2, 0x1F4, 0x1EE, and 0x1EF respectively,
 * then apply the 0x1EE selection to the presentation at 0x54. Returns nothing;
 * presentation playback state changes and no hardware is touched directly.
 */
void PresentationBackedActor_SetPlaybackParameters(void *actor, u16 value_1f2, u16 value_1f4,
                   u8 selection, u8 value_1ef)
{
    FIELD(u16, actor, 0x1f2) = value_1f2;
    FIELD(u16, actor, 0x1f4) = value_1f4;
    FIELD(u8, actor, 0x1ee) = selection;
    FIELD(u8, actor, 0x1ef) = value_1ef;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, actor, 0x54), FIELD(u8, actor, 0x1ee));
}
