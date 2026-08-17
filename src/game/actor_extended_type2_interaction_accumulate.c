#include "tingle/types.h"

/* Accumulate proximity contact and dispatch an extended type-two interaction. */
extern u8 data_020df9e8[];
#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorExtendedType2_IsDirectionToActorAccepted(void *self, u32 kind, void *other);
extern s32 SignedAbsoluteValue(s32 value);
extern s32 ActorExtendedRecordArray_ContainsPoint(void *records, s32 x, s32 y);
#ifdef __cplusplus
}
#endif

/*
 * Return zero if other +0xd0 bit 0x100 is set or ActorExtendedType2_IsDirectionToActorAccepted rejects the
 * interaction using descriptor +0x1e low two bits. Unless descriptor +0x1a bit
 * 0x100 is set, also reject absolute Z separation at least 0x28000. Test X/Y
 * containment through optional record array +0x278 and
 * ActorExtendedRecordArray_ContainsPoint, or by squared distance against
 * descriptor signed radius +0x0a; actor +0x260 bit
 * 0x40000 folds Z separation into Y. Outside clears +0x25e and returns zero.
 * Inside adds descriptor signed +0x16 to +0x25e; below 6000 sets mode byte
 * +0x24c to six and returns zero. At 6000, invoke virtual +0xd4(self,other),
 * install global pair +0x20/+0x24 at +0x220/+0x224, and return one. Actor and
 * virtual interaction state may change.
 */
s32 ActorExtendedType2_AccumulateProximityInteraction(void *self, void *otherObject, const void *descriptorRecord)
{
    u8 *a=(u8 *)self,*o=(u8 *)otherObject; const u8 *d=(const u8 *)descriptorRecord; s32 inside=0;
    if((*(u32 *)(o+0xd0)&0x100)!=0)return 0;
    if(!ActorExtendedType2_IsDirectionToActorAccepted(a,*(u16 *)(d+0x1e)&3,o))return 0;
    if((*(u16 *)(d+0x1a)&0x100)==0&&SignedAbsoluteValue(*(s32 *)(a+0x24)-*(s32 *)(o+0x24))>=0x28000)return 0;
    if(*(void **)(a+0x278)!=0) inside=ActorExtendedRecordArray_ContainsPoint(*(void **)(a+0x278),*(s32 *)(o+0x1c),*(s32 *)(o+0x20))!=0;
    else {s32 x=(*(s32 *)(a+0x1c)-*(s32 *)(o+0x1c))>>12; s32 y=(*(s32 *)(a+0x20)-*(s32 *)(o+0x20))>>12; s32 r=*(s16 *)(d+0xa); if((*(u32 *)(a+0x260)&0x40000)!=0)y-=(*(s32 *)(a+0x24)-*(s32 *)(o+0x24))>>12; inside=x*x+y*y<r*r;}
    if(!inside){*(u16 *)(a+0x25e)=0;return 0;}
    *(u16 *)(a+0x25e)+=*(s16 *)(d+0x16); if(*(u16 *)(a+0x25e)<6000){a[0x24c]=6;return 0;}
    (*(void (**)(void *,void *))(*(u8 **)a+0xd4))(a,o); *(u32 *)(a+0x220)=*(u32 *)(data_020df9e8+0x20); *(u32 *)(a+0x224)=*(u32 *)(data_020df9e8+0x24); return 1;
}
