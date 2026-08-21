#include "tingle/types.h"

/*
 * Recovered overlay 82 ActorExtendedType2 interaction subsystem.
 *
 * Two related actors share attachment timing, terrain-relative animation,
 * contact impulses, currency feedback, resource spawning, and paired-actor
 * callbacks. Shared actor layouts remain offset based.
 */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
typedef s32 (*M0)(void *); typedef void (*V0)(void *); typedef void (*V1)(void *,void *);
typedef void (*V2)(void *,void *,s32);

extern "C" void *gActorRuntimeCollection,*gSoundContext,*gLupyContext,*gHeapContext,*data_021052fc;
extern "C" const u16 data_020e6e68[]; extern "C" const u8 data_020e6adc[],data_020e6b74[],data_020e6c0c[];
extern "C" u8 data_ov082_022145e8[],data_ov082_022145f0[],data_ov082_02214668[];
extern "C" u8 data_ov082_0221483c[],data_ov082_022148d0[],data_ov082_02214aa4[];
extern "C" u8 data_ov082_02214aac[],data_ov082_02214abc[],data_ov082_02214ac4[],data_ov082_02214b18[];
extern "C" void *ActorExtendedType2_Init(void *,const void *); extern "C" void *ActorExtendedType2_Destroy(void *);
extern "C" void ActorExtendedType2_UpdateFrame(void *); extern "C" void ActorExtendedType2_TriggerContactFeedback(void *);
extern "C" void ActorExtendedType2_CopyAdjustedDescriptor(void *,void *); extern "C" s32 ActorExtendedType2_GetDescriptorValue25(void *);
extern "C" s32 ActorExtendedType2_GetDescriptorValue28(void *); extern "C" s32 ActorExtendedType2_GetDescriptorValue2A(void *);
extern "C" s32 ActorExtendedType2_GetDescriptorValue2C(void *); extern "C" s32 ActorExtendedType2_UpdateTimedAttachmentTransition(void *);
extern "C" void ActorExtendedType2_InitializeReentryState(void *); extern "C" void Actor_RestoreSavedFlags(void *);
extern "C" void *Heap_Free(void *); extern "C" void *Heap_Alloc(u32,const void *,u32,void *);
extern "C" void VecFx32Object_Init(void *); extern "C" void VecFx32Object_InitCopy(void *,const void *);
extern "C" void VecFx32Object_InitComponents(void *,s32,s32,s32); extern "C" void VecFx32Object_Destroy(void *);
extern "C" void *Actor_GetCollection(void *); extern "C" void *ActorCollection_GetSpriteOwner(void *);
extern "C" void *ActorCollection_FindActorByDescriptorValue(void *,s32); extern "C" s32 Actor_GetCachedTerrainHeight(void *);
extern "C" void GraphicsSpriteGroup_ReplaceStateResources(void *,void *,void *,void *,void *);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *,s32); extern "C" s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *);
extern "C" s32 ActorRuntimeCollection_GetBusyState(void *); extern "C" void *TrackedResourceActor_SpawnFromKey(s32,const void *,const void *);
extern "C" void ActorContactState_AddContact(void *,void *,s32); extern "C" void ActorDerivedType1_StartRecord(void *,s32);
extern "C" void *ActorMotionAreaFollower_GetPosition(void *); extern "C" void GamePhaseCurrencyHud_AddCurrency(void *,s32,s32);
extern "C" void PresentationList_AppendObject(void *,void *); extern "C" void *func_0201e0ec(void *);
extern "C" void *func_02022cb0(void *,const void *,void *,s32,s32,s32); extern "C" void func_02032228(void *,s32,s32,s32);
extern "C" s32 func_02033f4c(void *); extern "C" void func_02034a60(void *,s32,s32);
extern "C" s32 func_0204cfa4(s32,s32); extern "C" void func_020593dc(void *,s32,s32,void *,s32,s32);
extern "C" void func_020a28e0(void *,s32,s32,s32,s32); extern "C" s32 func_020adc90(s32,s32);
extern "C" void func_020adfbc(const void *,const void *,void *); extern "C" void func_020adff0(const void *,const void *,void *);
extern "C" s32 func_020befec(s32,s32); extern "C" u64 func_020bf1f8(u32,u32); extern "C" u32 genrand_int32(void);
extern "C" s32 SignedAbsoluteValue(s32); extern "C" void Sound_Play(void *,s32,s32);
extern "C" void EffectManager_SubmitPointEffect(void *,s32,s32,s32,s32);

