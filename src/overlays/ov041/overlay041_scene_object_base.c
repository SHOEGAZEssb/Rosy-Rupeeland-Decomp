#include "tingle/types.h"

/*
 * Overlay 41 scene-object base initialization. This recovered constructor sets
 * the base dispatch table, initializes two embedded transform records, and
 * clears the base object's pointer/state fields.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void func_02004fe0(void *);
extern u8 data_020f3058;
}

/*
 * Initialize object with the base dispatch table and default-zero state.
 * Embedded records at 0x1C and 0x2C are initialized through the shared SDK
 * helper. The input pointer is returned; no hardware state is touched.
 */
extern "C" void *func_ov041_021ff1cc(void *object)
{
    FIELD(void *, object, 0) = &data_020f3058;
    func_02004fe0((u8 *)object + 0x1c);
    func_02004fe0((u8 *)object + 0x2c);
    FIELD(s32, object, 4) = 0;
    FIELD(s32, object, 8) = 0;
    FIELD(s32, object, 0x0c) = 0;
    FIELD(s32, object, 0x44) = 0;
    return object;
}
