#include "tingle/types.h"

/* Overlay 39 embedded-array and SDK-object teardown helpers. */

typedef void (*Overlay039ArrayFn)(void *element);

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Destroy(void *object);
extern void __destroy_arr(void *array, s32 count, s32 stride,
                          Overlay039ArrayFn destructor);
extern void func_ov039_021fce5c(void);
#ifdef __cplusplus
}
#endif

/* No-op destructor for the eight-byte records at scene +0x1D8. */
extern "C" void func_ov039_021fd06c(void)
{
}

/*
 * Destroy embedded SDK objects at +0x320 and +0x310, then destroy 39
 * eight-byte elements at +0x1D8 through func_ov039_021fd06c and 39 twelve-byte
 * elements at +4 through func_ov039_021fce5c. Returns scene without freeing
 * it; embedded SDK/array state changes in that order.
 */
extern "C" void *func_ov039_021fd01c(void *scene)
{
    VecFx32Object_Destroy((u8 *)scene + 0x320);
    VecFx32Object_Destroy((u8 *)scene + 0x310);
    __destroy_arr((u8 *)scene + 0x1d8, 39, 8,
                  (Overlay039ArrayFn)func_ov039_021fd06c);
    __destroy_arr((u8 *)scene + 4, 39, 12,
                  (Overlay039ArrayFn)func_ov039_021fce5c);
    return scene;
}
