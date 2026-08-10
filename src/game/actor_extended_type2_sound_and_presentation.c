#include "tingle/heap.h"
#include "tingle/types.h"

/* Play descriptor-indexed sound and spawn the optional fourth actor presentation. */
extern u16 data_020e7444[];extern const char gActorExtendedType2SpritePresentationAllocationTag[];extern u8 *data_021052fc;
#ifdef __cplusplus
extern "C" {extern void func_020349b8(void *actor,u32 sound,s32 extra);extern void *TimedSpriteOffsetPresentation_Init(void *allocation,...);extern void func_0201ded4(void *manager,void *presentation);}
#endif

/* Play the nonzero data_020e7444 sound selected by actor +0x4e only when actor +0x10 bit four is set; return no value and affect sound hardware only on that path. */
void ActorExtendedType2_PlayDescriptorSoundIfEnabled(void *self)
{u8 *a=(u8 *)self;u16 sound=data_020e7444[*(u16 *)(a+0x4e)];if(sound!=0&&(*(u32 *)(a+0x10)&4)!=0)func_020349b8(a,sound,0);}

/*
 * Return when optional resource +0x214 is null. Otherwise allocate a 0x14-byte
 * presentation, construct it through TimedSpriteOffsetPresentation_Init using actor position +0x18,
 * byte-truncated index, attachment +0x54 resource +0x00, optional-resource
 * words +0x04/+0x08/+0x0c, extra and -1. Store value into halfword +0x36 of
 * the nested object reached through result +0x08 then +0x04, and register the
 * presentation with manager +0x2f7c. Returns no value; heap and presentation
 * state change. Retail dereferences the result even if allocation failed.
 */
void ActorExtendedType2_SpawnOptionalPresentation(void *self,u32 index,u16 value,s32 extra)
{
 u8 *a=(u8 *)self,*r=*(u8 **)(a+0x214);void *p=0;if(!r)return;void *mem=Heap_Alloc(0x14,gActorExtendedType2SpritePresentationAllocationTag,4,&gHeapContext);if(mem)p=TimedSpriteOffsetPresentation_Init(mem,a+0x18,index&0xff,**(void ***)(a+0x54),*(u32 *)(r+4),*(u32 *)(r+8),*(u32 *)(r+0xc),extra,-1);*(u16 *)(*(u8 **)(*(u8 **)((u8 *)p+8)+4)+0x36)=value;func_0201ded4(data_021052fc+0x2f7c,p);
}
