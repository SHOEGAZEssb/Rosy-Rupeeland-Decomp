#include "tingle/types.h"

/*
 * Recovered resource and state setup for the trigger-presentation actor. It
 * constructs the owned presentation from a descriptor and provides the small
 * state reset used to select a new presentation entry.
 */

extern void *data_020f4e18;

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorCollection_GetSpriteGroup(void);
extern void Actor_GetOwningCollection(void *actor);
extern void Actor_ApplySpawnDescriptorScript(void *actor, const void *descriptor);
extern void *GraphicsArchive_FindCharacterResource(void *archive, u32 resource_id);
extern void *GraphicsArchive_FindPaletteResource(void *archive, u32 resource_id);
extern void *GraphicsArchive_FindCellResource(void *archive, u32 resource_id);
extern void GraphicsSpriteState_SetAnimationIndex(void *presentation, u32 selection);
extern void *GraphicsSpriteGroup_CreateState(void *context, void *resource0, void *resource1,
                           void *resource2, u32 mode);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are an actor and a descriptor with resource IDs at 0x04/0x08/0x0C
 * and mode bytes at 0x10/0x11. Resolve the resources through data_020f4e18,
 * prepare the actor, create its presentation at +0x54, select the initial
 * entry, set presentation mask 0x0002, and apply the descriptor's optional
 * actor script through Actor_ApplySpawnDescriptorScript. Returns nothing;
 * resource, script, and presentation state change without direct hardware
 * access.
 */
void TriggerPresentationActor_SetupPresentation(void *actor, const void *descriptor)
{
    void *resource0 = GraphicsArchive_FindCharacterResource(data_020f4e18,
                                    FIELD(u32, descriptor, 4));
    void *resource1 = GraphicsArchive_FindPaletteResource(data_020f4e18,
                                    FIELD(u32, descriptor, 8));
    void *resource2 = GraphicsArchive_FindCellResource(data_020f4e18,
                                    FIELD(u32, descriptor, 12));
    Actor_GetOwningCollection(actor);
    void *presentation = GraphicsSpriteGroup_CreateState(
        ActorCollection_GetSpriteGroup(), resource0, resource1, resource2,
        FIELD(u8, descriptor, 0x10));
    FIELD(void *, actor, 0x54) = presentation;
    GraphicsSpriteState_SetAnimationIndex(presentation, FIELD(u8, descriptor, 0x11));
    FIELD(u16, presentation, 0x24) |= 2;
    Actor_ApplySpawnDescriptorScript(actor, descriptor);
}

/*
 * Inputs are an actor and a 16-bit presentation selection. Store it at 0x1EE,
 * reset state 0x1EC to zero, and tail-call GraphicsSpriteState_SetAnimationIndex for the presentation
 * at 0x54. The callee's return is propagated by retail assembly; actor and
 * presentation state change, with no direct hardware effects.
 */
void Actor_SetPresentationSelection(void *actor, u16 selection)
{
    FIELD(u16, actor, 0x1ee) = selection;
    FIELD(u16, actor, 0x1ec) = 0;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, actor, 0x54), selection);
}
