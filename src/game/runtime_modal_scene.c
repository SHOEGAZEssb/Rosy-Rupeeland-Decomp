#include "tingle/types.h"
#include "tingle/heap.h"
#include "tingle/scene.h"
#include "tingle/display_brightness.h"

/* Recovered modal scene entered by runtime commands 60/64. It owns the menu
 * controller and sub-screen effects, advances their frames, and stages the
 * confirmed completion area and GameWork result fields. */
#define F(t,p,o) (*(t *)((u8 *)(p)+(o)))
extern u8 data_020f311c[],gDisplayBrightnessPair[];
extern const char data_020f3148[],data_020f3150[];
extern u8 *gGamePhaseRuntime,*gGameWork;
extern void *data_020f4e14,*gSoundContext;
#ifdef __cplusplus
extern "C" {
#endif
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *);
extern void Graphics3dPresentation_LoadResourceProfile(void *,s32);
extern void Graphics3dPresentation_Clear(void *);
extern void GX_SetGraphicsMode(s32,s32,s32);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern DisplayBrightness *DisplayBrightnessPair_GetScreen(void *,u32);
extern void GameWork_SetFlag(void *,u32);
extern void Sound_StopAllDirectSequences(void *,s32);
extern void Sound_StopAllArchiveEffects(void *);
extern void GamePhaseState_ApplyPlacementState(void *,const void *);
extern void GamePhaseState_UpdateRenderHelpers(void *);
extern void RuntimePresentationManager_UpdatePresentations(void *,s32);
extern void GamePhaseRuntime_StageAreaRequest(void *,s32,s32,s32,s32,s32);
extern void VecFx32Object_InitCopy(void *,const void *);
extern void VecFx32Object_Destroy(void *);
extern void GXx_SetMasterBrightness_(void *,s32);
extern void *func_020a6320(void *);
extern void *func_020a6390(void *);
extern void *func_0209def4(void *,void *,s32);
extern void *func_0209e198(void *);
extern void func_0209e3d4(void *);
extern void func_0209ed08(void *);
#ifdef __cplusplus
}
#endif

