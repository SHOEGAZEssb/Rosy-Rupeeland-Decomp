#include "tingle/types.h"

/*
 * Recovered overlay 83 linked actor pair subsystem.
 *
 * One ActorExtendedLinked actor owns presentation and state while a second
 * ActorExtendedLinkSource actor supplies a moving partner.  The pair exchange
 * link callbacks, target transforms, contact impulses, visibility, and timed
 * detach state. Unknown shared-class fields remain offset based.
 */
#define F(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
typedef s32 (*M0)(void *);
typedef s32 (*M1)(void *, void *);
typedef void (*V0)(void *);
typedef void (*V1)(void *, void *);

extern "C" void *gSoundContext;
extern "C" const u8 data_020e6adc[], data_020e6b74[];
extern "C" const u16 data_020e7318[];
extern "C" u8 data_ov083_02213e48[], data_ov083_02213e88[];
extern "C" u8 data_ov083_02213f78[], data_ov083_02214154[];
extern "C" void *ActorExtendedLinked_Init(void *, const void *);
extern "C" void *ActorExtendedLinked_Destroy(void *);
extern "C" void *ActorExtendedLinkSource_Init(void *, const void *);
extern "C" void *ActorExtendedLinkSource_Destroy(void *);
extern "C" void Heap_Free(void *);
extern "C" void ActorExtendedType2_InitializeReentryState(void *);
extern "C" void *Actor_GetCollection(void *);
extern "C" void *ActorCollection_GetSpriteOwner(void *);
extern "C" void GraphicsSpriteGroup_ReplaceStateResources(void *, void *, void *, void *, void *);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void Sound_StopEffect(void *, s32, s32);
extern "C" s32 ActorExtendedType2_UpdateTimedAttachmentTransition(void *);
extern "C" void Actor_RestoreSavedFlags(void *);
extern "C" void ActorExtendedType2_LaunchRandomMotion(void *);
extern "C" void ActorExtendedLinkSource_UpdateFrame(void *);
extern "C" s32 func_020adc90(s32, s32);
extern "C" void Actor_IntegrateMotion(void *);
extern "C" void VecFx32Object_Init(void *);
extern "C" void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern "C" void VecFx32Object_InitCopy(void *, const void *);
extern "C" void VecFx32Object_Assign(void *, const void *);
extern "C" void VecFx32Object_Destroy(void *);
extern "C" void func_020adff0(const void *, const void *, void *);
extern "C" void ActorExtendedLinkSource_ApplyContactResponse(void *, void *, s32);
extern "C" void ActorExtendedLinkSource_ClearPartnerLinkedFlag(void *);
extern "C" void ActorExtendedLinkSource_ClearRuntimeFlag2(void *);
extern "C" u32 genrand_int32(void);

extern "C" void func_ov083_02213734(void *, s32, s32, s32, s32);
extern "C" bool func_ov083_02213968(void *);
extern "C" void func_ov083_02213afc(void *, s32, s32, s32);
extern "C" void func_ov083_02213b14(void *, const void *, const void *);
extern "C" void func_ov083_02213bd4(void *, s32);

/* Resolve a vtable entry while the shared C++ class layout remains partial. */
static void *vm(void *actor, u32 offset) { return F(void *, F(void *, actor, 0), offset); }

/* Construct the presentation-owning member of the linked pair. */
extern "C" void *func_ov083_02212ae0(void *actor, const void *configuration)
{ ActorExtendedLinked_Init(actor, configuration); F(void *, actor, 0) = data_ov083_02213f78; return actor; }

/* Destroy the owning actor while retaining its allocation. */
extern "C" void *func_ov083_02212b00(void *actor)
{ ActorExtendedLinked_Destroy(actor); return actor; }

/* Destroy and free the owning actor. */
extern "C" void *func_ov083_02212b14(void *actor)
{ ActorExtendedLinked_Destroy(actor); Heap_Free(actor); return actor; }

/* Ignore the optional owner notification. */
extern "C" void func_ov083_02212b30(void) {}

/* Initialize reentry state and notify the linked source when active. */
extern "C" void func_ov083_02212b34(void *actor)
{
    ActorExtendedType2_InitializeReentryState(actor);
    if (F(s32, actor, 0x1fc) <= 0 && F(void *, actor, 0x298) != 0)
        ((V0)vm(F(void *, actor, 0x298), 0x1dc))(F(void *, actor, 0x298));
}

