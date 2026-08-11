#include "tingle/types.h"

/* Overlay 25 randomized follow-up animation dispatch by effect mode. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" s32 func_0209189c(u32 *, s32, s32);
extern "C" void func_ov025_021feb08(void *, s32);

/*
 * For current mode 3 or 6, choose a random follow-up in inclusive range 4..11
 * or 15..20 and dispatch it. Other modes leave the object unchanged. RNG and
 * follow-up animation state may change; returns void.
 */
extern "C" void func_ov025_021fe444(void *object)
{
    switch (FIELD(s32, object, 0x9c)) {
    case 0:
        break;
    case 1:
        break;
    case 2:
        break;
    case 3:
        func_ov025_021feb08(
            object, func_0209189c((u32 *)object + 0x3e, 4, 11));
        break;
    case 4:
        break;
    case 5:
        break;
    case 6:
        func_ov025_021feb08(
            object, func_0209189c((u32 *)object + 0x3e, 15, 20));
        break;
    case 7:
        break;
    case 8:
        break;
    case 9:
        break;
    case 10:
        break;
    case 11:
        break;
    default:
        break;
    }
}
