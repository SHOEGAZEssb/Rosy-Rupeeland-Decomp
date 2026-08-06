#include "tingle/types.h"

/*
 * Build the reduced actor category view used when only the base-admission and
 * non-type-six lists are required. Five counts are reset even though only
 * categories zero and three receive entries.
 */
typedef struct BasicCategoryActor {
    u8 field_00[0x10];
    u32 flags_10;
    u32 flags_14;
    u8 field_18[0x35];
    u8 type_4d;
} BasicCategoryActor;
typedef struct ActorCollectionBasicCategories {
    BasicCategoryActor *actors_0000[128];
    BasicCategoryActor *categories_0200[5][128];
    u8 field_0c00[0x220];
    s32 categoryCounts_0e20[5];
    u8 field_0e34[0x2040];
    s32 slotLimit_2e74;
} ActorCollectionBasicCategories;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0202dd80(ActorCollectionBasicCategories *, s32,
                          BasicCategoryActor *);
#ifdef __cplusplus
}
#endif

/*
 * Clear all category counts and actor flag 0x80. Add actors to category zero
 * when flag 8, flag 4, type six, or flag 0x100 admits them; independently add
 * every non-type-six actor to category three. Categories one, two, and four
 * remain empty.
 */
void func_0202dddc(ActorCollectionBasicCategories *self)
{
    s32 i;

    for (i = 0; i < 5; i++)
        self->categoryCounts_0e20[i] = 0;
    for (i = 0; i < self->slotLimit_2e74; i++) {
        BasicCategoryActor *actor = self->actors_0000[i];
        if (!actor)
            continue;
        actor->flags_10 &= ~0x80u;
        if ((actor->flags_14 & 8) || (actor->flags_10 & 4) ||
            actor->type_4d == 6 || (actor->flags_10 & 0x100))
            func_0202dd80(self, 0, actor);
        if (actor->type_4d != 6)
            func_0202dd80(self, 3, actor);
    }
}
