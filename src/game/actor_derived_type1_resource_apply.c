#include "tingle/types.h"

/* Apply one indexed type-1 actor resource triple to its primary attachment. */
#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetOwningCollection(void *actor);
extern void *ActorCollection_GetSpriteGroup(void *collection);
extern void GraphicsSpriteGroup_ReplaceStateResources(void *collectionData, void *attachment, u32 first,
                          u32 second, u32 third);
#ifdef __cplusplus
}
#endif

/*
 * Select actor resource pointer +0x208[index], resolve the actor collection's
 * data, and pass the primary attachment +0x54 plus resource words +4/+8/+0xc
 * to GraphicsSpriteGroup_ReplaceStateResources. Returns no explicit value; the helper replaces or updates
 * attachment presentation resources and may affect SDK-managed state.
 */
void ActorDerivedType1_ApplyResourceIndex(void *self, u32 index)
{
    u8 *actor = (u8 *)self;
    u8 *resource = *(u8 **)(actor + 0x208 + index * 4);

    GraphicsSpriteGroup_ReplaceStateResources(ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor)),
                  *(void **)(actor + 0x54), *(u32 *)(resource + 4),
                  *(u32 *)(resource + 8), *(u32 *)(resource + 0x0c));
}
