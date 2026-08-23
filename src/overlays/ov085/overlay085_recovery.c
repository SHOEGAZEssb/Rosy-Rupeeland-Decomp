#include "tingle/types.h"

/*
 * Recovered overlay 85 ActorDerivedRuntime movement and marker subsystem.
 *
 * The actor owns a terrain-relative Type7 marker, selects sprite resources
 * from movement state, responds to paired actors, and dispatches timed roaming,
 * pursuit, and recovery states. Shared class layouts remain offset based.
 */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
typedef s32 (*M0)(void *); typedef void (*S0)(void *); typedef void (*V1)(void *, void *);
typedef void (*V2)(void *, void *, s32); typedef void (*V3)(void *, s32, void *, s32);
typedef void (*VPP)(void *, void *, void *);

extern "C" void *gActorRuntimeCollection,*gSoundContext,*data_021052fc;
extern "C" const s16 data_020c9670[]; extern "C" void *data_020f4e18;
extern "C" u8 data_ov085_02214328[],data_ov085_02214330[],data_ov085_02214338[];
extern "C" u8 data_ov085_02214340[],data_ov085_02214348[],data_ov085_02214350[];
extern "C" u8 data_ov085_02214358[],data_ov085_02214360[],data_ov085_02214368[];
extern "C" u8 data_ov085_02214370[],data_ov085_02214378[],data_ov085_02214380[];
extern "C" u8 data_ov085_02214388[],data_ov085_02214390[],data_ov085_02214398[];
extern "C" u8 data_ov085_022143a0[],data_ov085_022143b0[],data_ov085_022143b8[];
extern "C" u8 data_ov085_022143c0[],data_ov085_022143c8[],data_ov085_022143d0[];
extern "C" u8 data_ov085_022143d8[],data_ov085_022143e0[],data_ov085_022143e8[];
extern "C" u8 data_ov085_022143f8[],data_ov085_02214400[],data_ov085_02214408[];
extern "C" u8 data_ov085_02214434[],data_ov085_0221447c[],data_ov085_022144f4[];
extern "C" void *ActorDerivedRuntime_Init(void*,const void*); extern "C" void *ActorDerivedRuntime_DestroyAlternate(void*);
extern "C" void ActorDerivedRuntime_UpdateFrame(void*); extern "C" void ActorDerivedRuntime_HandlePairActive(void*,void*,s32);
extern "C" void ActorDerivedRuntime_AcceptInteractionQuery(void*,void*);
extern "C" void Type7MarkerPresentation_Init(void*,void*); extern "C" void Type7MarkerPresentation_Destroy(void*);
extern "C" void Type7MarkerPresentation_ReloadResources(void*); extern "C" void Type7MarkerPresentation_SelectAnimation(void*,s32);
extern "C" void VecFx32Object_Init(void*); extern "C" void VecFx32Object_InitCopy(void*,const void*);
extern "C" void VecFx32Object_Assign(void*,const void*); extern "C" void VecFx32Object_Destroy(void*);
extern "C" s32 VecFx32Object_GetMagnitude(const void*); extern "C" void *Heap_Free(void*);
extern "C" void *Actor_GetCollection(void*); extern "C" void *ActorCollection_GetSpriteOwner(void*);
extern "C" void *GraphicsSpriteGroup_CreateState(void*,s32,s32,s32,u8);
extern "C" void GraphicsSpriteGroup_ReplaceStateResources(void*,void*,void*,void*,void*);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void*,s32); extern "C" void Actor_SetRuntimeFlag80(void*);
extern "C" void Actor_UpdateAnimationState(void*); extern "C" void Actor_UpdateTimedResourceState(void*);
extern "C" s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void*); extern "C" void Actor_RefreshTerrainHeight(void*);
extern "C" s32 Actor_GetCachedTerrainHeight(void*); extern "C" void func_02031758(void*,void*,s32);
extern "C" void func_02032228(void*,s32,s32,s32); extern "C" void func_02032370(void*,void*,s32);
extern "C" void func_02033b38(void); extern "C" void Sound_PlayOwnedEffect(void*,s32,s32,void*,s32,s32);
extern "C" void func_02071ee0(void*,const void*,s32,s32,s32); extern "C" s32 func_0209189c(void*,s32,s32);
extern "C" s32 func_0204cfa4(s32,s32); extern "C" s32 func_020adc90(s32,s32);
extern "C" s32 func_020adcac(const void*,const void*); extern "C" void func_020adfbc(const void*,const void*,void*);
extern "C" void func_020adff0(const void*,const void*,void*); extern "C" s32 func_020ae024(s32,s32);
extern "C" u32 genrand_int32(void); extern "C" u64 func_020bf1f8(u32,u32); extern "C" void OS_Halt(void);
extern "C" void func_ov085_02213194(void*,s32); extern "C" void func_ov085_022131b4(void*);
extern "C" void func_ov085_02213204(void*,s32,s32,s32); extern "C" void func_ov085_02213ae4(void*);
extern "C" void func_ov085_02213b3c(void*); extern "C" void func_ov085_02213bd0(void*,s32,s32,s32);
extern "C" s32 func_ov085_02213bf8(void*); extern "C" void func_ov085_02213a38(void*,const void*,const void*);
extern "C" void func_ov085_02214154(void*,const void*,const void*); extern "C" bool func_ov085_02214248(void*);

