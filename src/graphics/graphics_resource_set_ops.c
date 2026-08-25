#include "tingle/graphics_resources.h"

/*
 * Teardown and graphics-application operations for a three-part resource set.
 * Each decoded handle retains its owning archive at offset 0x04. Teardown
 * passes that archive together with the handle to its reference-counted cache
 * release function. The concrete formats remain partly unconfirmed, so
 * address-derived names and offsets are preserved.
 */

/* Only the offset-0x04 member is accessed here during resource teardown. */
typedef struct GraphicsResourceHandle {
    u32 field_00;
    void *archive_04;
} GraphicsResourceHandle;

#ifdef __cplusplus
extern "C" {
#endif

extern void GraphicsArchive_ReleaseCharacterResource(void *archive, void *resource);
extern void GraphicsArchive_ReleasePaletteResource(void *archive, void *resource);
extern void GraphicsArchive_ReleaseScreenResource(void *archive, void *resource);
extern void GraphicsBgCharacterResource_UploadToMainBg(void *resource, s32 value, s32 zero);
extern void GraphicsBgPaletteResource_UploadToMainBg(void *resource, s32 value);
extern void GraphicsBgMapResource_UploadToMainBg(void *resource, s32 value, s32 zero);
extern void GraphicsBgCharacterResource_UploadToSubBg(void *resource, s32 value, s32 zero);
extern void GraphicsBgPaletteResource_UploadToSubBg(void *resource, s32 value);
extern void GraphicsBgMapResource_UploadToSubBg(void *resource, s32 value, s32 zero);

#ifdef __cplusplus
}
#endif

/*
 * Release each handle from the cache in its retained archive, then clear all
 * three pointers. A null resource0 marks the entire set empty and causes no
 * state change; the teardown helpers may destroy final-reference resources.
 */
void GraphicsResourceSet_ReleaseHandles(GraphicsResourceSet *set)
{
    GraphicsResourceHandle *resource0 =
        (GraphicsResourceHandle *)set->resource0;
    GraphicsResourceHandle *resource1;
    GraphicsResourceHandle *resource2;

    if (resource0 == 0) {
        return;
    }

    GraphicsArchive_ReleaseCharacterResource(resource0->archive_04, resource0);
    resource1 = (GraphicsResourceHandle *)set->resource1;
    GraphicsArchive_ReleasePaletteResource(resource1->archive_04, resource1);
    resource2 = (GraphicsResourceHandle *)set->resource2;
    GraphicsArchive_ReleaseScreenResource(resource2->archive_04, resource2);
    set->resource0 = 0;
    set->resource1 = 0;
    set->resource2 = 0;
}

/*
 * Forward set and the two caller values through the first confirmed graphics
 * setup path. resource0/resource2 receive value0 plus a zero flag, while
 * resource1 receives value1; the downstream helpers mutate graphics state.
 */
void GraphicsResourceSet_ApplyToMainBg(GraphicsResourceSet *set, s32 value0, s32 value1)
{
    GraphicsBgCharacterResource_UploadToMainBg(set->resource0, value0, 0);
    GraphicsBgPaletteResource_UploadToMainBg(set->resource1, value1);
    GraphicsBgMapResource_UploadToMainBg(set->resource2, value0, 0);
}

/*
 * Forward set and the two caller values through the second confirmed graphics
 * application path. The argument routing matches GraphicsResourceSet_ApplyToMainBg; downstream
 * helpers update graphics-library and potentially display-engine state.
 */
void GraphicsResourceSet_Apply(GraphicsResourceSet *set, s32 value0,
                               s32 value1)
{
    GraphicsBgCharacterResource_UploadToSubBg(set->resource0, value0, 0);
    GraphicsBgPaletteResource_UploadToSubBg(set->resource1, value1);
    GraphicsBgMapResource_UploadToSubBg(set->resource2, value0, 0);
}
