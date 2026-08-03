#include "tingle/graphics_3d_resource_owner.h"

/*
 * Teardown for the 3D resource owner. It delegates release of live graphics
 * resources, resets the two inferred NDS VRAM-bank assignments, and runs the
 * Metrowerks array destructor over both embedded fixed descriptor arrays.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020776e8(Graphics3DResourceOwner *owner);
extern void func_020ae740(void);
extern void func_020ae72c(void);
extern void __destroy_arr(void *array, u32 count, u32 elementSize,
                          void (*destructor)(void *));

#ifdef __cplusplus
}
#endif

/*
 * Release owner-managed live resources, invoke the two inferred texture and
 * texture-palette bank reset helpers, destroy all 32 palette descriptors and
 * then all 32 texture descriptors, and return owner. The descriptor destructors
 * are currently no-ops, but retail still performs both reverse-order runtime
 * walks. Hardware bank reset occurs before descriptor destruction.
 */
Graphics3DResourceOwner *func_020775d8(Graphics3DResourceOwner *owner)
{
    func_020776e8(owner);
    func_020ae740();
    func_020ae72c();
    __destroy_arr(owner->paletteRegions.regions, 32,
                  sizeof(GraphicsSpriteRegion),
                  (void (*)(void *))func_02076944);
    __destroy_arr(owner->textureRegions.regions, 32,
                  sizeof(GraphicsSpriteRegion),
                  (void (*)(void *))func_02076718);
    return owner;
}
