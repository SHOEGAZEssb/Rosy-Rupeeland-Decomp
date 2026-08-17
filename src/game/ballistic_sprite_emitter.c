#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Own and update a six-particle ballistic sprite burst.  The emitter keeps its
 * particles in a small heap-backed doubly linked list, releases expired
 * particles, occasionally creates an auxiliary sprite at a live particle, and
 * reports completion once the list is empty.
 */

typedef struct EmitterVector {
    u32 field00;
    s32 x04;
    s32 y08;
    s32 z0c;
} EmitterVector;

typedef struct SpriteResourceDescriptor {
    void **vtable;
    s32 resource04;
    s32 palette08;
    s32 animation0c;
} SpriteResourceDescriptor;

typedef struct ParticleListNode {
    struct ParticleListNode *next00;
    struct ParticleListNode *previous04;
    void *particle08;
} ParticleListNode;

typedef struct ParticleList {
    void **vtable00;
    ParticleListNode *head04;
    ParticleListNode *tail08;
    s32 count0c;
} ParticleList;

typedef struct BallisticSpriteEmitter {
    void **vtable00;
    u32 field04;
    EmitterVector position08;
    SpriteResourceDescriptor resources18[2];
    void *spriteOwner38;
    ParticleList particles3c;
} BallisticSpriteEmitter;

#ifdef __cplusplus
extern "C" {
#endif
extern const char gBallisticSpriteParticleListNodeAllocationTag[];
extern void *data_020d66b8;
extern void *data_020d6718;
extern const char gBallisticSpriteParticleAllocationTag[];
extern const char gBallisticSpriteEmitterAllocationTag[];
extern void *gDebugFont;
extern void *gSoundContext;
extern u8 *data_021052fc;
extern void TimedSpritePresentation_InitBase(void *self);
extern void func_0201e28c(void *self);
extern void PresentationList_AppendObject(void *list, void *value);
extern void VecFx32Object_InitComponents(EmitterVector *value, s32 x, s32 y, s32 z);
extern void VecFx32Object_InitCopy(EmitterVector *destination,
                          const EmitterVector *source);
extern void VecFx32Object_Destroy(void *value);
extern void AnimationResource_Init(SpriteResourceDescriptor *descriptor, s32 resource,
                          s32 palette, s32 animation);
extern void AnimationResource_Destroy(SpriteResourceDescriptor *descriptor);
extern void AnimationResource_Assign(SpriteResourceDescriptor *destination,
                          const SpriteResourceDescriptor *source);
extern void *func_02023890(void *particle, void *spriteOwner,
                           const SpriteResourceDescriptor *resources,
                           const EmitterVector *position, s32 remaining,
                           s32 direction);
extern void *func_020239e8(void *particle);
extern s32 func_02023a14(void *particle);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void GraphicsSpriteGroupOwner_DestroyGroup(void *owner, void *spriteOwner);
extern u8 *GraphicsSpriteGroup_CreateState(void *owner, s32 resource, s32 palette,
                         s32 animation, s32 mode);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *owner);
extern u32 func_020be4e4(void);
extern u64 func_020befec(s32 dividend, s32 divisor);
extern void Sound_Play(void *context, s32 first, s32 soundId);
#ifdef __cplusplus
}
#endif

ParticleList *func_02023bcc(ParticleList *self);
void func_02023c0c(ParticleList *self);
void func_02023c4c(ParticleList *self, void *particle);

/*
 * Initialize base state and copy position.  Construct and copy descriptors for
 * resource triples 0x1714..0x1716 and 0x1688..0x168a, acquire the sprite owner
 * derived from gDebugFont, then allocate six 0x34-byte particles using the
 * supplied lifetime and direction and append every allocation result to the
 * embedded list.  Return self; failed particle allocations are stored as null.
 */
BallisticSpriteEmitter *func_02023a8c(BallisticSpriteEmitter *self,
                                      const EmitterVector *position,
                                      s32 remaining, s32 direction)
{
    SpriteResourceDescriptor temporary;
    s32 index;

    TimedSpritePresentation_InitBase(self);
    self->vtable00 = (void **)data_020d6718;
    VecFx32Object_InitCopy(&self->position08, position);
    AnimationResource_Init(&self->resources18[0], 0, 0, 0);
    AnimationResource_Init(&self->resources18[1], 0, 0, 0);
    func_02023bcc(&self->particles3c);

    AnimationResource_Init(&temporary, 0x1714, 0x1715, 0x1716);
    AnimationResource_Assign(&self->resources18[0], &temporary);
    AnimationResource_Destroy(&temporary);
    AnimationResource_Init(&temporary, 0x1688, 0x1689, 0x168a);
    AnimationResource_Assign(&self->resources18[1], &temporary);
    AnimationResource_Destroy(&temporary);
    self->spriteOwner38 = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);

    for (index = 0; index < 6; index++) {
        void *particle = Heap_Alloc(0x34, gBallisticSpriteParticleAllocationTag, 4, &gHeapContext);
        if (particle != 0) {
            particle = func_02023890(particle, self->spriteOwner38,
                                     &self->resources18[0], &self->position08,
                                     remaining, direction);
        }
        func_02023c4c(&self->particles3c, particle);
    }
    return self;
}

/* Initialize an empty particle list and return it. */
ParticleList *func_02023bcc(ParticleList *self)
{
    self->vtable00 = (void **)data_020d66b8;
    self->head04 = 0;
    self->tail08 = 0;
    self->count0c = 0;
    return self;
}

