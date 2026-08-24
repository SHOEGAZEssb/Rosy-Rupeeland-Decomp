#include "tingle/types.h"

/* Portable recovery of the complete overlay-52 Pinkle message-menu scene. */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void *(*DeletingDestructor)(void *object);
typedef struct Overlay052ResourceSet {
    void *resource0;
    void *resource1;
    void *resource2;
} Overlay052ResourceSet;

extern u8 data_ov052_0220e1e0[], data_ov052_0220e1e4[];
extern u8 data_ov052_0220e1e8[], data_ov052_0220e1ec[];
extern u8 data_ov052_0220e200[], data_ov052_0220e21c[];
extern u8 data_ov052_0220e224[], data_ov052_0220e240[];
extern void *data_020f4e18, *data_021052fc;
extern u8 data_021f4020[];
extern void *gDebugFont, *gGamePhaseCurrencyHud, *gSceneManager;
extern void *gSoundContext, *gTouchPanelManager;
extern u8 gDisplayBrightnessPair[], gHeapContext[];
extern const u16 gPadState1[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *); extern void Heap_Free(void *);
extern void *GraphicsArchive_AcquireVfdResource(void *, u32); extern void GraphicsArchive_ReleaseResourceE4(void *, void *);
extern void *TitleDialog_Init(void *, void *, void *);
extern void TitleDialog_SetText(void *, const void *, s32); extern s32 TitleDialog_UpdateTextPage(void *, const void *);
extern void TitleDialog_ResetAfterClose(void *); extern void func_020939c8(void *); extern void TitleDialog_ClearTextRect(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *); extern void GraphicsSpriteGroup_Destroy(void *);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *); extern void *AnimationResource_Init(void *, u32, u32, u32);
extern void *GraphicsSpriteState_Create(void *, const void *, u8, u8, u16, u16, u16);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern u32 genrand_int32(void); extern void *DisplayBrightnessPair_GetScreen(void *, u32);
extern void DisplayBrightness_StartTransition(void *, s32, s32, s32); extern s32 DisplayBrightness_GetCurrent(void *);
extern void Sound_Play(void *, s32, s32); extern void GamePhaseCurrencyHud_SetVisible(void *, s32);
extern void GamePhaseRuntime_SetPlacementMode(void *, s32, s32); extern void GamePhaseAreaScene_SetEnabled(void *, s32);
extern void GamePhaseRuntime_ApplyScreenMode(void *, s32, s32); extern void *RetailSelectionDatabase_GetMessageRecordById(void *, u16);
extern void *SceneManager_GetCurrent(void *); extern s32 Scene_HasFlags03(void *);
extern void Scene_ClearFlags03(void *); extern void Scene_SetFlags03(void *);
extern void GXS_SetGraphicsMode(u32); extern void GX_SetBankForSubBG(u32); extern void func_020aea7c(u32);
extern void GraphicsResourceSet_Init(void *); extern void GraphicsResourceSet_Load(void *, void *, u32, u32, u32);
extern void GraphicsResourceSet_ReleaseHandles(void *); extern void *GraphicsResourceSet_Destroy(void *);
extern void func_020706c4(void *, s32, s32); extern void func_02070bc4(void *, u32);
extern void GraphicsBgMapResource_UploadToSubBg(void *, s32, s32); extern void func_020b44e8(void);
extern void func_020afd28(volatile void *, const void *, s32, s32, s32, s32);

void func_ov052_0220d600(void *, u32, u32, u32, u32);