extern "C" s32 func_ov082_0221340c(void *);
extern "C" void func_ov082_0221391c(void *,s32);
extern "C" void func_ov082_02213974(void *,const void *,const void *);
extern "C" void func_ov082_022139ac(void *,const void *,s32);
extern "C" void func_ov082_022139f4(void *,const void *,const void *);

/* Read one method from the partial ActorExtendedType2 vtable. */
static void *vm(void *a,u32 o){return F(void *,F(void *,a,0),o);}
/* Compare an active callback pair with a split callback/tag descriptor. */
static bool pair_is(void *a,const void *callbacks,u32 co,const void *tag){void*c=F(void *,callbacks,co);return F(void *,a,0x218)==c&&(F(void *,a,0x21c)==F(void *,tag,4)||c==0);}
/* Copy one initialized callback pair into the actor. */
static void set_pair(void *a,const void *d,u32 o){F(void *,a,0x218)=F(void *,d,o);F(void *,a,0x21c)=F(void *,d,o+4);}
/* Multiply signed 20.12 values with retail rounding. */
static s32 fxmul(s32 a,s32 b){return (s32)(((s64)a*b+0x800)>>12);}

/* Construct the primary actor and install its recovered vtable. */
extern "C" void *func_ov082_02212ae0(void *a,const void *c){ActorExtendedType2_Init(a,c);F(void *,a,0)=data_ov082_02214668;return a;}
/* Destroy the primary actor while retaining its allocation. */
extern "C" void *func_ov082_02212b00(void *a){ActorExtendedType2_Destroy(a);return a;}
/* Destroy and free the primary actor. */
extern "C" void *func_ov082_02212b14(void *a){ActorExtendedType2_Destroy(a);Heap_Free(a);return a;}

/* Replace sprite resources and select animation for the current motion state. */
extern "C" void func_ov082_02212b30(void *a)
{
 s32 n=0,alpha=0x100;bool stop=false; s32 attachment;
 switch(F(s16,a,0xd6)){
 case 1: attachment=ActorExtendedType2_GetDescriptorValue25(a);if(attachment<0){n=F(u8,a,0xd4)+8;alpha=0;stop=true;}else n=F(u8,a,0xd4)+(F(s32,a,0x24)<Actor_GetCachedTerrainHeight(a)+0x8000?8:0x16);break;
 case 2:case 3:case 4: attachment=ActorExtendedType2_GetDescriptorValue25(a);n=F(u8,a,0xd4)+(attachment<0||F(s32,a,0x24)<F(s32,a,0x238)+0x14000?8:0x16);break;
 case 5:case 6: attachment=ActorExtendedType2_GetDescriptorValue25(a);n=F(u8,a,0xd4)+(attachment>=0&&F(s16,a,0xda)==1?0x16:0);break;
 case 7: if(data_020e6c0c[F(u16,a,0x4e)]){n=F(u8,a,0xd4)+0x15;stop=true;}else{attachment=ActorExtendedType2_GetDescriptorValue25(a);n=F(u8,a,0xd4)+(attachment>=0&&F(s16,a,0xda)==1?0x16:0);}break;
 case 8:case 9:n=F(u8,a,0xd4);break;case 0xb:n=0x12;break;case 0xd:n=F(u8,a,0xd4)+0x16;stop=true;break;
 case 0x11:if(data_020e6b74[F(u16,a,0x4e)]){n=0x15;stop=true;}break;case 0x12:n=0x10;stop=true;break;
 case 0x13:if(data_020e6adc[F(u16,a,0x4e)]){n=0x14;stop=true;}else n=F(u8,a,0xd4)+8;break;case 0x16:n=0x11;break;default:break;}
 void*r=F(void *,a,0x208),*s=F(void *,a,0x54);GraphicsSpriteGroup_ReplaceStateResources(ActorCollection_GetSpriteOwner(Actor_GetCollection(a)),s,F(void *,r,4),F(void *,r,8),F(void *,r,0xc));
 if(F(u8,s,0x38)!=(u8)n)GraphicsSpriteState_SetAnimationIndex(s,n);F(u16,s,0x36)=(u16)alpha;F(u16,s,0x30)=0;if(stop)F(u16,s,0x24)&=~3u;else F(u16,s,0x24)=(F(u16,s,0x24)&~1u)|2;
}

