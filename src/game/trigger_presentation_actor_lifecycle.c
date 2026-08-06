#include "tingle/types.h"

/*
 * Recovered lifecycle for an actor with trigger-driven presentation state.
 * The constructor initializes its private state word; destructor wrappers run
 * the virtual presentation cleanup and inherited actor teardown.
 */

extern const u8 data_020e2560[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void *func_02030f98(void *actor);
extern void func_0203130c(void *actor);
extern void func_02031488(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is actor storage. Construct the inherited actor, install vtable
 * data_020e2560, clear halfword 0x1EC, and return self. Parent construction may
 * change engine state; no hardware is accessed directly.
 */
void *func_0204e944(void *self)
{
    func_02030f98(self);
    FIELD(const void *, self, 0) = data_020e2560;
    FIELD(u16, self, 0x1ec) = 0;
    return self;
}

/*
 * Input is an actor. Restore data_020e2560, invoke virtual slot 0xBC, release
 * inherited presentation state, and run final base teardown. Return self;
 * engine state changes, heap storage remains, and hardware is untouched directly.
 */
void *func_0204e970(void *self)
{
    FIELD(const void *, self, 0) = data_020e2560;
    void (**vtable)(void *) = (void (**)(void *))data_020e2560;
    vtable[0xbc / sizeof(void *)](self);
    func_02031488(self);
    func_0203130c(self);
    return self;
}

/*
 * Input is an actor. Perform the teardown documented for func_0204e970, free
 * the actor allocation, and return its former address. Engine and heap state
 * change; there are no direct hardware effects.
 */
void *func_0204e9a8(void *self)
{
    func_0204e970(self);
    Heap_Free(self);
    return self;
}

