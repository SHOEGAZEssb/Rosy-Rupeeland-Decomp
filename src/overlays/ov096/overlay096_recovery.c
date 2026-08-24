#include "tingle/types.h"

/*
 * Recovered overlay 96 paired ActorExtendedType2/ActorExtendedTransform family.
 *
 * The first actor owns animation and a timed tracked-resource spawn sequence.
 * The transform actor follows a selected target, accumulates and damps motion,
 * reflects on contact, and exposes the callback leaves used by both vtables.
 * Shared class layouts remain offset based until their resident types mature.
 */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
typedef s32 (*M0)(void *);
typedef void (*V1)(void *, void *);
typedef void (*V2)(void *, void *, s32);

extern "C" void *gSoundContext;
extern "C" void *gGamePhaseRuntime;
extern "C" const u8 data_020e6adc[], data_020e6b74[], data_020e6c0c[];
extern "C" const u16 data_020e6e68[];
extern "C" u8 gTrackedResourceActorRecordTable[];
extern "C" u8 data_ov096_02218b08[], data_ov096_02218b18[], data_ov096_02218b20[];
extern "C" u8 data_ov096_02218b98[], data_ov096_02218d6c[], data_ov096_02218d74[];
extern "C" u8 data_ov096_02218de8[];
extern "C" void *ActorExtendedType2_Init(void *, const void *);
extern "C" void *ActorExtendedType2_Destroy(void *);
extern "C" void ActorExtendedType2_ConfigureCallback08(void *);
extern "C" void ActorExtendedType2_UpdateFrame(void *);
extern "C" s32 ActorExtendedType2_GetDescriptorValue2A(void *);
extern "C" void ActorExtendedType2_UpdatePresentationForState(void *);
extern "C" void ActorExtendedType2_CopyAdjustedDescriptor(void *, void *);
extern "C" void ActorExtendedType2_DispatchTransitionCallback(void *, void *);
extern "C" void ActorExtendedType2_SelectRandomDescriptorCallback(void *, void *);
extern "C" s32 ActorExtendedType2_UpdateTargetValidationMotion(void *, void *, s32);
extern "C" s32 ActorExtendedType2_LookupSpecialTarget65(void *, void *, s32);
extern "C" void *ActorExtendedTransform_Init(void *, const void *);
extern "C" void *ActorExtendedTransform_Destroy(void *);
extern "C" void ActorExtendedTransform_UpdateTargetMotion(void *);
extern "C" void Heap_Free(void *);
extern "C" void *Actor_GetOwningCollection(void *);
extern "C" void *ActorCollection_GetSpriteGroup(void *);
extern "C" void GraphicsSpriteGroup_ReplaceStateResources(void *, void *, void *, void *, void *);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void Sound_PlayOwnedEffect(void *, s32, s32, void *, s32, s32);
extern "C" void VecFx32Object_Assign(void *, const void *);
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" s32 VecFx32Object_GetMagnitude(const void *);
extern "C" void *TrackedResourceActor_SpawnFromKey(s32, const void *, const void *);
extern "C" u32 genrand_int32(void);
extern "C" u64 func_020bf1f8(u32, u32);
extern "C" s32 func_020adcac(const void *, const void *);
extern "C" void *func_020536b8(void);

extern "C" bool func_ov096_02217e88(void *);
extern "C" void func_ov096_0221811c(void *);
extern "C" bool func_ov096_02218590(void *);
extern "C" void func_ov096_0221880c(void *, s32, s32, s32);
extern "C" bool func_ov096_0221881c(void *);

/* Read one vtable entry while the recovered shared class layout is partial. */
static void *vm(void *actor, u32 offset) { return F(void *, F(void *, actor, 0), offset); }

/* Install one sprite resource record and select its animation. */
static void install(void *actor, void *resource, s32 animation)
{
    void *sprite = F(void *, actor, 0x54);
    GraphicsSpriteGroup_ReplaceStateResources(
        ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(actor)), sprite,
        F(void *, resource, 4), F(void *, resource, 8), F(void *, resource, 0xc));
    GraphicsSpriteState_SetAnimationIndex(sprite, animation);
}

