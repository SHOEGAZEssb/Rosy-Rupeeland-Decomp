#include "tingle/types.h"

/* Resident count followed by fixed-size actor-type records. */
extern s32 data_020c4778;
extern u8 data_020c477c[];
extern void func_020b5294(void);

/*
 * Return the first 0x40-byte resident actor-type record whose leading word
 * equals index. Retail asserts when no entry matches and then returns the
 * one-past-end cursor; valid database indices therefore return borrowed
 * immutable resident storage without allocating or changing game state.
 */
u8 *func_0206899c(s32 index)
{
    s32 recordIndex;
    u8 *record = data_020c477c;

    for (recordIndex = 0; recordIndex < data_020c4778; ++recordIndex) {
        if (*(s32 *)record == index)
            return record;
        record += 0x40;
    }
    func_020b5294();
    return record;
}
