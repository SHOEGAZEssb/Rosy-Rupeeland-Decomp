#include "tingle/types.h"

/* Palette-bank mutation for decoded background screen-map resources. */

typedef struct GraphicsBgMapDescriptor {
    u8 field_00[0xc];
    s32 width;
    s32 height;
} GraphicsBgMapDescriptor;

typedef struct GraphicsBgMapResource {
    u8 field_00[0x20];
    GraphicsBgMapDescriptor *descriptor;
    void *data;
} GraphicsBgMapResource;

/*
 * Add value to the palette-bank nibble of every map entry, preserving its
 * low 12-bit tile and transform fields. Arithmetic wraps to four bits; the
 * decoded map buffer changes in place and no hardware copy occurs here.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_02070f80(GraphicsBgMapResource *resource, s32 value)
{
    u16 *entry = (u16 *)resource->data;
    s32 index;

    for (index = 0;
         index < resource->descriptor->width * resource->descriptor->height;
         index++) {
        u16 current = *entry;
        u16 palette = (u16)(value + ((u32)current >> 12));

        current &= ~0xf000;
        current |= (u16)((palette & 0xf) << 12);
        *entry = current;
        entry++;
    }
}
