#include "tingle/types.h"

/* Apply one indexed type-1 actor resource triple to its primary attachment. */
#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetCollection(void *actor);
extern void *ActorCollection_GetSpriteOwner(void *collection);
extern void func_020740c8(void *collectionData, void *attachment, u32 first,
                          u32 second, u32 third);
#ifdef __cplusplus
}
#endif

/*
 * Select actor resource pointer +0x208[index], resolve the actor collection's
 * data, and pass the primary attachment +0x54 plus resource words +4/+8/+0xc
 * to func_020740c8. Returns no explicit value; the helper replaces or updates
 * attachment presentation resources and may affect SDK-managed state.
 */
void func_020354e8(void *self, u32 index)
{
    u8 *actor = (u8 *)self;
    u8 *resource = *(u8 **)(actor + 0x208 + index * 4);

    func_020740c8(ActorCollection_GetSpriteOwner(Actor_GetCollection(actor)),
                  *(void **)(actor + 0x54), *(u32 *)(resource + 4),
                  *(u32 *)(resource + 8), *(u32 *)(resource + 0x0c));
}
