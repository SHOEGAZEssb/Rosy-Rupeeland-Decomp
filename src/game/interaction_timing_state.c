#include "tingle/types.h"

/* Recovered reset and tick operations for a six-byte shared interaction timing state. */
extern u8 data_0210576c[];

/*
 * Clear state bytes +0, +1, +2, and +3 plus halfword +4. Returns no value;
 * only the shared timing state changes and no SDK or hardware access occurs.
 */
void func_02045004(void)
{
    data_0210576c[0] = 0;
    data_0210576c[1] = 0;
    data_0210576c[2] = 0;
    data_0210576c[3] = 0;
    *(u16 *)(data_0210576c + 4) = 0;
}

/*
 * Decrement shared halfword timer +4 and byte timer +2 when each is nonzero.
 * Returns no value; the two timers may change without direct hardware effects.
 */
void func_02045028(void)
{
    if (*(u16 *)(data_0210576c + 4) != 0)
        --*(u16 *)(data_0210576c + 4);
    if (data_0210576c[2] != 0)
        --data_0210576c[2];
}
