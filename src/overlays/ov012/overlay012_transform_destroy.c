#include "tingle/types.h"

/* Overlay 12 render-transform non-freeing destruction. */

extern u32 data_ov012_021fe5f4[];
extern void *data_020f4e18;
#ifdef __cplusplus
extern "C" void GraphicsArchive_ReleaseOwlvResource(void *);
#else
extern void GraphicsArchive_ReleaseOwlvResource(void *);
#endif

/* Restore the address-derived vtable and, when +0x04 is non-null, notify GraphicsArchive_ReleaseOwlvResource through the global +0x020F4E18 owner; return object. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov012_021fce3c(void *object)
{
    *(u32 **)object = data_ov012_021fe5f4;
    if (*(void **)((u8 *)object + 4) != 0) {
        GraphicsArchive_ReleaseOwlvResource(data_020f4e18);
    }
    return object;
}
