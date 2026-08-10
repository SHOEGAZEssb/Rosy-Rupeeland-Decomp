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
    u32 baseFlags_04;
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
extern void *data_020de89c;
extern void *data_020de8cc;
extern const char data_020de860[];
extern const char data_020de8ec[];
extern const char data_020de8f4[];
extern u8 *data_021052fc;
extern void *data_020f4e14;
extern u32 genrand_int32(void);
extern void __construct_array(void *, u32, u32, void (*)(void *),
                              void (*)(void *));
extern void __destroy_arr(void *, u32, u32, void (*)(void *));
extern void func_02010854(void *);
extern void AnimationResource_Init(void *, s32, s32, s32);
extern void AnimationResource_Destroy(void *);
extern void AnimationResource_Assign(void *, const void *);
extern void func_0200500c(void *, s32, s32, s32);
extern void func_02005030(void *, const void *);
extern void func_02005058(void *);
extern void func_020066a4(void *, const void *, const void *);
extern void func_0201e250(void *);
extern void func_0201e28c(void *);
extern void *func_0201ded4(void *, void *);
extern void func_02071f38(void *);
extern u8 *func_020742cc(void *);
extern void func_02074330(void *, void *);
extern void func_020740a4(void *);
extern void func_02074110(void *);
extern void *func_02028860(void *, void *, void *, const void *,
                           const void *, s32);
extern void *func_0202895c(void *);
extern s32 func_02028998(void *, const void *);
void func_02028c94(ParticleList *);
void func_02028cd4(ParticleList *);
void func_02028e9c(ParticleList *, ParticleListNode *);
RandomizedSpriteParticleEmitter *func_02028b98(
    RandomizedSpriteParticleEmitter *, const void *, const EmitterVector *,
    const EmitterVector *, s32);
RandomizedSpriteParticleEmitter *func_02028d14(
    RandomizedSpriteParticleEmitter *);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the presentation and endpoints, construct two 0x10-byte resource
 * wrappers, configure them with ID triplets 0x138e/0x1078/0x138f and
 * 0x168b..0x168d, create an empty particle list, acquire the global sprite
 * owner, and return self. The projection pointer is borrowed.
 */
RandomizedSpriteParticleEmitter *func_02028b98(
    RandomizedSpriteParticleEmitter *self, const void *projection,
    const EmitterVector *position, const EmitterVector *target, s32 frame)
{
    u8 temporary[0x10];
    func_0201e250(self);
    self->vtable_00 = (void **)data_020de8cc;
    self->projection_08 = projection;
    func_02005030(&self->position_0c, position);
    func_02005030(&self->target_1c, target);
    __construct_array(self->resources_2c, 2, 0x10,
                      (void (*)(void *))func_02010854, AnimationResource_Destroy);
    self->spawnTimer_54 = 0;
    self->frame_58 = frame;
    func_02028c94(&self->particles_5c);
    AnimationResource_Init(temporary, 0x138e, 0x1078, 0x138f);
    AnimationResource_Assign(self->resources_2c, temporary);
    AnimationResource_Destroy(temporary);
    AnimationResource_Init(temporary, 0x168b, 0x168c, 0x168d);
    AnimationResource_Assign(self->resources_2c + 0x10, temporary);
    AnimationResource_Destroy(temporary);
    self->spriteOwner_4c = func_020742cc(data_020f4e14);
    return self;
}

/* Initialize an empty intrusive particle-node list with its recovered vtable. */
void func_02028c94(ParticleList *self)
{
    self->vtable_00 = (void **)data_020de89c;
    self->head_04 = 0;
    self->tail_08 = 0;
    self->count_0c = 0;
}

/* Destroy all list nodes, clear links/count, and return the list. */
ParticleList *func_02028cb4(ParticleList *self)
{
    self->vtable_00 = (void **)data_020de89c;
    func_02028cd4(self);
    return self;
}

/* Free every node without touching its payload, then reset the empty list. */
void func_02028cd4(ParticleList *self)
{
    ParticleListNode *node = self->head_04;
    while (node) {
        ParticleListNode *next = node->next_00;
        Heap_Free(node);
        node = next;
    }
    self->head_04 = 0;
    self->tail_08 = 0;
    self->count_0c = 0;
}

