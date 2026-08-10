#include "tingle/types.h"

/*
 * Recovered lifecycle for an actor that owns a resource bundle and a private
 * grid/query subobject. The constructor initializes its bitfield-backed state;
 * destructor wrappers release presentation, resource, and inherited actor state.
 */

extern const u8 data_020e2664[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void func_02022fbc(void *subobject);
extern void *func_02030f98(void *actor);
extern void func_0203130c(void *actor);
extern void func_02031488(void *actor);
extern void Type7Actor_ClearGlobalRelationshipToActor(void *actor);
extern void func_0204fa48(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is actor storage. Construct the inherited actor, install vtable
 * data_020e2664, clear the pointer at 0x1EC, the bitfield halfword at 0x1F0,
 * and counter 0x1F2, initialize the subobject at 0x1F4, then set bytes 0x21A
 * and 0x21B to -1 and zero. Return self. Parent/subobject engine state changes;
 * no hardware is accessed directly.
 */
void *func_0204ec0c(void *self)
{
    func_02030f98(self);
    FIELD(const void *, self, 0) = data_020e2664;
    FIELD(void *, self, 0x1ec) = 0;
    FIELD(u16, self, 0x1f0) = 0;
    FIELD(u16, self, 0x1f2) = 0;
    func_02022fbc((u8 *)self + 0x1f4);
    FIELD(s8, self, 0x21a) = -1;
    FIELD(u8, self, 0x21b) = 0;
    return self;
}

/*
 * Input is an actor. Restore data_020e2664, release owned presentation state,
 * call virtual slot 0xBC, release inherited presentation state, invoke virtual
 * slot 4 on the optional object at 0x1EC, then run func_0204fa48 and final base
 * teardown. Return self; engine-owned state changes, heap storage is retained,
 * and hardware is not touched directly.
 */
void *func_0204ec74(void *self)
{
    FIELD(const void *, self, 0) = data_020e2664;
    Type7Actor_ClearGlobalRelationshipToActor(self);
    void (**vtable)(void *) = (void (**)(void *))data_020e2664;
    vtable[0xbc / sizeof(void *)](self);
    func_02031488(self);
    void *owned = FIELD(void *, self, 0x1ec);
    if (owned != 0) {
        void (**owned_vtable)(void *) =
            *(void (***)(void *))owned;
        owned_vtable[1](owned);
    }
    func_0204fa48(self);
    func_0203130c(self);
    return self;
}

/*
 * Input is an actor. Perform the complete teardown documented for
 * func_0204ec74, free the actor allocation, and return its former address.
 * Engine and heap state change; there are no direct hardware effects.
 */
void *func_0204ecd4(void *self)
{
    func_0204ec74(self);
    Heap_Free(self);
    return self;
}

