#include "tingle/field_effect.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Own and update a linked collection of randomized sprite particles. The
 * emitter stores two FX32 endpoints, two resource-wrapper records, a sprite
 * owner, a 30..34-tick randomized spawn cadence, and a small intrusive list.
 * Game flag 0x414 terminates the presentation and suppresses further spawns.
 */
typedef struct EmitterVector {
    s32 x;
    s32 y;
    s32 z;
    s32 field_0c;
} EmitterVector;

typedef struct ParticleListNode {
    struct ParticleListNode *next_00;
    struct ParticleListNode *previous_04;
    void *particle_08;
} ParticleListNode;

typedef struct ParticleList {
    void **vtable_00;
    ParticleListNode *head_04;
    ParticleListNode *tail_08;
    s32 count_0c;
} ParticleList;

typedef struct RandomizedSpriteParticleEmitter {
    void **vtable_00;
    u32 dispatchState;
    const void *projection_08;
    EmitterVector position_0c;
    EmitterVector target_1c;
    u8 resources_2c[0x20];
    u8 *spriteOwner_4c;
    u32 field_50;
    s32 spawnTimer_54;
    s32 frame_58;
    ParticleList particles_5c;
} RandomizedSpriteParticleEmitter;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020de89c[];
extern void *data_020de8cc[];
extern const char gRandomizedSpriteParticleListNodeAllocationTag[];
extern const char gRandomizedSpriteParticleAllocationTag[];
extern const char gRandomizedSpriteParticleEmitterAllocationTag[];
extern u8 *gGamePhaseRuntime;
extern void *data_020f4e14;
extern u32 genrand_int32(void);
extern void __construct_array(void *, u32, u32, void (*)(void *),
                              void (*)(void *));
extern void __destroy_arr(void *, u32, u32, void (*)(void *));
extern void AnimationResource_InitEmpty(void *);
extern void AnimationResource_Init(void *, s32, s32, s32);
extern void AnimationResource_Destroy(void *);
extern void AnimationResource_Assign(void *, const void *);
extern void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern void VecFx32Object_InitCopy(void *, const void *);
extern void VecFx32Object_Destroy(void *);
extern void VecFx32_Subtract(void *, const void *, const void *);

extern void *RuntimePresentationManager_AppendFirstListEffect(void *, void *);
extern void AnimationResourceState_ReleaseResources(void *);
extern u8 *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteGroupOwner_DestroyGroup(void *, void *);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void *RandomizedSpriteParticle_Init(void *, void *, void *, const void *,
                           const void *, s32);
extern void *RandomizedSpriteParticle_Destroy(void *);
extern s32 RandomizedSpriteParticle_Update(void *, const void *);
void RandomizedSpriteParticleList_Init(ParticleList *);
void RandomizedSpriteParticleList_Clear(ParticleList *);
void RandomizedSpriteParticleList_RemoveNode(ParticleList *, ParticleListNode *);
RandomizedSpriteParticleEmitter *RandomizedSpriteParticleEmitter_Init(
    RandomizedSpriteParticleEmitter *, const void *, const EmitterVector *,
    const EmitterVector *, s32);
RandomizedSpriteParticleEmitter *RandomizedSpriteParticleEmitter_Destroy(
    RandomizedSpriteParticleEmitter *);

/*
 * Initialize the presentation and endpoints, construct two 0x10-byte resource
 * wrappers, configure them with ID triplets 0x138e/0x1078/0x138f and
 * 0x168b..0x168d, create an empty particle list, acquire the global sprite
 * owner, and return self. The projection pointer is borrowed.
 */
