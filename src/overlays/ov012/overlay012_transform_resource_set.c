#include "tingle/types.h"

/* Overlay 12 render-transform owned-resource replacement. */

extern void *data_020f4e18;
#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsArchive_ReleaseOwlvResource(void *);
extern void *GraphicsArchive_AcquireOwlvResource(void *, void *);
#ifdef __cplusplus
}
#endif

/* Release any current +0x04 resource through the global owner, create a replacement from descriptor, store it, and return void. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fceb4(void *object, void *descriptor)
{
    if (*(void **)((u8 *)object + 4) != 0) {
        GraphicsArchive_ReleaseOwlvResource(data_020f4e18);
    }
    *(void **)((u8 *)object + 4) = GraphicsArchive_AcquireOwlvResource(data_020f4e18, descriptor);
}