/* Install one resource set and its animation on the owner's sprite. */
static void install(void *actor, void *resource, s32 animation, u16 set, u16 clear)
{
    void *sprite = F(void *, actor, 0x54);
    GraphicsSpriteGroup_ReplaceStateResources(
        ActorCollection_GetSpriteOwner(Actor_GetCollection(actor)), sprite,
        F(void *, resource, 4), F(void *, resource, 8), F(void *, resource, 0xc));
    GraphicsSpriteState_SetAnimationIndex(sprite, animation);
    F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) & ~clear) | set;
}

/* Select owner presentation from action, link state, and descriptor traits. */
extern "C" void func_ov083_02212b68(void *actor)
{
    void *primary = F(void *, actor, 0x208);
    bool linked = F(void *, actor, 0x298) != 0 &&
                  (F(u32, F(void *, actor, 0x298), 0x29c) & 1) == 0;
    void *resource = linked ? F(void *, actor, 0x20c) : primary;
    void *sprite = F(void *, actor, 0x54);
    u16 delay = 0x100;
    if (F(s16, actor, 0xda) == 1) {
        install(actor, primary, 0x17, 0, 3);
        return;
    }
    s16 action = F(s16, actor, 0xd6);
    switch (action) {
    case 1:
        install(actor, resource, F(u8, actor, 0xd4) + 8, 0, 3); delay = 0; break;
    case 2: case 3: case 4:
        install(actor, resource, F(u8, actor, 0xd4) + 8, 2, 1); break;
    case 5: case 6:
        install(actor, resource, F(u8, actor, 0xd4), 2, 1); break;
    case 7:
        if (linked) install(actor, resource, F(u8, actor, 0xd4), 2, 1);
        else if (F(u8, sprite, 0x38) != 0x15) install(actor, primary, 0x15, 0, 3);
        break;
    case 8: case 9:
        install(actor, primary, F(u8, actor, 0xd4), 2, 1); break;
    case 11:
        GraphicsSpriteState_SetAnimationIndex(sprite, 0x12);
        F(u16, sprite, 0x24) = (F(u16, sprite, 0x24) | 2) & ~1u;
        break;
    case 17:
        if (data_020e6b74[F(u16, actor, 0x4e)] != 0) install(actor, primary, 0x15, 0, 3);
        break;
    case 18:
        install(actor, resource, 0x10, 2, 1); break;
    case 19:
        if (data_020e6adc[F(u16, actor, 0x4e)] != 0) install(actor, primary, 0x14, 0, 3);
        else install(actor, primary, 0, 2, 1);
        break;
    case 20:
        install(actor, primary, 0, 2, 1); break;
    case 22:
        install(actor, resource, 0x11, 2, 1); break;
    default: break;
    }
    F(u16, sprite, 0x36) = delay;
    F(u16, sprite, 0x30) = 0;
}

/* Complete the owner's link animation and notify both linked actors. */
extern "C" s32 func_ov083_02213170(void *actor)
{
    F(u32, actor, 0x260) &= ~1u; F(u8, actor, 0x24c) = 1;
    if (((M0)vm(actor, 0x38))(actor) != 0) return 0;
    void *partner = F(void *, actor, 0x298);
    bool linked = partner != 0 && (F(u32, partner, 0x29c) & 1) == 0;
    bool done = linked ? ++F(s16, actor, 0x25a) > 0x1e : (F(u16, F(void *, actor, 0x54), 0x24) & 1) != 0;
    if (!done) return 0;
    F(u16, actor, 0x25a) = 0; F(u16, actor, 0x256) = 0;
    F(u32, actor, 0x218) = F(u32, data_ov083_02213e48, 8);
    F(u32, actor, 0x21c) = F(u32, data_ov083_02213e48, 0xc);
    F(u32, actor, 0x260) |= 4;
    u16 sound = data_020e7318[F(u16, actor, 0x4e)];
    if (sound != 0xffff) Sound_StopEffect(gSoundContext, sound >> 7, sound & 0x7f);
    if (partner != 0 && (F(u32, partner, 0x29c) & 1) != 0)
        ((V0)vm(partner, 0x1d8))(partner);
    F(u16, actor, 0xda) = 0;
    return 1;
}

