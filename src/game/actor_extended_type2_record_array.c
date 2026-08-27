#include "tingle/heap.h"
#include "tingle/types.h"

/* Construct the extended type-two actor's copied array of four-halfword records. */
extern const void *data_020dfec0[];
extern const char data_020df9e0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *CxxArray_ConstructWithCookie(void *allocation, s32 count, s32 elementSize,
                           s32 alignment, void (*constructor)(void *),
                           void (*destructor)(void *));
void ActorExtendedRecordArray_InitElementNoOp(void *element);
#ifdef __cplusplus
}
#endif

/*
 * Install vtable data_020dfec0 and count consecutive eight-byte input records
 * until the first signed halfword equals -1. For a positive count, allocate
 * count*8+8 bytes, initialize an eight-byte-element array through CxxArray_ConstructWithCookie
 * using ActorExtendedRecordArray_InitElementNoOp and no destructor, store it
 * at +0x04, then copy all four input halfwords into each element. For a
 * non-positive count, store null at
 * +0x04. Return self; heap and array-construction state change. As in retail,
 * allocation failure still leaves the subsequent copy loop without a guard.
 */
void *ActorExtendedRecordArray_Init(void *self, const void *records)
{
    u8 *object = (u8 *)self;
    const s16 *source = (const s16 *)records;
    s32 count = 0;
    s32 index;

    *(const void **)object = data_020dfec0;
    *(s32 *)(object + 8) = 0;
    while (source[count * 4] != -1)
        ++count;
    *(s32 *)(object + 8) = count;

    if (count > 0) {
        void *allocation = Heap_AllocAlternateEntry((u32)(count * 8 + 8),
                                         data_020df9e0, 4, &gHeapContext);
        if (allocation != 0) {
            allocation = CxxArray_ConstructWithCookie(allocation, count, 8, 8,
                                       ActorExtendedRecordArray_InitElementNoOp, 0);
        }
        *(void **)(object + 4) = allocation;
        for (index = 0; index < count; ++index) {
            s16 *destination = (s16 *)((u8 *)allocation + index * 8);
            destination[0] = source[index * 4 + 0];
            destination[1] = source[index * 4 + 1];
            destination[2] = source[index * 4 + 2];
            destination[3] = source[index * 4 + 3];
        }
    } else {
        *(void **)(object + 4) = 0;
    }
    return object;
}

/* Accept an array element and perform no initialization; returns no value. */
void ActorExtendedRecordArray_InitElementNoOp(void *element)
{
    (void)element;
}
