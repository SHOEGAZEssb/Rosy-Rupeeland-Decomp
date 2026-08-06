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
extern void *data_020d6630;extern void *data_020f4e18;extern void *data_021e9ac0;
extern void *func_0201e250(void *);extern void *func_0201e28c(void *);
extern void func_02005030(void *,const void *);extern void func_02004fe0(void *);
extern void func_0200500c(void *,s32,s32,s32);extern void func_020050a4(void *,const void *);
extern void func_02005058(void *);extern void func_020050c8(void *,const void *);
extern void func_020066a4(void *,const void *,s32);extern void func_02056f00(void *,const void *);
extern void *func_020337d4(void *);extern void *func_02030acc(void *);
extern void func_02071ea4(void *);extern void func_02071eb8(void *);
extern u8 *func_02073ffc(void *,void *,s32);extern void func_02072b68(void *,s32);
extern void func_02074038(void *,void *);extern void func_02022fbc(void *);
extern s32 func_02063658(void *,u16);extern void func_020627d0(void *,u16,s32,s32);
extern void func_020627a0(void *,u16,u16);extern void func_02062918(void *,s32);
extern void func_02063014(void *,void *,void *);extern s32 func_02063190(void);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/*
 * Initialize base/track state and derive spriteOwner from config. Modes 2/3 are
 * accepted; other modes halt through OS_Halt. Resolve recordId (arg4), construct
 * a temporary self-linked config using the one-record or range path selected by
 * func_02063658 and arg5, load resource48, create a mode-2 sprite and apply the
 * resolved frame. Hide it when arg5 is zero. Sample initial position, configure
 * the two Z offsets from arg6/arg7 (negated when initial Y <= 0x40), clear timer,
 * destroy temporaries and return self.
 */
RecordSpriteMotionPresentation *func_02022ff4(
    RecordSpriteMotionPresentation *self,s32 sampleArgument,const u8 *config,
    s32 mode,s32 recordId,s32 rangeEnd,s32 firstOffset,s32 secondOffset)
{
    TrackValue sampled,position,temp;SelfLinkedConfig record;s32 kind;
    func_0201e250(self);self->vtable=(void **)data_020d6630;
    self->sampleArgument08=sampleArgument;func_02005030(&self->track0c,config+0x18);
    func_02004fe0(&self->firstOffset1c);func_02004fe0(&self->secondOffset2c);
    self->spriteOwner44=func_02030acc(func_020337d4((void *)config));
    func_02071ea4(self->resource48);*(s32 *)&self->track0c.bytes[0x0c]+=0x10000;
    if(mode!=2&&mode!=3)OS_Halt();
    kind=func_02063658(data_021e9ac0,(u16)recordId);func_02022fbc(&record);
    if(kind==1)func_020627d0(&record,(u16)recordId,1,1);
    else func_020627a0(&record,(u16)recordId,(u16)rangeEnd);
    func_02062918(&record,0);func_02063014(&record,data_020f4e18,self->resource48);
    self->sprite3c=func_02073ffc(self->spriteOwner44,self->resource48,2);
    func_02062918(&record,0);func_02072b68(self->sprite3c,func_02063190());
    if(rangeEnd==0)*(u16 *)(self->sprite3c+0x24)|=4;
    func_020066a4(&sampled,&self->track0c,self->sampleArgument08);
    func_02056f00(&position,&sampled);func_02005058(&sampled);
    *(s16 *)(self->sprite3c+0x2c)=(s16)(*(s32 *)&position.bytes[4]>>12);
    *(s16 *)(self->sprite3c+0x2e)=(s16)(*(s32 *)&position.bytes[8]>>12);
    if((*(s32 *)&position.bytes[8]>>12)>0x40){
        func_0200500c(&temp,0,0,firstOffset);func_020050a4(&self->firstOffset1c,&temp);func_02005058(&temp);
        func_0200500c(&temp,0,0,secondOffset);func_020050a4(&self->secondOffset2c,&temp);func_02005058(&temp);
    }else{
        func_0200500c(&temp,0,0,-firstOffset);func_020050a4(&self->firstOffset1c,&temp);func_02005058(&temp);
        func_0200500c(&temp,0,0,-secondOffset);func_020050a4(&self->secondOffset2c,&temp);func_02005058(&temp);
    }
    self->timer40=0;func_02005058(&position);return self;
}

static RecordSpriteMotionPresentation *teardown_record_sprite(RecordSpriteMotionPresentation *self)
{
    self->vtable=(void **)data_020d6630;func_02074038(self->spriteOwner44,self->sprite3c);
    func_02071eb8(self->resource48);func_02005058(&self->secondOffset2c);
    func_02005058(&self->firstOffset1c);func_02005058(&self->track0c);
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
    TrackValue sampled,position;func_020066a4(&sampled,&self->track0c,self->sampleArgument08);
    func_02056f00(&position,&sampled);func_02005058(&sampled);
    *(s16 *)(self->sprite3c+0x2c)=(s16)(*(s32 *)&position.bytes[4]>>12);
    *(s16 *)(self->sprite3c+0x2e)=(s16)(*(s32 *)&position.bytes[8]>>12);
    func_020050c8(&self->track0c,&self->firstOffset1c);func_020050c8(&self->firstOffset1c,&self->secondOffset2c);
    self->timer40++;func_02005058(&position);return self->timer40>=60;
}