/* Update timed attachment state and exchange callbacks with the partner. */
extern "C" s32 func_ov083_022132b8(void *actor)
{
    s32 result = ActorExtendedType2_UpdateTimedAttachmentTransition(actor);
    void *partner = result != 0 ? F(void *, actor, 0x298) : 0;
    if (result != 0 && partner != 0) {
        ((V0)vm(partner, 0x114))(partner);
        ((V1)vm(partner, 0x1d4))(partner, actor);
    }
    return result;
}

/* Drive movement either toward the linked source or the stored target. */
extern "C" s32 func_ov083_022132fc(void *actor, void *event)
{
    if (((M0)vm(actor, 0x38))(actor) || ((M1)vm(actor, 0x134))(actor, event)) return 0;
    F(u32, actor, 0x260) = (F(u32, actor, 0x260) & ~1u) | 2;
    if ((F(u16, event, 0x1a) & 2) != 0) {
        F(u32, actor, 0x218) = F(u32, data_ov083_02213e48, 0x58);
        F(u32, actor, 0x21c) = F(u32, data_ov083_02213e48, 0x5c);
        return 0;
    }
    void *partner = F(void *, actor, 0x298);
    bool usable = partner != 0 && (F(u32, partner, 0x29c) & 1) == 0;
    bool pursue = false;
    void *target = 0;
    if (!usable && F(s16, actor, 0xda) < 1) {
        F(u32, actor, 0xd0) &= ~2u; F(void *, actor, 0x228) = 0;
        pursue = true;
    } else if (F(s16, actor, 0xda) == 0) {
        F(u32, actor, 0xd0) |= 2; F(void *, actor, 0x228) = partner;
        target = partner;
        pursue = true;
    } else if (F(s16, actor, 0xda) == 1 && (F(u16, F(void *, actor, 0x54), 0x24) & 1)) {
        F(u32, actor, 0x218) = F(u32, data_ov083_02213e48, 0x38);
        F(u32, actor, 0x21c) = F(u32, data_ov083_02213e48, 0x3c);
        F(u32, actor, 0x220) = F(u32, data_ov083_02213e48, 0x48);
        F(u32, actor, 0x224) = F(u32, data_ov083_02213e48, 0x4c);
        F(u16, actor, 0xda) = 0; F(u32, actor, 0xc8) = 0;
        F(u8, actor, 0xd4) = 4; F(void *, actor, 0x228) = 0;
        return 0;
    }
    if (pursue) {
        if (((M1)vm(actor, 0x11c))(actor,event) || ((M1)vm(actor,0x124))(actor,event) ||
            ((M1)vm(actor,0x12c))(actor,event) || ((M1)vm(actor,0x130))(actor,event)) return 0;
        s32 tx = target ? F(s32,target,0x1c) : F(s32,actor,0x230);
        s32 ty = target ? F(s32,target,0x20) : F(s32,actor,0x234);
        s32 dx=(F(s32,actor,0x1c)-tx)>>12, dy=(F(s32,actor,0x20)-ty)>>12;
        if (dx*dx+dy*dy < 0x24) {
            if (usable) {
                F(u16,actor,0xda)=1; F(u32,actor,0x260)&=~2u;
                ((V1)vm(partner,0x1d4))(partner,actor); F(u32,partner,0x14)&=~0x10u;
            } else {
                F(u32,actor,0x218)=F(u32,data_ov083_02213e48,0x10);
                F(u32,actor,0x21c)=F(u32,data_ov083_02213e48,0x14);
                F(u32,actor,0x220)=F(u32,data_ov083_02213e48,0x20);
                F(u32,actor,0x224)=F(u32,data_ov083_02213e48,0x24);
            }
        } else ((V1)vm(actor,0xd0))(actor, target ? (u8*)target+0x18 : (u8*)actor+0x22c);
    }
    return 0;
}

