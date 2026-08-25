#include "tingle/types.h"

/*
 * Build per-frame actor category arrays from registered actors. Five embedded
 * 128-pointer arrays have independent counts; the recovered classifier uses
 * actor flags, type, a nullable offset-0x54 pointer, and two signed byte deltas.
 */
typedef struct CategorizedActor {
    void *vtable_00;
    u8 field_04[4];
    s8 x0_08;
    s8 y0_09;
    s8 x1_0a;
    s8 y1_0b;
    u8 field_0c[4];
    u32 flags_10;
    u32 flags_14;
    u8 field_18[0x35];
    u8 type_4d;
    u8 field_4e[6];
    void *field_54;
} CategorizedActor;
typedef struct ActorCollectionCategories {
    CategorizedActor *actors_0000[128];
    CategorizedActor *categories_0200[5][128];
    u8 field_0c00[0x220];
    s32 categoryCounts_0e20[5];
    u8 field_0e34[0x2040];
    s32 slotLimit_2e74;
} ActorCollectionCategories;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorCollection_AppendToCategory(ActorCollectionCategories *, s32,
                                             CategorizedActor *);
extern s32 Actor_GetCategorizationWidth(const CategorizedActor *);
extern s32 Actor_GetCategorizationHeight(const CategorizedActor *);
#ifdef __cplusplus
}
#endif

/*
 * Clear all five category counts, clear flag 0x80 on every actor, then build:
 * category zero for actors admitted by flags/type; category one for selected
 * moving/type-one actors unless flags 0x01000002 block it; category two for
 * selected moving actors lacking flag four; and category three for every
 * non-type-six actor. Category four remains empty. Actors with flag 0x200000
 * are excluded from movement-derived categories. The exact meaning of these
 * lists is not yet confirmed.
 */
void ActorCollection_RebuildCategories(ActorCollectionCategories *self)
{
    s32 i;
    CategorizedActor *actor;
    s32 selected;

    for (i = 0; i < 5; i++)
        self->categoryCounts_0e20[i] = 0;
    for (i = 0; i < self->slotLimit_2e74; i++) {
        actor = self->actors_0000[i];
        if (!actor)
            continue;
        actor->flags_10 &= ~0x80u;
        selected = (s32)actor->field_54;
        if ((actor->flags_14 & 8) || (actor->flags_10 & 4) ||
            actor->type_4d == 6 || (actor->flags_10 & 0x100)) {
            ActorCollection_AppendToCategory(self, 0, actor);
            if (!(actor->flags_14 & 0x200000)) {
                if (Actor_GetCategorizationWidth(actor) || Actor_GetCategorizationHeight(actor)) {
                    if (!actor->field_54 || !(actor->flags_14 & 0x10000000) ||
                        (actor->flags_14 & 8))
                        selected = 1;
                    else
                        selected = 0;
                } else {
                    selected = 0;
                }
                if (!(actor->flags_14 & 0x01000002)) {
                    if (selected)
                        ActorCollection_AppendToCategory(self, 1, actor);
                    else if (actor->type_4d == 1)
                        ActorCollection_AppendToCategory(self, 1, actor);
                }
                if (selected && !(actor->flags_14 & 4))
                    ActorCollection_AppendToCategory(self, 2, actor);
            }
        }
        if (actor->type_4d != 6)
            ActorCollection_AppendToCategory(self, 3, actor);
    }
}

/* Append actor to category at its current count and increment that count. */
void ActorCollection_AppendToCategory(ActorCollectionCategories *self,
                                      s32 category, CategorizedActor *actor)
{
    s32 index = self->categoryCounts_0e20[category]++;
    self->categories_0200[category][index] = actor;
}

/* Return x1_0a minus x0_08 truncated back to a signed eight-bit value. */
s32 Actor_GetCategorizationWidth(const CategorizedActor *actor)
{
    return (s8)(actor->x1_0a - actor->x0_08);
}

/* Return y1_0b minus y0_09 truncated back to a signed eight-bit value. */
s32 Actor_GetCategorizationHeight(const CategorizedActor *actor)
{
    return (s8)(actor->y1_0b - actor->y0_09);
}