/* Read one method from the partial ActorDerivedRuntime vtable. */
static void *vm(void *a,u32 o){return F(void*,F(void*,a,0),o);}
/* Compare the actor callback pair with an initialized-data descriptor. */
static bool pair_is(void*a,const void*d){return F(void*,a,0x208)==F(void*,d,0)&&(F(void*,a,0x20c)==F(void*,d,4)||F(void*,a,0x208)==0);}
/* Compare a callback-table entry and its separately stored tagged descriptor. */
static bool state_is(void*a,u32 o,const void*d){void*c=F(void*,data_ov085_02214328,o);return F(void*,a,0x208)==c&&(F(void*,a,0x20c)==F(void*,d,4)||c==0);}
/* Install a callback pair and reset its timer. */
static void set_pair(void*a,const void*d,s32 n){func_ov085_02213bd0(a,F(s32,d,0),F(s32,d,4),n);}
/* Resolve either a direct callback or the inherited tagged-vtable encoding. */
static S0 resolve_callback(void*a,u32 callback,u32 tag){return (tag&1)?(S0)F(void*,F(u8*,a,tag>>1),callback):(S0)callback;}

/* Vtable adapter starting a randomized idle transition. */
extern "C" void func_ov085_02212ae0(void*a){func_ov085_02213ae4(a);}
/* Construct the actor, marker, position object, and initial state. */
extern "C" void *func_ov085_02212aec(void*a,const void*c){ActorDerivedRuntime_Init(a,c);F(void*,a,0)=data_ov085_022144f4;VecFx32Object_Init((u8*)a+0x214);F(s32,a,0x224)=0x666;F(s32,a,0x228)=0x1000;F(s16,a,0x234)=-1;F(s32,a,0x238)=0x2400;Type7MarkerPresentation_Init((u8*)a+0x23c,a);F(s32,a,0x24c)=0;F(s32,a,0x254)=genrand_int32();VecFx32Object_Assign((u8*)a+0x214,(u8*)a+0x18);if(F(u32,a,0x14)&0x400)F(u32,a,0xd0)|=4;((M0)vm(a,0xc4))(a);if(F(void*,c,0x2c))((V1)vm(a,0x74))(a,F(void*,c,0x2c));F(u32,a,0x10)&=~0x1000000u;F(u32,a,0x5c)&=0xffff0000u;set_pair(a,data_ov085_02214338,300);F(s16,a,0x234)=0x10;F(s32,a,0x250)=0;return a;}
/* Destroy owned state while retaining the allocation. */
extern "C" void *func_ov085_02212c04(void*a){Type7MarkerPresentation_Destroy((u8*)a+0x23c);VecFx32Object_Destroy((u8*)a+0x214);ActorDerivedRuntime_DestroyAlternate(a);return a;}
/* Destroy the actor and free its allocation. */
extern "C" void *func_ov085_02212c2c(void*a){func_ov085_02212c04(a);Heap_Free(a);return a;}
/* Reset to the home state and refresh terrain-relative vectors. */
extern "C" void func_ov085_02212c5c(void*a){set_pair(a,data_ov085_02214390,120);F(s32,a,0x210)=0;func_ov085_022131b4(a);}
/* Build the sprite state from a five-field resource descriptor. */
extern "C" void func_ov085_02212c8c(void*a,const void*r){func_02071ee0((u8*)a+0x1f0,data_020f4e18,F(s32,r,4),F(s32,r,8),F(s32,r,0xc));void*o=ActorCollection_GetSpriteOwner(Actor_GetCollection(a));void*s=GraphicsSpriteGroup_CreateState(o,F(s32,a,0x1f0),F(s32,a,0x1f4),F(s32,a,0x1f8),F(u8,r,0x10));F(void*,a,0x54)=s;((M0)vm(a,0x14))(a);if(F(u32,a,0x14)&0x80)F(u8,s,0x3a)=(u8)F(u16,r,0x3c);}
/* Run one actor frame and dispatch its current state callback. */
extern "C" void func_ov085_02212d08(void*a)
{
 if(F(s32,a,0x114)){ActorDerivedRuntime_UpdateFrame(a);return;}
 ((M0)vm(a,0x18))(a);Actor_SetRuntimeFlag80(a);Actor_UpdateTimedResourceState(a);
 if(!ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection)&&!(F(u32,a,0x14)&0x10000000)){
  F(s16,a,0xd6)=1;F(s32,a,0x3c)=F(s32,a,0x40)=0;
  if(!((M0)vm(a,0x38))(a)){
   if(F(s32,a,0x230)!=-1){if(F(s32,a,0x22c)<F(s32,a,0x230))++F(s32,a,0x22c);else func_ov085_02213b3c(a);}
   resolve_callback(a,F(u32,a,0x208),F(u32,a,0x20c))(a);
   if((u16)(F(s16,a,0xd6)-1)<2&&func_ov085_02214248(a))F(s16,a,0xd6)=5;
   if(!F(void*,a,0x210)){if(VecFx32Object_GetMagnitude((u8*)a+0x98)>0x300)func_02032228(a,F(s32,a,0x9c),F(s32,a,0xa0),0x400);else func_02032228(a,F(s32,a,0x3c),F(s32,a,0x40),0x800);}
   else func_02032370(a,(u8*)F(void*,a,0x210)+0x18,0x800);
  }
  ((M0)vm(a,0xa4))(a);Actor_UpdateAnimationState(a);((M0)vm(a,0x20))(a);return;
 }
 if((u16)(F(s16,a,0xd6)-5)<2){F(s16,a,0xd6)=1;((M0)vm(a,0x5c))(a);}((M0)vm(a,0x20))(a);
}
/* Update gameplay and select marker animation/resources. */
extern "C" void func_ov085_02212ef4(void*a,s32,s32,s32){F(u32,a,0xd0)&=~0x10u;F(u32,a,0x14)&=~0x40u;if(!(F(u32,a,0x14)&0x10000000)&&F(s32,a,0x24c)>0&&!--F(s32,a,0x24c)){F(s32,a,0x44)=0x2666;F(s32,a,0x8c)=F(s32,a,0x3c);F(s32,a,0x90)=F(s32,a,0x40);F(s32,a,0x3c)=F(s32,a,0x40)=0;Sound_PlayOwnedEffect(gSoundContext,0x133,1,a,0,0x100);}func_ov085_02212d08(a);bool blocked=(F(u32,a,0x10)&0x1000000)||ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection)||(F(u32,a,0x14)&0x10000000);s32 n=-1;if(!F(s32,a,0x114)){if(state_is(a,0x20,data_ov085_02214348))n=2;else if(!blocked&&(state_is(a,0,data_ov085_02214328)||state_is(a,0xa8,data_ov085_022143d0)))n=0xd;else if(!blocked&&state_is(a,8,data_ov085_02214330)&&F(u8,F(void*,a,0x54),0x38)==0x1a&&F(s32,a,0x22c)<150)n=4;}if(n<0)func_ov085_02213194((u8*)a+0x23c,0);else{if(F(s16,a,0x24a))Type7MarkerPresentation_ReloadResources((u8*)a+0x23c);Type7MarkerPresentation_SelectAnimation((u8*)a+0x23c,n);func_ov085_02213194((u8*)a+0x23c,1);}((M0)F(void*,F(void*,a,0x23c),8))((u8*)a+0x23c);}
/* Toggle marker visibility through its sprite's bit 2. */
extern "C" void func_ov085_02213194(void*m,s32 v){void*s=F(void*,m,4);if(v)F(u16,s,0x24)&=~4u;else F(u16,s,0x24)|=4;}
/* Copy position to the local vector and clear both impulses. */
extern "C" void func_ov085_022131b4(void*a){VecFx32Object_Assign((u8*)a+0x214,(u8*)a+0x18);Actor_RefreshTerrainHeight(a);F(s32,a,0x24)=F(s32,a,0x1dc);func_ov085_02213204((u8*)a+0x38,0,0,0);func_ov085_02213204((u8*)a+0x88,0,0,0);}
/* Assign the three payload coordinates following a vector header. */
extern "C" void func_ov085_02213204(void*v,s32 x,s32 y,s32 z){F(s32,v,4)=x;F(s32,v,8)=y;F(s32,v,12)=z;}
/* React to a paired actor and reflect motion or select recovery. */
extern "C" void func_ov085_02213214(void*a,void*o,s32 q){if(!(F(u32,a,0x10)&0x1000000)&&!ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection)){if(F(u8,o,0x4d)==1&&((M0)vm(o,0x68))(o)){if(!state_is(a,0xe0,data_ov085_02214408)&&!state_is(a,0xd8,data_ov085_02214400)){s32 dx=F(s32,o,0x1c)-F(s32,a,0x1c),dy=F(s32,o,0x20)-F(s32,a,0x20),d=func_0204cfa4(dx,dy);if(d>0x1000){F(s32,a,0x9c)-=2*func_020adc90(dx,d);F(s32,a,0xa0)-=2*func_020adc90(dy,d);if(state_is(a,0xc0,data_ov085_022143e8))((V2)vm(a,0xd0))(a,F(void*,data_021052fc,0x2ea4),240);else if(!state_is(a,0xb8,data_ov085_022143e0))set_pair(a,data_ov085_022143f8,30);}}else{set_pair(a,data_ov085_022143d8,90);F(s32,a,0x250)=1;}}else if(!q&&(u16)(F(s16,a,0xd6)-5)<2)func_ov085_02213ae4(a);}ActorDerivedRuntime_HandlePairActive(a,o,q);}
/* Reject the optional interaction query. */
extern "C" s32 func_ov085_0221347c(void){return 0;}
/* Accept an interaction and schedule its marker/sound response. */
extern "C" void func_ov085_02213484(void*a,void*q,s32,s32){if(!ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection)&&!(F(u32,a,0x14)&0x10000000)){bool impact=state_is(a,0x48,data_ov085_02214370)||state_is(a,0xa0,data_ov085_022143c8);if(impact){if(!(F(u32,a,0xd0)&0x10)&&F(s32,a,0x24)==F(s32,a,0x1dc)&&!F(s32,a,0x24c)){F(s32,a,0x24c)=4;F(u32,a,0xd0)|=0x1000;}}else if(state_is(a,0x98,data_ov085_022143c0)){set_pair(a,data_ov085_022143b8,200);F(s32,a,0x250)=0;Sound_PlayOwnedEffect(gSoundContext,0x133,2,a,0,0x100);}else if(!state_is(a,0x88,data_ov085_022143b0)&&!state_is(a,0x30,data_ov085_02214358))set_pair(a,data_ov085_022143a0,60);}ActorDerivedRuntime_AcceptInteractionQuery(a,q);}

