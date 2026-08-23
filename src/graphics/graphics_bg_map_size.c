#include "tingle/graphics_bg_map_resource.h"

/* Entry-payload byte-size calculation for background screen-map resources. */

/* Return width times height times the two-byte map-entry size. */
#ifdef __cplusplus
extern "C"
#endif
u32 GraphicsBgMapResource_GetDataSizeBytes(const GraphicsBgMapResource *resource)
{
    return resource->descriptor->entryColumnCount *
           resource->descriptor->entryRowCount * sizeof(*resource->entries);
}
