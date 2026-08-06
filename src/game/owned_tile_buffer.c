#include "tingle/heap.h"
#include "tingle/types.h"

/* Own a heap buffer and its associated count for tile-renderer layer data. */
typedef struct OwnedTileBuffer {
    void *bytes_00;
    u32 count_04;
} OwnedTileBuffer;

#ifdef __cplusplus
extern "C" {
#endif
void func_02029e64(OwnedTileBuffer *);
#ifdef __cplusplus
}
#endif

/* Release storage when present and return the buffer object. */
OwnedTileBuffer *func_02029e44(OwnedTileBuffer *self)
{
    if (self->bytes_00)
        func_02029e64(self);
    return self;
}

/* Free owned storage when non-null, then clear both pointer and count. */
void func_02029e64(OwnedTileBuffer *self)
{
    if (self->bytes_00) {
        func_02003e38(self->bytes_00);
        self->bytes_00 = 0;
    }
    self->count_04 = 0;
}
