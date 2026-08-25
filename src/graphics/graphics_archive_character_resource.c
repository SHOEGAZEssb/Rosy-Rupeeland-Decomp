#include "tingle/types.h"

/* Construct the cached NCGR/NCBR character-resource view used by archives. */

typedef struct GraphicsArchiveCharacterResource {
    const void *vtable;
    u8 field_04[0x1c];
    const u32 *source;
    const void *payload;
    u32 formatFlags;
} GraphicsArchiveCharacterResource;

#ifdef __cplusplus
extern "C" {
#endif
extern const u32 data_020e5ca0[];
extern void GraphicsArchiveResource_Init(void *self, void *archive, const void *source,
                          u32 sourceSize, u32 resourceId, u32 resourceKind);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the common cached-resource base as kind zero, retain the source
 * header and its payload at +0x0c, and recover the packed character format
 * flags. The fifth input is the archive resource ID; no allocation occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
GraphicsArchiveCharacterResource *GraphicsArchiveCharacterResource_Init(
    GraphicsArchiveCharacterResource *self, void *archive, const u32 *source,
    u32 sourceSize, u32 resourceId)
{
    GraphicsArchiveResource_Init(self, archive, source, sourceSize, resourceId, 0);
    self->vtable = data_020e5ca0;
    self->source = source;
    self->payload = source + 3;
    if (self->source[0] == 0x56434720) {
        self->formatFlags =
            (self->formatFlags & ~0xf) | (self->source[1] & 0xf);
        self->formatFlags &= 0xffffc00f;
        self->formatFlags &= 0xff003fff;
    } else {
        self->formatFlags = self->source[1];
    }
    return self;
}
