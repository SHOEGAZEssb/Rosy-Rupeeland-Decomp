#include "tingle/types.h"

/*
 * Recovered allocator for choosing records from a sentinel-terminated table
 * while tracking the object currently owning each record.
 */
extern const char data_020e16a8[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02003e20(u32 size, const char *label, u32 alignment,
                           void *heapContext);
extern void func_02003e38(void *allocation);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

/*
 * Store the four-byte record table at object +0, count records until a signed
 * halfword -1 sentinel, allocate a four-byte-per-record owner array with label
 * data_020e16a8/alignment four, clear every owner slot, and return self. Object,
 * heap ownership, and allocation state change; the allocator crosses the heap
 * boundary but performs no direct hardware access.
 */
void *func_02045058(void *self, const void *recordTable)
{
    u8 *object = (u8 *)self;
    const u8 *record = (const u8 *)recordTable;
    s32 count = 0;
    s32 i;
    *(const void **)object = recordTable;
    while (*(const s16 *)record != -1) {
        ++count;
        record += 4;
    }
    *(s32 *)(object + 8) = count;
    *(void **)(object + 4) =
        func_02003e20((u32)count * 4, data_020e16a8, 4, &gHeapContext);
    for (i = 0; i < count; ++i)
        (*(void ***)(object + 4))[i] = 0;
    return object;
}

/*
 * Allocate a temporary index array as large as the record count. Collect every
 * owner slot that is empty or already equals owner, choose one uniformly using
 * genrand_int32 modulo the candidate count, free the temporary array, store
 * owner in the chosen slot, and return its four-byte table record. With no
 * candidate, free the temporary and return null. Heap/random state and record
 * ownership may change; allocation/freeing crosses the engine heap boundary.
 */
void *func_020450dc(void *self, void *owner)
{
    u8 *object = (u8 *)self;
    s32 count = *(s32 *)(object + 8);
    s32 *indices = (s32 *)func_02003e20(
        (u32)count * 4, data_020e16a8, 4, &gHeapContext);
    void **owners = *(void ***)(object + 4);
    s32 candidateCount = 0;
    s32 i;
    for (i = 0; i < count; ++i) {
        if (owners[i] == 0 || owners[i] == owner)
            indices[candidateCount++] = i;
    }
    if (candidateCount > 0) {
        s32 chosen = indices[genrand_int32() % candidateCount];
        func_02003e38(indices);
        owners[chosen] = owner;
        return (u8 *)*(void **)object + chosen * 4;
    }
    func_02003e38(indices);
    return 0;
}

/*
 * Clear every owner-array slot equal to owner. Returns no value; record
 * ownership changes while table and heap allocation remain intact.
 */
void func_02045184(void *self, void *owner)
{
    u8 *object = (u8 *)self;
    void **owners = *(void ***)(object + 4);
    s32 i;
    for (i = 0; i < *(s32 *)(object + 8); ++i) {
        if (owners[i] == owner)
            owners[i] = 0;
    }
}
