#include "tingle/game_work.h"

/*
 * Bit-level accessors for the flag storage embedded at offset 0x024C in the
 * global game-work object. Each numeric flag selects one bit in the byte array;
 * callers supply the GameWork instance explicitly.
 */

/* Set a flag without changing any of the other seven bits in its byte. */
void GameWork_SetFlag(GameWork *work, int flag)
{
    work->bytes024C[flag / 8] |= 1 << (flag % 8);
}

/* Return nonzero when the selected flag is set and zero when it is clear. */
int GameWork_TestFlag(GameWork *work, int flag)
{
    return (work->bytes024C[flag / 8] & (1 << (flag % 8))) != 0;
}

/* Clear a flag without changing any of the other seven bits in its byte. */
void GameWork_ClearFlag(GameWork *work, int flag)
{
    work->bytes024C[flag / 8] &= ~(1 << (flag % 8));
}