/* Construct all owned dialog and sprite resources; borrowed archives persist. */
void *Overlay052Scene_Init(void *scene, u32 mode, u32 variant)
{
    u8 *s=(u8 *)scene; void *dialog,*resource,*sprite;
    FIELD(void *,s,0)=data_ov052_0220e200; FIELD(s16,s,4)=0; FIELD(u16,s,8)=0;
    FIELD(void *,s,0xc)=0; FIELD(void *,s,0x10)=0; FIELD(s32,s,0x28)=0;
    FIELD(u16,s,0x2c)=(u16)mode; FIELD(u16,s,0x2e)=(u16)variant;
    FIELD(void *,s,0xc)=GraphicsArchive_AcquireVfdResource(data_020f4e18,0x7007);
    dialog=Heap_Alloc(0xec,data_ov052_0220e21c,4,gHeapContext);
    if(dialog) dialog=TitleDialog_Init(dialog,gDebugFont,FIELD(void *,s,0xc));
    FIELD(void *,s,0x10)=dialog; func_ov052_0220d600(dialog,0x47,0x2f,0x86,0x50);
    FIELD(s32,dialog,0xc0)=0; FIELD(s32,dialog,0xd0)=9; FIELD(s32,dialog,0xd4)=0; FIELD(s32,dialog,0xbc)=-2;
    FIELD(void *,s,0x1c)=GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    resource=Heap_Alloc(0x10,data_ov052_0220e224,4,gHeapContext);
    if(resource) resource=AnimationResource_Init(resource,0x14ec,0x14ed,0x14ee);
    FIELD(void *,s,0x20)=resource;
    sprite=GraphicsSpriteState_Create(FIELD(void *,s,0x1c),resource,0,0,0,0,2);
    FIELD(void *,s,0x18)=sprite; FIELD(s16,sprite,0x2c)=0x26; FIELD(s16,sprite,0x2e)=0x5b;
    sprite=GraphicsSpriteState_Create(FIELD(void *,s,0x1c),resource,0,0,0,0,2);
    FIELD(void *,s,0x14)=sprite; FIELD(s16,sprite,0x2c)=0x26; FIELD(s16,sprite,0x2e)=0x6d;
    FIELD(s32,s,0x24)=4;
    DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1),0,-16,0);
    FIELD(u16,s,0x30)=(FIELD(u16,gGamePhaseCurrencyHud,0xb0)&1)==0;
    if(FIELD(s16,s,0x30)) GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud,0);
    GamePhaseRuntime_SetPlacementMode(data_021052fc,0,1);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont); return scene;
}

/* Release all owned resources while retaining caller-owned scene storage. */
void *Overlay052Scene_Destroy(void *scene)
{
    u8 *s=(u8 *)scene; void *o; FIELD(void *,s,0)=data_ov052_0220e200;
    o=FIELD(void *,s,0x10); if(o) ((DeletingDestructor *)FIELD(void *,o,0))[1](o);
    GraphicsArchive_ReleaseResourceE4(data_020f4e18,FIELD(void *,s,0xc)); GraphicsSpriteGroup_Destroy(FIELD(void *,s,0x1c));
    o=FIELD(void *,s,0x20); if(o) ((DeletingDestructor *)FIELD(void *,o,0))[1](o);
    if(FIELD(void *,data_021052fc,0x2fb8)) GamePhaseRuntime_ApplyScreenMode(data_021052fc,1,1);
    if(FIELD(s16,s,0x2c)) DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1),-16,0,4);
    if(FIELD(s16,s,0x30)) GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud,1);
    return scene;
}

/* Release resources and heap-owned scene storage, returning its old identity. */
void *func_ov052_0220d968(void *scene){Overlay052Scene_Destroy(scene);Heap_Free(scene);return scene;}