/* Construct the presentation actor and bind its tracked-resource descriptor. */
extern "C" void *func_ov096_022177e0(void *actor, const void *configuration)
{
    u8 descriptor[0x30];
    ActorExtendedType2_Init(actor, configuration); F(void *,actor,0)=data_ov096_02218b98;
    F(u8,actor,0x298)=F(u8,actor,0x299)=F(u8,actor,0x29a)=F(u8,actor,0x29b)=0;
    ((V1)vm(actor,0xc8))(actor,descriptor);
    void *record=0;
    for(s32 i=0;i<0x43;i++) if(F(s16,gTrackedResourceActorRecordTable,i*0x32)==F(s8,descriptor,0x25))
        record=gTrackedResourceActorRecordTable+i*0x32;
    F(void*,actor,0x29c)=record; return actor;
}

/* Destroy the presentation actor while retaining its allocation. */
extern "C" void *func_ov096_02217868(void *actor) { ActorExtendedType2_Destroy(actor); return actor; }
/* Destroy and free the presentation actor. */
extern "C" void *func_ov096_0221787c(void *actor) { ActorExtendedType2_Destroy(actor); Heap_Free(actor); return actor; }
/* Configure the actor's callback and clear its local presentation phase. */
extern "C" void func_ov096_02217898(void *actor)
{ ActorExtendedType2_ConfigureCallback08(actor); F(u8,actor,0x298)=0; F(u8,actor,0x299)=0; F(u32,actor,0xd0)|=0x1000; }

/* Test whether both callback pairs select the overlay's neutral state. */
static bool neutral_callbacks(void *actor)
{
    u32 a=F(u32,actor,0x218), b=F(u32,actor,0x220);
    bool first=a==F(u32,data_ov096_02218b08,0x18) && (F(u32,actor,0x21c)==F(u32,data_ov096_02218b20,4)||a==0);
    bool second=b==F(u32,data_ov096_02218b08,0x10) && (F(u32,actor,0x224)==F(u32,data_ov096_02218b18,4)||b==0);
    return first&&second;
}

/* Advance the six-phase resource animation and synchronize interaction flags. */
extern "C" void func_ov096_022178c0(void *actor)
{
    if(F(u32,actor,0x14)&0x200000) return;
    if(F(u8,actor,0x29a)) --F(u8,actor,0x29a);
    F(u8,actor,0x298)=neutral_callbacks(actor); F(u8,actor,0x29b)&=~1u; F(u32,actor,0x260)&=~0x8000u;
    void *sprite=F(void*,actor,0x54); u8 state=F(u8,actor,0x299); bool neutral=F(u8,actor,0x298)!=0;
    if(neutral) {
        switch(state) {
        case 0: F(u8,actor,0x299)=1; F(u16,sprite,0x24)&=~3u; install(actor,F(void*,actor,0x208),0x14); Sound_PlayOwnedEffect(gSoundContext,0x143,3,actor,0,0x100); break;
        case 1: F(u16,sprite,0x24)&=~2u; if(F(u16,sprite,0x24)&1){F(u16,sprite,0x24)=(F(u16,sprite,0x24)&~1u)|2;F(u8,actor,0x299)=2;install(actor,F(void*,actor,0x208),0x15);} F(u32,actor,0x260)|=0x8000; break;
        case 2: F(u32,actor,0x260)|=0x8000; break;
        case 3: F(u16,sprite,0x24)&=~2u; if(F(u16,sprite,0x24)&1)F(u8,actor,0x299)=0; F(u32,actor,0x260)|=0x8000; break;
        case 4: F(u16,sprite,0x24)&=~2u; if(F(u16,sprite,0x24)&1){F(u8,actor,0x299)=5;GraphicsSpriteState_SetAnimationIndex(sprite,0x17);func_ov096_0221811c(actor);} F(u32,actor,0x260)|=0x8000; break;
        case 5: F(u16,sprite,0x24)&=~2u; if(F(u16,sprite,0x24)&1){F(u16,sprite,0x24)=(F(u16,sprite,0x24)&~1u)|2;F(u8,actor,0x299)=2;install(actor,F(void*,actor,0x208),0x15);} F(u32,actor,0x260)|=0x8000; break;
        }
    } else {
        switch(state) {
        case 1: F(u16,sprite,0x24)&=~2u; if(!(F(u16,sprite,0x24)&1))break;
        case 2: F(u8,actor,0x299)=3; F(u16,sprite,0x24)&=~3u; install(actor,F(void*,actor,0x208),0x13); Sound_PlayOwnedEffect(gSoundContext,0x143,2,actor,0,0x100); F(u32,actor,0x260)|=0x8000; break;
        case 3: F(u16,sprite,0x24)&=~2u; if(F(u16,sprite,0x24)&1){F(u8,actor,0x299)=0;F(u32,actor,0xd0)|=0x1000;F(u32,actor,0xc8)=0;} F(u32,actor,0x260)|=0x8000; break;
        case 4: F(u16,sprite,0x24)&=~2u; if(F(u16,sprite,0x24)&1){F(u8,actor,0x299)=5;GraphicsSpriteState_SetAnimationIndex(sprite,0x17);func_ov096_0221811c(actor);} F(u32,actor,0x260)|=0x8000; break;
        case 5: F(u16,sprite,0x24)&=~2u; if(F(u16,sprite,0x24)&1){F(u8,actor,0x299)=3;F(u16,sprite,0x24)&=~3u;install(actor,F(void*,actor,0x208),0x13);} F(u32,actor,0x260)|=0x8000; break;
        }
    }
    if(!func_ov096_02217e88(actor)){F(u8,actor,0x29b)|=1;F(u16,sprite,0x36)=0x100;}
    if(!((M0)vm(actor,0xa8))(actor)) {
        if(func_ov096_02217e88(actor)){F(u32,actor,0x260)&=~0x2000u;if(!ActorExtendedType2_GetDescriptorValue2A(actor))F(u32,actor,0x10)&=~0x1f0000u;}
        else {F(u32,actor,0x260)|=0x2000;if(!ActorExtendedType2_GetDescriptorValue2A(actor))F(u32,actor,0x10)|=0x1f0000;}
    }
    ActorExtendedType2_UpdateFrame(actor);
}

