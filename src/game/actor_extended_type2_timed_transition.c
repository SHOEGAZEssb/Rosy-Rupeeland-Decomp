#include "tingle/types.h"

/* Advance the extended type-two actor's timed attachment transition. */
extern u8 data_020e6b74[];extern u16 data_020e71ec[];extern u8 data_020df9e8[];extern u8 *data_021052fc;extern void *gGameWork;
#ifdef __cplusplus
extern "C" {extern s32 GameWork_TestFlag(void *work,s32 flag);extern s16 *func_020450dc(void *handle,void *actor);extern void Actor_AdjustPositionForTerrainHeight(void *actor);extern void func_020452f8(void *object,s32 x,s32 y);extern s32 *func_0204539c(void *object);extern s32 *func_020453b0(void *object);extern u16 func_020453c8(void *object);extern void func_020349b8(void *actor,u32 sound,s32 extra);}
#endif

/*
 * Enter state 17. Before +0x260 bit 0x800 is set, drive attachment +0x34
 * toward its transition, update attachment/actor visibility flags, honor
 * descriptor-indexed immediate behavior and saved-game gating, and count
 * +0x24e through descriptor halfword +0x14. On expiry, resample optional handle
 * +0x274 and coordinate object +0x26c, invoke virtual +0xcc, restore +0x24e,
 * and set bit 0x800. Once set, gate completion through actor +0x10 bit four,
 * +0x272 bits 0x100/0x200/0x400, and primary actor activity. On completion,
 * invoke virtual +0xc4, restore +0x1fc from +0x200 if null, enter state 19,
 * install global pair +0x2d0/+0x2d4, clear transition visibility/attachment
 * flags and bit 0x800, optionally decrement positive +0x250, play the nonzero
 * descriptor-indexed sound, and return one. All incomplete paths return zero.
 * Actor, attachment, path, game-work, virtual, and sound state may change.
 */
s32 func_0204067c(void *self,const void *descriptorRecord)
{
 u8 *a=(u8 *)self,*d=(u8 *)descriptorRecord,*att=*(u8 **)(a+0x54);u16 index=*(u16 *)(a+0x4e);*(s16 *)(a+0xd6)=17;
 if((*(u32 *)(a+0x260)&0x800)==0){
  if((*(u16 *)(att+0x24)&0x10)==0){*(u32 *)(a+0x260)&=~3;if(data_020e6b74[index]){if((*(u16 *)(att+0x24)&1)==0)return 0;*(u16 *)(att+0x24)|=0x14;*(u32 *)(a+0x14)|=0x10000000;*(u16 *)(att+0x32)=*(u16 *)(att+0x34)=0x100;*(u16 *)(a+0x24e)=0;(*(void (**)(void *))(*(u8 **)a+0x118))(a);}else{*(s16 *)(att+0x34)-=0x10;if(*(s16 *)(att+0x34)>0x10)return 0;*(u16 *)(att+0x34)=0x100;*(u16 *)(att+0x24)|=0x14;*(u32 *)(a+0x14)|=0x10000000;*(u16 *)(a+0x24e)=0;(*(void (**)(void *))(*(u8 **)a+0x118))(a);}}
  if(((*(u32 *)(a+0x260)&0x4000)==0&&*(s16 *)(a+0x250)==0)||((*(u16 *)(a+0x272)&0x800)!=0&&!GameWork_TestFlag(gGameWork,*(s32 *)(a+0x1cc)))){*(u16 *)(att+0x24)|=((*(u16 *)(a+0x272)&0x800)!=0)?7:0x17;*(u32 *)(a+0x14)|=0x10000000;*(u16 *)(a+0x24e)=*(u16 *)(d+0x14);return 0;}
  if(++*(u16 *)(a+0x24e)<=*(u16 *)(d+0x14))return 0;
  if(*(void **)(a+0x274)){s16 *p=func_020450dc(*(void **)(a+0x274),a);*(s32 *)(a+0x230)=(s32)p[0]<<12;*(s32 *)(a+0x234)=(s32)p[1]<<12;Actor_AdjustPositionForTerrainHeight(a);if(*(void **)(a+0x26c)){void *o=*(void **)(a+0x26c);func_020452f8(o,*(s32 *)(a+0x230)>>12,*(s32 *)(a+0x234)>>12);*(s32 *)(a+0x230)=*func_0204539c(o)<<12;*(s32 *)(a+0x234)=*func_020453b0(o)<<12;*(u16 *)(a+0x26a)=func_020453c8(o);}}
  (*(void (**)(void *))(*(u8 **)a+0xcc))(a);*(u16 *)(a+0x24e)=*(u16 *)(d+0x14);*(u32 *)(a+0x260)|=0x800;return 0;
 }else{
  u16 f=*(u16 *)(a+0x272);u8 *primary=*(u8 **)(data_021052fc+0x2ea4);s32 ok=0;if((*(u32 *)(a+0x10)&4)!=0){if((f&0x100)!=0)ok=(f&0x400)==0||(*(s32 (**)(void *))(*(u8 **)primary+0xa8))(primary)!=0;}else if((f&0x200)!=0)ok=(f&0x400)==0||(*(s32 (**)(void *))(*(u8 **)primary+0xa8))(primary)!=0;if(!ok)return 0;
  (*(void (**)(void *))(*(u8 **)a+0xc4))(a);if(!*(void **)(a+0x1fc))*(void **)(a+0x1fc)=*(void **)(a+0x200);*(s16 *)(a+0xd6)=19;*(u32 *)(a+0x218)=*(u32 *)(data_020df9e8+0x2d0);*(u32 *)(a+0x21c)=*(u32 *)(data_020df9e8+0x2d4);*(u32 *)(a+0x14)&=~0x10000000;*(u16 *)(att+0x24)&=~0x10;*(u32 *)(a+0x260)&=~0x800;if((*(u32 *)(a+0x260)&0x4000)==0&&*(s16 *)(a+0x250)>0)--*(s16 *)(a+0x250);u16 sound=data_020e71ec[index];if(sound)func_020349b8(a,sound,0);return 1;
 }
}
