#include "tingle/types.h"

/*
 * Overlay 49 derived-object teardown. This recovered helper destroys two
 * embedded records before delegating to the shared runtime base destructor.
 */

extern "C" void VecFx32Object_Destroy(void *record);
extern "C" void func_02099fb0(void *object);

/*
 * Destroy embedded records +0x9C and +0x8C in reverse construction order,
 * invoke the base teardown, and return `object`. Owned runtime/SDK state may be
 * released by callees; storage itself is not freed and no direct MMIO occurs.
 */
extern "C" void *func_ov049_0220ba98(void *object)
{
    VecFx32Object_Destroy((u8 *)object + 0x9c);
    VecFx32Object_Destroy((u8 *)object + 0x8c);
    func_02099fb0(object);
    return object;
}
