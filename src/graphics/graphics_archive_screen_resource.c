#include "tingle/types.h"

/* Construct cached NSCR background screen-map views loaded from an archive. */

typedef struct GraphicsArchiveScreenResource {
    const void *vtable;
    u8 field_04[0x1c];
    const u32 *source;
    const void *payload;
} GraphicsArchiveScreenResource;

#ifdef __cplusplus
extern "C" {
#endif
extern const u32 data_020e5c80[];
extern void GraphicsArchiveResource_Init(void *self, void *archive, const void *source,
                          u32 sourceSize, u32 resourceId, u32 resourceKind);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the common cached-resource base as kind three, retain the source
 * header, point at its map payload at +0x14, and return self. The fifth input
 * is the archive resource ID; no upload is performed here.
 */
#ifdef __cplusplus
extern "C"
#endif
GraphicsArchiveScreenResource *GraphicsArchiveScreenResource_Init(
    GraphicsArchiveScreenResource *self, void *archive, const u32 *source,
    u32 sourceSize, u32 resourceId)
{
    GraphicsArchiveResource_Init(self, archive, source, sourceSize, resourceId, 3);
    self->vtable = data_020e5c80;
    self->source = source;
    self->payload = (const u8 *)source + 0x14;
    return self;
}
