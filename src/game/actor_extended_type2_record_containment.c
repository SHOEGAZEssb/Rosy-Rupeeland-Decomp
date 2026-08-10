#include "tingle/types.h"

/* Test a point against the extended type-two actor's copied rectangle records. */

/*
 * Convert fixed-point X/Y inputs to signed integer coordinates by shifting
 * down 12. Iterate object +0x08 eight-byte records at array +0x04; return one
 * when X lies in [halfword +0x00,+0x04) and Y lies in
 * [halfword +0x02,+0x06). Return zero when no record contains the point.
 * Inputs and records are read only; no engine or hardware state changes.
 */
s32 ActorExtendedRecordArray_ContainsPoint(const void *self, s32 x, s32 y)
{
    const u8 *object=(const u8 *)self; const u8 *records=*(const u8 *const *)(object+4); s32 i;
    x>>=12; y>>=12;
    for(i=0;i<*(const s32 *)(object+8);++i){const s16 *r=(const s16 *)(records+i*8); if(y<r[3]&&y>=r[1]&&x>=r[0]&&x<r[2])return 1;}
    return 0;
}
