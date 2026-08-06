#include "tingle/types.h"

/* Provide category-specific batch-spawn entry points and install two recovered callbacks. */
extern void *data_020df500[2];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203af24(void *first, void *second, void *descriptors,
                          s32 category);
#ifdef __cplusplus
}
#endif

/* Forward all three inputs to func_0203af24 with actor category one; return no value. */
void func_0203b38c(void *first, void *second, void *descriptors)
{
    func_0203af24(first, second, descriptors, 1);
}

/* Forward all three inputs to func_0203af24 with actor category two; return no value. */
void func_0203b39c(void *first, void *second, void *descriptors)
{
    func_0203af24(first, second, descriptors, 2);
}

/* Store input in recovered callback slot data_020df500+0; return no value. */
void func_0203b3ac(void *callback)
{
    data_020df500[0] = callback;
}

/* Store input in recovered callback slot data_020df500+4; return no value. */
void func_0203b3bc(void *callback)
{
    data_020df500[1] = callback;
}
