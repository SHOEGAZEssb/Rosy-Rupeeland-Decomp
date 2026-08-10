#include "tingle/types.h"

/* Apply an installed callback to a category control actor and enable category-two members. */
extern u8 *data_021052fc;
extern void *data_020df500[2];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02007f0c(void *runtime, s32 category);
extern void *ActorCollection_FindActorByTypeAndId(void *collection, s32 type, s32 subtype);
extern void Actor_SetActive(void *actor, s32 enabled);
#ifdef __cplusplus
}
#endif

/*
 * Select category one when mode is zero and category two otherwise. Find its
 * type-three/subtype-four control actor, invoke virtual +0x74 with zero,
 * virtual +0xac with index four and the corresponding callback slot, then
 * virtual +0x78 with four. Category two additionally walks collection entries
 * [0,+0x2e74), invoking Actor_SetActive(entry,1) for every nonnull entry. Returns
 * no value; collection lookup, virtual calls, and enable calls mutate actor
 * state. The retail implementation assumes the control actor lookup succeeds.
 */
void func_0203b3cc(s32 mode)
{
    s32 category = mode == 0 ? 1 : 2;
    u8 *collection = (u8 *)func_02007f0c(data_021052fc, category);
    void *control = ActorCollection_FindActorByTypeAndId(collection, 3, 4);
    void **vtable = *(void ***)control;

    (*(void (**)(void *, s32))((u8 *)vtable + 0x74))(control, 0);
    (*(void (**)(void *, s32, void *))((u8 *)vtable + 0xac))(
        control, 4, data_020df500[mode == 0 ? 0 : 1]);
    (*(void (**)(void *, s32))((u8 *)vtable + 0x78))(control, 4);

    if (mode != 0) {
        s32 i;
        for (i = 0; i < *(s32 *)(collection + 0x2e74); ++i) {
            void *actor = *(void **)(collection + i * 4);
            if (actor != 0)
                Actor_SetActive(actor, 1);
        }
    }
}
