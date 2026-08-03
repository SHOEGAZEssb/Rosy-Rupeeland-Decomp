#include "tingle/graphics_3d_light.h"

/*
 * Metrowerks runtime construction and destruction wrappers for the fixed array
 * of four NDS directional lights. The light element destructor is a no-op, but
 * retail retains the standard array-lifetime calls in both directions.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void __construct_array(void *array, u32 count, u32 elementSize,
                              void (*constructor)(void *),
                              void (*destructor)(void *));
extern void __destroy_arr(void *array, u32 count, u32 elementSize,
                          void (*destructor)(void *));

#ifdef __cplusplus
}
#endif

/* Initialize all four lights to zero through the compiler array runtime. */
Graphics3DLightSet *func_02077a8c(Graphics3DLightSet *set)
{
    __construct_array(set->lights, 4, sizeof(Graphics3DLight),
                      (void (*)(void *))func_02077a04,
                      (void (*)(void *))func_02077a20);
    return set;
}

/*
 * Traverse the four lights in reverse through the array runtime and return
 * set. The current element destructor has no observable effects.
 */
Graphics3DLightSet *func_02077ac4(Graphics3DLightSet *set)
{
    __destroy_arr(set->lights, 4, sizeof(Graphics3DLight),
                  (void (*)(void *))func_02077a20);
    return set;
}
