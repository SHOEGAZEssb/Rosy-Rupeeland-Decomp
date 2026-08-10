#include "tingle/types.h"

/* Install recovered callback pairs and reset related extended type-two state. */
extern u8 data_020df9e8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203fd00(void *actor);
#ifdef __cplusplus
}
#endif

/* Set +0x254 to 120, clear target +0x228 and +0x260 bit 0x20, copy global pairs +0x00/+0x04 and +0x170/+0x174 to +0x218..+0x224, and return no value. */
void ActorExtendedType2_ConfigureCallbacks00And170(void *self)
{
    u8 *a=(u8 *)self; *(u16 *)(a+0x254)=120; *(void **)(a+0x228)=0;
    *(u32 *)(a+0x260)&=~0x20; *(u32 *)(a+0x218)=*(u32 *)(data_020df9e8+0);
    *(u32 *)(a+0x21c)=*(u32 *)(data_020df9e8+4); *(u32 *)(a+0x220)=*(u32 *)(data_020df9e8+0x170); *(u32 *)(a+0x224)=*(u32 *)(data_020df9e8+0x174);
}

/* Set +0x254 to 240, set +0x260 bit four and clear bit 0x20, clear +0x228/+0x25e, copy global pairs +0x78/+0x7c and +0x70/+0x74, and return no value. */
void ActorExtendedType2_ConfigureCallbacks78And70(void *self)
{
    u8 *a=(u8 *)self; *(u16 *)(a+0x254)=240; *(u32 *)(a+0x260)=(*(u32 *)(a+0x260)|4)&~0x20; *(void **)(a+0x228)=0; *(u16 *)(a+0x25e)=0;
    *(u32 *)(a+0x218)=*(u32 *)(data_020df9e8+0x78); *(u32 *)(a+0x21c)=*(u32 *)(data_020df9e8+0x7c); *(u32 *)(a+0x220)=*(u32 *)(data_020df9e8+0x70); *(u32 *)(a+0x224)=*(u32 *)(data_020df9e8+0x74);
}

/* Zero +0x254/+0x228, clear +0x260 bit 0x20, copy global pairs +0x18/+0x1c and +0x240/+0x244, and return no value. */
void ActorExtendedType2_ConfigureCallbacks18And240(void *self)
{
    u8 *a=(u8 *)self; *(u16 *)(a+0x254)=0; *(void **)(a+0x228)=0; *(u32 *)(a+0x260)&=~0x20;
    *(u32 *)(a+0x218)=*(u32 *)(data_020df9e8+0x18); *(u32 *)(a+0x21c)=*(u32 *)(data_020df9e8+0x1c); *(u32 *)(a+0x220)=*(u32 *)(data_020df9e8+0x240); *(u32 *)(a+0x224)=*(u32 *)(data_020df9e8+0x244);
}

/* Clear attachment +0x24 bit four, copy global pair +0x08/+0x0c to +0x218/+0x21c, and if actor +0x10 bit eight is set also set bit 0x01000000. */
void ActorExtendedType2_ConfigureCallback08(void *self)
{
    u8 *a=(u8 *)self; *(u16 *)(*(u8 **)(a+0x54)+0x24)&=~4; *(u32 *)(a+0x218)=*(u32 *)(data_020df9e8+8); *(u32 *)(a+0x21c)=*(u32 *)(data_020df9e8+0xc);
    if ((*(u32 *)(a+0x10)&8)!=0) *(u32 *)(a+0x10)|=0x01000000;
}

/* Invoke actor virtual +0xfc followed by func_0203fd00; return no value and propagate both routines' actor effects. */
void ActorExtendedType2_RunVirtualFCAndResetProgress(void *self)
{
    u8 *a=(u8 *)self; (*(void (**)(void *))(*(u8 **)a+0xfc))(a); func_0203fd00(a);
}