/* Report whether the local animation controller is fully idle. */
extern "C" bool func_ov096_02217e88(void *actor) { return F(u8,actor,0x298)==0&&F(u8,actor,0x299)==0; }
/* Expose the inherited 0x80 actor capability bit. */
extern "C" u32 func_ov096_02217ea4(void *actor) { return F(u32,actor,0xd0)&0x80; }
/* Apply attachment state unless the local animation owns the sprite. */
extern "C" void func_ov096_02217eb0(void *actor) { if(!(F(u8,actor,0x29b)&1))ActorExtendedType2_UpdatePresentationForState(actor); }
/* Copy the adjusted descriptor, clearing it while animation is active. */
extern "C" void func_ov096_02217ec8(void *actor,void *out) { ActorExtendedType2_CopyAdjustedDescriptor(actor,out);if(!func_ov096_02217e88(actor))F(u16,out,0)=F(u16,out,2)=F(u16,out,4)=0; }
/* Latch the descriptor threshold result and forward the transition callback. */
extern "C" void func_ov096_02217ef8(void *actor,void *event) { if(!(F(u32,actor,0x260)&0x100)){void *x=func_020536b8();if(x&&((F(s16,event,0x2e)<<24)>>28)<=F(s8,F(void*,x,0x1f8),9))F(u32,actor,0x260)|=0x100;}ActorExtendedType2_DispatchTransitionCallback(actor,event); }
/* Suppress the random-descriptor flag during the local delay. */
extern "C" void func_ov096_02217f4c(void *actor,void *descriptor) { if(F(u8,actor,0x29a))F(u16,descriptor,0x18)&=~1u;ActorExtendedType2_SelectRandomDescriptorCallback(actor,descriptor); }

/* Run the randomized tracked-resource spawn timer and distant-target fallback. */
extern "C" s32 func_ov096_02217f6c(void *actor)
{
    F(u32,actor,0x260)&=~3u;F(u16,actor,0xd6)=2;VecFx32Object_Assign((u8*)actor+0x78,(u8*)actor+0x18);
    void *record=F(void*,actor,0x29c);s32 delay=record?F(s16,record,0x22):0x5a;s16 frame=F(s16,actor,0x25a);
    if(frame==0){F(s16,actor,0x258)=0xf0+(s16)(func_020bf1f8(genrand_int32(),600)>>32);}
    else if(frame>=F(u16,actor,0x258)) {
        void *primary=F(void*,gGamePhaseRuntime,0x2ea4);
        if(func_020adcac(primary?(u8*)primary+0x1c:0,(u8*)actor+0x1c)<0x40000){F(u16,actor,0x25a)=0;F(u16,actor,0x258)=delay+1;}
        else {F(u8,actor,0x29a)=0x5a;F(u32,actor,0x220)=F(u32,data_ov096_02218b08,8);F(u32,actor,0x224)=F(u32,data_ov096_02218b08,0xc);}
    /* Retail tests the division helper's ARM r1 remainder; spell it out for the host ABI. */
    } else if(record && frame%delay==0 && F(u8,actor,0x298)==1&&F(u8,actor,0x299)==2) {
        F(u8,actor,0x299)=4;F(u16,F(void*,actor,0x54),0x24)&=~3u;install(actor,F(void*,actor,0x208),0x16);Sound_PlayOwnedEffect(gSoundContext,0x143,4,actor,0,0x100);
    }
    ++F(s16,actor,0x25a);return 0;
}

