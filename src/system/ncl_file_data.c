#include "tingle/ncl_file.h"

/* CNclFile virtual destructor pair used by the retail class instance. */

NclFileVTable data_020d40ec = {
    NclFile_Destroy,
    NclFile_DestroyAndFree,
};
