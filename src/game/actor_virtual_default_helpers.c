#include "tingle/heap.h"
#include "tingle/types.h"

/* Supply default lifecycle, position-copy, flag, and constant virtual hooks. */
#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitCopy(void *destination, const void *source);
#ifdef __cplusplus
}
#endif

/*
 * Free self through the heap and return the original pointer value. This is the
 * confirmed deleting-destructor convention; the returned address no longer
 * owns live storage and must not be dereferenced.
 */
void *func_02034e08(void *self)
{
    Heap_Free(self);
    return self;
}

/*
 * Construct/copy the vector at source+0x18 into destination through
 * VecFx32Object_InitCopy. Returns no explicit value; the helper may manage SDK value state.
 */
void func_02034e1c(void *destination, const void *source)
{
    VecFx32Object_InitCopy(destination, (const u8 *)source + 0x18);
}

/* Ignore self and return zero as the default query result. */
s32 func_02034e2c(void *self)
{
    (void)self;
    return 0;
}

/* Set actor flag 0x80 at offset 0xd0 and return no value. */
void func_02034e34(void *self)
{
    *(u32 *)((u8 *)self + 0xd0) |= 0x80;
}

/* Ignore self and return zero as a second default query result. */
s32 func_02034e44(void *self)
{
    (void)self;
    return 0;
}

/* Ignore self and return zero as a third default query result. */
s32 func_02034e4c(void *self)
{
    (void)self;
    return 0;
}

/* Empty recovered callback; ignores self and returns no value. */
void func_02034e54(void *self)
{
    (void)self;
}
