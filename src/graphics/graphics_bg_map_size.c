#include "tingle/types.h"

/* Byte-size calculation for decoded background screen-map resources. */

typedef struct GraphicsBgMapDescriptor {
    u8 field_00[0xc];
    s32 width;
    s32 height;
} GraphicsBgMapDescriptor;

typedef struct GraphicsBgMapResource {
    u8 field_00[0x20];
    GraphicsBgMapDescriptor *descriptor;
} GraphicsBgMapResource;

/* Return width times height times the two-byte map-entry size. */
#ifdef __cplusplus
extern "C"
#endif
u32 func_02070e94(const GraphicsBgMapResource *resource)
{
    return resource->descriptor->width * resource->descriptor->height * 2;
}
