#include "tingle/heap.h"
#include "tingle/types.h"

/* Specialize timed sprites with a per-frame offset and status-bit completion. */
typedef struct Track{u8 bytes[0x10];}Track;
typedef struct OffsetTimedSprite{void *vtable;u8 *sprite;Track first08;Track second18;s32 remaining28;s32 offset2c;}OffsetTimedSprite;
#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6084;
extern OffsetTimedSprite *func_0201e290(OffsetTimedSprite *,u8 *);
extern OffsetTimedSprite *func_0201e380(OffsetTimedSprite *);
extern void func_0201e3b8(OffsetTimedSprite *,s32);
extern void VecFx32Object_Assign(Track *,const void *);
extern void VecFx32Object_Add(Track *,Track *);
extern void GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(void *,s32,s32,s32,s32,s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *,s32);
#ifdef __cplusplus
}
#endif

/* Initialize the base, copy tracks/lifetime, remember offset, clear sprite flag 2, set sprite value, and return self. */
OffsetTimedSprite *func_0201e584(OffsetTimedSprite *self,u8 *config,s32 spriteValue,s32 offset)
{
    func_0201e290(self,config);self->vtable=data_020d6084;self->offset2c=offset;
    VecFx32Object_Assign(&self->first08,config+0x10);VecFx32Object_Assign(&self->second18,config+0x20);
    self->remaining28=*(s32 *)(config+0x30);*(u16 *)(self->sprite+0x24)&=~2;
    GraphicsSpriteState_SetAnimationIndex(self->sprite,spriteValue);return self;
}

/* Run shared non-freeing teardown and return self. */
OffsetTimedSprite *func_0201e5f0(OffsetTimedSprite *self){func_0201e380(self);return self;}

/* Run shared teardown, free self, and return its old address. */
OffsetTimedSprite *func_0201e604(OffsetTimedSprite *self){func_0201e380(self);Heap_Free(self);return self;}

/* Decrement lifetime; hide/finish on expiry or sprite flag 1. Otherwise update motion, add offset to sprite halfword 0x28, and return flag 1. */
s32 func_0201e620(OffsetTimedSprite *self,s32 argument)
{
    self->remaining28--;if(self->remaining28<0||(*(u16 *)(self->sprite+0x24)&1)){func_0201e3b8(self,0);return 1;}
    VecFx32Object_Add(&self->first08,&self->second18);*(u16 *)(self->sprite+0x24)&=~4;
    GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(self->sprite,argument,*(s32 *)&self->first08.bytes[4],*(s32 *)&self->first08.bytes[8],*(s32 *)&self->first08.bytes[0xc],8);
    *(u16 *)(self->sprite+0x28)=(u16)(self->offset2c+*(u16 *)(self->sprite+0x28));
    return (*(u16 *)(self->sprite+0x24)&1)!=0;
}