/* Select the ordinary or alternate animation index. */
extern "C" s32 func_ov096_02218108(void *actor) { return (F(u32,actor,0x260)&0x2000)?0x15:0x10; }
/* Spawn the actor's tracked resource at its current transform. */
extern "C" void func_ov096_0221811c(void *actor) { if(F(void*,actor,0x29c)){u8 a[16],b[16];VecFx32Object_InitCopy(a,(u8*)actor+0x18);VecFx32Object_InitCopy(b,a);TrackedResourceActor_SpawnFromKey(F(s16,F(void*,actor,0x29c),0),a,b);VecFx32Object_Destroy(b);VecFx32Object_Destroy(a);} }
/* Return the fixed neutral result used by one vtable slot. */
extern "C" s32 func_ov096_02218178(void){return 0;}
/* Copy another actor's position into a vector object. */
extern "C" void func_ov096_02218180(void *out,void *actor){VecFx32Object_InitCopy(out,(u8*)actor+0x18);}
/* Test the inherited 0x40 actor capability bit. */
extern "C" bool func_ov096_02218190(void *actor){return (F(u32,actor,0xd0)&0x40)!=0;}
/* Return the fixed false result used by a vtable slot. */
extern "C" s32 func_ov096_022181a4(void){return 0;}
/* Ignore the first optional callback. */
extern "C" void func_ov096_022181ac(void){}
/* Ignore the second optional callback. */
extern "C" void func_ov096_022181b0(void){}
/* Return the actor's position vector. */
extern "C" void *func_ov096_022181b4(void *actor){return (u8*)actor+0x18;}
/* Return the fixed interaction mask. */
extern "C" u32 func_ov096_022181bc(void){return 0xc0000;}
/* Forward contact through virtual callback 0x108 with kind zero. */
extern "C" void func_ov096_022181c4(void *actor,void *other){((V2)vm(actor,0x108))(actor,other,0);}
/* Forward the alternate contact through virtual callback 0x108. */
extern "C" void func_ov096_022181dc(void *actor,void *other){((V2)vm(actor,0x108))(actor,other,0);}
/* Return the fixed false result used by the interaction gate. */
extern "C" s32 func_ov096_022181f4(void){return 0;}
/* Latch the actor's transient callback flag. */
extern "C" void func_ov096_022181fc(void *actor){F(u32,actor,0x260)|=0x10;}
/* Report the gated transient interaction state. */
extern "C" s32 func_ov096_0221820c(void *actor){return (F(u32,actor,0x260)&8)&&(F(u32,actor,0x260)&2)&&!((M0)vm(actor,0xa8))(actor);}
/* Test whether presentation state eight is active. */
extern "C" bool func_ov096_02218254(void *actor){return F(u8,actor,0x24c)==8;}
/* Test whether action 0x10 is inactive. */
extern "C" bool func_ov096_02218268(void *actor){return F(s16,actor,0xd6)!=0x10;}
/* Test the action-five/six family. */
extern "C" bool func_ov096_02218288(void *actor){s16 x=F(s16,actor,0xd6);return x==5||x==6;}
/* Test the secondary action-nine/ten family. */
extern "C" bool func_ov096_022182a0(void *actor){s16 x=F(s16,actor,0xd8);return x==9||x==10;}
/* Test the primary action-nine/ten family. */
extern "C" bool func_ov096_022182b8(void *actor){s16 x=F(s16,actor,0xd6);return x==9||x==10;}
/* Return the first fixed motion scale. */
extern "C" s32 func_ov096_022182d0(void){return 0x800;}
/* Return the second fixed motion scale. */
extern "C" s32 func_ov096_022182d8(void){return 0x800;}
/* Ignore the first optional vtable notification. */
extern "C" void func_ov096_022182e0(void){}
/* Ignore the second optional vtable notification. */
extern "C" void func_ov096_022182e4(void){}
/* Toggle visibility of the auxiliary sprite at actor offset 0x288. */
extern "C" void func_ov096_022182e8(void *actor,s32 enabled){void *s=F(void*,actor,0x288);if(enabled)F(u16,s,0x24)&=~4u;else F(u16,s,0x24)|=4;}
/* Return the fixed collision extent. */
extern "C" u32 func_ov096_02218308(void){return 0x20000;}