/* Render the marker 0x18000 fixed-point units above the actor. */
extern "C" void func_ov085_022136c8(void*c,void*a,s32 q,s32){func_02031758(c,a,q);if(!(F(u32,a,0x14)&0x10000000)){u8 p[16];VecFx32Object_InitCopy(p,(u8*)a+0x18);F(s32,p,8)-=0x18000;((V3)F(void*,F(void*,a,0x23c),0xc))((u8*)a+0x23c,q,p,0);VecFx32Object_Destroy(p);}else func_ov085_02213194((u8*)a+0x23c,0);}
/* Replace resources and choose an animation from movement phase. */
extern "C" void func_ov085_02213748(void*a,s32,s32,s32){void*s=F(void*,a,0x54);GraphicsSpriteGroup_ReplaceStateResources(ActorCollection_GetSpriteOwner(Actor_GetCollection(a)),s,F(void*,a,0x1f0),F(void*,a,0x1f4),F(void*,a,0x1f8));s32 n=-1;switch(F(u16,a,0xd6)){case 1:case 2:n=(F(s32,a,0x24)==Actor_GetCachedTerrainHeight(a)?8:0x1a)+F(u8,a,0xd4);break;case 3:n=0x11;break;case 4:n=0x38;break;case 5:case 6:n=(F(s32,a,0x24)==Actor_GetCachedTerrainHeight(a)?0:0x1a)+F(u8,a,0xd4);break;case 7:n=F(u8,a,0xd4);break;case 8:n=0x37;break;}if(n>=0){F(u16,s,0x24)=(F(u16,s,0x24)&~1u)|2;if(F(u8,s,0x38)!=(u8)n)GraphicsSpriteState_SetAnimationIndex(s,n);}}
/* Derive horizontal velocity toward home and select the move phase. */
extern "C" void func_ov085_022138dc(void*a,void*source,s32,s32){u8 d[16];VecFx32Object_Assign((u8*)a+0x78,source);func_ov085_02213a38(d,(u8*)a+0x78,(u8*)a+0x18);s32 x=F(s32,d,4),y=F(s32,d,8),m=func_0204cfa4(x,y);if(m<=0x4000){if(F(s16,a,0xd6)==6){F(s32,a,0x8c)=F(s32,a,0x3c)/2;F(s32,a,0x90)=F(s32,a,0x40)/2;}F(s32,a,0x3c)=F(s32,a,0x40)=0;F(s16,a,0xd6)=1;}else{s32 v=(F(u32,a,0xd0)&2)?F(s32,a,0x228):F(s32,a,0x224);F(s16,a,0xd6)=(F(u32,a,0xd0)&2)?6:5;if(F(u32,a,0x14)&0x40)v/=10;s32 angle=func_020ae024(y,x)>>4;F(s32,a,0x3c)=v*data_020c9670[angle*2+1]>>12;F(s32,a,0x40)=v*data_020c9670[angle*2]>>12;}if(!(F(u32,a,0x14)&0x40)&&F(s32,a,0x1dc)<F(s32,a,0x24))F(s16,a,0xd6)=7;if((F(u32,a,0xd0)&4)&&((M0)vm(a,0x30))(a))F(s32,a,0x8c)=F(s32,a,0x90)=F(s32,a,0x94)=0;VecFx32Object_Destroy(d);}
/* Construct a vector holding lhs minus rhs. */
extern "C" void func_ov085_02213a38(void*out,const void*l,const void*r){VecFx32Object_Init(out);func_020adfbc((u8*)l+4,(u8*)r+4,(u8*)out+4);}
/* Install the timed chase state and notify its target. */
extern "C" void func_ov085_02213a70(void*a,void*t,s32 n,s32){F(s32,a,0x230)=n;set_pair(a,data_ov085_02214398,n);((V1)vm(a,0xcc))(a,t);}
/* Store the actor currently targeted by the chase state. */
extern "C" void func_ov085_02213aac(void*a,void*t){F(void*,a,0x210)=t;}
/* Enter short recovery and expose its presentation flag. */
extern "C" void func_ov085_02213ab4(void*a){F(s16,a,0xd6)=2;F(u32,a,0xd0)|=0x1000;set_pair(a,data_ov085_02214350,120);}
/* Select randomized state/duration; the division remainder is in the high word. */
extern "C" void func_ov085_02213ae4(void*a){u32 r=genrand_int32();s32 i,n;if(!(r&7)){i=5;n=(s32)(func_020bf1f8(r,60)>>32);}else{i=(r&1)?4:1;n=(s32)(func_020bf1f8(r,120)>>32);}set_pair(a,data_ov085_02214434+i*8,n+60);}
/* Dispatch the callback associated with the current descriptor pair. */
extern "C" void func_ov085_02213b3c(void*a)
{for(s32 i=0;i<9;i++)if(pair_is(a,data_ov085_02214434+i*8)){resolve_callback(a,F(u32,data_ov085_0221447c+i*8,0),F(u32,data_ov085_0221447c+i*8,4))(a);return;}OS_Halt();}
/* Assign a callback pair and reset its elapsed/limit counters. */
extern "C" void func_ov085_02213bd0(void*a,s32 c,s32 t,s32 n){F(s32,a,0x208)=c;F(s32,a,0x20c)=t;F(s32,a,0x22c)=0;F(s32,a,0x230)=n;}
/* Return home if the actor leaves its radius or crosses the boundary. */
extern "C" s32 func_ov085_02213bf8(void*a){s32 x=(F(s32,a,0x1c)-F(s32,a,0x218))>>12,y=(F(s32,a,0x20)-F(s32,a,0x21c))>>12;if(!F(u8,a,0x4b)&&x*x+y*y<=F(s32,a,0x238))return 0;((V1)vm(a,0xc8))(a,(u8*)a+0x214);F(void*,a,0x210)=0;set_pair(a,data_ov085_02214388,300);return 1;}
/* Select one terrain-relative movement phase unless returning home. */
static s32 terrain_phase(void*a,s16 p){if(!func_ov085_02213bf8(a))F(s16,a,0xd6)=F(s32,a,0x24)<=F(s32,a,0x1dc)?p:7;return 0;}
/* Select movement phase one. */
extern "C" s32 func_ov085_02213c84(void*a){return terrain_phase(a,1);}
/* Select movement phase two. */
extern "C" s32 func_ov085_02213cbc(void*a){return terrain_phase(a,2);}
/* Select movement phase three. */
extern "C" s32 func_ov085_02213cf4(void*a){return terrain_phase(a,3);}
/* Enter the faster randomized roaming family. */
extern "C" void func_ov085_02213d2c(void*a){F(s32,a,0xc8)=F(s32,a,0xcc)=0x2000;F(u8,a,0xd4)=F(u8,a,0xd5)=1;F(s16,a,0x1ea)=0;func_ov085_02213ae4(a);}
/* Advance impact animation and choose its next timed state. */
extern "C" s32 func_ov085_02213d5c(void*a){F(s16,a,0xd6)=4;if(F(s32,a,0x22c)==50){if(F(s32,a,0x250)==1)set_pair(a,data_ov085_02214378,60);else{GraphicsSpriteState_SetAnimationIndex(F(void*,a,0x54),0x1a);F(u16,F(void*,a,0x54),0x24)=(F(u16,F(void*,a,0x54),0x24)&~1u)|2;}}else if(F(s32,a,0x22c)>50&&!F(s32,a,0x250)&&(F(u32,a,0x10)&0x2000))set_pair(a,data_ov085_02214380,60);return 0;}
/* Enter the slower roaming family at its home descriptor. */
extern "C" void func_ov085_02213df8(void*a){F(s32,a,0xc8)=F(s32,a,0xcc)=0;F(u8,a,0xd4)=F(u8,a,0xd5)=0;F(s16,a,0x1ea)=0;set_pair(a,data_ov085_02214340,300);}
/* Wander with orientation bit clear, rerolling on rest. */
extern "C" s32 func_ov085_02213e30(void*a){F(u32,a,0xd0)&=~2u;if(!F(s32,a,0x22c)){F(s32,a,0x7c)=func_0209189c((u8*)a+0x254,0x10,0xf0)<<12;F(s32,a,0x80)=func_0209189c((u8*)a+0x254,0x88,0xb0)<<12;F(void*,a,0x210)=0;}if(func_ov085_02213bf8(a))return 0;if(!F(u8,a,0x4b)){((V1)vm(a,0xc8))(a,(u8*)a+0x78);if(!F(s32,a,0x3c)&&!F(s32,a,0x40))func_ov085_02213b3c(a);}else func_ov085_02213b3c(a);return 0;}
/* Wander with orientation bit set, rerolling on rest. */
extern "C" s32 func_ov085_02213eec(void*a){F(u32,a,0xd0)|=2;if(!F(s32,a,0x22c)){F(s32,a,0x7c)=func_0209189c((u8*)a+0x254,0x10,0xf0)<<12;F(s32,a,0x80)=func_0209189c((u8*)a+0x254,0x88,0xb0)<<12;F(void*,a,0x210)=0;}if(!func_ov085_02213bf8(a)){((V1)vm(a,0xc8))(a,(u8*)a+0x78);if(!F(s32,a,0x3c)&&!F(s32,a,0x40))func_ov085_02213b3c(a);}return 0;}
/* Move toward home and reroll after velocity reaches zero. */
extern "C" s32 func_ov085_02213f90(void*a){F(u32,a,0xd0)|=2;if(!F(s32,a,0x22c)){VecFx32Object_Assign((u8*)a+0x78,(u8*)a+0x214);F(void*,a,0x210)=0;}((V1)vm(a,0xc8))(a,(u8*)a+0x78);if(!F(s32,a,0x3c)&&!F(s32,a,0x40))func_ov085_02213b3c(a);return 0;}
/* Return to the standard 300-frame home descriptor. */
extern "C" void func_ov085_02213ffc(void*a){set_pair(a,data_ov085_02214368,300);}
/* Pursue a target, then damp velocity and accumulated impulses. */
extern "C" s32 func_ov085_02214018(void*a){F(u32,a,0xd0)|=2;void*t=F(void*,a,0x210);if(!t){func_ov085_02213ab4(a);return 0;}u8 p[16],d[16],s[16];((VPP)vm(t,0xb4))(p,t,a);s32 distance=func_020adcac((u8*)p+4,(u8*)a+0x1c);if(distance<0xc000){func_ov085_02213a38(d,(u8*)a+0x18,p);func_ov085_02214154(s,d,(u8*)a+0x18);VecFx32Object_Assign(p,s);VecFx32Object_Destroy(s);VecFx32Object_Destroy(d);}else if(distance<0x20000)VecFx32Object_Assign(p,(u8*)a+0x18);((V1)vm(a,0xc8))(a,p);F(s32,a,0x8c)+=F(s32,a,0x3c)/10;F(s32,a,0x90)+=F(s32,a,0x40)/10;F(s32,a,0x3c)/=3;F(s32,a,0x40)/=3;VecFx32Object_Destroy(p);return 0;}
/* Copy another actor position into a temporary vector. */
extern "C" void func_ov085_02214144(void*out,void*a){VecFx32Object_InitCopy(out,(u8*)a+0x18);}
/* Construct a vector holding lhs plus rhs. */
extern "C" void func_ov085_02214154(void*out,const void*l,const void*r){VecFx32Object_Init(out);func_020adff0((u8*)l+4,(u8*)r+4,(u8*)out+4);}
/* Abandon pursuit and return to the home descriptor. */
extern "C" void func_ov085_0221418c(void*a){F(void*,a,0x210)=0;((V1)vm(a,0xc8))(a,(u8*)a+0x214);set_pair(a,data_ov085_02214360,300);}
/* Select phase eight near terrain and emit the arrival sound. */
extern "C" s32 func_ov085_022141c8(void*a){if(!func_ov085_02213bf8(a)){F(s16,a,0xd6)=F(s32,a,0x24)<=F(s32,a,0x1dc)?8:7;void*s=F(void*,a,0x54);if(F(u8,s,0x38)==0x37&&!F(s32,s,0x20))Sound_PlayOwnedEffect(gSoundContext,0x133,0,a,0,0x100);}return 0;}
/* Report whether accumulated motion exceeds 0x800 units. */
extern "C" bool func_ov085_02214248(void*a){return VecFx32Object_GetMagnitude((u8*)a+0x98)+VecFx32Object_GetMagnitude((u8*)a+0x38)+VecFx32Object_GetMagnitude((u8*)a+0x88)>0x800;}
/* Return the fixed 64-unit interaction radius. */
extern "C" s32 func_ov085_02214288(void){return 0x40000;}
/* Report no secondary interaction radius. */
extern "C" s32 func_ov085_02214290(void){return 0;}
/* Expose inherited capability bit 0x80. */
extern "C" u32 func_ov085_02214298(void*a){return F(u32,a,0xd0)&0x80;}
/* Report inherited capability bit 0x40. */
extern "C" bool func_ov085_022142a4(void*a){return (F(u32,a,0xd0)&0x40)!=0;}
/* Report no alternate action. */
extern "C" s32 func_ov085_022142b8(void){return 0;}
/* No-op vtable callback. */
extern "C" void func_ov085_022142c0(void){}
/* No-op vtable callback. */
extern "C" void func_ov085_022142c4(void){}
/* Enable inherited capability bit 0x80. */
extern "C" void func_ov085_022142c8(void*a){F(u32,a,0xd0)|=0x80;}
/* Report the first optional query unsupported. */
extern "C" s32 func_ov085_022142d8(void){return 0;}
/* Report the second optional query unsupported. */
extern "C" s32 func_ov085_022142e0(void){return 0;}
/* No-op notification callback. */
extern "C" void func_ov085_022142e8(void){}
/* Forward to the resident actor helper. */
extern "C" void func_ov085_022142ec(void){func_02033b38();}
/* Report no additional descriptor flags. */
extern "C" s32 func_ov085_022142f8(void){return 0;}
/* Hide the owned marker through its visibility adapter. */
extern "C" void func_ov085_02214300(void*a){func_ov085_02213194((u8*)a+0x23c,0);}