/* Advance vertical attachment motion, clamp terrain height, and expose height bands. */
extern "C" void func_ov082_02212d90(void *a)
{
 if(F(u32,a,0x14)&0x200000)return;F(u32,a,0x14)=((u16)(F(s16,a,0xd6)-5)<=1)?F(u32,a,0x14)|0x40:F(u32,a,0x14)&~0x40u;ActorExtendedType2_UpdateFrame(a);
 if(F(u32,a,0x14)&0x40){F(s32,a,0x44)=0;s32 base=F(s32,a,0x238)+0x28000;F(s32,a,0x24)=fxmul(F(s32,a,0x24),0xfae)+fxmul(base,0x52);if(ActorExtendedType2_GetDescriptorValue25(a)>=0){++F(u16,a,0x298);if(!F(s16,a,0xda)&&F(u16,a,0x298)>ActorExtendedType2_GetDescriptorValue2A(a)&&SignedAbsoluteValue(F(s32,a,0x24)-base)<0x4000){void*child=TrackedResourceActor_SpawnFromKey(ActorExtendedType2_GetDescriptorValue25(a),(u8*)a+0x18,(u8*)a+0x18);if(child)F(s32,child,0x44)=0x1000;F(s16,a,0xda)=1;F(u32,a,0xd0)|=0x1000;}}}
 if(pair_is(a,data_ov082_022145e8,8,data_ov082_022145f0)){s32 h=Actor_GetCachedTerrainHeight(a);if(F(s32,a,0x24)<h){F(s32,a,0x24)=h;F(s32,a,0x44)=0;}return;}
 s32 lo=F(s32,a,0x238),hi=lo+0x2e000;if(F(s32,a,0x24)<lo){F(s32,a,0x24)=lo;F(s32,a,0x44)=0;}else if(F(s32,a,0x24)>=hi)F(s32,a,0x24)=hi;
 if(ActorExtendedType2_GetDescriptorValue2C(a)==1){if(F(s32,a,0x24)<lo+0x16000){F(u32,a,0x14)&=~0x80u;F(u32,a,0x5c)&=0xffff0000u;}else{F(u32,a,0x14)|=0x80;F(u32,a,0x5c)=(F(u32,a,0x5c)&0xffff0000u)|0xff80;F(u8,F(void *,a,0x54),0x3a)=1;}if(F(s32,a,0x24)<lo+0x22000)F(u32,a,0x14)&=~0x100u;else F(u32,a,0x14)|=0x100;}
}
/* Trigger feedback once the actor returns to the permitted height. */
extern "C" void func_ov082_02213018(void*a){if(ActorExtendedType2_GetDescriptorValue2C(a)!=1||F(s32,a,0x24)<=F(s32,a,0x238)){ActorExtendedType2_TriggerContactFeedback(a);F(s16,a,0xda)=0;F(u16,a,0x298)=0;}}
/* Report the optional action unsupported. */ extern "C" s32 func_ov082_02213058(void){return 0;}
/* Copy another actor position into an output vector. */ extern "C" void func_ov082_02213060(void*out,void*a){VecFx32Object_InitCopy(out,(u8*)a+0x18);}
/* Expose inherited capability bit 0x80. */ extern "C" u32 func_ov082_02213070(void*a){return F(u32,a,0xd0)&0x80;}
/* Report inherited capability bit 0x40. */ extern "C" bool func_ov082_0221307c(void*a){return (F(u32,a,0xd0)&0x40)!=0;}
/* Report no secondary interaction action. */ extern "C" s32 func_ov082_02213090(void){return 0;}
/* No-op primary notification. */ extern "C" void func_ov082_02213098(void){}
/* No-op secondary notification. */ extern "C" void func_ov082_0221309c(void){}
/* Return the fixed descriptor width. */ extern "C" s32 func_ov082_022130a0(void){return 0x10;}
/* Return the embedded position object. */ extern "C" void*func_ov082_022130a8(void*a){return(u8*)a+0x18;}
/* Return the fixed interaction radius. */ extern "C" s32 func_ov082_022130b0(void){return 0xc0000;}
/* Forward a position update with mode zero. */ extern "C" void func_ov082_022130b8(void*a,void*p){((V2)vm(a,0x108))(a,p,0);}
/* Forward the alternate position update with mode zero. */ extern "C" void func_ov082_022130d0(void*a,void*p){((V2)vm(a,0x108))(a,p,0);}
/* Report no tertiary query result. */ extern "C" s32 func_ov082_022130e8(void){return 0;}
/* Enable inherited attachment flag 0x10. */ extern "C" void func_ov082_022130f0(void*a){F(u32,a,0x260)|=0x10;}
/* Report a completed armed transition while vmethod 0xa8 is idle. */ extern "C" bool func_ov082_02213100(void*a){return(F(u32,a,0x260)&8)&&(F(u32,a,0x260)&2)&&((M0)vm(a,0xa8))(a)==0;}
/* Report descriptor byte mode eight. */ extern "C" bool func_ov082_02213148(void*a){return F(u8,a,0x24c)==8;}
/* Report every animation state except 0x10 eligible. */ extern "C" bool func_ov082_0221315c(void*a){return F(s16,a,0xd6)!=0x10;}
/* Report vertical motion states five or six. */ extern "C" bool func_ov082_0221317c(void*a){return F(s16,a,0xd6)==5||F(s16,a,0xd6)==6;}
/* Report secondary animation states nine or ten. */ extern "C" bool func_ov082_02213194(void*a){return F(s16,a,0xd8)==9||F(s16,a,0xd8)==10;}
/* Report primary animation states nine or ten. */ extern "C" bool func_ov082_022131ac(void*a){return F(s16,a,0xd6)==9||F(s16,a,0xd6)==10;}
/* No-op vtable callback. */ extern "C" void func_ov082_022131c4(void){}
/* No-op vtable callback. */ extern "C" void func_ov082_022131c8(void){}
/* Toggle the auxiliary sprite visibility bit. */ extern "C" void func_ov082_022131cc(void*a,s32 show){void*s=F(void*,a,0x288);if(show)F(u16,s,0x24)&=~4u;else F(u16,s,0x24)|=4;}
/* Return the fixed auxiliary radius. */ extern "C" s32 func_ov082_022131ec(void){return 0x20000;}
/* Divide the resident descriptor-derived value by three. */ extern "C" s32 func_ov082_022131f4(void*a){return func_020befec(func_02033f4c(a),3);}
/* Return the fixed horizontal step. */ extern "C" s32 func_ov082_02213208(void){return 0x400;}
/* Return the fixed presentation alpha. */ extern "C" s32 func_ov082_02213210(void){return 0x100;}

