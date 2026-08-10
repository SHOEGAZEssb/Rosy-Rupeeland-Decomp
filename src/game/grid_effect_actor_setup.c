#include "tingle/types.h"

/*
 * Recovered resource setup for the grid/effect actor. It allocates a small
 * three-resource bundle, creates the actor's presentation from that bundle,
 * and binds both objects into inherited actor state.
 */

extern const u8 data_020e2724[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32 size, const void *tag, u32 align, void *heap);
extern void *func_02005580(void *storage, u32 resource0, u32 resource1,
                           u32 resource2);
extern void *func_02030acc(void);
extern void func_020313b4(void *actor, void *bundle, u32 mode);
extern void Actor_GetCollection(void *actor);
extern void func_02072b68(void *presentation, u32 selection);
extern void *func_02073fc4(void *context, void *resource0, void *resource1,
                           void *resource2, u32 mode);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are an actor and a descriptor containing three resource values at
 * 0x04..0x0C and mode bytes at 0x10/0x11. Allocate a 16-byte bundle tagged by
 * data_020e2724, initialize it with func_02005580, store it at actor+0x1EC,
 * prepare the actor, create a presentation at 0x54 from bundle words 1..3,
 * bind the bundle through func_020313b4, select the initial entry, and set
 * presentation flags 1 and 2. Returns nothing; heap/resource/presentation state
 * changes, and hardware is not accessed directly. Retail assumes allocation succeeds.
 */
void func_0204ed3c(void *actor, const void *descriptor)
{
    void *bundle = Heap_Alloc(0x10, data_020e2724, 4, gHeapContext);
    if (bundle != 0) {
        bundle = func_02005580(bundle,
                              FIELD(u32, descriptor, 4),
                              FIELD(u32, descriptor, 8),
                              FIELD(u32, descriptor, 12));
    }
    FIELD(void *, actor, 0x1ec) = bundle;
    Actor_GetCollection(actor);
    void *presentation = func_02073fc4(
        func_02030acc(), FIELD(void *, bundle, 4), FIELD(void *, bundle, 8),
        FIELD(void *, bundle, 12), FIELD(u8, descriptor, 0x10));
    FIELD(void *, actor, 0x54) = presentation;
    func_020313b4(actor, bundle, FIELD(u8, descriptor, 0x10));
    func_02072b68(presentation, FIELD(u8, descriptor, 0x11));
    FIELD(u16, presentation, 0x24) |= 6;
}

