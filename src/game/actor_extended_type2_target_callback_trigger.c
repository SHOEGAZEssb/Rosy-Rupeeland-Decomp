#include "tingle/types.h"

/* Trigger a stored-target callback for an enabled extended type-two actor. */
extern u8 data_020df9e8[];

/*
 * Return zero without changes unless actor +0x260 bit 0x100 is set. When set,
 * invoke actor virtual +0xe4 with stored target +0x228, copy global callback
 * pair +0x2b0/+0x2b4 to +0x220/+0x224, set mode byte +0x24c to seven, and
 * return one. Actor and virtual target state may change.
 */
s32 func_02040234(void *self)
{
    u8 *a=(u8 *)self;if((*(u32 *)(a+0x260)&0x100)==0)return 0;
    (*(void (**)(void *,void *))(*(u8 **)a+0xe4))(a,*(void **)(a+0x228));
    *(u32 *)(a+0x220)=*(u32 *)(data_020df9e8+0x2b0);*(u32 *)(a+0x224)=*(u32 *)(data_020df9e8+0x2b4);a[0x24c]=7;return 1;
}
