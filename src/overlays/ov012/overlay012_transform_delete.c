#include "tingle/types.h"

/* Overlay 12 render-transform deleting destruction. */

extern u32 data_ov012_021fe5f4[];
extern void *data_020f4e18;
#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071e04(void *);
extern void Heap_Free(void *);
#ifdef __cplusplus
}
#endif

/* Perform the transform's resource-owner notification, free object, and return its invalid post-free ABI pointer. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov012_021fce74(void *object)
{
    *(u32 **)object = data_ov012_021fe5f4;
    if (*(void **)((u8 *)object + 4) != 0) {
        func_02071e04(data_020f4e18);
    }
    Heap_Free(object);
    return object;
}