RandomizedSpriteParticleEmitter *RandomizedSpriteParticleEmitter_Init(
    RandomizedSpriteParticleEmitter *self, const void *projection,
    const EmitterVector *position, const EmitterVector *target, s32 frame)
{
    u8 temporary[0x10];
    FieldEffect_Init(self);
    self->vtable_00 = (void **)data_020de8cc;
    self->projection_08 = projection;
    VecFx32Object_InitCopy(&self->position_0c, position);
    VecFx32Object_InitCopy(&self->target_1c, target);
    __construct_array(self->resources_2c, 2, 0x10,
                      (void (*)(void *))AnimationResource_InitEmpty, AnimationResource_Destroy);
    self->spawnTimer_54 = 0;
    self->frame_58 = frame;
    RandomizedSpriteParticleList_Init(&self->particles_5c);
    AnimationResource_Init(temporary, 0x138e, 0x1078, 0x138f);
    AnimationResource_Assign(self->resources_2c, temporary);
    AnimationResource_Destroy(temporary);
    AnimationResource_Init(temporary, 0x168b, 0x168c, 0x168d);
    AnimationResource_Assign(self->resources_2c + 0x10, temporary);
    AnimationResource_Destroy(temporary);
    self->spriteOwner_4c = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    return self;
}

/* Initialize an empty intrusive particle-node list with its recovered vtable. */
void RandomizedSpriteParticleList_Init(ParticleList *self)
{
    self->vtable_00 = (void **)data_020de89c;
    self->head_04 = 0;
    self->tail_08 = 0;
    self->count_0c = 0;
}

/* Destroy all list nodes, clear links/count, and return the list. */
ParticleList *RandomizedSpriteParticleList_Destroy(ParticleList *self)
{
    self->vtable_00 = (void **)data_020de89c;
    RandomizedSpriteParticleList_Clear(self);
    return self;
}

/* Free every node without touching its payload, then reset the empty list. */
void RandomizedSpriteParticleList_Clear(ParticleList *self)
{
    ParticleListNode *node = self->head_04;
    while (node) {
        ParticleListNode *next = node->next_00;
        if (node)
            Heap_Free(node);
        node = next;
    }
    self->head_04 = 0;
    self->tail_08 = 0;
    self->count_0c = 0;
}

/* Release all particles/nodes and owned graphics/vector/FieldEffect state; return self. */
RandomizedSpriteParticleEmitter *RandomizedSpriteParticleEmitter_Destroy(
    RandomizedSpriteParticleEmitter *self)
{
    ParticleListNode *node = self->particles_5c.head_04;
    self->vtable_00 = (void **)data_020de8cc;
    while (node) {
        ParticleListNode *next = node->next_00;
        void *particle = node->particle_08;
        RandomizedSpriteParticleList_RemoveNode(&self->particles_5c, node);
        if (particle) {
            RandomizedSpriteParticle_Destroy(particle);
            Heap_Free(particle);
        }
        node = next;
    }
    GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14, self->spriteOwner_4c);
    AnimationResourceState_ReleaseResources(self->resources_2c + 4);
    AnimationResourceState_ReleaseResources(self->resources_2c + 0x14);
    self->particles_5c.vtable_00 = (void **)data_020de89c;
    RandomizedSpriteParticleList_Clear(&self->particles_5c);
    __destroy_arr(self->resources_2c, 2, 0x10, AnimationResource_Destroy);
    VecFx32Object_Destroy(&self->target_1c);
    VecFx32Object_Destroy(&self->position_0c);
    FieldEffect_DestroyBase(self);
    return self;
}

