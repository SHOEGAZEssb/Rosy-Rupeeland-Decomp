#include "tingle/types.h"

/* Overlay 12 render-transform non-freeing destruction. */

extern u32 data_ov012_021fe5f4[];
extern void *data_020f4e18;
#ifdef __cplusplus
extern "C" void func_02071e04(void *);
#else
extern void func_02071e04(void *);
#endif

/* Restore the address-derived vtable and, when +0x04 is non-null, notify func_02071e04 through the global +0x020F4E18 owner; return object. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov012_021fce3c(void *object)
{
    *(u32 **)object = data_ov012_021fe5f4;
    if (*(void **)((u8 *)object + 4) != 0) {
        func_02071e04(data_020f4e18);
    }
    return object;
}