/* Restore ordinary flags and behavior callback pairs. */
extern "C" s32 func_ov083_02213648(void *actor)
{
    Actor_RestoreSavedFlags(actor); F(u32,actor,0x10)&=~0x1f0000u;
    F(u32,actor,0x218)=F(u32,data_ov083_02213e48,0x18); F(u32,actor,0x21c)=F(u32,data_ov083_02213e48,0x1c);
    F(u32,actor,0x220)=F(u32,data_ov083_02213e48,0x30); F(u32,actor,0x224)=F(u32,data_ov083_02213e48,0x34);
    F(u32,actor,0xd0)&=~0x200u; F(u16,actor,0xd6)=2; return 0;
}

/* Run the short launch countdown and swap callback pairs when it expires. */
extern "C" s32 func_ov083_022136a4(void *actor)
{
    F(u32,actor,0x260)&=~1u; F(u8,actor,0x24c)=8; F(u16,actor,0xd6)=0x16;
    if (--F(s16,actor,0x25a)<0) {
        F(u32,actor,0x218)=F(u32,data_ov083_02213e48,0); F(u32,actor,0x21c)=F(u32,data_ov083_02213e48,4);
        F(u32,actor,0x220)=F(u32,data_ov083_02213e48,0x28); F(u32,actor,0x224)=F(u32,data_ov083_02213e48,0x2c);
    }
    return 0;
}

/* Launch random motion and notify the linked source. */
extern "C" void func_ov083_0221370c(void *actor)
{
    ActorExtendedType2_LaunchRandomMotion(actor);
    if (F(void *,actor,0x298)) ((V0)vm(F(void *,actor,0x298),0x1dc))(F(void *,actor,0x298));
}

/* Store the source actor's four-word motion record. */
extern "C" void func_ov083_02213734(void *record,s32 a,s32 b,s32 c,s32 d)
{ F(s32,record,0)=a; F(s32,record,4)=b; F(s32,record,8)=c; F(s32,record,12)=d; }

/* Construct the linked source actor and initialize its motion accumulator. */
extern "C" void *func_ov083_02213748(void *actor,const void *configuration)
{
    ActorExtendedLinkSource_Init(actor,configuration); F(void *,actor,0)=data_ov083_02214154;
    func_ov083_02213734((u8*)actor+0x2a0,0,0,0,0x1800);
    F(u16,actor,0x2b0)=0; F(u16,actor,0x2b2)=0; F(u32,actor,0x260)&=~8u; return actor;
}

/* Destroy the linked source while retaining its allocation. */
extern "C" void *func_ov083_022137a8(void *actor)
{ ActorExtendedLinkSource_Destroy(actor); return actor; }

/* Destroy and free the linked source actor. */
extern "C" void *func_ov083_022137bc(void *actor)
{ ActorExtendedLinkSource_Destroy(actor); Heap_Free(actor); return actor; }

/* Update linked-source angular motion, damping, sprite rotation, and detach. */
extern "C" void func_ov083_022137d8(void *actor)
{
    if (F(u32,actor,0x14)&0x200000) return;
    ActorExtendedLinkSource_UpdateFrame(actor);
    if ((F(u32,actor,0x29c)&1)==0) {
        F(s32,actor,0x2a0)+=(s32)(((s64)F(s32,actor,0x2a4)*0x1800+0x800)>>12);
        F(s32,actor,0x2a4)+=(s32)(((s64)F(s32,actor,0x2a8)*0x1800+0x800)>>12);
        s32 force=(s32)(((s64)-0x333*F(s32,actor,0x2a4)+0x800)>>12);
        force+=(s32)(((s64)(-0x333>>2)*F(s32,actor,0x2a0)+0x800)>>12);
        F(s32,actor,0x2a8)=func_020adc90(force,F(s32,actor,0x2ac));
        s32 angle=F(s32,actor,0x2a0); F(s16,actor,0x2b0)=(s16)((angle+(s32)((u32)(angle>>3)>>28))>>4);
    } else { F(u16,actor,0x2b0)=0; F(u32,actor,0x14)|=6; }
    F(u16,F(void*,actor,0x54),0x30)=F(u16,actor,0x2b0);
    void *partner=F(void*,actor,0x298);
    if (partner && func_ov083_02213968(partner) && !func_ov083_02213968(actor))
        ((V0)vm(actor,0x100))(actor);
    F(u32,actor,0x260)&=~2u;
}

