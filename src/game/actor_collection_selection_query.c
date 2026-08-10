#include "tingle/types.h"

/*
 * Select actors for an opaque query and conditionally dispatch a follow-up
 * action through global scene state. Concrete gameplay meanings remain
 * unresolved, so actor fields, predicates, and callbacks retain offsets or
 * address-derived names while the confirmed filtering order is documented.
 */
typedef struct ActorSelectionQuery {
    u32 field_00;
    s32 field_04;
    s32 field_08;
} ActorSelectionQuery;
typedef struct ActorSelectionCollection {
    void *actors_0000[128];
    u8 field_0200[0x2c74];
    s32 slotLimit_2e74;
} ActorSelectionCollection;
typedef struct SelectionVectorStorage {
    u8 bytes[16];
} SelectionVectorStorage;

#ifdef __cplusplus
extern "C" {
#endif
extern u8 data_02105310[];
extern void *data_021052fc;
extern s32 Actor_TestQueryPoint(void *actor,
                                const ActorSelectionQuery *query);
extern s32 func_02034060(void *actor);
extern s32 func_02034044(void *actor);
extern s32 func_0200b04c(const void *state);
extern s32 func_0204aff4(void *actor);
extern s32 func_020397d4(void *actor);
extern void func_0200500c(void *storage, s32 first, s32 second);
extern void func_02005058(void *storage);
extern void func_02038d38(void *actor, void *storage, s32 value, s32 mode);
#ifdef __cplusplus
}
#endif

static u32 read_u32(const void *object, u32 offset)
{
    return *(const u32 *)((const u8 *)object + offset);
}

static void *read_pointer(const void *object, u32 offset)
{
    return *(void *const *)((const u8 *)object + offset);
}

static s32 call_query_hook(void *actor, const ActorSelectionQuery *query)
{
    void **vtable = *(void ***)actor;
    return ((s32 (*)(void *, const ActorSelectionQuery *))vtable[0x12])(
        actor, query);
}

static u16 actor_rank(void *actor)
{
    const u8 *record = (const u8 *)read_pointer(actor, 0x54);
    return *(const u16 *)(record + 0x28);
}

/*
 * Query reserved actor zero first when flag 0x200000 is clear and
 * Actor_TestQueryPoint accepts it. Preserve its vtable-0x48 return value and mark it
 * as candidate when func_02034060 succeeds. If neither yields a result, scan
 * ordinary slots 2..slotLimit-1 under the same eligibility tests, call their
 * query hooks, and choose the nonnull-offset-0x184 actor with the smallest
 * offset-0x54/+0x28 halfword (later actors win ties).
 *
 * Reserved actor one then receives special handling governed by flags at
 * 0x10, 0x14, and 0x268 plus address-derived predicates. A selected candidate
 * can return func_02034044, or can cause a temporary vector to be built from
 * query fields and actor offset-0x24 values and sent to the global actor at
 * scene offset 0x2ea4. The function returns the preserved hook result,
 * func_02034044's result, or zero. Query hooks and the final dispatch may
 * mutate actor/scene state.
 */
s32 func_0202d7a8(ActorSelectionCollection *self,
                  const ActorSelectionQuery *query)
{
    void *actor = self->actors_0000[0];
    void *candidate = 0;
    s32 result = 0;
    s32 bestRank;
    s32 i;
    u8 *scene;

    if (!(read_u32(actor, 0x14) & 0x200000) &&
        Actor_TestQueryPoint(actor, query)) {
        result = call_query_hook(actor, query);
        if (func_02034060(actor))
            candidate = actor;
    }

    if (!result && !candidate) {
        bestRank = 0x7fffffff;
        for (i = 2; i < self->slotLimit_2e74; i++) {
            actor = self->actors_0000[i];
            if (actor && !(read_u32(actor, 0x14) & 0x200000) &&
                Actor_TestQueryPoint(actor, query)) {
                call_query_hook(actor, query);
                if (read_pointer(actor, 0x184) && actor_rank(actor) <= bestRank) {
                    bestRank = actor_rank(actor);
                    candidate = actor;
                }
            }
        }

        actor = self->actors_0000[1];
        if (actor && !(read_u32(actor, 0x14) & 0x200000) &&
            Actor_TestQueryPoint(actor, query)) {
            if (read_u32(actor, 0x10) & 0x01000000) {
                call_query_hook(actor, query);
                if (actor_rank(actor) <= bestRank &&
                    (!candidate || !func_02034060(candidate)))
                    candidate = actor;
            } else if ((!candidate || !func_02034060(candidate)) &&
                       !func_0200b04c(data_02105310) &&
                       (read_u32(actor, 0x268) & 0x8000) &&
                       func_0204aff4(actor) != 5) {
                call_query_hook(actor, query);
            }
        }
    }

    if (candidate) {
        scene = (u8 *)data_021052fc;
        actor = *(void **)(scene + 0x2ea4);
        if (func_020397d4(actor) && !func_0200b04c(data_02105310)) {
            if (func_02034060(candidate)) {
                result = func_02034044(candidate);
            } else if (read_u32(candidate, 0x14) & 0x08000000) {
                void *guardActor = *(void **)(scene + 0x2ea8);
                s32 allowed = 1;
                if (guardActor && (read_u32(guardActor, 0x268) & 0x10) &&
                    !(read_u32(guardActor, 0x268) & 0x400) &&
                    (read_u32(guardActor, 0x10) & 4) &&
                    (read_pointer(guardActor, 0x234) ||
                     (read_u32(guardActor, 0x268) & 4)))
                    allowed = 0;
                if (allowed) {
                    SelectionVectorStorage storage;
                    s32 second = *(s32 *)((u8 *)actor + 0x24) -
                                 *(s32 *)((u8 *)candidate + 0x24) +
                                 (query->field_08 << 12);
                    func_0200500c(&storage, query->field_04 << 12, second);
                    func_02038d38(actor, &storage, 0x14, 3);
                    func_02005058(&storage);
                }
            }
        }
    }
    return result;
}