/* Select the retail display-routing bit in POWCNT1 without changing other bits. */
void func_0209d758(u32 enabled)
{
    *(volatile u16 *)0x04000304=(u16)((*(volatile u16 *)0x04000304&~0x8000u)|(enabled<<15));
}
/* Initialize the scene, its two owned controllers and display/audio transitions. */
void *func_0209d774(void *self,s32 mode)
{
    void *object;
    Scene_Init((Scene *)self);F(void *,self,0)=data_020f311c;F(s32,self,0x28)=mode;
    Graphics3dPresentation_LoadResourceProfile(RuntimePresentationManager_GetGraphics3dPresentation(gGamePhaseRuntime+0x2f7c),mode==2?6:0);
    func_0209d758(0);GX_SetGraphicsMode(1,0,1);
    *(volatile u32 *)0x04000000=(*(volatile u32 *)0x04000000&~0x1f00u)|0x1d00;
    *(volatile u16 *)0x04000008&=(u16)~3;
    object=Heap_Alloc(0x4bc,data_020f3148,4,&gHeapContext);
    if(object)object=func_020a6320(object);
    F(void *,self,0x34)=object;
    object=Heap_Alloc(0xc8,data_020f3150,4,&gHeapContext);
    if(object)object=func_0209def4(object,self,mode);
    F(void *,self,0x24)=object;
    if(mode){
        void *actor=F(void *,gGamePhaseRuntime,0x2ea4);
        Scene_SetFlags03((Scene *)self);
        (*(void (**)(void *,s32))(F(u8 *,actor,0)+0x54))(actor,0);
        F(s32,data_020f4e14,0x38)=0;
    }
    GameWork_SetFlag(gGameWork,0x386);
    DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,0),16,0,64);
    DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1),16,0,64);
    Sound_StopAllDirectSequences(gSoundContext,0);
    return self;
}
/* Destroy controller ownership and restore sprite rendering; retain scene storage. */
void *func_0209d918(void *self)
{
    void *object;F(void *,self,0)=data_020f311c;
    object=F(void *,self,0x24);if(object){func_0209e198(object);Heap_Free(object);}F(void *,self,0x24)=0;
    Graphics3dPresentation_Clear(RuntimePresentationManager_GetGraphics3dPresentation(gGamePhaseRuntime+0x2f7c));
    GameWork_SetFlag(gGameWork,0x3f8);F(s32,data_020f4e14,0x38)=1;
    object=F(void *,self,0x34);if(object){func_020a6390(object);Heap_Free(object);}F(void *,self,0x34)=0;
    Scene_Destroy((Scene *)self);return self;
}
/* Perform complete scene teardown, free the allocation, and return its former address. */
void *func_0209d9c8(void *self){func_0209d918(self);Heap_Free(self);return self;}
/* Copy controller position into the caller's vector result. */
void func_0209de34(void *out,const void *controller){VecFx32Object_InitCopy(out,(const u8 *)controller+0x24);}
/* Update the scene and its menu; completed fades release it and stage the result. */
s32 func_0209da80(void *self)
{
    void *controller=F(void *,self,0x24);s32 result,brightness,firstMode,amount;
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    func_0209e3d4(controller);func_0209ed08(controller);
    if(F(s32,self,0x28)){
        s32 position[4],maxX,maxY;void *map=F(void *,gGamePhaseRuntime,0x2ed4);
        func_0209de34(position,controller);
        maxX=((F(u32,map,0x20)&0xffff)*16-256)*4096;
        maxY=((F(u32,map,0x20)>>16)*16-192)*4096;
        if(position[1]<0)position[1]=0;else if(position[1]>maxX)position[1]=maxX;
        if(position[2]<0)position[2]=0;else if(position[2]>maxY)position[2]=maxY;
        GamePhaseState_ApplyPlacementState(gGamePhaseRuntime+0x24,position);
        RuntimePresentationManager_UpdatePresentations(gGamePhaseRuntime+0x2f7c,1);
        VecFx32Object_Destroy(position);
    }
    result=F(void *,controller,0x14)?F(s16,F(void *,controller,0x14),0x1cac)==1:F(s16,F(void *,controller,0x18),0x1ca8)==1;
    if(!result&&F(s16,F(void *,controller,8),0xb8)!=1){
        s32 *state=(s32 *)((u8 *)F(void *,self,0x34)+8);
        if(*state==1||*state==2)*state=0;
        return 0;
    }
    brightness=DisplayBrightness_GetCurrent(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,0));
    if(brightness==0){
        if(result){
            DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,0),F(s16,F(void *,controller,8),0xbe)/18+1,16,30);
            DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1),0,16,30);
        }else{
            DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,0),0,-16,64);
            DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1),0,-16,64);
        }
        return 0;
    }
    if(brightness!=16&&brightness!=-16)return 0;
    Scene_ClearFlags03((Scene *)self);
    firstMode=F(s32,self,0x28)==1;
    amount=F(s32,controller,0x90)*(firstMode?10:400);
    GameWork_SetFlag(gGameWork,0x386);
    (*(void (**)(void *))(F(u8 *,self,0)+4))(self);
    if(firstMode)GamePhaseRuntime_StageAreaRequest(gGamePhaseRuntime,0x15,0x80,0x120,0,0);
    else GamePhaseRuntime_StageAreaRequest(gGamePhaseRuntime,0xc0,0x301,0x70,0,0);
    F(s16,gGameWork,0x1e4)=result?1:-1;
    if(result){F(s32,gGameWork,0x7d8)=amount;if(firstMode)GameWork_SetFlag(gGameWork,0x14d);}
    Sound_StopAllArchiveEffects(gSoundContext);Sound_StopAllDirectSequences(gSoundContext,0);
    return 1;
}
/* Finish render helpers and exchange the scanline back/front buffer index. */
s32 func_0209de44(void *self)
{
    void *controller=F(void *,self,0x34);
    GamePhaseState_UpdateRenderHelpers(gGamePhaseRuntime+0x24);
    if(controller)F(u32,controller,0x20)^=1;
    return 0;
}
/* During visible sub-screen scanlines, apply the front-buffer scroll and brightness. */
s32 func_0209de7c(void *self)
{
    void *controller=F(void *,self,0x34);s32 line,buffer;
    if(!F(s32,controller,0))return 1;
    line=*(volatile s16 *)0x04000006;
    if(line<192){
        buffer=F(s32,controller,0x20)^1;
        *(volatile u32 *)0x04001014=F(s16,controller,0x24+buffer*0x180+line*2)&0x1ff;
        GXx_SetMasterBrightness_((void *)0x0400106c,F(s8,controller,0x324+buffer*192+line));
    }
    return 0;
}