/* Restore the list vtable, release every node, clear its fields, and return it. */
ParticleList *func_02023bec(ParticleList *self)
{
    self->vtable00 = (void **)data_020d66b8;
    func_02023c0c(self);
    return self;
}

/*
 * Free all linked-list nodes without touching their particle payloads, then
 * clear head, tail, and count.  Payload ownership is handled by emitter update.
 */
void func_02023c0c(ParticleList *self)
{
    ParticleListNode *node = self->head04;
    while (node != 0) {
        ParticleListNode *next = node->next00;
        Heap_Free(node);
        node = next;
    }
    self->head04 = 0;
    self->tail08 = 0;
    self->count0c = 0;
}

/* Allocate a 12-byte tail node for particle, link it, and increment count. */
void func_02023c4c(ParticleList *self, void *particle)
{
    ParticleListNode *node = (ParticleListNode *)Heap_Alloc(
        0x0c, gBallisticSpriteParticleListNodeAllocationTag, 4, &gHeapContext);
    if (node != 0) {
        node->next00 = 0;
        node->previous04 = 0;
        node->particle08 = particle;
    }
    if (self->tail08 != 0) {
        self->tail08->next00 = node;
        if (node != 0) {
            node->previous04 = self->tail08;
        }
    } else {
        self->head04 = node;
    }
    self->tail08 = node;
    self->count0c++;
}

/*
 * Release the acquired sprite owner, free list nodes, destroy both resource
 * descriptors and position, tear down the recovered base, and return self.
 */
BallisticSpriteEmitter *func_02023cb0(BallisticSpriteEmitter *self)
{
    self->vtable00 = (void **)data_020d6718;
    GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont, self->spriteOwner38);
    self->particles3c.vtable00 = (void **)data_020d66b8;
    func_02023c0c(&self->particles3c);
    AnimationResource_Destroy(&self->resources18[1]);
    AnimationResource_Destroy(&self->resources18[0]);
    VecFx32Object_Destroy(&self->position08);
    func_0201e28c(self);
    return self;
}

/* Perform emitter teardown, free its storage, and return the old address. */
BallisticSpriteEmitter *func_02023d1c(BallisticSpriteEmitter *self)
{
    func_02023cb0(self);
    Heap_Free(self);
    return self;
}

/*
 * Update each particle.  Expired entries are unlinked, their node and payload
 * are freed, and sound 15 is played.  For live particles, a random remainder
 * of 25 from division by 50 creates a mode-2 auxiliary sprite using the second
 * descriptor at the particle position and sets sprite flag 0x100.  Update the
 * sprite owner and return one exactly when the list is empty.
 *
 * Retail advances with node->next00 after the expiration path has already
 * freed node.  This offset-derived lifetime quirk is intentionally documented;
 * allocator behavior evidently leaves the saved link readable for that step.
 */
s32 func_02023d90(BallisticSpriteEmitter *self)
{
    ParticleListNode *node = self->particles3c.head04;
    while (node != 0) {
        void *particle = node->particle08;
        ParticleListNode *next = node->next00;
        if (func_02023a14(particle)) {
            if (node == self->particles3c.head04) {
                self->particles3c.head04 = node->next00;
            } else {
                node->previous04->next00 = node->next00;
            }
            if (node == self->particles3c.tail08) {
                self->particles3c.tail08 = node->previous04;
            } else {
                node->next00->previous04 = node->previous04;
            }
            Heap_Free(node);
            self->particles3c.count0c--;
            if (self->particles3c.count0c == 0) {
                func_02023c0c(&self->particles3c);
            }
            if (particle != 0) {
                func_020239e8(particle);
                Heap_Free(particle);
            }
            Sound_Play(gSoundContext, 0, 15);
        } else {
            u64 division = func_020befec((s32)func_020be4e4(), 50);
            if ((s32)(division >> 32) == 25) {
                u8 *sprite = GraphicsSpriteGroup_CreateState(
                    self->spriteOwner38, self->resources18[1].resource04,
                    self->resources18[1].palette08,
                    self->resources18[1].animation0c, 2);
                *(u16 *)(sprite + 0x24) |= 0x100;
                *(u16 *)(sprite + 0x2c) =
                    (u16)(*(s32 *)((u8 *)particle + 4) >> 12);
                *(u16 *)(sprite + 0x2e) =
                    (u16)(*(s32 *)((u8 *)particle + 8) >> 12);
            }
        }
        node = next;
    }
    GraphicsSpriteGroup_AdvanceAnimations(self->spriteOwner38);
    return self->particles3c.count0c == 0;
}

/*
 * Allocate a 0x4c-byte emitter at integer x/y converted to 20.12 fixed point,
 * construct it with the supplied lifetime/direction, register it in the global
 * owner list at offset 0x2f7c, and destroy the temporary position value.
 */
void func_02023ed4(s32 x, s32 y, s32 remaining, s32 direction)
{
    EmitterVector position;
    BallisticSpriteEmitter *emitter = (BallisticSpriteEmitter *)Heap_Alloc(
        0x4c, gBallisticSpriteEmitterAllocationTag, 4, &gHeapContext);
    VecFx32Object_InitComponents(&position, x << 12, y << 12, 0);
    if (emitter != 0) {
        emitter = func_02023a8c(emitter, &position, remaining, direction);
    }
    PresentationList_AppendObject(data_021052fc + 0x2f7c, emitter);
    VecFx32Object_Destroy(&position);
}

/* Clear a standalone particle list, free it, and return its old address. */
ParticleList *func_02023f78(ParticleList *self)
{
    self->vtable00 = (void **)data_020d66b8;
    func_02023c0c(self);
    Heap_Free(self);
    return self;
}
