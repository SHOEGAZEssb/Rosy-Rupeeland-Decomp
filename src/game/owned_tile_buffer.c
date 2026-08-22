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
void OwnedTileBuffer_Clear(OwnedTileBuffer *);
/* Release storage when present and return the buffer object. */
OwnedTileBuffer *OwnedTileBuffer_Destroy(OwnedTileBuffer *self)
{
    if (self->bytes_00)
        OwnedTileBuffer_Clear(self);
    return self;
}

/* Free owned storage when non-null, then clear both pointer and count. */
void OwnedTileBuffer_Clear(OwnedTileBuffer *self)
{
    if (self->bytes_00) {
        func_02003e38(self->bytes_00);
        self->bytes_00 = 0;
    }
    self->count_04 = 0;
}

#ifdef __cplusplus
}
#endif
