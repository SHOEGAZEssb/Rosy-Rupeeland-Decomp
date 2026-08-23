#include "tingle/types.h"

/*
 * Recovered lifecycle for an actor that owns a resource bundle and a private
 * grid/query subobject. The constructor initializes its bitfield-backed state;
 * destructor wrappers release presentation, resource, and inherited actor state.
 */

extern const u8 gGridEffectActorVtable[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void SelfLinkedSpriteConfig_Init(void *subobject);
extern void *ActorRuntimeBase_Init(void *actor, const void *descriptor);
extern void func_0203130c(void *actor);
extern void Actor_ReleaseSecondaryRenderAttachment(void *actor);
extern void Type7Actor_ClearGlobalRelationshipToActor(void *actor);
extern void GridEffectActorRegistry_Unregister(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are actor storage and its borrowed spawn descriptor. Construct the
 * inherited actor, install
 * gGridEffectActorVtable, clear the pointer at 0x1EC, the bitfield halfword at 0x1F0,
 * and counter 0x1F2, initialize the subobject at 0x1F4, then set bytes 0x21A
 * and 0x21B to -1 and zero. Return self. Parent/subobject engine state changes;
 * no hardware is accessed directly.
 */
void *GridEffectActor_Init(void *self, const void *descriptor)
{
    ActorRuntimeBase_Init(self, descriptor);
    FIELD(const void *, self, 0) = gGridEffectActorVtable;
    FIELD(void *, self, 0x1ec) = 0;
    FIELD(u16, self, 0x1f0) = 0;
    FIELD(u16, self, 0x1f2) = 0;
    SelfLinkedSpriteConfig_Init((u8 *)self + 0x1f4);
    FIELD(s8, self, 0x21a) = -1;
    FIELD(u8, self, 0x21b) = 0;
    return self;
}

/*
 * Input is an actor. Restore gGridEffectActorVtable, release owned presentation state,
 * call virtual slot 0xBC, release inherited presentation state, invoke virtual
 * slot 4 on the optional object at 0x1EC, then run GridEffectActorRegistry_Unregister and final base
 * teardown. Return self; engine-owned state changes, heap storage is retained,
 * and hardware is not touched directly.
 */
void *GridEffectActor_Destroy(void *self)
{
    FIELD(const void *, self, 0) = gGridEffectActorVtable;
    Type7Actor_ClearGlobalRelationshipToActor(self);
    void (**vtable)(void *) = (void (**)(void *))gGridEffectActorVtable;
    vtable[0xbc / sizeof(void *)](self);
    Actor_ReleaseSecondaryRenderAttachment(self);
    void *owned = FIELD(void *, self, 0x1ec);
    if (owned != 0) {
        void (**owned_vtable)(void *) =
            *(void (***)(void *))owned;
        owned_vtable[1](owned);
    }
    GridEffectActorRegistry_Unregister(self);
    func_0203130c(self);
    return self;
}

/*
 * Input is an actor. Perform the complete teardown documented for
 * GridEffectActor_Destroy, free the actor allocation, and return its former address.
 * Engine and heap state change; there are no direct hardware effects.
 */
void *GridEffectActor_DestroyAndFree(void *self)
{
    GridEffectActor_Destroy(self);
    Heap_Free(self);
    return self;
}
