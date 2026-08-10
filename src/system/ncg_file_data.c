#include "tingle/ncg_file.h"

/*
 * CNcgFile vtable. The RTTI descriptor itself remains in the original data
 * gap and is referenced by its address-derived symbol.
 */

extern const void *data_020d4064;

NitroFileVTable data_020d40cc = {
    (NitroFile *(*)(NitroFile *))NcgFile_Destroy,
    (NitroFile *(*)(NitroFile *))NcgFile_DestroyAndFree,
    0,
    &data_020d4064,
};
