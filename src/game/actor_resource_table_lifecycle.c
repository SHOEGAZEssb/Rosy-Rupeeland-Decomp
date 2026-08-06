#include "tingle/heap.h"
#include "tingle/types.h"

/* Select, materialize, destroy, and query the recovered 15-entry actor resource table. */
extern u8 *data_021052fc;
extern u8 data_020e9fa0[];
extern u8 data_021056e4[];
extern const char data_020df4e0[];
extern const char data_020df4e8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02028388(s32 index);
extern void *func_02005580(void *allocation, u16 first, u16 second, u16 third);
#ifdef __cplusplus
}
#endif

/*
 * Resolve the active table index from data_021052fc -> +0x24 -> +0x00 minus
 * one through func_02028388, sign-extend the low 12 bits of returned word
 * +0x40, and select its 0x78-byte record block in data_020e9fa0. Store that
 * block at singleton data_021056e4 +0x04 and allocate a 0x3c-byte array at
 * +0x08. For each of 15 eight-byte records, read signed halfwords +0/+2/+4;
 * a nonzero first value allocates and initializes a tagged 0x10-byte resource,
 * while zero stores null. Returns no value. The retail path assumes the array
 * allocation succeeds; heap and resource initialization change ownership.
 */
void func_02039f6c(void)
{
    s32 selector;
    u8 *records;
    void **resources;
    s32 i;
    void *state = *(void **)(*(u8 **)(data_021052fc + 0x24));

    state = func_02028388(*(s32 *)state - 1);
    selector = (*(s32 *)((u8 *)state + 0x40) << 20) >> 20;
    records = data_020e9fa0 + selector * 0x78;
    *(u8 **)(data_021056e4 + 4) = records;
    resources = (void **)Heap_Alloc(0x3c, data_020df4e0, 4, &gHeapContext);
    *(void ***)(data_021056e4 + 8) = resources;
    for (i = 0; i < 15; ++i) {
        s16 first = *(s16 *)(records + i * 8);
        s16 second = *(s16 *)(records + i * 8 + 2);
        s16 third = *(s16 *)(records + i * 8 + 4);
        if (first != 0) {
            void *resource = Heap_Alloc(0x10, data_020df4e8, 4,
                                        &gHeapContext);
            if (resource != 0)
                resource = func_02005580(resource, first, second, third);
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
 * ownership established by func_02039f6c.
 */
void func_0203a050(void)
{
    void **resources;
    s32 i;
    *(void **)(data_021056e4 + 4) = 0;
    resources = *(void ***)(data_021056e4 + 8);
    if (resources == 0)
        return;
    for (i = 0; i < 15; ++i) {
        void *resource = resources[i];
        if (resource != 0)
            (*(void (**)(void *))(*(u8 **)resource + 4))(resource);
    }
    Heap_Free(resources);
    *(void **)(data_021056e4 + 8) = 0;
}

/*
 * Return null for one-based index zero; otherwise return resource array entry
 * index-1 from singleton +0x08. No bounds check or state change occurs.
 */
void *func_0203a0b4(u32 index)
{
    if (index == 0)
        return 0;
    return (*(void ***)(data_021056e4 + 8))[index - 1];
}

/*
 * Return unsigned halfword +0x06 from one-based record index in singleton
 * table +0x04. The table and index are preconditions; no state changes.
 */
u16 func_0203a0d4(u32 index)
{
    u8 *records = *(u8 **)(data_021056e4 + 4);
    return *(u16 *)(records + (index - 1) * 8 + 6);
}
