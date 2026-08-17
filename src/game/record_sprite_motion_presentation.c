#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Animate one record-selected sprite along a sampled track for 60 frames.  The
 * constructor resolves a mode-2/3 resource record through SDK helpers, owns the
 * resulting sprite/resource state, and chains two signed auxiliary offsets.
 */
typedef struct TrackValue { u8 bytes[0x10]; } TrackValue;
typedef struct RecordSpriteMotionPresentation {
    void **vtable;u32 field04;s32 sampleArgument08;TrackValue track0c;
    TrackValue firstOffset1c,secondOffset2c;u8 *sprite3c;s32 timer40;
    void *spriteOwner44;u8 resource48[0x0c];
} RecordSpriteMotionPresentation;
typedef struct SelfLinkedConfig { u8 bytes[0x24]; } SelfLinkedConfig;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6630[];extern void *data_020f4e18;extern void *data_021e9ac0;
extern void *TimedSpritePresentation_InitBase(void *);extern void *func_0201e28c(void *);
extern void VecFx32Object_InitCopy(void *,const void *);extern void VecFx32Object_Init(void *);
extern void VecFx32Object_InitComponents(void *,s32,s32,s32);extern void VecFx32Object_Assign(void *,const void *);
extern void VecFx32Object_Destroy(void *);extern void VecFx32Object_Add(void *,const void *);
extern void VecFx32_Subtract(void *,const void *,s32);extern void func_02056f00(void *,const void *);
extern void *Actor_GetCollection(void *);extern void *ActorCollection_GetSpriteOwner(void *);
extern void AnimationResourceState_InitEmbedded(void *);extern void AnimationResourceState_Destroy(void *);
extern u8 *GraphicsSpriteGroup_CreateStateFromSource(void *,void *,s32);extern void GraphicsSpriteState_SetAnimationIndex(void *,s32);
extern void GraphicsSpriteGroup_ReleaseState(void *,void *);extern void SelfLinkedSpriteConfig_Init(void *);
extern s32 ActorDatabase_QueryDefinitionKind(void *,u16);extern void ActorDescriptor_Init(void *,u16,s32,s32);
extern void ActorDescriptor_InitRange(void *,u16,u16);extern void *ActorDescriptor_GetComponent(void *,s32);
extern void ActorDescriptorComponent_LoadResources(void *,void *,void *);extern s32 ActorDescriptorComponent_GetAnimation(void *);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/*
 * Initialize base/track state and derive spriteOwner from config. Modes 2/3 are
 * accepted; other modes halt through OS_Halt. Resolve recordId (arg4), construct
 * a temporary self-linked config using the one-record or range path selected by
 * ActorDatabase_QueryDefinitionKind and arg5, load resource48, create a mode-2 sprite and apply the
 * resolved frame. Hide it when arg5 is zero. Sample initial position, configure
 * the two Z offsets from arg6/arg7 (negated when initial Y <= 0x40), clear timer,
 * destroy temporaries and return self.
 */
