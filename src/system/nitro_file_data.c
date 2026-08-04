#include "tingle/nitro_file.h"

/*
 * Retail NitroFile virtual dispatch table. Its trailing RTTI descriptor stays
 * in the original data gap; this unit reconstructs only the class vtable.
 */

extern const void *data_020d406c;

NitroFileVTable data_020d40dc = {
    func_02005134,
    func_02005160,
    0,
    &data_020d406c,
};
