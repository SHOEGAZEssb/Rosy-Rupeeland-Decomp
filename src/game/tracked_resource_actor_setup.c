#include "tingle/types.h"

/*
 * Recovered resource and presentation setup for the tracked-resource actor.
 * It creates a small owned bundle, binds the presentation, and finishes through
 * the actor's virtual initialization callback.
 */

extern const u8 data_020e35c4[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32 size, const void *tag, u32 align, void *heap);
extern void *func_02005580(void *storage, u32 resource0, u32 resource1,
                           u32 resource2);
extern void *func_02030acc(void);
extern void func_020313b4(void *actor, void *bundle, u32 mode);
extern void func_020337d4(void *actor);
extern void func_02072b68(void *presentation, u32 selection);
extern void *func_02073fc4(void *context, void *resource0, void *resource1,
                           void *resource2, u32 mode);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef void (*ActorCallback)(void *actor);

/*
 * Inputs are an actor and descriptor with resource values at 0x04..0x0C and
 * mode bytes at 0x10/0x11. Allocate and initialize a 16-byte bundle tagged by
 * data_020e35c4, store it at 0x1EC, prepare the actor, create presentation 0x54,
 * select its initial entry, set flags 1 and 2, bind the bundle with
 * func_020313b4, then invoke virtual slot 0x14. Returns nothing; heap, resource,
 * and presentation state change. Retail assumes allocation succeeds; no direct
 * hardware effects occur.
 */
void func_0204fe68(void *actor, const void *descriptor)
{
    void *bundle = Heap_Alloc(0x10, data_020e35c4, 4, gHeapContext);
    if (bundle != 0) {
        bundle = func_02005580(bundle,
                              FIELD(u32, descriptor, 4),
                              FIELD(u32, descriptor, 8),
                              FIELD(u32, descriptor, 12));
    }
    FIELD(void *, actor, 0x1ec) = bundle;
    func_020337d4(actor);
    void *presentation = func_02073fc4(
        func_02030acc(), FIELD(void *, bundle, 4), FIELD(void *, bundle, 8),
        FIELD(void *, bundle, 12), FIELD(u8, descriptor, 0x10));
    FIELD(void *, actor, 0x54) = presentation;
    func_02072b68(presentation, FIELD(u8, descriptor, 0x11));
    FIELD(u16, presentation, 0x24) |= 6;
    func_020313b4(actor, bundle, FIELD(u8, descriptor, 0x10));
    ActorCallback callback =
        *(ActorCallback *)((u8 *)FIELD(void *, actor, 0) + 0x14);
    callback(actor);
}
