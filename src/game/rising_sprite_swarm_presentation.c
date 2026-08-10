#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Manage a staged swarm of rising sprite-motion controllers.  The presentation
 * owns graphics resources, a sampled track, and a doubly linked list of child
 * controllers; its state machine spawns four children, waits on GameWork flag
 * 0x408, retracts them, and signals completion through flag 0x409.
 */

typedef struct PresentationValue {
    u8 bytes[0x10];
} PresentationValue;

typedef struct ControllerListNode {
    struct ControllerListNode *next00;
    struct ControllerListNode *previous04;
    void *controller08;
} ControllerListNode;

typedef struct ControllerList {
    void **vtable;
    ControllerListNode *head04;
    ControllerListNode *tail08;
    s32 count0c;
} ControllerList;

typedef struct RisingSpriteSwarmPresentation {
    void **vtable;
    u32 field04;
    s32 referencePosition08;
    ControllerList controllers0c;
    s32 state1c;
    s32 timer20;
    void *resource24;
    void *resource28;
    u8 spriteConfig2c[0x0c];
    PresentationValue track38;
    s32 nextPathArgument48;
} RisingSpriteSwarmPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6358;
extern void *data_020d6398;
extern const char data_020d63b8[];
extern const char data_020d632c[];
extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *gDebugFont;
extern void *gGameWork;
extern void *func_0201e250(void *self);
extern void *func_0201e28c(void *self);
extern void VecFx32Object_InitComponents(PresentationValue *value, s32 x, s32 y, s32 z);
extern void VecFx32Object_InitCopy(PresentationValue *destination, const void *source);
extern void VecFx32Object_Destroy(PresentationValue *value);
extern void VecFx32Object_Add(PresentationValue *destination,
                          PresentationValue *source);
extern void func_02008378(PresentationValue *destination, s32 argument,
                          PresentationValue *source);
extern void func_02071ea4(void *state);
extern void func_02071eb8(void *state);
extern void func_02071ee0(void *state, void *table, s32 first, s32 second,
                          s32 third);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *resource);
extern void GraphicsSpriteGroup_Clear(void *resource);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *resource);
extern void GameWork_ClearFlag(void *gameWork, s32 flag);
extern s32 GameWork_TestFlag(void *gameWork, s32 flag);
extern void GameWork_SetFlag(void *gameWork, s32 flag);
extern void *RisingSpriteMotionController_Init(void *self, void *resource24,
                                                void *resource28,
                                                void *spriteConfig,
                                                s32 pathArgument,
                                                s32 sequence);
extern void *RisingSpriteMotionController_Destroy(void *controller);
extern s32 RisingSpriteMotionController_Update(void *controller,
                                                s32 referencePosition);
extern void RisingSpriteMotionController_SetState(void *controller, s32 state);
#ifdef __cplusplus
}
#endif

void RisingSpriteControllerList_Clear(ControllerList *self);
ControllerList *RisingSpriteControllerList_Init(ControllerList *self);
void RisingSpriteControllerList_RemoveNode(ControllerList *self,
                                           ControllerListNode *node);
void RisingSpriteSwarmPresentation_SpawnController(RisingSpriteSwarmPresentation *self);
void RisingSpriteSwarmPresentation_SetControllerState(
    RisingSpriteSwarmPresentation *self, s32 state);

/*
 * Initialize the recovered base, list owner, sprite-resource state, and track;
 * retain referencePosition and add a fixed-point Z offset from trackZ. Acquire
 * two graphics resources, initialize spriteConfig2c from the global resource
 * table and IDs 0x1658..0x165a, clear GameWork flags 0x408/0x409, reset the
 * state/timers and child sequence, and return self.
 */