/* Test whether the actor has the linked callback pair. */
extern "C" bool func_ov083_02213968(void *actor)
{
    u32 first=F(u32,actor,0x218);
    return first==F(u32,data_ov083_02213e48,0x40) &&
        (F(u32,actor,0x21c)==F(u32,data_ov083_02213e88,4)||first==0);
}

/* Integrate ordinary motion or snap an attached source to its partner. */
extern "C" void func_ov083_022139b0(void *actor)
{
    if ((F(u32,actor,0x29c)&1)==0) {
        F(u32,actor,0x29c)&=~2u; Actor_IntegrateMotion(actor);
        void *partner=F(void*,actor,0x298); if (!partner) return;
        void *sprite=F(void*,actor,0x54);
        if (F(u16,actor,0x2b2)) {
            --F(u16,actor,0x2b2);
            if(F(u16,actor,0x2b2)&4) F(u16,sprite,0x24)|=0x10; else F(u16,sprite,0x24)&=~0x10u;
        } else if(func_ov083_02213968(actor)) F(u16,sprite,0x24)|=0x10; else F(u16,sprite,0x24)&=~0x10u;
        return;
    }
    func_ov083_02213afc((u8*)actor+0x38,0,0,0); func_ov083_02213afc((u8*)actor+0x88,0,0,0);
    func_ov083_02213afc((u8*)actor+0x98,0,0,0);
    u8 axis[0x10], target[0x10]; s32 z=((M0)vm(actor,0x1e0))(actor);
    VecFx32Object_InitComponents(axis,0,0,z); func_ov083_02213b14(target,(u8*)F(void*,actor,0x298)+0x18,axis);
    VecFx32Object_Destroy(axis); VecFx32Object_Assign((u8*)actor+0x18,target); VecFx32Object_Assign((u8*)actor+0x28,target);
    F(u16,F(void*,actor,0x54),0x24)|=0x10; VecFx32Object_Destroy(target);
}

/* Store three vector coordinates after the leading ABI word. */
extern "C" void func_ov083_02213afc(void *v,s32 x,s32 y,s32 z)
{ u8 *p=v?(u8*)v+4:(u8*)v; F(s32,p,0)=x; F(s32,p,4)=y; F(s32,p,8)=z; }

/* Return the source actor's fixed interaction mask. */
extern "C" u32 func_ov083_02213b0c(void) { return 0x20000; }

/* Build the displacement between two vector objects. */
extern "C" void func_ov083_02213b14(void *out,const void *a,const void *b)
{ VecFx32Object_Init(out); func_020adff0(a?(const u8*)a+4:a,b?(const u8*)b+4:b,(u8*)out+4); }

/* Apply a horizontal impulse for direct contacts, then run base response. */
extern "C" void func_ov083_02213b4c(void *actor,void *other,s32 kind)
{
    if(kind==0 && (F(u8,other,0x4d)==2||F(u8,other,0x4d)==7||F(u8,other,0x4d)==1))
        func_ov083_02213bd4((u8*)actor+0x2a0,F(s32,other,0x1c)-F(s32,actor,0x1c)>0?0x2800:-0x2800);
    ActorExtendedLinkSource_ApplyContactResponse(actor,other,kind);
}

/* Reset the source motion record with a horizontal velocity. */
extern "C" void func_ov083_02213bd4(void *record,s32 velocity)
{ F(s32,record,0)=0; F(s32,record,4)=velocity; F(s32,record,8)=0; }

/* Clear partner linkage, choose a launch side, and copy the partner position. */
extern "C" void func_ov083_02213be8(void *actor)
{
    ActorExtendedLinkSource_ClearPartnerLinkedFlag(actor);
    func_ov083_02213bd4((u8*)actor+0x2a0,(genrand_int32()&1)?0x4000:-0x4000);
    if(F(void*,actor,0x298)) VecFx32Object_Assign((u8*)actor+0x18,(u8*)F(void*,actor,0x298)+0x18);
    F(u32,actor,0x14)=(F(u32,actor,0x14)&~6u)|0x10;
}

/* Clear runtime flag two and start a 32-frame visibility blink. */
extern "C" void func_ov083_02213c3c(void *actor)
{ ActorExtendedLinkSource_ClearRuntimeFlag2(actor); F(u16,actor,0x2b2)=0x20; F(u32,actor,0x14)|=6; }

