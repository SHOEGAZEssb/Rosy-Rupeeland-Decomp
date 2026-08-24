#include "tingle/types.h"

/* Scan primary and secondary runtime groups for nearby extended type-two actors. */
extern u8 *gGamePhaseRuntime; extern s16 data_020e70c0[];

/*
 * Return zero while self cooldown +0x254 is nonzero or descriptor signed radius
 * +0x10 is zero. Obtain scan roots from primary actor +0x2ea4 field +0x26c and,
 * when present, secondary actor +0x2ea8 field +0x234; return zero if both are
 * null. Perform two passes: first match self index +0x4e, then its signed
 * data_020e70c0 mapping (returning zero if -1). Within each root, scan the
 * recovered +0x44 collection of +0x84 entries; candidates are entry +0x1d0,
 * must differ from self, have type byte +0x4d equal two, match the pass index,
 * and lie strictly within squared X/Y radius after shifting coordinates by 12.
 * On a match invoke self virtual +0xd4 with the primary or secondary runtime
 * actor corresponding to the root and return one. Return zero otherwise;
 * only a successful virtual callback changes state. Collection ownership and
 * the asymmetric root offsets remain unconfirmed.
 */
s32 ActorExtendedType2_CheckRuntimeGroupProximity(void *self,const void *descriptorRecord)
{
 u8 *a=(u8 *)self,*runtime=gGamePhaseRuntime,*primary,*secondary;void *roots[2];s32 radius=*(const s16 *)((const u8 *)descriptorRecord+0x10),pass,which,i;
 if(*(u16 *)(a+0x254)!=0||radius==0)return 0;primary=*(u8 **)(runtime+0x2ea4);secondary=*(u8 **)(runtime+0x2ea8);roots[0]=*(void **)(primary+0x26c);roots[1]=secondary?*(void **)(secondary+0x234):0;if(!roots[0]&&!roots[1])return 0;
 for(pass=0;pass<2;++pass){s32 type=pass?data_020e70c0[*(u16 *)(a+0x4e)]:*(u16 *)(a+0x4e);if(type==-1)return 0;for(which=0;which<2;++which){u8 *root=(u8 *)roots[which];if(root){u8 *list=*(u8 **)(root+0x44);s32 count=*(s32 *)(list+0x84);for(i=0;i<count;++i){u8 *entry=*(u8 **)(list+i*4),*candidate=*(u8 **)(entry+0x1d0);s32 x,y;if(candidate==a||candidate[0x4d]!=2||*(u16 *)(candidate+0x4e)!=type)continue;x=(*(s32 *)(a+0x1c)-*(s32 *)(candidate+0x1c))>>12;y=(*(s32 *)(a+0x20)-*(s32 *)(candidate+0x20))>>12;if(x*x+y*y<radius*radius){void *target=which?secondary:primary;(*(void (**)(void *,void *))(*(u8 **)a+0xd4))(a,target);return 1;}}}}}
 return 0;
}