RisingSpriteSwarmPresentation *RisingSpriteSwarmPresentation_Init(
    RisingSpriteSwarmPresentation *self, s32 referencePosition,
    const u8 *config,
    s32 trackZ)
{
    PresentationValue offset;

    func_0201e250(self);
    self->vtable = (void **)data_020d6398;
    self->referencePosition08 = referencePosition;
    RisingSpriteControllerList_Init(&self->controllers0c);
    self->state1c = 0;
    self->timer20 = 0;
    self->resource24 = 0;
    self->resource28 = 0;
    func_02071ea4(self->spriteConfig2c);
    VecFx32Object_InitCopy(&self->track38, config + 0x18);
    self->nextPathArgument48 = 0;
    VecFx32Object_InitComponents(&offset, 0, 0, trackZ << 12);
    VecFx32Object_Add(&self->track38, &offset);
    VecFx32Object_Destroy(&offset);
    self->resource24 = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    self->resource28 = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    func_02071ee0(self->spriteConfig2c, data_020f4e18, 0x1658, 0x1659,
                  0x165a);
    GameWork_ClearFlag(gGameWork, 0x408);
    GameWork_ClearFlag(gGameWork, 0x409);
    return self;
}

/* Install the list vtable and clear head, tail, and count. */
ControllerList *RisingSpriteControllerList_Init(ControllerList *self)
{
    self->vtable = (void **)data_020d6358;
    self->head04 = 0;
    self->tail08 = 0;
    self->count0c = 0;
    return self;
}

/* Install the list vtable, clear and free all nodes, and return self. */
ControllerList *RisingSpriteControllerList_Destroy(ControllerList *self)
{
    self->vtable = (void **)data_020d6358;
    RisingSpriteControllerList_Clear(self);
    return self;
}

/* Free every node reachable from head04, then zero head, tail, and count. */
void RisingSpriteControllerList_Clear(ControllerList *self)
{
    ControllerListNode *node = self->head04;

    while (node != 0) {
        ControllerListNode *next = node->next00;
        Heap_Free(node);
        node = next;
    }
    self->head04 = 0;
    self->tail08 = 0;
    self->count0c = 0;
}

static RisingSpriteSwarmPresentation *teardown_swarm(
    RisingSpriteSwarmPresentation *self)
{
    ControllerListNode *node;

    self->vtable = (void **)data_020d6398;
    node = self->controllers0c.head04;
    while (node != 0) {
        void *controller = node->controller08;
        if (controller != 0) {
            RisingSpriteMotionController_Destroy(controller);
            Heap_Free(controller);
        }
        RisingSpriteControllerList_RemoveNode(&self->controllers0c, node);
        /* Retail reloads next00 through the just-freed node allocation. */
        node = node->next00;
    }
    GraphicsSpriteGroup_Clear(self->resource24);
    GraphicsSpriteGroup_Clear(self->resource28);
    VecFx32Object_Destroy(&self->track38);
    func_02071eb8(self->spriteConfig2c);
    self->controllers0c.vtable = (void **)data_020d6358;
    RisingSpriteControllerList_Clear(&self->controllers0c);
    func_0201e28c(self);
    return self;
}

/* Destroy all children and owned resources, tear down the base, and return self. */
RisingSpriteSwarmPresentation *RisingSpriteSwarmPresentation_Destroy(
    RisingSpriteSwarmPresentation *self)
{
    return teardown_swarm(self);
}

/* Perform the normal teardown, free self, and return its old address. */
RisingSpriteSwarmPresentation *RisingSpriteSwarmPresentation_DestroyAndFree(
    RisingSpriteSwarmPresentation *self)
{
    teardown_swarm(self);
    Heap_Free(self);
    return self;
}

/*
 * Unlink node from both list ends/neighbors, free it when nonnull, decrement
 * count, and clear the list again when the count reaches zero.
 */
void RisingSpriteControllerList_RemoveNode(ControllerList *self,
                                           ControllerListNode *node)
{
    if (node == self->head04) {
        self->head04 = node->next00;
    } else {
        node->previous04->next00 = node->next00;
    }
    if (node == self->tail08) {
        self->tail08 = node->previous04;
    } else {
        node->next00->previous04 = node->previous04;
    }
    if (node != 0) {
        Heap_Free(node);
    }
    self->count0c--;
    if (self->count0c == 0) {
        RisingSpriteControllerList_Clear(self);
    }
}

/*
 * Drive the five-state spawn/retract sequence, returning one only once state
 * four has no remaining children (and setting flag 0x409).  Every other call
 * updates all children with referencePosition08, removes finished children,
 * then
 * refreshes both graphics resources and returns zero.  Retail advances list
 * iteration through a node after RisingSpriteControllerList_RemoveNode frees
 * that node.
 */
