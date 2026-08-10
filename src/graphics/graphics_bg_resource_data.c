#include "tingle/types.h"

/* Primary and alternate decoded-data access for background resources. */

typedef struct GraphicsBgResourceData {
    u8 field_00[0x24];
    void *data;
    void *alternateData;
} GraphicsBgResourceData;

/* Return alternate decoded storage when present, otherwise primary storage. */
#ifdef __cplusplus
extern "C"
#endif
void *func_02070874(GraphicsBgResourceData *resource)
{
    if (resource->alternateData != 0)
        return resource->alternateData;
    return resource->data;
}
