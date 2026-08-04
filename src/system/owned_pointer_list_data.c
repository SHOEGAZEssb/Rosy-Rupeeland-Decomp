#include "tingle/owned_pointer_list.h"

/*
 * Destructor dispatch table for the owning pointer-list base. It is kept in
 * a data-only translation unit because the retail link places this table
 * before game-phase data while placing the corresponding code after it.
 */

OwnedPointerListVTable data_020d3ca0 = {
    func_02001d30,
    func_02001d90,
};
