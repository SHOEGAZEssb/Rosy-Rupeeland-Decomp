#include "tingle/actor_pair_state.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/types.h"

/*
 * Initialize and tear down the large actor collection used by subsequent
 * registration, relationship, and update routines. The object contains 128
 * actor slots, five parallel pointer arrays, a triangular relationship matrix,
 * two embedded owners, and an optional sprite group selected from one of two
 * group owners.
 */
typedef struct ActorCollectionOwner {
    u8 bytes[12];
} ActorCollectionOwner;

typedef struct ActorCollection {
    void *actors_0000[128];
    void *relations_0200[5][128];
    void *field_0c00[128];
    GraphicsSpriteGroup *spriteGroup_0e00;
    ActorCollectionOwner owner_0e04;
    ActorCollectionOwner owner_0e10;
    s32 actorCount_0e1c;
    void *field_0e20[5];
    ActorPairStateMatrix pairStateMatrix_0e34;
    s32 slotLimit_2e74;
    u32 flags_2e78;
    void *specialActor_2e7c;
    void *secondaryActor_2e80;
    s32 spriteMode_2e84;
    s32 actorScale_2e88;
    u8 field_2e8c[4];
    s32 field_2e90[4];
} ActorCollection;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e14;
extern void *gDebugFont;
extern void OverlaySlot_Init(void *owner);
extern void OverlaySlot_Destroy(void *owner);
extern void OverlaySlot_UnloadOverlay(void *owner);
extern void ActorCollection_UnregisterAndDestroyAllActors(ActorCollection *self);
extern void ActorCollection_Deinit(ActorCollection *self);
#ifdef __cplusplus
}
#endif

/* Clear exactly 0x2040 relationship bytes and return no value. */
void ActorPairStateMatrix_ClearAll(ActorPairStateMatrix *matrix)
{
    s32 i;
    for (i = 0; i < ACTOR_PAIR_STATE_ENTRY_COUNT; i++)
        matrix->entries[i] = 0;
}

/*
 * Initialize both embedded owners, clear the triangular relationship matrix,
 * zero all actor/relation/auxiliary slots, set the first usable actor slot and
 * slot limit to two, preserve flags other than clearing bit zero and setting
 * bit one, clear special pointers, set the collection-wide actor scale to Q12
 * unity (0x1000), initialize four trailing indices to -1, and return self.
 * Embedded owner calls may establish allocation or SDK state not yet
 * semantically identified.
 */
ActorCollection *ActorCollection_Init(ActorCollection *self)
{
    s32 i;
    s32 j;

    self->spriteGroup_0e00 = 0;
    OverlaySlot_Init(&self->owner_0e04);
    OverlaySlot_Init(&self->owner_0e10);
    ActorPairStateMatrix_ClearAll(&self->pairStateMatrix_0e34);
    self->flags_2e78 |= 2;
    self->spriteMode_2e84 = 0;
    self->actorScale_2e88 = 0x1000;
    for (i = 0; i < 128; i++) {
        self->actors_0000[i] = 0;
        for (j = 0; j < 5; j++)
            self->relations_0200[j][i] = 0;
        self->field_0c00[i] = 0;
    }
    for (i = 0; i < 5; i++)
        self->field_0e20[i] = 0;
    self->actorCount_0e1c = 2;
    self->slotLimit_2e74 = 2;
    self->flags_2e78 &= ~1u;
    self->specialActor_2e7c = 0;
    self->secondaryActor_2e80 = 0;
    for (i = 0; i < 4; i++)
        self->field_2e90[i] = -1;
    return self;
}

/*
 * Select an optional sprite group: mode one creates it through data_020f4e14,
 * mode two creates it through gDebugFont, and other modes create nothing.
 * Record the requested mode regardless of whether a group was created.
 */
void ActorCollection_SetSpriteMode(ActorCollection *self, s32 mode)
{
    if (mode == 1)
        self->spriteGroup_0e00 = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    else if (mode == 2)
        self->spriteGroup_0e00 = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    self->spriteMode_2e84 = mode;
}

/* Fully clean the collection and both embedded owners, then return self. */
ActorCollection *ActorCollection_Destructor(ActorCollection *self)
{
    ActorCollection_Deinit(self);
    OverlaySlot_Destroy(&self->owner_0e10);
    OverlaySlot_Destroy(&self->owner_0e04);
    return self;
}

/*
 * Remove all registered actors, return the optional sprite group to the owner
 * selected by spriteMode_2e84, clear its pointer, and finalize both embedded
 * owners. Modes other than one and two do not release spriteGroup_0e00.
 */
void ActorCollection_Deinit(ActorCollection *self)
{
    ActorCollection_UnregisterAndDestroyAllActors(self);
    if (self->spriteMode_2e84 == 1) {
        GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14, self->spriteGroup_0e00);
        self->spriteGroup_0e00 = 0;
    } else if (self->spriteMode_2e84 == 2) {
        GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont, self->spriteGroup_0e00);
        self->spriteGroup_0e00 = 0;
    }
    OverlaySlot_UnloadOverlay(&self->owner_0e04);
    OverlaySlot_UnloadOverlay(&self->owner_0e10);
}