RecordSpriteMotionPresentation *func_02022ff4(
    RecordSpriteMotionPresentation *self,s32 sampleArgument,const u8 *config,
    s32 mode,s32 recordId,s32 rangeEnd,s32 firstOffset,s32 secondOffset)
{
    TrackValue sampled,position,temp;SelfLinkedConfig record;void *component;s32 kind;
    TimedSpritePresentation_InitBase(self);self->vtable=(void **)data_020d6630;
    self->sampleArgument08=sampleArgument;VecFx32Object_InitCopy(&self->track0c,config+0x18);
    VecFx32Object_Init(&self->firstOffset1c);VecFx32Object_Init(&self->secondOffset2c);
    self->spriteOwner44=ActorCollection_GetSpriteOwner(Actor_GetCollection((void *)config));
    AnimationResourceState_InitEmbedded(self->resource48);*(s32 *)&self->track0c.bytes[0x0c]+=0x10000;
    if(mode!=2&&mode!=3)OS_Halt();
    kind=ActorDatabase_QueryDefinitionKind(data_021e9ac0,(u16)recordId);SelfLinkedSpriteConfig_Init(&record);
    if(kind==1)ActorDescriptor_Init(&record,(u16)recordId,1,1);
    else ActorDescriptor_InitRange(&record,(u16)recordId,(u16)rangeEnd);
    component=ActorDescriptor_GetComponent(&record,0);ActorDescriptorComponent_LoadResources(component,data_020f4e18,self->resource48);
    self->sprite3c=GraphicsSpriteGroup_CreateStateFromSource(self->spriteOwner44,self->resource48,2);
    component=ActorDescriptor_GetComponent(&record,0);GraphicsSpriteState_SetAnimationIndex(self->sprite3c,ActorDescriptorComponent_GetAnimation(component));
    if(rangeEnd==0)*(u16 *)(self->sprite3c+0x24)|=4;
    VecFx32_Subtract(&sampled,&self->track0c,self->sampleArgument08);
    func_02056f00(&position,&sampled);VecFx32Object_Destroy(&sampled);
    *(s16 *)(self->sprite3c+0x2c)=(s16)(*(s32 *)&position.bytes[4]>>12);
    *(s16 *)(self->sprite3c+0x2e)=(s16)(*(s32 *)&position.bytes[8]>>12);
    if((*(s32 *)&position.bytes[8]>>12)>0x40){
        VecFx32Object_InitComponents(&temp,0,0,firstOffset);VecFx32Object_Assign(&self->firstOffset1c,&temp);VecFx32Object_Destroy(&temp);
        VecFx32Object_InitComponents(&temp,0,0,secondOffset);VecFx32Object_Assign(&self->secondOffset2c,&temp);VecFx32Object_Destroy(&temp);
    }else{
        VecFx32Object_InitComponents(&temp,0,0,-firstOffset);VecFx32Object_Assign(&self->firstOffset1c,&temp);VecFx32Object_Destroy(&temp);
        VecFx32Object_InitComponents(&temp,0,0,-secondOffset);VecFx32Object_Assign(&self->secondOffset2c,&temp);VecFx32Object_Destroy(&temp);
    }
    self->timer40=0;VecFx32Object_Destroy(&position);return self;
}

static RecordSpriteMotionPresentation *teardown_record_sprite(RecordSpriteMotionPresentation *self)
{
    self->vtable=(void **)data_020d6630;GraphicsSpriteGroup_ReleaseState(self->spriteOwner44,self->sprite3c);
    AnimationResourceState_Destroy(self->resource48);VecFx32Object_Destroy(&self->secondOffset2c);
    VecFx32Object_Destroy(&self->firstOffset1c);VecFx32Object_Destroy(&self->track0c);
    func_0201e28c(self);return self;
}

/* Release sprite/resource and all tracks, tear down base, and return self. */
RecordSpriteMotionPresentation *func_02023260(RecordSpriteMotionPresentation *self)
{return teardown_record_sprite(self);}

/* Perform func_02023260 teardown, free self, and return its old address. */
RecordSpriteMotionPresentation *func_020232b0(RecordSpriteMotionPresentation *self)
{teardown_record_sprite(self);Heap_Free(self);return self;}

/* Sample/reposition sprite, chain both offsets into the track, and return whether 60 frames elapsed. */
s32 func_02023308(RecordSpriteMotionPresentation *self)
{
    TrackValue sampled,position;VecFx32_Subtract(&sampled,&self->track0c,self->sampleArgument08);
    func_02056f00(&position,&sampled);VecFx32Object_Destroy(&sampled);
    *(s16 *)(self->sprite3c+0x2c)=(s16)(*(s32 *)&position.bytes[4]>>12);
    *(s16 *)(self->sprite3c+0x2e)=(s16)(*(s32 *)&position.bytes[8]>>12);
    VecFx32Object_Add(&self->track0c,&self->firstOffset1c);VecFx32Object_Add(&self->firstOffset1c,&self->secondOffset2c);
    self->timer40++;VecFx32Object_Destroy(&position);return self->timer40>=60;
}
