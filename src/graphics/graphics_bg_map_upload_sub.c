/*
 * Sub-engine BG screen-map upload dispatch. The decoded map remains owned by
 * its graphics archive and the destination is a byte offset in BG screen VRAM.
 */
#include "tingle/types.h"

typedef struct GraphicsBgMapResource {
    u8 field00[0x20];
    const void *descriptor;
    const void *data;
} GraphicsBgMapResource;

extern u32 func_02070e94(const GraphicsBgMapResource *resource);
extern void func_020b1ccc(const void *source, u32 destination, u32 size);
extern void func_020b1bfc(const void *source, u32 destination, u32 size);
extern void func_020b1b2c(const void *source, u32 destination, u32 size);
extern void func_020b1a5c(const void *source, u32 destination, u32 size);

/* Upload the decoded map to sub BG0..BG3. The shared size helper reads its
 * descriptor dimensions; invalid background indices leave VRAM unchanged. */
void func_02070eac(GraphicsBgMapResource *resource, s32 background,
                   u32 destination)
{
    switch (background) {
    case 0:
        func_020b1ccc(resource->data, destination, func_02070e94(resource));
        return;
    case 1:
        func_020b1bfc(resource->data, destination, func_02070e94(resource));
        return;
    case 2:
        func_020b1b2c(resource->data, destination, func_02070e94(resource));
        return;
    case 3:
        func_020b1a5c(resource->data, destination, func_02070e94(resource));
        return;
    }
}
