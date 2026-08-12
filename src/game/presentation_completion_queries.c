
/* Exact portable forms of the small presentation-state queries at 0x02095224. */
#include "tingle/types.h"

/* Return true when no transition is active or when its state is one. */
s32 func_02095224(const void *presentation)
{
    const u8 *object = (const u8 *)presentation;

    if (*(void *const *)(object + 0x8c) == 0) {
        return 1;
    }
    return *(const s32 *)(object + 0x90) == 1;
}

/* Return true when no transition is active or when its state is three. */
s32 func_02095248(const void *presentation)
{
    const u8 *object = (const u8 *)presentation;

    if (*(void *const *)(object + 0x8c) == 0) {
        return 1;
    }
    return *(const s32 *)(object + 0x90) == 3;
}

/* Retail's unconditional presentation capability query. */
s32 func_0209526c(void)
{
    return 1;
}


