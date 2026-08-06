#include "tingle/types.h"

/* Recovered extended type-two actor vertical-motion and callback reset. */
extern u8 data_020df9e8[];

/*
 * Clear actor velocities +0x3c/+0x40 and set +0x44 to 0x3000. When +0x260 bit
 * one is set, install global callback pair +0x1c8/+0x1cc at +0x218/+0x21c and
 * set halfword +0x25a to 120. Finally set +0x260 bit 0x80. The routine has no
 * meaningful return value, changes only actor/callback state, and performs no
 * SDK or hardware operation.
 */
void func_02042810(void *self)
{
    u8 *actor = (u8 *)self;
    *(s32 *)(actor + 0x40) = 0;
    *(s32 *)(actor + 0x3c) = 0;
    *(s32 *)(actor + 0x44) = 0x3000;
    if ((*(u32 *)(actor + 0x260) & 2) != 0) {
        *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x1c8);
        *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x1cc);
        *(u16 *)(actor + 0x25a) = 120;
    }
    *(u32 *)(actor + 0x260) |= 0x80;
}
