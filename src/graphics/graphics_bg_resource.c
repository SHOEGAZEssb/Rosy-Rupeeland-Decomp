#include "tingle/types.h"

/*
 * Accessors and upload operations for the game's decoded background-resource
 * handles. Character and screen data remain game-owned; the final copies are
 * delegated to the NitroSDK graphics upload routines.
 */

typedef struct GraphicsBgResourceDescriptor {
    u8 field_00[8];
    u32 uploadSize;
    s32 width;
    s32 height;
} GraphicsBgResourceDescriptor;

typedef struct GraphicsBgResource {
    u8 field_00[0x14];
    void *allocation;
    u8 field_18[8];
    GraphicsBgResourceDescriptor *descriptor;
    void *data;
} GraphicsBgResource;

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020b19f4(const void *source, s32 destination, u32 size);
extern void func_020b1924(const void *source, s32 destination, u32 size);
extern void func_020b1854(const void *source, s32 destination, u32 size);
extern void func_020b1784(const void *source, s32 destination, u32 size);

#ifdef __cplusplus
}
#endif

/*
 * Upload the decoded character bytes to main-engine background 0..3 at the
 * caller's byte offset. An absent allocation or an out-of-range background
 * leaves VRAM unchanged; the NitroSDK helper performs the hardware copy.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_02070638(GraphicsBgResource *resource, s32 background,
                   s32 destination)
{
    if (resource->allocation == 0)
        return;

    switch (background) {
    case 0:
        func_020b19f4(resource->data, destination,
                      resource->descriptor->uploadSize);
        return;
    case 1:
        func_020b1924(resource->data, destination,
                      resource->descriptor->uploadSize);
        return;
    case 2:
        func_020b1854(resource->data, destination,
                      resource->descriptor->uploadSize);
        return;
    case 3:
        func_020b1784(resource->data, destination,
                      resource->descriptor->uploadSize);
        return;
    }
}