/* Construct the attachment-producing actor and clear its local timers. */
extern "C" void*func_ov082_02213218(void*a,const void*c){ActorExtendedType2_Init(a,c);F(void*,a,0)=data_ov082_022148d0;F(u16,a,0x298)=0;F(u16,a,0x29a)=F(u16,a,0x29c)=0;F(u32,a,0x260)&=~8u;return a;}
/* Destroy the attachment actor while retaining allocation. */ extern "C" void*func_ov082_02213274(void*a){ActorExtendedType2_Destroy(a);return a;}
/* Destroy and free the attachment actor. */ extern "C" void*func_ov082_02213288(void*a){ActorExtendedType2_Destroy(a);Heap_Free(a);return a;}
/* Forward a descriptor and arm supported attachment types. */ extern "C" void func_ov082_022132a4(void*a,void*d){((V2)vm(a,0x108))(a,d,0);s32 k=ActorExtendedType2_GetDescriptorValue25(a);if(k==0||k==2)func_ov082_0221340c(a);}
/* Emit the five-particle completion burst and attachment-specific sound. */
extern "C" void func_ov082_022132e8(void*a){if(ActorExtendedType2_GetDescriptorValue25(a)!=1||!func_ov082_0221340c(a))return;void*e=func_0201e0ec((u8*)data_021052fc+0x2f7c);s32 x=(F(s32,a,0x1c)>>12)-12,y=(F(s32,a,0x20)>>12)-(F(s32,a,0x24)>>12);for(s32 i=0;i<5;i++){u32 r=genrand_int32();func_020a28e0(e,1,x+(s32)(func_020bf1f8(r,24)>>32),y-(s32)((r>>4)&15),60);}s32 mode=ActorExtendedType2_GetDescriptorValue2C(a);if(mode==0)func_020593dc(gSoundContext,0x1d6,2,a,0,0x100);else if(mode==1)func_020593dc(gSoundContext,0x1e3,3,a,0,0x100);}
/* Arm the timed attachment transition and install its callbacks. */
extern "C" s32 func_ov082_0221340c(void*a){if((F(u16,a,0x298)&1)||((M0)vm(a,0xa8))(a)!=0||(F(u32,a,0xd0)&0x100))return 0;F(u16,a,0x298)|=1;F(u16,a,0x29a)=(u16)ActorExtendedType2_GetDescriptorValue2A(a);F(s16,a,0xda)=0;F(u32,a,0xd0)|=0x1000;F(u32,a,0x260)|=8;F(u32,a,0x10)&=~0x10000u;set_pair(a,data_ov082_0221483c,8);F(void*,a,0x220)=F(void*,data_ov082_0221483c,0x10);F(void*,a,0x224)=F(void*,data_ov082_0221483c,0x14);if(ActorExtendedType2_GetDescriptorValue25(a)==0)func_02034a60(a,0xc882,0);return 1;}
/* Copy an adjusted descriptor and mark an active accepted contact. */
extern "C" void func_ov082_022134f8(void*a,void*d){ActorExtendedType2_CopyAdjustedDescriptor(a,d);if(F(u16,a,0x298)&1)F(u16,d,0x1a)=(F(u16,d,0x1a)&~1u)|4;}

