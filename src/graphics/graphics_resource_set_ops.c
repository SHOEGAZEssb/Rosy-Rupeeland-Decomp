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

extern void func_02071bdc(void *archive, void *resource);
extern void func_02071c38(void *archive, void *resource);
extern void func_02071cf0(void *archive, void *resource);
extern void func_02070638(void *resource, s32 value, s32 zero);
extern void func_02070b50(void *resource, s32 value);
extern void GraphicsBgMapResource_UploadToMainBg(void *resource, s32 value, s32 zero);
extern void func_020706c4(void *resource, s32 value, s32 zero);
extern void func_02070bc4(void *resource, s32 value);
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

    func_02071bdc(resource0->archive_04, resource0);
    resource1 = (GraphicsResourceHandle *)set->resource1;
    func_02071c38(resource1->archive_04, resource1);
    resource2 = (GraphicsResourceHandle *)set->resource2;
    func_02071cf0(resource2->archive_04, resource2);
    set->resource0 = 0;
    set->resource1 = 0;
    set->resource2 = 0;
}

/*
 * Forward set and the two caller values through the first confirmed graphics
 * setup path. resource0/resource2 receive value0 plus a zero flag, while
 * resource1 receives value1; the downstream helpers mutate graphics state.
 */
void func_02072048(GraphicsResourceSet *set, s32 value0, s32 value1)
{
    func_02070638(set->resource0, value0, 0);
    func_02070b50(set->resource1, value1);
    GraphicsBgMapResource_UploadToMainBg(set->resource2, value0, 0);
}

/*
 * Forward set and the two caller values through the second confirmed graphics
 * application path. The argument routing matches func_02072048; downstream
 * helpers update graphics-library and potentially display-engine state.
 */
void GraphicsResourceSet_Apply(GraphicsResourceSet *set, s32 value0,
                               s32 value1)
{
    func_020706c4(set->resource0, value0, 0);
    func_02070bc4(set->resource1, value1);
    GraphicsBgMapResource_UploadToSubBg(set->resource2, value0, 0);
}
