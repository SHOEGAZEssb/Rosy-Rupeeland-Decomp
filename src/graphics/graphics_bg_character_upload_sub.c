/*
 * Sub-engine BG character upload dispatch for decoded graphics resources.
 * Resource bytes remain archive-owned; destination and size are byte units.
 */
#include "tingle/types.h"

typedef struct GraphicsBgCharacterResource {
    u8 field00[0x14];
    u32 loaded;
    u8 field18[8];
    const void *descriptor;
    const void *data;
} GraphicsBgCharacterResource;

extern void func_020b198c(const void *source, u32 destination, u32 size);
extern void func_020b18bc(const void *source, u32 destination, u32 size);
extern void func_020b17ec(const void *source, u32 destination, u32 size);
extern void func_020b171c(const void *source, u32 destination, u32 size);

/* Upload the decoded character block to sub BG0..BG3. Unloaded resources and
 * background indices outside 0..3 produce no hardware writes. */
void GraphicsBgCharacterResource_UploadToSubBg(GraphicsBgCharacterResource *resource, s32 background,
                   u32 destination)
{
    if (resource->loaded == 0)
        return;
    switch (background) {
    case 0:
        func_020b198c(resource->data, destination,
                      *(const u32 *)((const u8 *)resource->descriptor + 8));
        return;
    case 1:
        func_020b18bc(resource->data, destination,
                      *(const u32 *)((const u8 *)resource->descriptor + 8));
        return;
    case 2:
        func_020b17ec(resource->data, destination,
                      *(const u32 *)((const u8 *)resource->descriptor + 8));
        return;
    case 3:
        func_020b171c(resource->data, destination,
                      *(const u32 *)((const u8 *)resource->descriptor + 8));
        return;
    }
}
