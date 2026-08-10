#include "tingle/types.h"

/* Main-engine upload dispatch for decoded background screen-map resources. */

typedef struct GraphicsBgMapResource {
    u8 field_00[0x20];
    void *descriptor;
    void *data;
} GraphicsBgMapResource;

#ifdef __cplusplus
extern "C" {
#endif

extern u32 func_02070e94(const GraphicsBgMapResource *resource);
extern void func_020b1d34(const void *source, s32 destination, u32 size);
extern void func_020b1c64(const void *source, s32 destination, u32 size);
extern void func_020b1b94(const void *source, s32 destination, u32 size);
extern void func_020b1ac4(const void *source, s32 destination, u32 size);

#ifdef __cplusplus
}
#endif

/*
 * Upload the decoded screen map to main-engine background 0..3 at the caller's
 * byte offset. The map size is derived by func_02070e94; invalid indices do
 * not alter VRAM.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_02070e0c(GraphicsBgMapResource *resource, s32 background,
                   s32 destination)
{
    switch (background) {
    case 0:
        func_020b1d34(resource->data, destination,
                      func_02070e94(resource));
        return;
    case 1:
        func_020b1c64(resource->data, destination,
                      func_02070e94(resource));
        return;
    case 2:
        func_020b1b94(resource->data, destination,
                      func_02070e94(resource));
        return;
    case 3:
        func_020b1ac4(resource->data, destination,
                      func_02070e94(resource));
        return;
    }
}