/* Resolve contact, exchange impulses, currency, sound, and point effects. */
extern "C" void func_ov082_02213538(void*a,void*other,s32 q)
{
 if(!ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection)&&!ActorRuntimeCollection_GetBusyState(gActorRuntimeCollection)&&((F(u16,a,0x298)>>1)==0)&&!(F(u32,a,0x260)&8)&&(F(u8,other,0x4d)==1||F(u8,other,0x4d)==7)){
  F(u16,a,0x298)=(F(u16,a,0x298)&1)|0x78;((V1)vm(a,0x1b4))(a,other);s32 dx=F(s32,a,0x1c)-F(s32,other,0x1c),dy=F(s32,a,0x20)-F(s32,other,0x20),m=func_0204cfa4(dx,dy);
  if(m>0x1000){bool record=false;s32 kind=ActorExtendedType2_GetDescriptorValue25(a);if(kind==0||kind==1){dx*=2;dy*=2;record=kind==1;}else if(kind==2){dx*=-5;dy*=-2;}u8 impulse[16];VecFx32Object_InitComponents(impulse,func_020adc90(dx,m),func_020adc90(dy,m),0);((V2)vm(a,0xb8))(a,impulse,1);if(F(u8,other,0x4d)==1){func_ov082_0221391c(impulse,-0x2000);((V2)vm(other,0xb8))(other,impulse,1);if(record)ActorDerivedType1_StartRecord(other,0x84);}else{func_ov082_0221391c(impulse,-0x1000);((V2)vm(other,0xb8))(other,impulse,1);}s32 amount=ActorExtendedType2_GetDescriptorValue28(a);
   if(!F(u16,a,0x29c)){if(F(u8,other,0x4d)==1&&amount>0){GamePhaseCurrencyHud_AddCurrency(gLupyContext,-amount,0);void*p=Heap_Alloc(0x44,data_ov082_02214aa4,4,gHeapContext);if(p)p=func_02022cb0(p,ActorMotionAreaFollower_GetPosition((u8*)data_021052fc+0x2fbc),other,-amount,0x2000,-0xc0);PresentationList_AppendObject((u8*)data_021052fc+0x2f7c,p);}u16 snd=data_020e6e68[F(u16,a,0x4e)];if(snd!=0xffff)Sound_Play(gSoundContext,snd>>7,snd&0x7f);}if(amount>0)func_02032228(a,-dx,-dy,0x8000);
   u8 delta[16],scaled[16],pos[16];func_ov082_02213974(delta,(u8*)other+0x18,(u8*)a+0x18);func_ov082_022139ac(scaled,delta,0x2000);func_ov082_022139f4(pos,(u8*)a+0x18,scaled);F(s32,pos,8)+=0x18000-F(s32,pos,12);EffectManager_SubmitPointEffect(func_0201e0ec((u8*)data_021052fc+0x2f7c),1,F(s32,pos,4),F(s32,pos,8),0);VecFx32Object_Destroy(pos);VecFx32Object_Destroy(scaled);VecFx32Object_Destroy(delta);VecFx32Object_Destroy(impulse);}}
 ActorContactState_AddContact(a,other,q);
}
/* Scale all vector payload components by a 20.12 scalar. */ extern "C" void func_ov082_0221391c(void*v,s32 k){F(s32,v,4)=fxmul(F(s32,v,4),k);F(s32,v,8)=fxmul(F(s32,v,8),k);F(s32,v,12)=fxmul(F(s32,v,12),k);}
/* Construct a vector holding lhs minus rhs. */ extern "C" void func_ov082_02213974(void*out,const void*l,const void*r){VecFx32Object_Init(out);func_020adfbc((u8*)l+4,(u8*)r+4,(u8*)out+4);}
/* Construct a vector divided by a scalar. */ extern "C" void func_ov082_022139ac(void*out,const void*v,s32 d){VecFx32Object_Init(out);F(s32,out,4)=func_020adc90(F(s32,v,4),d);F(s32,out,8)=func_020adc90(F(s32,v,8),d);F(s32,out,12)=func_020adc90(F(s32,v,12),d);}
/* Construct a vector holding lhs plus rhs. */ extern "C" void func_ov082_022139f4(void*out,const void*l,const void*r){VecFx32Object_Init(out);func_020adff0((u8*)l+4,(u8*)r+4,(u8*)out+4);}

