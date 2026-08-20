#include "tingle/types.h"

/*
 * Overlay 53 field-effect scene lifecycle, graphics setup, and static callback
 * initialization. Exact assembly preserves cleanup, GameWork, and MMIO ordering.
 */

extern "C" u32 data_ov053_0220dd10[];
extern "C" u16 data_ov053_0220dcb0[];
extern "C" u8 data_ov053_0220dd7c[], data_ov053_0220dd80[], data_ov053_0220dd82[];
extern "C" u8 data_ov053_0220dd40[], data_ov053_0220dd4c[], data_ov053_0220dd58[];
extern "C" u8 data_ov053_0220dd64[], data_ov053_0220dd70[], data_ov053_0220dd84[];
extern "C" u8 data_ov053_0220dd8c[], data_ov053_0220dd94[], data_ov053_0220dd9c[];
extern "C" u32 data_ov053_0220dd30[];
extern "C" void *data_021052fc, *gDebugFont, *gGameWork, *gSoundContext, *gHeapContext;
extern "C" void TimedSpritePresentation_InitBase(void *);
extern "C" void *func_ov053_0220d600(void *);
extern "C" void func_ov053_0220da60(void *);
extern "C" void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern "C" void AnimationResource_Init(void *,s32,s32,s32);
extern "C" void AnimationResource_Assign(void *,const void *);
extern "C" void AnimationResource_Destroy(void *);
extern "C" void *GraphicsSpriteGroup_CreateStateFromSource(void *,void *,s32);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *,s32);
extern "C" s32 GameWork_TestFlag(void *,u16);

