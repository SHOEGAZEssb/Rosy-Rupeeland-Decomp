#include "tingle/types.h"

/* Overlay 51 scene update adapter for the shared callback ABI. */

extern "C" void func_ov051_0220d688(void *scene);

/*
 * Advance `scene` through func_ov051_0220d688 and return zero. Scene, graphics,
 * and SDK state may change through the callee; no direct hardware access occurs.
 */
extern "C" s32 func_ov051_0220dd80(void *scene)
{
    func_ov051_0220d688(scene);
    return 0;
}
