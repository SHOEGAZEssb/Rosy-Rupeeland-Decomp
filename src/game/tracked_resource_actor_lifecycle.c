#include "tingle/types.h"

/*
 * Recovered lifecycle for an actor with an owned resource bundle and compact
 * tracking flags. The constructor preserves only the high bit of its private
 * halfword; destructor variants release presentation, bundle, and base state.
 */

extern const u8 data_020e2e9c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void *func_02030f98(void *actor);
extern void func_0203130c(void *actor);
extern void func_02031488(void *actor);
extern void Type7Actor_ClearGlobalRelationshipToActor(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is actor storage. Construct the inherited actor, install vtable
 * data_020e2e9c, clear pointer 0x1EC, preserve only bit 15 of halfword 0x1F0,
 * clear bit 0 of word 0x1F4, clear halfword 0x1F8 and word 0x1FC, then return
 * self. Parent state may change; no hardware is accessed directly.
 */
void *func_0204fcb8(void *self)
{
    func_02030f98(self);
    FIELD(const void *, self, 0) = data_020e2e9c;
    FIELD(void *, self, 0x1ec) = 0;
    FIELD(u16, self, 0x1f0) &= 0x8000;
    FIELD(u32, self, 0x1f4) &= ~1u;
    FIELD(u16, self, 0x1f8) = 0;
    FIELD(u32, self, 0x1fc) = 0;
    return self;
}

/*
 * Input is an actor. Restore data_020e2e9c, release owned presentation state,
 * invoke virtual slot 0xBC, release inherited presentation state, invoke slot 4
 * on the optional object at 0x1EC, and perform final base teardown. Return self;
 * engine state changes, heap storage remains, and hardware is untouched directly.
 */
void *func_0204fd08(void *self)
{
    FIELD(const void *, self, 0) = data_020e2e9c;
    Type7Actor_ClearGlobalRelationshipToActor(self);
    void (**vtable)(void *) = (void (**)(void *))data_020e2e9c;
    vtable[0xbc / sizeof(void *)](self);
    func_02031488(self);
    void *owned = FIELD(void *, self, 0x1ec);
    if (owned != 0) {
        void (**owned_vtable)(void *) = *(void (***)(void *))owned;
        owned_vtable[1](owned);
    }
    func_0203130c(self);
    return self;
}

/*
 * Input is an actor. Perform the teardown documented for func_0204fd08, free
 * the allocation, and return its former address. Engine and heap state change;
 * there are no direct hardware effects.
 */
void *func_0204fd60(void *self)
{
    func_0204fd08(self);
    Heap_Free(self);
    return self;
}

/*
 * Input is an actor. Perform the same non-deleting teardown and return behavior
 * as func_0204fd08. This distinct entry point is preserved for recovered
 * callback identity; no heap or hardware state changes directly.
 */
void *func_0204fdc0(void *self)
{
    return func_0204fd08(self);
}

