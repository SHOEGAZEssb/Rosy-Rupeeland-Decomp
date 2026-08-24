#include "tingle/heap.h"
#include "tingle/types.h"

/* Select, materialize, destroy, and query the recovered 15-entry actor resource table. */
extern u8 *gGamePhaseRuntime;
extern u8 data_020e9fa0[];
extern u8 gActorInteractionResourceState[];
extern const char gActorFeedbackResourcePointerArrayAllocationTag[];
extern const char gActorFeedbackAnimationResourceAllocationTag[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseMetadata_GetByIndex(s32 index);
extern void *AnimationResource_Init(void *allocation, u16 first, u16 second, u16 third);
#ifdef __cplusplus
}
#endif

/*
 * Resolve the active table index from gGamePhaseRuntime -> +0x24 -> +0x00 minus
 * one through GamePhaseMetadata_GetByIndex, sign-extend the low 12 bits of returned word
 * +0x40, and select its 0x78-byte record block in data_020e9fa0. Store that
 * block at singleton gActorInteractionResourceState +0x04 and allocate a 0x3c-byte array at
 * +0x08. For each of 15 eight-byte records, read signed halfwords +0/+2/+4;
 * a nonzero first value allocates and initializes a tagged 0x10-byte resource,
 * while zero stores null. Returns no value. The retail path assumes the array
 * allocation succeeds; heap and resource initialization change ownership.
 */
void ActorFeedbackResources_Load(void)
{
    s32 selector;
    u8 *records;
    void **resources;
    s32 i;
    void *state = *(void **)(*(u8 **)(gGamePhaseRuntime + 0x24));

    state = GamePhaseMetadata_GetByIndex(*(s32 *)state - 1);
    selector = (*(s32 *)((u8 *)state + 0x40) << 20) >> 20;
    records = data_020e9fa0 + selector * 0x78;
    *(u8 **)(gActorInteractionResourceState + 4) = records;
    resources = (void **)Heap_Alloc(0x3c, gActorFeedbackResourcePointerArrayAllocationTag, 4, &gHeapContext);
    *(void ***)(gActorInteractionResourceState + 8) = resources;
    for (i = 0; i < 15; ++i) {
        s16 first = *(s16 *)(records + i * 8);
        s16 second = *(s16 *)(records + i * 8 + 2);
        s16 third = *(s16 *)(records + i * 8 + 4);
        if (first != 0) {
            void *resource = Heap_Alloc(0x10, gActorFeedbackAnimationResourceAllocationTag, 4,
                                        &gHeapContext);
            if (resource != 0)
                resource = AnimationResource_Init(resource, first, second, third);
            resources[i] = resource;
        } else {
            resources[i] = 0;
        }
    }
}

/*
 * Clear singleton table pointer +0x04. If resource array +0x08 exists,
 * destroy each of its 15 nonnull entries through virtual +0x04, free the
 * array, and clear +0x08. Returns no value; virtual and heap calls release all
 * ownership established by ActorFeedbackResources_Load.
 */
void ActorFeedbackResources_Unload(void)
{
    void **resources;
    s32 i;
    *(void **)(gActorInteractionResourceState + 4) = 0;
    resources = *(void ***)(gActorInteractionResourceState + 8);
    if (resources == 0)
        return;
    for (i = 0; i < 15; ++i) {
        void *resource = resources[i];
        if (resource != 0)
            (*(void (**)(void *))(*(u8 **)resource + 4))(resource);
    }
    Heap_Free(resources);
    *(void **)(gActorInteractionResourceState + 8) = 0;
}

/*
 * Return null for one-based index zero; otherwise return resource array entry
 * index-1 from singleton +0x08. No bounds check or state change occurs.
 */
void *ActorFeedbackResources_GetResource(u32 index)
{
    if (index == 0)
        return 0;
    return (*(void ***)(gActorInteractionResourceState + 8))[index - 1];
}

/*
 * Return unsigned halfword +0x06 from one-based record index in singleton
 * table +0x04. The table and index are preconditions; no state changes.
 */
u16 ActorFeedbackResources_GetPackedSound(u32 index)
{
    u8 *records = *(u8 **)(gActorInteractionResourceState + 4);
    return *(u16 *)(records + (index - 1) * 8 + 6);
}
