#include "tingle/types.h"

/*
 * Overlay 49 derived-object teardown. This recovered helper destroys two
 * embedded records before delegating to the shared runtime base destructor.
 */

extern "C" void func_02005058(void *record);
extern "C" void func_02099fb0(void *object);

/*
 * Destroy embedded records +0x9C and +0x8C in reverse construction order,
 * invoke the base teardown, and return `object`. Owned runtime/SDK state may be
 * released by callees; storage itself is not freed and no direct MMIO occurs.
 */
extern "C" void *func_ov049_0220ba98(void *object)
{
    func_02005058((u8 *)object + 0x9c);
    func_02005058((u8 *)object + 0x8c);
    func_02099fb0(object);
    return object;
}
