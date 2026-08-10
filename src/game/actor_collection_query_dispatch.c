#include "tingle/types.h"

/*
 * Dispatch an opaque query across registered actors. Actors with offset-0x14
 * flag 0x200000 are skipped; eligible actors must also pass Actor_TestQueryPoint
 * before the selected virtual hook is invoked.
 */
typedef struct QueryDispatchCollection {
    void *actors_0000[128];
    u8 field_0200[0x2c74];
    s32 slotLimit_2e74;
} QueryDispatchCollection;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_TestQueryPoint(void *actor, const void *query);
#ifdef __cplusplus
}
#endif

static s32 actor_is_eligible(void *actor, const void *query)
{
    return actor &&
           !(*(u32 *)((u8 *)actor + 0x14) & 0x200000) &&
           Actor_TestQueryPoint(actor, query);
}

/*
 * Scan slots below slotLimit_2e74, call eligible actors' vtable offset-0x4c
 * hook with query, and return the first nonzero result; return zero if none.
 * The predicate and virtual hook may mutate actor state.
 */
s32 func_0202daec(QueryDispatchCollection *self, const void *query)
{
    s32 i;
    for (i = 0; i < self->slotLimit_2e74; i++) {
        void *actor = self->actors_0000[i];
        if (actor_is_eligible(actor, query)) {
            void **vtable = *(void ***)actor;
            s32 result = ((s32 (*)(void *, const void *))vtable[0x13])(
                actor, query);
            if (result)
                return result;
        }
    }
    return 0;
}

/*
 * Scan every slot below slotLimit_2e74 and call each eligible actor's vtable
 * offset-0x50 hook with query. No result is collected; predicate and hook
 * effects are observable on actor state.
 */
void func_0202db78(QueryDispatchCollection *self, const void *query)
{
    s32 i;
    for (i = 0; i < self->slotLimit_2e74; i++) {
        void *actor = self->actors_0000[i];
        if (actor_is_eligible(actor, query)) {
            void **vtable = *(void ***)actor;
            ((void (*)(void *, const void *))vtable[0x14])(actor, query);
        }
    }
}
