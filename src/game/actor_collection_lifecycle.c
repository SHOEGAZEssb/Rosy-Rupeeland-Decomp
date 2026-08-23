#include "tingle/actor_collection.h"

/*
 * Initialize and tear down the large actor collection used by subsequent
 * registration, relationship, and update routines. The object contains 128
 * actor slots, five category arrays, a triangular relationship matrix, two
 * embedded overlay slots, and an optional sprite group selected for one of
 * the two displays.
 */
#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e14;
extern void *gDebugFont;
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
 * Initialize both embedded overlay slots, clear the triangular relationship
 * matrix, zero all actor/category/removal slots, initialize actorCount with the
 * two-reserved-slot baseline and slotLimit to the first ordinary slot, preserve
 * flags other than clearing the removal-queue processing bit and setting state
 * bit one, clear reserved pointers, set the collection-wide actor scale to Q12
 * unity, initialize four sentinel indices to -1, and return self.
 */
ActorCollection *ActorCollection_Init(ActorCollection *self)
{
    s32 i;
    s32 j;

    self->spriteGroup = 0;
    OverlaySlot_Init(&self->firstOverlaySlot);
    OverlaySlot_Init(&self->secondOverlaySlot);
    ActorPairStateMatrix_ClearAll(&self->pairStateMatrix);
    self->flags |= ACTOR_COLLECTION_STATE_FLAG_BIT_ONE;
    self->spriteGroupDisplayMode = 0;
    self->actorScale = ACTOR_COLLECTION_DEFAULT_SCALE;
    for (i = 0; i < ACTOR_COLLECTION_SLOT_COUNT; i++) {
        self->actors[i] = 0;
        for (j = 0; j < ACTOR_COLLECTION_CATEGORY_COUNT; j++)
            self->categories[j][i] = 0;
        self->removalQueue[i] = 0;
    }
    for (i = 0; i < ACTOR_COLLECTION_CATEGORY_COUNT; i++)
        self->categoryCounts[i] = 0;
    self->actorCount = ACTOR_COLLECTION_FIRST_ORDINARY_SLOT;
    self->slotLimit = ACTOR_COLLECTION_FIRST_ORDINARY_SLOT;
    self->flags &= ~ACTOR_COLLECTION_PROCESS_REMOVAL_QUEUE_FLAG;
    self->reservedTypeOneActor = 0;
    self->reservedTypeSevenActor = 0;
    for (i = 0; i < ACTOR_COLLECTION_SENTINEL_INDEX_COUNT; i++)
        self->sentinelIndices[i] = -1;
    return self;
}

/*
 * Create an optional sprite group for display mode one through data_020f4e14
 * or for display mode two through gDebugFont. Other modes leave any existing
 * sprite-group pointer unchanged. Record the requested display mode regardless
 * of whether a group was created.
 */
void ActorCollection_CreateSpriteGroupForDisplayMode(ActorCollection *self,
                                                     s32 displayMode)
{
    if (displayMode == 1)
        self->spriteGroup = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    else if (displayMode == 2)
        self->spriteGroup = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    self->spriteGroupDisplayMode = displayMode;
}

/* Fully clean the collection and both embedded overlay slots, then return self. */
ActorCollection *ActorCollection_Destructor(ActorCollection *self)
{
    ActorCollection_Deinit(self);
    OverlaySlot_Destroy(&self->secondOverlaySlot);
    OverlaySlot_Destroy(&self->firstOverlaySlot);
    return self;
}

/*
 * Remove all registered actors, return the optional sprite group to the owner
 * selected by spriteGroupDisplayMode, clear its pointer, and unload both
 * embedded overlay slots. Other display modes do not release spriteGroup.
 */
void ActorCollection_Deinit(ActorCollection *self)
{
    ActorCollection_UnregisterAndDestroyAllActors(self);
    if (self->spriteGroupDisplayMode == 1) {
        GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14, self->spriteGroup);
        self->spriteGroup = 0;
    } else if (self->spriteGroupDisplayMode == 2) {
        GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont, self->spriteGroup);
        self->spriteGroup = 0;
    }
    OverlaySlot_UnloadOverlay(&self->firstOverlaySlot);
    OverlaySlot_UnloadOverlay(&self->secondOverlaySlot);
}
