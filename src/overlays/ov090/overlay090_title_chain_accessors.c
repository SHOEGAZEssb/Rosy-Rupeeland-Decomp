#include "tingle/heap.h"
#include "tingle/types.h"

/* Flag propagation, accessors, and release helper for phase-90 title chains. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void func_ov090_0221b97c(void *resource, u16 flags);
extern void func_ov090_0221bc5c(void *resource, u16 flags);

/* Set or clear sprite flag 0x10 on every member's paired resource. */
void func_ov090_0221c3dc(void *self, s32 clear)
{
    s32 i;

    for (i = 0; i < FIELD(s16, self, 8); i++) {
        void *resource = FIELD(void *, FIELD(void **, self, 4)[i], 4);
        if (clear != 0)
            func_ov090_0221bc5c(resource, 0x10);
        else
            func_ov090_0221b97c(resource, 0x10);
    }
}

/* Return the member at `index` from the chain's pointer array. */
void *func_ov090_0221c434(void *self, s32 index)
{
    return FIELD(void **, self, 4)[index];
}

/* Return the member at `index`; this duplicate entry preserves vtable ABI. */
void *func_ov090_0221c440(void *self, s32 index)
{
    return FIELD(void **, self, 4)[index];
}

/* Return the signed member count stored at chain offset +8. */
s32 func_ov090_0221c44c(void *self)
{
    return FIELD(s16, self, 8);
}

/* Free the chain allocation and return its original address. */
void *func_ov090_0221c454(void *self)
{
    Heap_Free(self);
    return self;
}