/* Construct the caller-owned field-effect scene and return it; graphics and GameWork state change. */
extern "C" void *func_ov053_0220d624(void *scene, u32 mode)
{
    u8 *s=(u8*)scene; TimedSpritePresentation_InitBase(scene);
    *(u32**)s=data_ov053_0220dd10; func_ov053_0220d600(s+0x24);
    *(u16*)(s+0x34)=(u16)mode; *(u16*)(s+0x36)=0; *(u16*)(s+0x38)=0;
    func_ov053_0220da60(scene);
    *(void**)(s+8)=GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    u8 resource[16]; AnimationResource_Init(resource,0x2189,0x218a,0x218b);
    AnimationResource_Assign(s+0x24,resource); AnimationResource_Destroy(resource);
    for(s32 i=0;i<5;i++){
        void *sprite=GraphicsSpriteGroup_CreateStateFromSource(*(void**)(s+8),s+0x28,2);
        *(void**)(s+0xc+i*4)=sprite;
        GraphicsSpriteState_SetAnimationIndex(sprite,GameWork_TestFlag(gGameWork,data_ov053_0220dcb0[i])?i+1:0);
        *(u16*)((u8*)sprite+0x24)|=2;
        *(s16*)((u8*)sprite+0x2c)=*(s16*)(data_ov053_0220dd7c+i*8+4);
        *(s16*)((u8*)sprite+0x2e)=*(s16*)(data_ov053_0220dd7c+i*8+6);
        *(u16*)((u8*)sprite+0x28)=1;
    }
    void *sprite=GraphicsSpriteGroup_CreateStateFromSource(*(void**)(s+8),s+0x28,2);
    *(void**)(s+0x20)=sprite; GraphicsSpriteState_SetAnimationIndex(sprite,(mode+6)&0xff);
    *(s16*)((u8*)sprite+0x2c)=*(s16*)(data_ov053_0220dd80+mode*8);
    *(s16*)((u8*)sprite+0x2e)=*(s16*)(data_ov053_0220dd82+mode*8);
    *(u16*)((u8*)sprite+0x24)|=6; *(u16*)((u8*)sprite+0x28)=0;
    *(u16*)((u8*)sprite+0x32)=0x20; *(u16*)((u8*)sprite+0x34)=0x20;
    *(u16*)(s+0x3e)=0; *(u16*)(s+0x36)=100; *(u16*)(s+0x3a)=5;
    return scene;
}
/* Destroy scene-owned resources without freeing `scene`, return it, and update graphics/task/SDK state. */
extern "C" void GraphicsSpriteGroupOwner_DestroyGroup(void *,void *);
extern "C" void AnimationResourceState_ReleaseResources(void *);
extern "C" void *OverlayManager_GetGlobal(void);
extern "C" void OverlayManager_UnloadOverlay(void *,s32);
extern "C" void func_0201e28c(void *);
static void *ov053_destroy(void *scene){u8*s=(u8*)scene;*(u32**)s=data_ov053_0220dd10;GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont,*(void**)(s+8));AnimationResourceState_ReleaseResources(s+0x28);OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(),0);AnimationResource_Destroy(s+0x24);func_0201e28c(scene);return scene;}
extern "C" void *func_ov053_0220d7fc(void *scene){return ov053_destroy(scene);}
/* Destroy and free `scene`, return its former identity, and update heap/graphics/task/SDK state. */
extern "C" void Heap_Free(void *);
extern "C" void *func_ov053_0220d850(void *scene){ov053_destroy(scene);Heap_Free(scene);return scene;}
/* Advance input, audio, GameWork, transition, and effect state; return the recovered scene status. */
extern "C" void Sound_Play(void *,s32,s32);
extern "C" void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern "C" void GameWork_ClearFlag(void *,u16);
extern "C" s32 func_ov053_0220d8ac(void *scene)
{u8*s=(u8*)scene;*(u16*)(s+0x3e)+=0x100;s16 phase=*(s16*)(s+0x38);if(phase==0){if(--*(s16*)(s+0x36)<=0){*(u16*)((u8*)*(void**)(s+0x20)+0x24)&=(u16)~4;*(s16*)(s+0x36)=0;phase=++*(s16*)(s+0x38);}}if(phase==1){*(s16*)(s+0x3c)+=0x10;if(*(s16*)(s+0x3c)>=0x200){Sound_Play(gSoundContext,0x15e,5);u16 mode=*(u16*)(s+0x34);GraphicsSpriteState_SetAnimationIndex(*(void**)(s+0xc+mode*4),(mode+1)&0xff);*(s16*)(s+0x3c)=0x200;phase=++*(s16*)(s+0x38);}}if(phase==2){*(s16*)(s+0x3c)-=0x10;if(*(s16*)(s+0x3c)<=0x20){*(u16*)((u8*)*(void**)(s+0x20)+0x24)|=4;*(s16*)(s+0x3c)=0;}}void*sp=*(void**)(s+0x20);*(s16*)((u8*)sp+0x32)=*(s16*)(s+0x3c);*(s16*)((u8*)sp+0x34)=*(s16*)(s+0x3c);*(u16*)((u8*)sp+0x30)=*(u16*)(s+0x3e);GraphicsSpriteGroup_AdvanceAnimations(*(void**)(s+8));if(GameWork_TestFlag(gGameWork,0x413)!=1)return 0;GameWork_ClearFlag(gGameWork,0x413);return 1;}
/* Allocate, construct, and register a scene; return the allocation and update heap/scene-manager state. */
extern "C" void *Heap_Alloc(s32,const void*,s32,void*);
extern "C" void PresentationList_AppendObject(void *,void *);
extern "C" void *func_ov053_0220da0c(u32 mode){void*p=Heap_Alloc(0x40,data_ov053_0220dd30,4,gHeapContext);if(p)p=func_ov053_0220d624(p,mode);PresentationList_AppendObject((u8*)data_021052fc+0x2f7c,p);return p;}
/* Configure/load/apply temporary graphics resources and BG scroll state; VRAM, display MMIO, and SDK state change. */
extern "C" void GraphicsResourceSet_Init(void*);extern "C" void GraphicsResourceSet_Load(void*,void*,s32,s32,s32);extern "C" void func_02072048(void*,s32,s32);extern "C" void GraphicsResourceSet_ReleaseHandles(void*);extern "C" void GraphicsResourceSet_Apply(void*,s32,s32);extern "C" void GraphicsResourceSet_Destroy(void*);extern "C" void BgScroll_SetMainBg2(s32,s32);extern "C" void BgScroll_SetSubBg2(s32,s32);extern "C" void *data_020f4e18;
extern "C" void func_ov053_0220da60(void *){u32 set[3];GraphicsResourceSet_Init(set);GraphicsResourceSet_Load(set,data_020f4e18,0xa12f,0xa130,0xa131);func_02072048(set,2,0);GraphicsResourceSet_ReleaseHandles(set);volatile u16*sub=(volatile u16*)0x0400100c;*sub=(*sub&0x43)|0x1a00;GraphicsResourceSet_Load(set,data_020f4e18,0xa12c,0xa12d,0xa12e);GraphicsResourceSet_Apply(set,2,0);volatile u32*disp=(volatile u32*)0x04001000;u32 planes=(*disp&0x1f00)>>8;*disp=(*disp&~0x1f00)|((planes|4)<<8);BgScroll_SetMainBg2(0,0);BgScroll_SetSubBg2(0,0);*(volatile u16*)0x0400000c&=(u16)~3;*(volatile u16*)0x0400100c&=(u16)~3;GraphicsResourceSet_Destroy(set);}
/* Construct and register five static coordinate callback objects during overlay initialization; global runtime state changes. */
extern "C" void func_ov053_0220db84(void*,u16,u16);extern "C" void func_ov053_0220db9c(void*);extern "C" void __register_global_object(void*,void(*)(void*),void*);
extern "C" void __sinit_ov053_0220dbb4(void){u8*objects[5]={data_ov053_0220dd7c,data_ov053_0220dd84,data_ov053_0220dd8c,data_ov053_0220dd94,data_ov053_0220dd9c};u8*records[5]={data_ov053_0220dd58,data_ov053_0220dd4c,data_ov053_0220dd64,data_ov053_0220dd40,data_ov053_0220dd70};const u16 xy[5][2]={{0x5c,0x94},{0x68,0x7c},{0x80,0x74},{0x98,0x7c},{0xa8,0x94}};for(s32 i=0;i<5;i++){func_ov053_0220db84(objects[i],xy[i][0],xy[i][1]);__register_global_object(objects[i],func_ov053_0220db9c,records[i]);}}
