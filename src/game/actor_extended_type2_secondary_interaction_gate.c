#include "tingle/types.h"

/* Gate the second descriptor-driven interaction callback against runtime actors. */
extern u8 *data_021052fc;
#ifdef __cplusplus
extern "C" {
extern s32 ActorExtendedType2_MatchesInteractionCallbackPairs(
    const void *actor, s32 unused);
}
#endif

/*
 * Require descriptor +0x1a bit two and reject when
 * ActorExtendedType2_MatchesInteractionCallbackPairs is nonzero.
 * Unless descriptor bit 0x10 is set, invoke actor virtual +0x128 with primary
 * runtime actor +0x2ea4 and descriptor, returning one on success. With bit
 * 0x20 set, also try non-null secondary actor +0x2ea8 when its +0x268 bit 0x10
 * is set. Return zero otherwise; only virtual runtime state may change.
 */
s32 ActorExtendedType2_TryDescriptorInteraction128(void *self,const void *descriptorRecord)
{
 u8 *a=(u8 *)self;const u8 *d=(const u8 *)descriptorRecord;u16 f=*(u16 *)(d+0x1a);
 if((f&4)==0||ActorExtendedType2_MatchesInteractionCallbackPairs(a,f))return 0;
 if((f&0x10)==0){void *p=*(void **)(data_021052fc+0x2ea4);if((*(s32 (**)(void *,void *,const void *))(*(u8 **)a+0x128))(a,p,d))return 1;}
 if((f&0x20)!=0){u8 *p=*(u8 **)(data_021052fc+0x2ea8);if(p!=0&&(*(u32 *)(p+0x268)&0x10)!=0&&(*(s32 (**)(void *,void *,const void *))(*(u8 **)a+0x128))(a,p,d))return 1;}
 return 0;
}
