#include "tingle/types.h"

/* Update saved progress and restore ordinary state for extended type-two actors. */
extern u8 *gGameWork;
extern u8 data_020df9e8[];
#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_RestoreSavedFlags(void *actor);
extern void func_02072b68(void *attachment, u32 animation);
#ifdef __cplusplus
}
#endif

/*
 * Read signed actor halfword +0x27c; return if it is -1. Scan five signed-ID/
 * counter pairs in gGameWork beginning at halfword index 0x90 plus byte offset
 * 0x4c. On an ID match, increment the following signed halfword and return.
 * Otherwise return unchanged. Saved game progress may change.
 */
void ActorExtendedType2_IncrementSavedProgressCounter(const void *self)
{
    s16 value=*(const s16 *)((const u8 *)self+0x27c); s32 i;
    if(value==-1)return;
    for(i=0x90;i<=0x9a;i+=2) if(value==*(s16 *)(gGameWork+i*2+0x4c)){++*(s16 *)(gGameWork+(i+1)*2+0x4c);return;}
}

/* Copy global callback pair +0x88/+0x8c to actor +0x218/+0x21c; return no value. */
void ActorExtendedType2_SetCallbackPair88(void *self)
{ u8 *a=(u8 *)self; *(u32 *)(a+0x218)=*(u32 *)(data_020df9e8+0x88); *(u32 *)(a+0x21c)=*(u32 *)(data_020df9e8+0x8c); }

/*
 * Invoke Actor_RestoreSavedFlags, clear +0xd0 bit 0x100, enter state one, clear attachment
 * +0x24 bit 0x10, and select animation (word +0xc8 plus eight) truncated to a
 * byte. Clear actor +0x14 bit 0x10000000, install global pair +0x28/+0x2c,
 * clear +0x10 bits 0x1f0000 and +0x14 bits two/four. Returns no value; actor
 * and attachment state change.
 */
void ActorExtendedType2_RestoreState1AndCallbackPair28(void *self)
{
    u8 *a=(u8 *)self,*p; Actor_RestoreSavedFlags(a); *(u32 *)(a+0xd0)&=~0x100; *(s16 *)(a+0xd6)=1;
    p=*(u8 **)(a+0x54); *(u16 *)(p+0x24)&=~0x10; func_02072b68(p,(u8)(*(u32 *)(a+0xc8)+8));
    *(u32 *)(a+0x14)&=~0x10000000; *(u32 *)(a+0x218)=*(u32 *)(data_020df9e8+0x28); *(u32 *)(a+0x21c)=*(u32 *)(data_020df9e8+0x2c);
    *(u32 *)(a+0x10)&=~0x1f0000; *(u32 *)(a+0x14)&=~6;
}