/* Construct the transform actor and clear its local impulse state. */
extern "C" void *func_ov096_02218310(void *actor,const void *configuration){ActorExtendedTransform_Init(actor,configuration);F(void*,actor,0)=data_ov096_02218de8;F(u16,actor,0x2ac)=0;F(u16,actor,0x2ae)&=1;return actor;}
/* Destroy the transform actor while retaining its allocation. */
extern "C" void *func_ov096_0221835c(void *actor){ActorExtendedTransform_Destroy(actor);return actor;}
/* Destroy and free the transform actor. */
extern "C" void *func_ov096_02218370(void *actor){ActorExtendedTransform_Destroy(actor);Heap_Free(actor);return actor;}

/* Select transform-actor presentation from action and callback state. */
extern "C" void func_ov096_0221838c(void *actor)
{
    s32 animation=0,slot=0;s32 delay=0x100;bool clear=true;s16 action=F(s16,actor,0xd6);
    switch(action){
    case 1: if(func_ov096_02218590(actor))animation=F(u8,actor,0xd4);else{animation=F(u8,actor,0xd4)+8;delay=0;}break;
    case 2:case 3:case 4:animation=F(u8,actor,0xd4)+8;break;
    case 5:case 6: if(F(s16,actor,0xda)==0){animation=F(u8,actor,0xd4);if(func_ov096_02218590(actor))delay=0x180;}else{slot=1;clear=false;animation=F(u8,actor,0xd4);}break;
    case 7: if(data_020e6c0c[F(u16,actor,0x4e)]){animation=F(u8,actor,0xd4)+0x15;clear=false;}else goto ordinary;
    ordinary: if(F(s16,actor,0xda)==0){animation=F(u8,actor,0xd4);if(func_ov096_02218590(actor))delay=0x180;}else{slot=1;clear=false;animation=F(u8,actor,0xd4);}break;
    case 8:case 9:animation=F(u8,actor,0xd4);break;
    case 11:animation=0x12;break;
    case 13:slot=1;clear=false;animation=F(u8,actor,0xd4)+0x16;break;
    case 17:if(data_020e6b74[F(u16,actor,0x4e)]){animation=0x15;clear=false;}break;
    case 18:animation=0x10;clear=false;break;
    case 19:if(data_020e6adc[F(u16,actor,0x4e)]){animation=0x14;clear=false;}else animation=F(u8,actor,0xd4)+8;break;
    case 22:animation=0x11;break;
    default:break;
    }
    install(actor,F(void*,actor,0x208+slot*4),animation);void *sprite=F(void*,actor,0x54);F(u16,sprite,0x36)=delay;F(u16,sprite,0x30)=0;
    if(clear)F(u16,sprite,0x24)=(F(u16,sprite,0x24)&~1u)|2;else F(u16,sprite,0x24)&=~3u;
}

/* Test whether the transform actor has left its neutral callback pair. */
extern "C" bool func_ov096_02218590(void *actor){u32 a=F(u32,actor,0x218);return !(a==F(u32,data_ov096_02218d6c,8)&&(F(u32,actor,0x21c)==F(u32,data_ov096_02218d74,4)||a==0));}
/* Update transform flags and reset stale attachment state. */
extern "C" void func_ov096_022185d8(void *actor){if(F(u32,actor,0x14)&0x200000)return;if(func_ov096_02218590(actor)&&F(s16,actor,0xda))F(u32,actor,0x260)&=~8u;else F(u32,actor,0x260)|=8;if(!func_ov096_02218590(actor)&&F(s16,actor,0xda)){F(u16,actor,0xda)=0;F(u32,actor,0xd0)|=0x1000;}ActorExtendedType2_UpdateFrame(actor);}
/* Forward the transform actor's standard target-motion update. */
extern "C" void func_ov096_0221865c(void *actor){ActorExtendedTransform_UpdateTargetMotion(actor);}