/* Randomize or restart a decoration and return the resulting sprite flags. */
s32 Overlay052Scene_RestartDecoration(void *scene, void *restart)
{
    u8 *s=(u8 *)scene; void *sprite=FIELD(void *,s,0x18); u32 i=(u32)FIELD(s32,s,0x28); u16 flags;
    if(restart){FIELD(s32,s,0x24)=0xc8;GraphicsSpriteState_SetAnimationIndex(sprite,data_ov052_0220e1e4[i]);}
    else if(--FIELD(s32,s,0x24)<0){FIELD(u16,sprite,0x24)&=0xfffeu;
        if(genrand_int32()%10==5){FIELD(s32,s,0x24)=0xc8;GraphicsSpriteState_SetAnimationIndex(sprite,data_ov052_0220e1e4[i]);}
        else{FIELD(s32,s,0x24)=(s32)(genrand_int32()&7)*0x1e;GraphicsSpriteState_SetAnimationIndex(sprite,data_ov052_0220e1e8[i]);}}
    flags=(u16)(FIELD(u16,sprite,0x24)&0xfffbu);FIELD(u16,sprite,0x24)=flags;return flags;
}

/* Load sub-screen resources, preserving the enclosing scene's flag state. */
void Overlay052Scene_LoadSubScreenResources(void *scene)
{
    Overlay052ResourceSet r; s32 transform[4]={0x1000,0,0,0x1000};
    void *current=SceneManager_GetCurrent(gSceneManager); s32 restore=Scene_HasFlags03(current);
    volatile u32 *display=(volatile u32 *)0x04001000; volatile u16 *bg=(volatile u16 *)0x04001008;
    (void)scene; Scene_ClearFlags03(current); GXS_SetGraphicsMode(5);
    *display=(*display&~0x1f00u)|0x1500u; GX_SetBankForSubBG(4); func_020aea7c(0x80);
    bg[0]=(u16)((bg[0]&0x43u)|0x3c80u); bg[2]=(u16)((bg[2]&0x43u)|0x7e10u);
    bg[0]=(u16)((bg[0]&~3u)|3u); bg[2]=(u16)((bg[2]&~3u)|1u); *(volatile u32 *)(bg+4)=0;
    GraphicsResourceSet_Init(&r); GraphicsResourceSet_Load(&r,data_020f4e18,0x900a,0x9008,0x900b);
    func_020b44e8(); func_020706c4(r.resource0,2,0); func_02070bc4(r.resource1,0x4000);
    GraphicsBgMapResource_UploadToSubBg(r.resource2,2,0); GraphicsResourceSet_ReleaseHandles(&r);
    GraphicsResourceSet_Load(&r,data_020f4e18,0x9007,0x9008,0x9009); func_020b44e8();
    func_020706c4(r.resource0,0,0); GraphicsBgMapResource_UploadToSubBg(r.resource2,0,0); GraphicsResourceSet_ReleaseHandles(&r);
    func_020afd28((volatile void *)0x04001020,transform,0,0,0,0);
    func_020afd28((volatile void *)0x04001030,transform,0,0,0,0);
    if(restore) Scene_SetFlags03(SceneManager_GetCurrent(gSceneManager)); GraphicsResourceSet_Destroy(&r);
}

