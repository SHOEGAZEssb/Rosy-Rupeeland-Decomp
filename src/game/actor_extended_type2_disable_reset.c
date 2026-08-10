#include "tingle/types.h"

/* Disable recovered extended type-two modes and install its inactive callback pair. */
extern u8 data_020df9e8[];
#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SaveAndForceFlags(void *actor);
extern void func_02045184(void *handle, void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Clear actor +0xd0 bit 0x200, +0x260 bit 0x800, and halfword +0x24e. If
 * attachment +0x54 exists, set its +0x24 bit 0x10. Invoke Actor_SaveAndForceFlags and
 * synchronize optional handle +0x274 through func_02045184. Copy global pair
 * +0x80/+0x84 to +0x218/+0x21c, clear +0x260 bits zero/one, set +0xd0 bit
 * 0x100, and store 0xff at halfword +0xac. Returns no value; actor, attachment,
 * and optional handle state change.
 */
void func_0203fc68(void *self)
{
    u8 *actor=(u8 *)self;
    *(u32 *)(actor+0xd0)&=~0x200; *(u32 *)(actor+0x260)&=~0x800; *(u16 *)(actor+0x24e)=0;
    if (*(void **)(actor+0x54)!=0) *(u16 *)(*(u8 **)(actor+0x54)+0x24)|=0x10;
    Actor_SaveAndForceFlags(actor); if (*(void **)(actor+0x274)!=0) func_02045184(*(void **)(actor+0x274),actor);
    *(u32 *)(actor+0x218)=*(u32 *)(data_020df9e8+0x80); *(u32 *)(actor+0x21c)=*(u32 *)(data_020df9e8+0x84);
    *(u32 *)(actor+0x260)&=~3; *(u32 *)(actor+0xd0)|=0x100; *(u16 *)(actor+0xac)=0xff;
}