/* Reload resources and select attachment animation and loop flags. */
extern "C" void func_ov082_02213a2c(void*a,s32,s32,s32)
{
 void*r=F(void*,a,0x208+((F(u16,a,0x298)&1)?4:0)),*s=F(void*,a,0x54);s32 n=-1;bool reload=false,stop=false;u16 alpha=0x100;
 if(F(s16,a,0xda)==1){n=(F(u16,a,0x298)&1)?0x14:0x15;reload=stop=true;}else if(F(s16,a,0x29c)){n=F(u8,a,0xd4)+0x16;reload=stop=true;}else switch(F(s16,a,0xd6)){case 1:n=F(u8,a,0xd4)+8;alpha=0;reload=stop=true;break;case 2:case 3:case 4:n=F(u8,a,0xd4)+8;reload=true;break;case 5:case 6:case 7:case 8:case 9:n=F(u8,a,0xd4);reload=true;break;case 0xb:n=0x12;break;case 0xd:n=F(u8,a,0xd4)+0x16;reload=stop=true;break;case 0x11:if(data_020e6b74[F(u16,a,0x4e)]){n=0x15;reload=stop=true;}break;case 0x12:n=0x10;reload=true;break;case 0x13:n=data_020e6adc[F(u16,a,0x4e)]?0x14:0;reload=true;stop=data_020e6adc[F(u16,a,0x4e)]!=0;break;case 0x14:n=0;reload=true;break;case 0x16:n=0x11;reload=true;break;default:break;}if(reload)GraphicsSpriteGroup_ReplaceStateResources(ActorCollection_GetSpriteOwner(Actor_GetCollection(a)),s,F(void*,r,4),F(void*,r,8),F(void*,r,0xc));if(n>=0){GraphicsSpriteState_SetAnimationIndex(s,n);if(stop)F(u16,s,0x24)&=~3u;else F(u16,s,0x24)=(F(u16,s,0x24)&~1u)|2;}F(u16,s,0x36)=alpha;
}
/* Run attachment countdown, particle cadence, cooldown, and base update. */
extern "C" void func_ov082_02213f64(void*a)
{
 if(F(u32,a,0x14)&0x200000)return;u16 count=F(u16,a,0x298)>>1;if(count)F(u16,a,0x298)=(F(u16,a,0x298)&1)|((count-1)<<1);
 if(F(u16,a,0x298)&1){F(u32,a,0x260)=(F(u32,a,0x260)&~0x400u)|8;F(u32,a,0x10)&=~0x10000u;if(F(s16,a,0x29a))--F(s16,a,0x29a);s32 total=ActorExtendedType2_GetDescriptorValue2A(a);if(total-30<F(s16,a,0x29a)&&ActorExtendedType2_GetDescriptorValue25(a)==1&&F(s16,a,0x29a)%3==0){u32 r=genrand_int32();func_020a28e0(func_0201e0ec((u8*)data_021052fc+0x2f7c),1,(F(s32,a,0x1c)>>12)-12+(s32)(func_020bf1f8(r,24)>>32),(F(s32,a,0x20)>>12)-(F(s32,a,0x24)>>12)-(s32)((r>>4)&15),60);}if(!F(s16,a,0x29a)){bool ready=(F(u32,a,0x260)&2)&&((M0)vm(a,0xa8))(a)==0;if(ready){F(u16,a,0x298)&=~1u;F(u32,a,0xd0)|=0x1000;F(s16,a,0xda)=0;set_pair(a,data_ov082_0221483c,0x30);F(void*,a,0x220)=F(void*,data_ov082_0221483c,0x20);F(void*,a,0x224)=F(void*,data_ov082_0221483c,0x24);if(ActorExtendedType2_GetDescriptorValue25(a)==0)func_02034a60(a,0xc883,0);goto done;}}if(F(s16,a,0x29c)){F(s16,a,0x29c)=0;F(u32,a,0xd0)|=0x1000;}}
 else{F(u32,a,0x260)&=~8u;if(!F(s16,a,0x29c)&&(F(u32,a,0x260)&0x10)){F(s16,a,0x29c)=30;F(u32,a,0x10)|=0x10000;F(u32,a,0xd0)|=0x1000;}if(!F(s16,a,0x29c))F(u32,a,0x260)&=~0x400u;else{F(u32,a,0x260)|=0x400;if(!--F(s16,a,0x29c)){F(u32,a,0xd0)|=0x1000;F(u32,a,0x10)&=~0x10000u;}}}
done:ActorExtendedType2_UpdateFrame(a);
}
/* Advance transition and clear active attachment on completion. */ extern "C" s32 func_ov082_02214248(void*a){if(ActorExtendedType2_UpdateTimedAttachmentTransition(a)){F(u16,a,0x298)&=~1u;return 1;}return 0;}
/* Restore saved flags and install normal reentry callbacks. */ extern "C" s32 func_ov082_02214278(void*a){Actor_RestoreSavedFlags(a);F(u32,a,0x10)&=~0x1f0000u;set_pair(a,data_ov082_0221483c,0x18);F(void*,a,0x220)=F(void*,data_ov082_0221483c,0x28);F(void*,a,0x224)=F(void*,data_ov082_0221483c,0x2c);F(u32,a,0xd0)&=~0x200u;F(s16,a,0xd6)=2;return 0;}
/* Complete animation and return to the idle callback set. */ extern "C" s32 func_ov082_022142d4(void*a){F(u32,a,0x260)&=~3u;if(!F(s16,a,0xda))F(s16,a,0xda)=1;else if(F(u16,F(void*,a,0x54),0x24)&1){set_pair(a,data_ov082_0221483c,0x30);F(void*,a,0x220)=F(void*,data_ov082_0221483c,0x20);F(void*,a,0x224)=F(void*,data_ov082_0221483c,0x24);F(s16,a,0xda)=0;F(s32,a,0xc8)=0;F(u8,a,0xd4)=4;F(s32,a,0x228)=0;}return 0;}
/* Initialize reentry and refresh a long active countdown. */ extern "C" void func_ov082_02214358(void*a){ActorExtendedType2_InitializeReentryState(a);if(F(s32,a,0x1fc)>0&&(F(u16,a,0x298)&1))F(s16,a,0x29a)=360;}
/* Return the first fixed range. */ extern "C" s32 func_ov082_0221438c(void){return 0x800;}
/* Return the second fixed range. */ extern "C" s32 func_ov082_02214394(void){return 0x800;}
/* Forward vmethod 0x1bc notification. */ extern "C" void func_ov082_0221439c(void*a){((V0)vm(a,0x1bc))(a);}
/* Construct the paired follower and clear its partner. */ extern "C" void*func_ov082_022143b0(void*a,const void*c){ActorExtendedType2_Init(a,c);F(void*,a,0)=data_ov082_02214b18;F(void*,a,0x298)=0;return a;}
/* Destroy paired follower while retaining allocation. */ extern "C" void*func_ov082_022143d8(void*a){ActorExtendedType2_Destroy(a);return a;}
/* Destroy and free paired follower. */ extern "C" void*func_ov082_022143ec(void*a){ActorExtendedType2_Destroy(a);Heap_Free(a);return a;}
/* Resolve and store a partner by descriptor identity. */ extern "C" void func_ov082_02214408(void*a,s32 id){F(void*,a,0x298)=id<0?0:ActorCollection_FindActorByDescriptorValue(Actor_GetCollection(a),id);}
/* Configure follower from partner or fallback callbacks. */ extern "C" s32 func_ov082_02214430(void*a,void*d){F(u32,a,0x260)|=3;void*p=F(void*,a,0x298);if(!p){((V0)vm(a,0xe8))(a);return 0;}F(u8,a,0x24c)=ActorExtendedType2_GetDescriptorValue2A(a)?0:0xb;if(((M0)vm(a,0x38))(a))return 0;if(F(u16,d,0x1a)&2)set_pair(a,data_ov082_02214aac,8);else((V1)vm(a,0xd0))(a,(u8*)p+0x18);return 0;}
/* Follow a live partner for selected states, then run base frame. */ extern "C" void func_ov082_022144e8(void*a){if(F(u32,a,0x14)&0x200000)return;bool first=pair_is(a,data_ov082_02214aac,0x18,data_ov082_02214ac4),second=pair_is(a,data_ov082_02214aac,0x10,data_ov082_02214abc);if((first||second)&&F(void*,a,0x298))((V1)vm(a,0xe0))(a,F(void*,a,0x298));ActorExtendedType2_UpdateFrame(a);}
