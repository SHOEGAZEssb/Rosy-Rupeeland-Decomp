#include "tingle/types.h"

/* Overlay 25 random follow-up mode selection for the animated title effect. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0209189c(u32 *, s32, s32);
extern s32 TitleRandom_NextBounded(u32 *, s32);
extern void func_ov025_021fe4cc(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Chooses a random mode in 0..8 different from current +0x9C, chooses a
 * random variant in 0..2, and dispatches both. RNG and animation state change;
 * returns no value.
 */
extern "C" void func_ov025_021fe3f8(void *object)
{
    s32 mode;
    do mode = TitleRandom_NextBounded((u32 *)object + 0x3e, 9);
    while (mode == FIELD(s32, object, 0x9c));
    func_ov025_021fe4cc(object, mode,
                        func_0209189c((u32 *)object + 0x3e, 0, 3));
}
