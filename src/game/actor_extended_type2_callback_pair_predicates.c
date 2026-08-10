#include "tingle/types.h"

/* Test recovered callback-pair states used by extended type-two interaction gates. */
extern u8 data_020df9e8[]; extern u8 data_020dfae8[]; extern u8 data_020dfab8[];

/* Return whether a two-word actor pair matches an address-derived global pair. */
static s32 matches(u32 a,u32 b,const u8 *x,const u8 *y){return a==*(const u32 *)x&&(b==*(const u32 *)(y+4)||a==0);}

/*
 * Ignore the second input and return one when actor pair +0x218/+0x21c matches
 * data_020df9e8+0x100/data_020dfae8, or pair +0x220/+0x224 matches
 * data_020df9e8+0xd0/data_020dfab8. Return zero otherwise; change no state.
 */
s32 ActorExtendedType2_MatchesInteractionCallbackPairs(const void *self,s32 unused)
{const u8 *a=(const u8 *)self;(void)unused;return matches(*(const u32 *)(a+0x218),*(const u32 *)(a+0x21c),data_020df9e8+0x100,data_020dfae8)||matches(*(const u32 *)(a+0x220),*(const u32 *)(a+0x224),data_020df9e8+0xd0,data_020dfab8);}

/* Ignore all inputs, return zero, and change no state. */
s32 ActorExtendedType2_ReturnZeroInteraction(void){return 0;}
