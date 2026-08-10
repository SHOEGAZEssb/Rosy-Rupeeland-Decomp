#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Animate a sprite along a scaled arcing path, optionally switch its resource
 * descriptor at the apex, and finish after the replacement animation.  A shared
 * byte throttles the transition sound across instances.
 */
typedef struct VecValue { u32 field00;s32 x04,y08,z0c; } VecValue;
typedef struct ArcingSpriteEffectPresentation {
    void **vtable;u32 field04;u8 *firstDescriptor08,*secondDescriptor0c;
    u8 *sprite10;s16 frame14,duration16,state18,amplitude1a;
    u8 *path1c;u8 switchResource20;
} ArcingSpriteEffectPresentation;
#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6740;extern const char data_020d6760[];
extern const s16 data_020c9670[];extern u8 data_02105610;extern void *gSoundContext;
extern void *func_0201e250(void *);extern void *func_0201e28c(void *);
extern void *AnimationResource_Init(void *,s32,s32,s32);extern u8 *GraphicsSpriteState_Create(void *,void *,s32,s32,s32,s32,s32);
extern void GraphicsSpriteState_SetDepthOrderedWorldPosition(void *,s32,s32,s32,s32);extern void func_02004fe0(void *);
extern void func_02005058(void *);extern void VecFx32Triple_Destroy(void *);extern void VecFx32Bezier_Evaluate3D(void *,void *,s32);
extern void VecFx32Triple_InitWithValues(void *,const void *,const void *,const void *);extern void func_02008378(void *,const void *,const void *);
extern void func_020233c8(void *,const void *,s32);extern s32 func_020befec(s32,s32);
extern void func_02074038(void *,void *);extern void func_020740c8(void *,s32,s32,s32,s32);
extern void func_02072b68(void *,s32);extern void Sound_Play(void *,s32,s32);
#ifdef __cplusplus
}
#endif

/*
 * Initialize base/state, allocate descriptors for IDs 0x1714..0x1716 and
 * 0x1625..0x1627, create the initial sprite through GraphicsSpriteState_Create, scale the two
 * input vectors by 0x4cd/0xb33, combine them, and allocate/construct a 0x30-byte
 * path from both inputs and the combined value. Retain duration and switch flag,
 * set amplitude 0x30, destroy temporaries, and return self.
 */
ArcingSpriteEffectPresentation *func_02023434(
    ArcingSpriteEffectPresentation *self,void *spriteOwner,const VecValue *first,
    const VecValue *second,s32 duration,s32 switchResource)
{
    VecValue a,b,combined;
    func_0201e250(self);self->vtable=(void **)data_020d6740;
    self->frame14=0;self->duration16=(s16)duration;self->state18=0;
    self->amplitude1a=0x30;self->switchResource20=(u8)switchResource;
    self->firstDescriptor08=(u8 *)Heap_Alloc(0x10,data_020d6760,4,&gHeapContext);
    if(self->firstDescriptor08)AnimationResource_Init(self->firstDescriptor08,0x1714,0x1715,0x1716);
    self->secondDescriptor0c=(u8 *)Heap_Alloc(0x10,data_020d6760,4,&gHeapContext);
    if(self->secondDescriptor0c)AnimationResource_Init(self->secondDescriptor0c,0x1625,0x1626,0x1627);
    self->sprite10=GraphicsSpriteState_Create(spriteOwner,self->firstDescriptor08,0,0,0,10,0);
    func_020233c8(&a,first,0x4cd);func_020233c8(&b,second,0xb33);
    func_02008378(&combined,&a,&b);func_02005058(&b);func_02005058(&a);
    self->path1c=(u8 *)Heap_Alloc(0x30,data_020d6760,4,&gHeapContext);
    if(self->path1c)VecFx32Triple_InitWithValues(self->path1c,first,second,&combined);
    func_02005058(&combined);return self;
}

static ArcingSpriteEffectPresentation *teardown_arc(ArcingSpriteEffectPresentation *self)
{
    self->vtable=(void **)data_020d6740;func_02074038(*(void **)self->sprite10,self->sprite10);
    if(self->path1c){VecFx32Triple_Destroy(self->path1c);Heap_Free(self->path1c);}
    if(self->firstDescriptor08)((void (*)(void *))(*(void ***)self->firstDescriptor08)[1])(self->firstDescriptor08);
    if(self->secondDescriptor0c)((void (*)(void *))(*(void ***)self->secondDescriptor0c)[1])(self->secondDescriptor0c);
    func_0201e28c(self);return self;
}

/* Release sprite, path and both descriptors, tear down base, and return self. */
ArcingSpriteEffectPresentation *func_020235a0(ArcingSpriteEffectPresentation *self)
{return teardown_arc(self);}

/* Perform func_020235a0 teardown, free self, and return its old address. */
ArcingSpriteEffectPresentation *func_0202361c(ArcingSpriteEffectPresentation *self)
{teardown_arc(self);Heap_Free(self);return self;}

/*
 * State zero samples path at frame/duration, adds a sine-table arc scaled by
 * amplitude, updates sprite position, and advances frame. At the end it either
 * switches to state one or finishes directly. State one replaces the sprite
 * resource with secondDescriptor, selects frame zero, clears low sprite flags,
 * enters state two and plays sound 15 if the shared cooldown is zero. State two
 * applies the path endpoint until sprite completion, then sets flag bit 3 and
 * finishes. Decrement the shared cooldown and return whether state is three.
 */
s32 func_020236a0(ArcingSpriteEffectPresentation *self)
{
    VecValue value;s32 progress,index;
    switch(self->state18){
    case 0:
        progress=func_020befec(self->frame14<<12,self->duration16);
        VecFx32Bezier_Evaluate3D(&value,self->path1c,progress);
        index=(func_020befec(self->frame14<<15,self->duration16)&0xffff)>>4;
        value.z0c+=self->amplitude1a*data_020c9670[index];
        GraphicsSpriteState_SetDepthOrderedWorldPosition(self->sprite10,value.x04,value.y08,value.z0c,8);
        if(++self->frame14>self->duration16){self->frame14=self->duration16;if(self->switchResource20)self->state18=1;else{*(u16 *)(self->sprite10+0x24)|=8;self->state18=3;}}
        func_02005058(&value);break;
    case 1:
        func_020740c8(*(void **)self->sprite10,*(s32 *)(self->secondDescriptor0c+4),*(s32 *)(self->secondDescriptor0c+8),*(s32 *)(self->secondDescriptor0c+12),*(s32 *)(self->secondDescriptor0c+12));
        func_02072b68(self->sprite10,0);*(u16 *)(self->sprite10+0x24)&=(u16)~3;self->state18=2;
        if(data_02105610==0){Sound_Play(gSoundContext,0,15);data_02105610=10;}
        /* Retail falls through to state two. */
    case 2:
        GraphicsSpriteState_SetDepthOrderedWorldPosition(self->sprite10,*(s32 *)(self->path1c+0x14),*(s32 *)(self->path1c+0x18),*(s32 *)(self->path1c+0x1c),8);
        if((*(u16 *)(self->sprite10+0x24)&1)!=0){self->state18=3;*(u16 *)(self->sprite10+0x24)|=8;}
        break;
    }
    if(data_02105610)data_02105610--;return self->state18==3;
}
