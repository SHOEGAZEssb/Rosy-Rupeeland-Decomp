#include "tingle/types.h"

/* Main-engine upload dispatch for decoded background palette resources. */

typedef struct GraphicsBgPaletteDescriptor {
    u8 field_00[4];
    u16 format;
    u16 count;
} GraphicsBgPaletteDescriptor;

typedef struct GraphicsBgPaletteResource {
    u8 field_00[0x14];
    void *allocation;
    u8 field_18[8];
    GraphicsBgPaletteDescriptor *descriptor;
    void *data;
    void *alternateData;
} GraphicsBgPaletteResource;

#ifdef __cplusplus
extern "C" {
#endif

extern void *GraphicsBgResourceData_GetDecoded(GraphicsBgPaletteResource *resource);
extern void func_020b2058(const void *source, s32 destination, u32 size);
extern void func_020b1618(void);
extern void func_020b1598(const void *source, s32 destination, u32 size);
extern void func_020b1534(void);

#ifdef __cplusplus
}
#endif

/*
 * Upload a standard 16-color palette or a 256-color extended palette at the
 * caller's byte offset. Absent allocations and unknown formats are ignored;
 * NitroSDK helpers own the VRAM transfer and extended-palette transaction.
 */
#ifdef __cplusplus
extern "C"
#endif
void GraphicsBgPaletteResource_UploadToMainBg(GraphicsBgPaletteResource *resource, s32 destination)
{
    GraphicsBgPaletteDescriptor *descriptor;

    if (resource->allocation == 0)
        return;
    descriptor = resource->descriptor;
    switch (descriptor->format) {
    case 0x10:
        func_020b2058(GraphicsBgResourceData_GetDecoded(resource), destination,
                      (u32)descriptor->count << 5);
        break;
    case 0x100:
        func_020b1618();
        func_020b1598(GraphicsBgResourceData_GetDecoded(resource), destination,
                      (u32)resource->descriptor->count << 9);
        func_020b1534();
        break;
    }
}
