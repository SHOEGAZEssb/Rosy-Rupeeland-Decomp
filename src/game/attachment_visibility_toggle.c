#include "tingle/types.h"

/* Toggle attachment flag 4 through a small owner wrapper. */

/*
 * Read the attachment pointer at self+4. A nonzero enabled argument clears
 * attachment halfword flag 4 at +0x24; zero sets it. Returns no value and
 * invokes no hardware or SDK helper. The attachment pointer is a precondition.
 */
void func_02035518(void *self, s32 enabled)
{
    u8 *attachment = *(u8 **)((u8 *)self + 4);

    if (enabled != 0)
        *(u16 *)(attachment + 0x24) &= (u16)~4;
    else
        *(u16 *)(attachment + 0x24) |= 4;
}
