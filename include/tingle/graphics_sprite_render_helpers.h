#ifndef TINGLE_GRAPHICS_SPRITE_RENDER_HELPERS_H
#define TINGLE_GRAPHICS_SPRITE_RENDER_HELPERS_H

#include "tingle/types.h"

/* Three OAM attributes plus the source cell metadata copied with the template. */
typedef struct GraphicsSpriteOamRecord {
    u16 attribute0;
    u16 attribute1;
    u16 attribute2;
    u16 cellMetadata;
} GraphicsSpriteOamRecord;

typedef char GraphicsSpriteOamRecordSizeCheck[
    sizeof(GraphicsSpriteOamRecord) == 8 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsSpriteOamRecord_Copy(GraphicsSpriteOamRecord *destination,
                                  const GraphicsSpriteOamRecord *source);

#ifdef __cplusplus
}
#endif

#endif