/* Update local impulse acquisition, scaling, sound, and expiry. */
extern "C" void func_ov096_02218668(void *actor,s32 *x,s32 *y)
{
    if(!func_ov096_02218590(actor)){F(u16,actor,0xda)=0;func_ov096_0221880c((u8*)actor+0x29c,0,0,0);}
    else if(F(s16,actor,0xda)==0){if(func_ov096_0221881c(actor)){F(u16,actor,0xda)=1;F(u16,actor,0x2ac)=0;F(u16,actor,0x2ae)&=~1u;func_ov096_0221880c((u8*)actor+0x29c,*x,*y,0);F(s32,actor,0x44)=ActorExtendedType2_GetDescriptorValue2A(actor)<<4;}F(u16,actor,0x2ae)&=1;}
    else {++F(s16,actor,0x2ac);*x=F(s32,actor,0x2a0);*y=F(s32,actor,0x2a4);if(func_ov096_0221881c(actor)){*x<<=2;*y<<=2;if((F(u16,actor,0x2ae)>>1)==0){F(u16,actor,0x2ae)=(F(u16,actor,0x2ae)&1)|2;u16 sound=data_020e6e68[F(u16,actor,0x4e)];if(sound!=0xffff)Sound_PlayOwnedEffect(gSoundContext,sound>>7,sound&0x7f,actor,0,0x100);}}if(VecFx32Object_GetMagnitude((u8*)actor+0x29c)<0x333){func_ov096_0221880c((u8*)actor+0x29c,0,0,0);F(u16,actor,0xda)=0;}}
}

/* Store three vector components after the record's leading word. */
extern "C" void func_ov096_0221880c(void *record,s32 x,s32 y,s32 z){s32 *p=(s32*)record;if(p)p++;p[0]=x;p[1]=y;p[2]=z;}
/* Test whether inherited motion currently equals its target vector. */
extern "C" bool func_ov096_0221881c(void *actor){return !(F(u32,actor,0xd0)&0x10)&&F(u32,actor,0x24)==F(u32,actor,0x1dc);}
/* Start one transform pulse or damp its existing impulse vector. */
extern "C" s32 func_ov096_0221883c(void *actor){F(u32,actor,0x260)&=~0x20u;if(!func_ov096_02218590(actor))return 0;if(!F(s16,actor,0xda)&&func_ov096_0221881c(actor)&&F(s16,actor,0x298)<F(s16,actor,0x29a)){++F(s16,actor,0x298);F(u16,actor,0xd6)=1;func_ov096_0221880c((u8*)actor+0x29c,0,0,0);F(u32,actor,0x44)=0;F(u32,actor,0x260)|=0x20;return 1;}F(s32,actor,0x2a0)=(s32)(((s64)F(s32,actor,0x2a0) * 0xfae + 0x800)>>12);F(s32,actor,0x2a4)=(s32)(((s64)F(s32,actor,0x2a4) * 0xfae + 0x800)>>12);F(s32,actor,0x2a8)=(s32)(((s64)F(s32,actor,0x2a8) * 0xfae + 0x800)>>12);return 0;}

/* Follow the selected target and reflect accumulated motion on contact. */
extern "C" s32 func_ov096_02218958(void *actor,void *event,s32 mode)
{
    void *target=F(void*,actor,0x228);if(target)mode=F(s16,actor,0xda);if(!target||!mode)return ActorExtendedType2_UpdateTargetValidationMotion(actor,event,mode);
    ((V1)vm(actor,0xd0))(actor,(u8*)target+0x18);if(!(F(u32,actor,0x260)&8)){F(u32,actor,0x260)|=1;F(u8,actor,0x24c)=3;}
    if(F(s8,actor,0x4b)){if(!(F(u16,actor,0x2ae)&1)&&F(s16,actor,0x2ac)>10&&VecFx32Object_GetMagnitude((u8*)actor+0x29c)>0x666){F(s32,actor,0x8c)=-(F(s32,actor,0x3c)+F(s32,actor,0x8c));F(s32,actor,0x90)=-(F(s32,actor,0x40)+F(s32,actor,0x90));((M0)vm(actor,0x10c))(actor);Sound_PlayOwnedEffect(gSoundContext,0x1c7,2,actor,0,0x100);if(func_ov096_0221881c(actor))F(s32,actor,0x44)=0x2000;F(u16,actor,0x298)=0;func_ov096_0221880c((u8*)actor+0x29c,0,0,0);}F(u16,actor,0x2ae)|=1;}
    return 0;
}
/* Follow an existing target or use the inherited special-target lookup. */
extern "C" s32 func_ov096_02218aa4(void *actor,void *event,s32 mode){void *target=F(void*,actor,0x228);if(target)mode=F(s16,actor,0xda);if(!target||!mode)return ActorExtendedType2_LookupSpecialTarget65(actor,event,mode);((V1)vm(actor,0xd0))(actor,(u8*)target+0x18);return 0;}
/* Return the transform actor's fixed interaction category. */
extern "C" s32 func_ov096_02218adc(void){return 0x10;}
