#include "tingle/types.h"

/* Build and dispatch a temporary actor resource effect. */
extern void *gGameWork;
extern u8 data_02105310[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020337d4(void *);
extern void func_0201b124(void *, void *, void *, void *);
extern void func_0200aef4(void *, const void *);
extern void func_0201b1e0(void *);
#ifdef __cplusplus
}
#endif

/*
 * Store resource at actor slot 0x180. Build a temporary 0x94-byte resource
 * using GameWork offset 0x3cc when the actor collection's mode 0x2e84 equals
 * one, otherwise offset 0x5cc. Dispatch it through data_02105310 and destroy
 * the temporary. Returns no value; resource/effect helpers may update SDK or
 * presentation state.
 */
void Actor_AssignPrimaryResourceWithEffect(void *self, void *resource)
{
    u8 *actor = (u8 *)self;
    u8 temporary[0x94];
    void *collection;
    void *gameData;

    *(void **)(actor + 0x180) = resource;
    collection = func_020337d4(actor);
    gameData = (u8 *)gGameWork +
               (*(s32 *)((u8 *)collection + 0x2e84) == 1 ? 0x3cc : 0x5cc);
    func_0201b124(temporary, actor, resource, gameData);
    func_0200aef4(data_02105310, temporary);
    func_0201b1e0(temporary);
}