/* Advance the five-state message-menu VM; one means fade-out completed. */
s32 Overlay052Scene_UpdateMessageMenu(void *scene)
{
    u8 *s=(u8 *)scene; u16 input[11]; s32 state,index,result,i;
    for(i=0;i<11;++i) input[i]=gPadState1[i]; state=FIELD(s16,s,4);
    switch(state){
    case 0:
        if(FIELD(void *,data_021052fc,0x2fb8)) GamePhaseAreaScene_SetEnabled(FIELD(void *,data_021052fc,0x2fb8),0);
        Overlay052Scene_LoadSubScreenResources(s);
        if(FIELD(s16,s,0x2e)==0) DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1),0,0,0);
        FIELD(s16,s,4)=FIELD(s16,s,8)!=0?2:1; break;
    case 1:
        (void)Overlay052Scene_RestartDecoration(s,0); index=FIELD(s32,s,0x28);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *,s,0x14),data_ov052_0220e1ec[index]); break;
    case 2:{
        void *dialog=FIELD(void *,s,0x10),*choice=FIELD(void *,s,0x14),*decoration=FIELD(void *,s,0x18); u32 flags;
        if(FIELD(s32,gTouchPanelManager,4)==1){flags=FIELD(u32,dialog,0x38);input[1]|=(flags&2u)?1u:2u;}
        result=TitleDialog_UpdateTextPage(dialog,input);
        if(result&0x200){index=FIELD(s32,dialog,0xe8);FIELD(s32,s,0x28)=index;
            GraphicsSpriteState_SetAnimationIndex(choice,data_ov052_0220e1ec[index]);(void)Overlay052Scene_RestartDecoration(s,(void *)1);}
        if((result&1)==0)(void)Overlay052Scene_RestartDecoration(s,0);
        if(result&2){if(FIELD(u16,choice,0x24)&1u)GraphicsSpriteState_SetAnimationIndex(choice,data_ov052_0220e1e0[FIELD(s32,s,0x28)]);}
        else if(result&1){GraphicsSpriteCanvas_FillRect(gDebugFont,0,0,0xff,0xbf,0);FIELD(s16,s,4)=1;FIELD(u16,s,8)=0;}
        else{u8 desired;FIELD(u16,choice,0x24)&=0xfffdu;index=FIELD(s32,s,0x28);desired=data_ov052_0220e1ec[index];
            if(desired!=FIELD(u8,choice,0x38)){GraphicsSpriteState_SetAnimationIndex(choice,desired);desired=data_ov052_0220e1e8[index];
                if(desired==FIELD(u8,decoration,0x38)||(FIELD(u16,decoration,0x24)&1u)){FIELD(s32,s,0x24)=0xc8;
                    FIELD(u16,decoration,0x24)&=0xfffeu;GraphicsSpriteState_SetAnimationIndex(decoration,data_ov052_0220e1e4[index]);}}
            else if(FIELD(u16,choice,0x24)&1u){FIELD(u16,choice,0x24)&=0xfffeu;GraphicsSpriteState_SetAnimationIndex(choice,desired);}}
        FIELD(u16,choice,0x24)&=0xfffbu; break;}
    case 3:
        FIELD(u16,FIELD(void *,s,0x18),0x24)|=4u;FIELD(u16,FIELD(void *,s,0x14),0x24)|=4u;return 0;
    case 4:
        if(DisplayBrightness_GetCurrent(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1))==-16)return 1;break;
    default:break;}
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *,s,0x1c));return 0;
}

/* Install or close a message and update the retained selection/active flag. */
void Overlay052Scene_SetMessage(void *scene, void *message, u32 reveal)
{
    u8 *s=(u8 *)scene;void *dialog=FIELD(void *,s,0x10);
    if(message){s32 state=FIELD(s16,s,4),result;if(state==2)TitleDialog_ResetAfterClose(dialog);else if(state==1||state==3)FIELD(s16,s,4)=2;
        TitleDialog_ClearTextRect(dialog);TitleDialog_SetText(dialog,message,0);result=TitleDialog_UpdateTextPage(dialog,data_ov052_0220e240);
        FIELD(s32,s,0x28)=(result&0x200)?FIELD(s32,dialog,0xe8):0;if(reveal)func_020939c8(dialog);FIELD(u16,s,8)=1;}
    else{TitleDialog_ResetAfterClose(dialog);if(FIELD(s16,s,4)==2)FIELD(s16,s,4)=1;FIELD(u16,s,8)=0;}
}

/* Resolve a borrowed message-table entry and forward it to the menu VM. */
void Overlay052Scene_SetMessageById(void *scene,u16 messageId,u32 reveal)
{Overlay052Scene_SetMessage(scene,RetailSelectionDatabase_GetMessageRecordById(data_021f4020,messageId),reveal);}

/* Enter state four, play the confirmation cue, and start the fade. */
void Overlay052Scene_BeginConfirmationFade(void *scene)
{FIELD(s16,scene,4)=4;Sound_Play(gSoundContext,0,0x3a);DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1),0,-16,4);}

#ifdef __cplusplus
}
#endif