/* Perform full emitter teardown, free self, and return its old address. */
RandomizedSpriteParticleEmitter *RandomizedSpriteParticleEmitter_DestroyAndFree(
    RandomizedSpriteParticleEmitter *self)
{
    RandomizedSpriteParticleEmitter_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * Unlink and free one node, decrement count, and normalize the list through
 * RandomizedSpriteParticleList_Clear when its last node is removed. The payload is not destroyed.
 */
void RandomizedSpriteParticleList_RemoveNode(ParticleList *self, ParticleListNode *node)
{
    if (node == self->head_04)
        self->head_04 = node->next_00;
    else
        node->previous_04->next_00 = node->next_00;
    if (node == self->tail_08)
        self->tail_08 = node->previous_04;
    else
        node->next_00->previous_04 = node->previous_04;
    if (node)
        Heap_Free(node);
    self->count_0c--;
    if (self->count_0c == 0)
        RandomizedSpriteParticleList_Clear(self);
}

/*
 * Stop with result one when flag 0x414 is set. Otherwise spawn a particle every
 * 30..34 updates, append it, update/remove expired particles, publish the
 * projected endpoint to the sprite owner, and return zero.
 */
s32 RandomizedSpriteParticleEmitter_Update(RandomizedSpriteParticleEmitter *self)
{
    ParticleListNode *node;
    EmitterVector projected;
    if (GameWork_TestFlag(gGameWork, 0x414))
        return 1;

    self->spawnTimer_54--;
    if (self->spawnTimer_54 < 0) {
        void *particle;
        ParticleListNode *newNode;
        self->spawnTimer_54 = 30 + (s32)(genrand_int32() % 5);
        particle = Heap_Alloc(0x4c, gRandomizedSpriteParticleAllocationTag, 4, &gHeapContext);
        if (particle)
            particle = RandomizedSpriteParticle_Init(particle, self->spriteOwner_4c,
                                     self->resources_2c + 0x10,
                                     &self->position_0c, &self->target_1c,
                                     self->frame_58);
        newNode = (ParticleListNode *)Heap_Alloc(
            sizeof(ParticleListNode), gRandomizedSpriteParticleListNodeAllocationTag, 4, &gHeapContext);
        if (newNode) {
            newNode->next_00 = 0;
            newNode->previous_04 = 0;
            newNode->particle_08 = particle;
        }
        if (self->particles_5c.tail_08) {
            self->particles_5c.tail_08->next_00 = newNode;
            newNode->previous_04 = self->particles_5c.tail_08;
        } else {
            self->particles_5c.head_04 = newNode;
        }
        self->particles_5c.tail_08 = newNode;
        self->particles_5c.count_0c++;
    }

    node = self->particles_5c.head_04;
    while (node) {
        ParticleListNode *next = node->next_00;
        void *particle = node->particle_08;
        if (RandomizedSpriteParticle_Update(particle, self->projection_08)) {
            RandomizedSpriteParticleList_RemoveNode(&self->particles_5c, node);
            if (particle) {
                RandomizedSpriteParticle_Destroy(particle);
                Heap_Free(particle);
            }
        }
        node = next;
    }
    VecFx32_Subtract(&projected, &self->position_0c, self->projection_08);
    GraphicsSpriteGroup_AdvanceAnimations(self->spriteOwner_4c);
    VecFx32Object_Destroy(&projected);
    return 0;
}

/*
 * Convert two integer coordinate pairs to FX32, allocate/construct a 0x6c-byte
 * emitter, enqueue it at global offset 0x2f7c, destroy temporaries, and return
 * the enqueue result.
 */
void *RandomizedSpriteParticleEmitter_CreateAndRegister(const void *projection, s32 x0, s32 y0, s32 x1,
                    s32 y1, s32 frame)
{
    EmitterVector position;
    EmitterVector target;
    RandomizedSpriteParticleEmitter *self;
    void *result;
    VecFx32Object_InitComponents(&position, x0 << 12, y0 << 12, 0);
    VecFx32Object_InitComponents(&target, x1 << 12, y1 << 12, 0);
    self = (RandomizedSpriteParticleEmitter *)Heap_Alloc(
        sizeof(RandomizedSpriteParticleEmitter), gRandomizedSpriteParticleEmitterAllocationTag, 4,
        &gHeapContext);
    if (self)
        self = RandomizedSpriteParticleEmitter_Init(self, projection, &position, &target, frame);
    result = RuntimePresentationManager_AppendFirstListEffect(gGamePhaseRuntime + 0x2f7c, self);
    VecFx32Object_Destroy(&target);
    VecFx32Object_Destroy(&position);
    return result;
}

/* Enable the sprite owner through offset 0x20, or hide it through the owner API. */
void RandomizedSpriteParticleEmitter_SetVisible(RandomizedSpriteParticleEmitter *self, s32 enabled)
{
    if (enabled)
        *(u32 *)(self->spriteOwner_4c + 0x20) = 1;
    else
        GraphicsSpriteGroup_ReleaseIndexedEntries(self->spriteOwner_4c);
}

/* Destroy an independently allocated particle list, free it, and return its old address. */
ParticleList *RandomizedSpriteParticleList_DestroyAndFree(ParticleList *self)
{
    self->vtable_00 = (void **)data_020de89c;
    RandomizedSpriteParticleList_Clear(self);
    Heap_Free(self);
    return self;
}

#ifdef __cplusplus
}
#endif
