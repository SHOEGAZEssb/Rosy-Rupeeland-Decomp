#include "tingle/heap.h"
#include "tingle/types.h"

/* Allocate type-1 actor animation resources and create its primary attachment. */
extern u32 data_020c3d90[27];
extern u8 data_020df48c[];
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02005580(void *storage, u32 first, u32 second, u32 third);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void *func_020337d4(void *actor);
extern void *func_02030acc(void *collection);
extern void *func_02073fc4(void *collectionData, u32 first, u32 second,
                           u32 third, u32 mode);
extern void func_02072b68(void *attachment, u32 animation);
extern void func_020313b4(void *actor, void *resource, u32 layer);
extern void func_0203b65c(void *actor, const void *descriptor);
#ifdef __cplusplus
}
#endif

/* Allocate and construct one 0x10-byte animation-resource descriptor. */
static void *allocateResource(u32 first, u32 second, u32 third)
{
    void *resource = Heap_Alloc(0x10, (const char *)data_020df48c, 4,
                                &gHeapContext);

    if (resource != 0) resource = func_02005580(resource, first, second, third);
    return resource;
}

/*
 * Copy the 27-word table data_020c3d90 locally and allocate nine 0x10-byte
 * resource descriptors from its consecutive triples, storing them at actor
 * +0x208..+0x228. If GameWork flag 0x25d is set, allocate an optional tenth
 * descriptor at +0x22c using IDs 0x1046..0x1048; otherwise store null. Create
 * the primary attachment +0x54 from the first descriptor's words +4/+8/+0xc
 * and collection data with mode two, select animation zero, attach that first
 * resource using descriptor byte +0x10 as layer, then forward the descriptor
 * through base initializer func_0203b65c. Returns no explicit value; heap,
 * resource, attachment, and presentation helpers establish owned SDK state.
 */
void func_020353a0(void *self, const void *descriptor)
{
    u8 *actor = (u8 *)self;
    const u8 *record = (const u8 *)descriptor;
    u32 resourceIds[27];
    u32 i;
    u8 *first;
    void *attachment;

    for (i = 0; i < 27; ++i) resourceIds[i] = data_020c3d90[i];
    for (i = 0; i < 9; ++i) {
        *(void **)(actor + 0x208 + i * 4) =
            allocateResource(resourceIds[i * 3], resourceIds[i * 3 + 1],
                             resourceIds[i * 3 + 2]);
    }
    if (GameWork_TestFlag(gGameWork, 0x25d) != 0)
        *(void **)(actor + 0x22c) = allocateResource(0x1046, 0x1047, 0x1048);
    else
        *(void **)(actor + 0x22c) = 0;

    first = *(u8 **)(actor + 0x208);
    attachment = func_02073fc4(func_02030acc(func_020337d4(actor)),
                               *(u32 *)(first + 4), *(u32 *)(first + 8),
                               *(u32 *)(first + 0x0c), 2);
    *(void **)(actor + 0x54) = attachment;
    func_02072b68(attachment, 0);
    func_020313b4(actor, first, record[0x10]);
    func_0203b65c(actor, record);
}
