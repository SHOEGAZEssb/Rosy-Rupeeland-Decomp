#include "tingle/ncl_file.h"

/* CNclFile virtual destructor pair used by the retail class instance. */

NclFileVTable gNclFileVTable = {
    NclFile_Destroy,
    NclFile_DestroyAndFree,
};