/* Return false for the optional source predicate. */
extern "C" s32 func_ov083_02213c64(void) { return 0; }

/* Copy another actor's embedded position vector. */
extern "C" void func_ov083_02213c6c(void *out,const void *actor)
{ VecFx32Object_InitCopy(out,(const u8*)actor+0x18); }

/* Report the source actor's 0x80 runtime bit. */
extern "C" u32 func_ov083_02213c7c(void *actor) { return F(u32,actor,0xd0)&0x80; }
/* Report the source actor's 0x40 runtime bit. */
extern "C" bool func_ov083_02213c88(void *actor) { return (F(u32,actor,0xd0)&0x40)!=0; }
/* Return false for the second optional source predicate. */
extern "C" s32 func_ov083_02213c9c(void) { return 0; }
/* Ignore the first source notification. */
extern "C" void func_ov083_02213ca4(void) {}
/* Ignore the second source notification. */
extern "C" void func_ov083_02213ca8(void) {}
/* Return the fixed interaction radius. */
extern "C" s32 func_ov083_02213cac(void) { return 0x10; }
/* Return the embedded world-position object. */
extern "C" void *func_ov083_02213cb4(void *actor) { return (u8*)actor+0x18; }
/* Return the fixed collision mask. */
extern "C" u32 func_ov083_02213cbc(void) { return 0xc0000; }
/* Dispatch the first actor callback with a zero third argument. */
extern "C" void func_ov083_02213cc4(void *actor,void *other) { ((void(*)(void*,void*,s32))vm(actor,0x108))(actor,other,0); }
/* Dispatch the parallel actor callback with a zero third argument. */
extern "C" void func_ov083_02213cdc(void *actor,void *other) { ((void(*)(void*,void*,s32))vm(actor,0x108))(actor,other,0); }
/* Return no optional source object. */
extern "C" s32 func_ov083_02213cf4(void) { return 0; }
/* Mark the source behavior descriptor active. */
extern "C" void func_ov083_02213cfc(void *actor) { F(u32,actor,0x260)|=0x10; }
/* Report whether the queued source interaction can execute. */
extern "C" s32 func_ov083_02213d0c(void *actor) { return (F(u32,actor,0x260)&8)&&(F(u32,actor,0x260)&2)&&!((M0)vm(actor,0xa8))(actor); }
/* Report action byte eight. */
extern "C" bool func_ov083_02213d54(void *actor) { return F(u8,actor,0x24c)==8; }
/* Report current action five or six. */
extern "C" bool func_ov083_02213d68(void *actor) { s16 s=F(s16,actor,0xd6); return s==5||s==6; }
/* Report previous action nine or ten. */
extern "C" bool func_ov083_02213d80(void *actor) { s16 s=F(s16,actor,0xd8); return s==9||s==10; }
/* Report current action nine or ten. */
extern "C" bool func_ov083_02213d98(void *actor) { s16 s=F(s16,actor,0xd6); return s==9||s==10; }
/* Return the first fixed source scale. */
extern "C" s32 func_ov083_02213db0(void) { return 0x800; }
/* Return the second fixed source scale. */
extern "C" s32 func_ov083_02213db8(void) { return 0x800; }
/* Ignore the first late source notification. */
extern "C" void func_ov083_02213dc0(void) {}
/* Ignore the second late source notification. */
extern "C" void func_ov083_02213dc4(void) {}
/* Toggle bit two on the auxiliary sprite object. */
extern "C" void func_ov083_02213dc8(void *actor,s32 enabled) { void *o=F(void*,actor,0x288); if(!enabled)F(u16,o,0x24)|=4;else F(u16,o,0x24)&=~4u; }
/* Return the secondary interaction mask. */
extern "C" u32 func_ov083_02213de8(void) { return 0x20000; }
/* Accept ordinary actions only while the source remains linked. */
extern "C" s32 func_ov083_02213df0(void *actor) { return F(s16,actor,0xd6)!=0x10 && (F(u32,actor,0x29c)&1)==0; }
/* Reject only action sixteen. */
extern "C" bool func_ov083_02213e14(void *actor) { return F(s16,actor,0xd6)!=0x10; }
