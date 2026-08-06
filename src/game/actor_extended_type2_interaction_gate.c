#include "tingle/types.h"

/* Gate descriptor-driven interaction callbacks against cooldown and runtime actors. */
extern u8 *data_021052fc;
#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020401a0(void *actor, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * If cooldown halfword +0x254 is nonzero, clear +0x260 bit zero, decrement the
 * cooldown, and return zero. Otherwise require descriptor +0x1a bit zero and
 * positive signed +0x16, then reject when func_020401a0(actor,+0x16) is nonzero.
 * Unless descriptor bit 0x10 is set, invoke actor virtual +0x120 with primary
 * runtime actor +0x2ea4 and the descriptor, returning one on success. When bit
 * 0x20 is set, also try non-null secondary actor +0x2ea8 only if its +0x268 bit
 * 0x10 is set. Return zero if neither callback succeeds. Actor cooldown/flags
 * and virtual runtime state may change.
 */
s32 func_020400a4(void *self, const void *descriptorRecord)
{
    u8 *a=(u8 *)self; const u8 *d=(const u8 *)descriptorRecord; u16 *cool=(u16 *)(a+0x254);
    if(*cool!=0){*(u32 *)(a+0x260)&=~1;--*cool;return 0;}
    if((*(u16 *)(d+0x1a)&1)==0||*(s16 *)(d+0x16)<=0||func_020401a0(a,*(s16 *)(d+0x16)))return 0;
    if((*(u16 *)(d+0x1a)&0x10)==0){void *p=*(void **)(data_021052fc+0x2ea4);if((*(s32 (**)(void *,void *,const void *))(*(u8 **)a+0x120))(a,p,d))return 1;}
    if((*(u16 *)(d+0x1a)&0x20)!=0){u8 *p=*(u8 **)(data_021052fc+0x2ea8);if(p!=0&&(*(u32 *)(p+0x268)&0x10)!=0&&(*(s32 (**)(void *,void *,const void *))(*(u8 **)a+0x120))(a,p,d))return 1;}
    return 0;
}
