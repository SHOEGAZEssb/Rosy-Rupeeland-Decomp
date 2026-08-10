#include "tingle/types.h"

/* Dispatch an immediate descriptor-radius callback between extended actors. */
extern u8 data_020df9e8[];
#ifdef __cplusplus
extern "C" { extern s32 ActorExtendedType2_IsDirectionToActorAccepted(void *self,u32 kind,void *other); }
#endif

/*
 * Require ActorExtendedType2_IsDirectionToActorAccepted(self, descriptor +0x1e low two bits, other), reject
 * other +0xd0 bit 0x100, and test squared X/Y separation (coordinates shifted
 * down 12) strictly below descriptor signed radius +0x0a squared. On success,
 * invoke self virtual +0xdc with other, copy global pair +0x10/+0x14 to
 * +0x220/+0x224, and return one. Return zero otherwise; virtual and actor
 * callback-pair state may change only on success.
 */
s32 ActorExtendedType2_DispatchProximityCallback(void *self,void *other,const void *descriptorRecord)
{
 u8 *a=(u8 *)self,*o=(u8 *)other;const u8 *d=(const u8 *)descriptorRecord;s32 x,y,r;
 if(!ActorExtendedType2_IsDirectionToActorAccepted(a,*(u16 *)(d+0x1e)&3,o)||(*(u32 *)(o+0xd0)&0x100)!=0)return 0;
 y=(*(s32 *)(a+0x20)-*(s32 *)(o+0x20))>>12;x=(*(s32 *)(a+0x1c)-*(s32 *)(o+0x1c))>>12;r=*(s16 *)(d+0xa);if(x*x+y*y>=r*r)return 0;
 (*(void (**)(void *,void *))(*(u8 **)a+0xdc))(a,o);*(u32 *)(a+0x220)=*(u32 *)(data_020df9e8+0x10);*(u32 *)(a+0x224)=*(u32 *)(data_020df9e8+0x14);return 1;
}