s32 RisingSpriteSwarmPresentation_Update(RisingSpriteSwarmPresentation *self)
{
    ControllerListNode *node;

    switch (self->state1c) {
    case 0:
        self->state1c++;
        break;
    case 1:
        if (--self->timer20 <= 0) {
            RisingSpriteSwarmPresentation_SpawnController(self);
            self->timer20 = 0x23;
            if (self->controllers0c.count0c < 4) {
                self->state1c = 0;
            } else {
                self->timer20 = 5;
                self->state1c++;
            }
        }
        break;
    case 2:
        if (--self->timer20 <= 0) {
            RisingSpriteSwarmPresentation_SetControllerState(self, 1);
            self->state1c++;
        }
        break;
    case 3:
        if (GameWork_TestFlag(gGameWork, 0x408) != 0) {
            RisingSpriteSwarmPresentation_SetControllerState(self, 2);
            self->state1c++;
        }
        break;
    case 4:
        if (self->controllers0c.count0c == 0) {
            GameWork_SetFlag(gGameWork, 0x409);
            return 1;
        }
        break;
    }
    node = self->controllers0c.head04;
    while (node != 0) {
        void *controller = node->controller08;
        if (RisingSpriteMotionController_Update(
                controller, self->referencePosition08) != 0) {
            RisingSpriteControllerList_RemoveNode(&self->controllers0c, node);
            if (controller != 0) {
                RisingSpriteMotionController_Destroy(controller);
                Heap_Free(controller);
            }
        }
        node = node->next00;
    }
    GraphicsSpriteGroup_AdvanceAnimations(self->resource24);
    GraphicsSpriteGroup_AdvanceAnimations(self->resource28);
    return 0;
}

/*
 * Allocate a 0x64-byte child controller and initialize it from this object's
 * resources/config plus a path derived from track38 and nextPathArgument48.
 * Destroy constructed temporaries, allocate a 0x0c-byte list node holding the
 * child (including null on child allocation failure), append it, and increment
 * both the list count and nextPathArgument48.
 */
void RisingSpriteSwarmPresentation_SpawnController(RisingSpriteSwarmPresentation *self)
{
    PresentationValue base;
    PresentationValue path;
    void *controller = Heap_Alloc(0x64, data_020d63b8, 4, &gHeapContext);

    if (controller != 0) {
        VecFx32Object_InitComponents(&base, 0, 0, 0x20000);
        func_02008378(&path, self->nextPathArgument48, &base);
        RisingSpriteMotionController_Init(controller, self->resource24, self->resource28,
                      self->spriteConfig2c, (s32)&path,
                      self->nextPathArgument48);
        VecFx32Object_Destroy(&path);
        VecFx32Object_Destroy(&base);
    }
    {
        ControllerListNode *node = (ControllerListNode *)Heap_Alloc(
            0x0c, data_020d632c, 4, &gHeapContext);
        if (node != 0) {
            node->next00 = 0;
            node->previous04 = 0;
            node->controller08 = controller;
        }
        if (self->controllers0c.tail08 != 0) {
            self->controllers0c.tail08->next00 = node;
            node->previous04 = self->controllers0c.tail08;
        } else {
            self->controllers0c.head04 = node;
        }
        self->controllers0c.tail08 = node;
        self->controllers0c.count0c++;
    }
    self->nextPathArgument48++;
}

/* Apply state to every child controller currently in the list. */
void RisingSpriteSwarmPresentation_SetControllerState(
    RisingSpriteSwarmPresentation *self, s32 state)
{
    ControllerListNode *node = self->controllers0c.head04;
    while (node != 0) {
        RisingSpriteMotionController_SetState(node->controller08, state);
        node = node->next00;
    }
}

/* Install the list vtable, clear it, free self, and return its old address. */
ControllerList *RisingSpriteControllerList_DestroyAndFree(ControllerList *self)
{
    self->vtable = (void **)data_020d6358;
    RisingSpriteControllerList_Clear(self);
    Heap_Free(self);
    return self;
}