/* Release all particles/nodes and owned graphics/vector/base state; return self. */
RandomizedSpriteParticleEmitter *func_02028d14(
    RandomizedSpriteParticleEmitter *self)
{
    ParticleListNode *node = self->particles_5c.head_04;
    self->vtable_00 = (void **)data_020de8cc;
    while (node) {
        ParticleListNode *next = node->next_00;
        void *particle = node->particle_08;
        func_02028e9c(&self->particles_5c, node);
        if (particle) {
            func_0202895c(particle);
            Heap_Free(particle);
        }
        node = next;
    }
    func_02074330(data_020f4e14, self->spriteOwner_4c);
    func_02071f38(self->resources_2c + 4);
    func_02071f38(self->resources_2c + 0x14);
    self->particles_5c.vtable_00 = (void **)data_020de89c;
    func_02028cd4(&self->particles_5c);
    __destroy_arr(self->resources_2c, 2, 0x10, AnimationResource_Destroy);
    func_02005058(&self->target_1c);
    func_02005058(&self->position_0c);
    func_0201e28c(self);
    return self;
}

/* Perform full emitter teardown, free self, and return its old address. */
RandomizedSpriteParticleEmitter *func_02028dd4(
    RandomizedSpriteParticleEmitter *self)
{
    func_02028d14(self);
    Heap_Free(self);
    return self;
}

/*
 * Unlink and free one node, decrement count, and normalize the list through
 * func_02028cd4 when its last node is removed. The payload is not destroyed.
 */
void func_02028e9c(ParticleList *self, ParticleListNode *node)
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
        func_02028cd4(self);
}

/*
 * Stop with result one when flag 0x414 is set. Otherwise spawn a particle every
 * 30..34 updates, append it, update/remove expired particles, publish the
 * projected endpoint to the sprite owner, and return zero.
 */
s32 func_02028f04(RandomizedSpriteParticleEmitter *self)
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
        particle = Heap_Alloc(0x4c, data_020de8ec, 4, &gHeapContext);
        if (particle)
            particle = func_02028860(particle, self->spriteOwner_4c,
                                     self->resources_2c + 0x10,
                                     &self->position_0c, &self->target_1c,
                                     self->frame_58);
        newNode = (ParticleListNode *)Heap_Alloc(
            sizeof(ParticleListNode), data_020de860, 4, &gHeapContext);
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
        if (func_02028998(particle, self->projection_08)) {
            func_02028e9c(&self->particles_5c, node);
            if (particle) {
                func_0202895c(particle);
                Heap_Free(particle);
            }
        }
        node = next;
    }
    func_020066a4(&projected, &self->position_0c, self->projection_08);
    func_020740a4(self->spriteOwner_4c);
    func_02005058(&projected);
    return 0;
}

/*
 * Convert two integer coordinate pairs to FX32, allocate/construct a 0x6c-byte
 * emitter, enqueue it at global offset 0x2f7c, destroy temporaries, and return
 * the enqueue result.
 */
void *func_0202906c(const void *projection, s32 x0, s32 y0, s32 x1,
                    s32 y1, s32 frame)
{
    EmitterVector position;
    EmitterVector target;
    RandomizedSpriteParticleEmitter *self;
    void *result;
    func_0200500c(&position, x0 << 12, y0 << 12, 0);
    func_0200500c(&target, x1 << 12, y1 << 12, 0);
    self = (RandomizedSpriteParticleEmitter *)Heap_Alloc(
        sizeof(RandomizedSpriteParticleEmitter), data_020de8f4, 4,
        &gHeapContext);
    if (self)
        self = func_02028b98(self, projection, &position, &target, frame);
    result = func_0201ded4(data_021052fc + 0x2f7c, self);
    func_02005058(&target);
    func_02005058(&position);
    return result;
}

/* Enable the sprite owner through offset 0x20, or hide it through the owner API. */
void func_02029170(RandomizedSpriteParticleEmitter *self, s32 enabled)
{
    if (enabled)
        *(u32 *)(self->spriteOwner_4c + 0x20) = 1;
    else
        func_02074110(self->spriteOwner_4c);
}

/* Destroy an independently allocated particle list, free it, and return its old address. */
ParticleList *func_02029190(ParticleList *self)
{
    self->vtable_00 = (void **)data_020de89c;
    func_02028cd4(self);
    Heap_Free(self);
    return self;
}
