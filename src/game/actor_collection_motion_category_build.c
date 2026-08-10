#include "tingle/types.h"

/*
 * Rebuild only the actor collection's movement-derived categories one and two.
 * Other category arrays and counts are preserved, allowing this pass to update
 * motion classification independently of the base category builders.
 */
typedef struct MotionCategoryActor {
    u8 field_00[0x10];
    u32 flags_10;
    u32 flags_14;
    u8 field_18[0x35];
    u8 type_4d;
    u8 field_4e[6];
    void *field_54;
} MotionCategoryActor;
typedef struct ActorCollectionMotionCategories {
    MotionCategoryActor *actors_0000[128];
    MotionCategoryActor *categories_0200[5][128];
    u8 field_0c00[0x220];
    s32 categoryCounts_0e20[5];
    u8 field_0e34[0x2040];
    s32 slotLimit_2e74;
} ActorCollectionMotionCategories;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorCollection_AppendToCategory(ActorCollectionMotionCategories *,
                                             s32, MotionCategoryActor *);
extern s32 func_0202ddac(const MotionCategoryActor *);
extern s32 func_0202ddc4(const MotionCategoryActor *);
#ifdef __cplusplus
}
#endif

/*
 * Clear counts for categories one and two, then scan registered actors. An
 * actor first passes the base admission test when flag 0x08 or 0x04 is set,
 * type is six, or flag 0x100 is set; flag 0x200000 then excludes it. Movement
 * is the nonzero result of either signed-byte delta helper. A moving actor is
 * selected when offset 0x54 is null, flag 0x10000000 is clear, or flag 0x08 is
 * set. Unless flags 0x01000002 block it, selected actors and type-one actors
 * enter category one. Selected actors lacking flag four enter category two.
 */
void ActorCollection_RebuildMotionCategories(ActorCollectionMotionCategories *self)
{
    s32 i;

    self->categoryCounts_0e20[1] = 0;
    self->categoryCounts_0e20[2] = 0;
    for (i = 0; i < self->slotLimit_2e74; i++) {
        MotionCategoryActor *actor = self->actors_0000[i];
        s32 selected;

        if (!actor)
            continue;
        selected = (s32)actor->field_54;
        if (!((actor->flags_14 & 8) || (actor->flags_10 & 4) ||
              actor->type_4d == 6 || (actor->flags_10 & 0x100)))
            continue;
        if (actor->flags_14 & 0x200000)
            continue;
        if (func_0202ddac(actor) || func_0202ddc4(actor)) {
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
