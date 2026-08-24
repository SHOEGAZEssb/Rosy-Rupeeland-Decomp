#include "tingle/types.h"

/* Apply an installed callback to a category control actor and enable category-two members. */
extern u8 *gGamePhaseRuntime;
extern const s8 *data_020df500[2];

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 category);
extern void *ActorCollection_FindActorByTypeAndId(void *collection, s32 type, s32 subtype);
extern void Actor_SetActive(void *actor, s32 enabled);
#ifdef __cplusplus
}
#endif

/*
 * Select category one when mode is zero and category two otherwise. Find its
 * type-three/subtype-four control actor, clear its primary script through
 * virtual +0x74, store the corresponding category script in slot four through
 * virtual +0xac, then select script variant four through virtual +0x78.
 * Category two additionally walks collection entries
 * [0,+0x2e74), invoking Actor_SetActive(entry,1) for every nonnull entry. Returns
 * no value; collection lookup, virtual calls, and enable calls mutate actor
 * state. The retail implementation assumes the control actor lookup succeeds.
 */
#ifdef __cplusplus
extern "C"
#endif
void ActorDescriptorBatch_ApplyCategoryCallback(s32 mode)
{
    s32 category = mode == 0 ? 1 : 2;
    u8 *collection = (u8 *)GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, category);
    void *control = ActorCollection_FindActorByTypeAndId(collection, 3, 4);
    u8 *vtable = *(u8 **)control;

    (*(void (**)(void *, const s8 *))(vtable + 0x74))(control, 0);
    (*(void (**)(void *, s32, const s8 *))(vtable + 0xac))(
        control, 4, data_020df500[mode == 0 ? 0 : 1]);
    (*(void (**)(void *, s32))(vtable + 0x78))(control, 4);

    if (mode != 0) {
        s32 i;
        for (i = 0; i < *(s32 *)(collection + 0x2e74); ++i) {
            void *actor = *(void **)(collection + i * 4);
            if (actor != 0)
                Actor_SetActive(actor, 1);
        }
    }
}
