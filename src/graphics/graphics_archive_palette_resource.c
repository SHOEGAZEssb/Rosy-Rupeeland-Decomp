#include "tingle/types.h"

/* Construct cached NCLR palette-resource views loaded from an archive. */

typedef struct GraphicsArchivePaletteResource {
    const void *vtable;
    u8 field_04[0x1c];
    const u32 *source;
    const void *payload;
    u32 field_28;
} GraphicsArchivePaletteResource;

#ifdef __cplusplus
extern "C" {
#endif
extern const u32 data_020e5c30[];
extern void GraphicsArchiveResource_Init(void *self, void *archive, const void *source,
                          u32 sourceSize, u32 resourceId, u32 resourceKind);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the common cached-resource base as kind one, retain the source
 * header, point at its payload at +8, clear field_28, and return self. The
 * fifth input is the archive resource ID; no SDK or hardware upload occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
GraphicsArchivePaletteResource *GraphicsArchivePaletteResource_Init(
    GraphicsArchivePaletteResource *self, void *archive, const u32 *source,
    u32 sourceSize, u32 resourceId)
{
    GraphicsArchiveResource_Init(self, archive, source, sourceSize, resourceId, 1);
    self->vtable = data_020e5c30;
    self->source = source;
    self->payload = source + 2;
    self->field_28 = 0;
    return self;
}
