#include "tingle/types.h"
#include "tingle/heap.h"
#include "tingle/display_brightness.h"

/* Recovered modal controller. Owns the overlay 39/49/69/7 widgets, camera
 * vectors, touch state and transition state used by runtime_modal_scene.c. */
#define F(t,p,o) (*(t *)((u8 *)(p)+(o)))
extern u8 *gGamePhaseRuntime,*gGameWork,*gTouchPanelManager;
extern void *data_020f4e14,*gDebugFont,*gSoundContext;
extern u8 gDisplayBrightnessPair[];
extern const char data_020f3158[],data_020f3160[];
#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Init(void *);
extern void VecFx32Object_InitCopy(void *,const void *);
extern void VecFx32Object_Assign(void *,const void *);
extern void VecFx32Object_Add(void *,const void *);
extern void VecFx32Object_Destroy(void *);
extern void TouchPoint_InitZero(void *);
extern void TouchPanelManager_GetPoint(void *,void *);
extern void OverlaySlot_Init(void *);
extern void OverlaySlot_Destroy(void *);
extern void OverlaySlot_LoadOverlay(void *,s32);
extern void OverlaySlot_UnloadOverlay(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteGroupOwner_DestroyGroup(void *,void *);
extern void *func_ov039_022058d8(void *,void *,void *);
extern void *func_ov039_021fce84(void *,void *,void *,s32);
extern void *func_ov049_0220b780(void *,void *,void *,s32);
extern void *func_0209ef24(void *,void *);
extern void *func_ov007_021fb720(void *,void *);
extern void *func_ov069_02211894(void *,void *,void *);
extern void *func_ov039_02200cd8(void *,void *,void *);
extern void func_ov007_021fb768(void *);
extern void func_ov069_0221193c(void *);
extern void func_ov039_02201118(void *);
extern void func_ov039_021fd71c(void *);
extern void func_0209f088(void *);
extern void func_ov049_0220ba98(void *);
extern void func_ov039_02205b94(void *);
extern void func_ov039_022077b4(void *);
extern void func_ov049_0220bee8(void *);
extern void func_0209f1ec(void *);
extern void func_ov039_021ff610(void *);
extern void func_ov039_02201fec(void *);
extern void func_ov069_022119f8(void *);
extern void func_ov007_021fbcd8(void *);
extern void func_ov069_022119bc(void *);
extern void func_ov007_021fb788(void *,void *);
extern void func_ov007_021fbc80(void *);
extern s32 func_ov039_022076d0(void *,const void *);
extern s32 func_ov049_0220bb84(void *);
extern s32 func_ov049_0220bac0(void *,const void *);
extern void func_ov039_02207f14(void *,const void *);
extern void func_ov049_0220c0b8(void *,const void *);
extern void func_0209f270(void *,const void *);
extern void func_ov039_0220076c(void *,const void *);
extern void func_ov039_022039b8(void *,const void *);
extern void func_ov069_022124c4(void *,const void *);
extern void func_ov007_021fbfdc(void *);
extern void func_020a6404(void *);
extern void func_020a6548(void *);
extern s32 func_020a6808(const void *);
extern void func_020a6810(void *);
extern void func_020a681c(void *);
extern void func_020a68dc(void *);
extern void func_020a68fc(void *,u32,s32);
extern void func_020a63d0(void *,s32);
extern void *func_020a6940(void *);
extern void func_020a6964(void *);
extern s32 func_020a6990(void *,s32,s32);
extern void func_020a6aa8(void *,const void *,s32);
extern s32 GameWork_TestFlag(void *,u32);
extern void Sound_PlayDirectSequence(void *,s32,s32);
extern void Sound_Play(void *,s32,s32);
extern void Sound_FadeDirectSequence(void *,s32,s32,s32);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *);
extern void Graphics3dPresentation_BeginFrame(void *,const void *);
extern DisplayBrightness *DisplayBrightnessPair_GetScreen(void *,u32);
extern u32 genrand_int32(void);
extern u32 func_020beb18(s32);
extern u32 func_020be8c0(u32,u32);
extern s32 func_020beae4(u32);
#ifdef __cplusplus
}
#endif

/* Return the scene-owned sub-screen controller; no ownership is transferred. */
static void *screen(void *self){return F(void *,F(void *,self,0xc4),0x34);}
/* Construct all widgets and value objects, loading their canonical overlays. */
void *func_0209def4(void *self,void *scene,s32 mode)
{
    void *object; s32 variant=mode==2; s32 i;
    VecFx32Object_Init((u8 *)self+0x24);VecFx32Object_Init((u8 *)self+0x34);
    func_020a6940((u8 *)self+0x50);TouchPoint_InitZero((u8 *)self+0x80);
    for(i=0;i<4;i++)OverlaySlot_Init((u8 *)self+0x94+i*12);
    F(void *,self,0xc4)=scene;
    F(void *,self,0)=GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    F(void *,self,4)=GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    OverlaySlot_LoadOverlay((u8 *)self+0x94,39);OverlaySlot_LoadOverlay((u8 *)self+0xa0,69);
    OverlaySlot_LoadOverlay((u8 *)self+0xac,49);OverlaySlot_LoadOverlay((u8 *)self+0xb8,7);
    F(void *,self,0x14)=F(void *,self,0x18)=0;
    object=Heap_Alloc(0xd8,data_020f3158,4,&gHeapContext);
    if(object)object=func_ov039_022058d8(object,self,F(void *,self,0));F(void *,self,8)=object;
    object=Heap_Alloc(0x1db4,data_020f3160,4,&gHeapContext);
    if(object)object=func_ov039_021fce84(object,self,F(void *,self,0),variant);F(void *,self,0x14)=object;
    object=Heap_Alloc(0xbc,data_020f3158,4,&gHeapContext);
    if(object)object=func_ov049_0220b780(object,self,F(void *,self,0),variant);F(void *,self,0xc)=object;
    object=Heap_Alloc(0x8c,data_020f3158,4,&gHeapContext);
    if(object)object=func_0209ef24(object,F(void *,self,0));F(void *,self,0x10)=object;
    object=Heap_Alloc(0xdc,data_020f3158,4,&gHeapContext);
    if(object)object=func_ov007_021fb720(object,self);F(void *,self,0x20)=object;
    object=0;
    if(variant||F(void *,gGamePhaseRuntime,0x2ea8)){
        object=Heap_Alloc(0x68,data_020f3158,4,&gHeapContext);
        if(object)object=func_ov069_02211894(object,self,F(void *,self,0));
    }
    F(void *,self,0x1c)=object;F(s32,self,0x74)=1;
    func_020a6404(screen(self));F(s32,self,0x78)=1;
    F(s32,self,0x28)=F(s32,self,0x2c)=F(s32,self,0x38)=F(s32,self,0x3c)=0x180000;
    F(s32,self,0x48)=F(s32,self,0x44)=F(s32,self,0x90)=F(s32,self,0x4c)=F(s32,self,0x7c)=0;
    func_020a68dc(screen(self));return self;
}
/* Tear down the seven widgets, unload overlays, release groups and vectors. */
void *func_0209e198(void *self)
{
    void (*destroy[7])(void *)={func_ov039_02205b94,func_ov049_0220ba98,func_0209f088,func_ov039_021fd71c,func_ov039_02201118,func_ov069_0221193c,func_ov007_021fb768};
    s32 i;void *object;
    for(i=6;i>=0;i--){object=F(void *,self,8+i*4);if(object){destroy[i](object);Heap_Free(object);}}
    for(i=3;i>=0;i--)OverlaySlot_UnloadOverlay((u8 *)self+0x94+i*12);
    GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14,F(void *,self,0));
    GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont,F(void *,self,4));
    for(i=3;i>=0;i--)OverlaySlot_Destroy((u8 *)self+0x94+i*12);
    VecFx32Object_Destroy((u8 *)self+0x60);VecFx32Object_Destroy((u8 *)self+0x50);
    VecFx32Object_Destroy((u8 *)self+0x34);VecFx32Object_Destroy((u8 *)self+0x24);return self;
}
/* Release the primary overlay-39 widget before replacing it with its alternate. */
void func_0209e2f4(void *self){void *object=F(void *,self,0x14);if(object){func_ov039_021fd71c(object);Heap_Free(object);F(void *,self,0x14)=0;}}
/* Store the vertical camera adjustment in Q12 units. */
void func_0209e328(void *self,s32 value){F(s32,self,0x4c)=value;}
/* Return the vertical camera adjustment in Q12 units. */
s32 func_0209e330(const void *self){return F(const s32,self,0x4c);}
/* Copy touch coordinates unless already aliased, then flag one pending sample. */
void func_0209e338(void *self,const void *point){if(point!=(u8 *)self+0x80){F(s32,self,0x84)=F(const s32,point,4);F(s32,self,0x88)=F(const s32,point,8);}F(s32,self,0x8c)=1;}
/* Query the overlay-39 widget with the pending touch, or return zero. */
s32 func_0209e35c(void *self){return F(s32,self,0x8c)?func_ov039_022076d0(F(void *,self,8),(u8 *)self+0x80):0;}
/* Route pending touch through the primary and secondary widget hit tests. */
s32 func_0209e384(void *self){if(!F(s32,self,0x8c))return 0;if(func_ov039_022076d0(F(void *,self,8),(u8 *)self+0x80)==1&&func_ov049_0220bb84(F(void *,self,0xc)))return 1;return func_ov049_0220bac0(F(void *,self,0xc),(u8 *)self+0x80);}
/* Copy the common overlay-39 widget position into a caller-owned vector. */
void func_0209eb24(void *out,const void *widget){VecFx32Object_InitCopy(out,(const u8 *)widget+0x2c);}
/* Apply the recorded camera jitter once per call, consuming two RNG values. */
static void jitter(void *self,void *position)
{
    s32 amplitude=F(s32,self,0x48);
    if(F(s32,self,0x44)>0){F(s32,self,0x44)--;
        F(s32,position,4)+=((s32)(genrand_int32()%(u32)(amplitude*2))-amplitude)*4096;
        F(s32,position,8)+=((s32)(genrand_int32()%(u32)(amplitude*2))-amplitude)*4096;}
}
/* Derive the constrained midpoint camera from active widget positions. */
void func_0209eb34(void *out,void *self)
{
    s32 center[4],temp[4],dx,dy;
    VecFx32Object_Init(center);VecFx32Object_Init(out);
    VecFx32Object_Assign(center,(u8 *)F(void *,F(void *,self,8),0x48)+0x2c);
    center[2]=func_020beae4(func_020be8c0(func_020beb18(center[2]),0x425c0000));
    if(F(void *,self,0x14)){func_0209eb24(temp,F(void *,self,0x14));VecFx32Object_Assign(out,temp);VecFx32Object_Destroy(temp);}
    if(F(void *,self,0x18)){func_0209eb24(temp,F(void *,self,0x18));VecFx32Object_Assign(out,temp);VecFx32Object_Destroy(temp);}
    VecFx32Object_Add(out,center);
    F(s32,out,4)=(s32)(((s64)F(s32,out,4)*0x800+0x800)>>12);
    F(s32,out,8)=(s32)(((s64)F(s32,out,8)*0x800+0x800)>>12);
    dx=center[1]-F(s32,out,4);dy=center[2]-F(s32,out,8);
    if(dx< -0x64000)F(s32,out,4)=center[1]+0x64000;else if(dx>0x64000)F(s32,out,4)=center[1]-0x64000;
    if(dy< -0x32000)F(s32,out,8)=center[2]+0x32000;else if(dy>0x5a000)F(s32,out,8)=center[2]-0x5a000;
    jitter(self,out);F(s32,out,4)-=0x80000;F(s32,out,8)-=0x60000;VecFx32Object_Destroy(center);
}
/* Clamp the rounded Q12 camera step to its retail per-frame speed and dead band. */
static s32 cameraStep(s32 delta)
{
    s32 step=(s32)(((s64)delta*0x19a+0x800)>>12);
    if(step>0x4800)step=0x4800;else if(step< -0x4800)step=-0x4800;
    if(step>=-0x19a&&step<=0x19a)step=0;
    return step;
}
/* Advance widgets, consume touch, move the camera, and route modal messages. */
void func_0209e3d4(void *self)
{
    s32 touch[3],point[3],temp[4],state,dx,dy,message,mode;
    void *object;
    TouchPanelManager_GetPoint(touch,gTouchPanelManager);
    if(F(s32,gTouchPanelManager,4)==1){
        TouchPoint_InitZero(point);point[1]=F(s32,self,0x28)+touch[1]*4096;point[2]=F(s32,self,0x2c)+touch[2]*4096;
        func_0209e338(self,point);
    }else F(s32,self,0x8c)=0;
    func_ov039_022077b4(F(void *,self,8));func_ov049_0220bee8(F(void *,self,0xc));func_0209f1ec(F(void *,self,0x10));
    if(F(void *,self,0x14))func_ov039_021ff610(F(void *,self,0x14));
    if(F(void *,self,0x18))func_ov039_02201fec(F(void *,self,0x18));
    if(F(void *,self,0x1c))func_ov069_022119f8(F(void *,self,0x1c));
    func_ov007_021fbcd8(F(void *,self,0x20));
    state=F(s32,self,0x74);
    if(state!=0){
        if(!F(s32,self,0x78)){
            if(F(s16,F(void *,screen(self),0x4a4),4)==1&&(state<23||state==49)){
                state=++F(s32,self,0x74);F(s32,self,0x78)=1;
                if(state==8){F(s32,self,0x38)=0x180000;F(s32,self,0x3c)=0x1bc000;}
                else if(state==9||state==12||state==50){func_0209eb34(temp,self);VecFx32Object_Assign((u8 *)self+0x34,temp);VecFx32Object_Destroy(temp);}
            }
        }else{
            dx=cameraStep(F(s32,self,0x38)-F(s32,self,0x28));dy=cameraStep(F(s32,self,0x3c)-F(s32,self,0x2c));
            F(s32,self,0x28)+=dx;F(s32,self,0x2c)+=dy;
            if(!dx&&!dy){
                message=F(void *,self,0x14)&&(GameWork_TestFlag(gGameWork,0x14d)||GameWork_TestFlag(gGameWork,0x354))?60:0;
                F(s32,self,0x78)=0;state=F(s32,self,0x74);
                switch(state){
                case 1:case 2:case 4:F(s32,self,0x78)=1;break;
                case 3:F(s32,self,0x38)=0x180000;F(s32,self,0x3c)=0xc2000;break;
                case 7:func_020a6548(screen(self));func_020a68fc(screen(self),message,0);Sound_Play(gSoundContext,0,0x6f);break;
                case 8:func_020a68fc(screen(self),message+1,0);break;
                case 9:func_020a68fc(screen(self),message+2,0);break;
                case 50:F(s32,self,0x74)++;break;
                default:break;
                }
            }
        }
        state=F(s32,self,0x74);
        if(state==23||state==24){
            F(s32,self,0x78)=1;
            func_0209eb24(temp,F(void *,self,F(void *,self,0x14)?0x14:0x18));
            VecFx32Object_Assign((u8 *)self+0x34,temp);VecFx32Object_Destroy(temp);
            F(s32,self,0x3c)+=F(s32,self,0x4c);F(s32,self,0x38)-=0x80000;
            F(s32,self,0x3c)-=F(void *,self,0x1c)?0x50000:0x6e000;
        }else if(state==25){
            F(s32,self,0x78)=1;VecFx32Object_Assign((u8 *)self+0x34,(u8 *)F(void *,F(void *,self,8),0x48)+0x2c);
            F(s32,self,0x38)-=0x80000;F(s32,self,0x3c)-=0x60000;
        }else if(state==10||state==13||state==51){
            F(s32,self,0x7c)=1;F(s32,self,0x74)=F(s32,self,0x78)=0;
            func_020a63d0(screen(self),-1);Sound_Play(gSoundContext,0,0x3a);
        }else if(state==43){
            func_0209e2f4(self);F(s32,self,0x74)=44;
            object=Heap_Alloc(0x1d58,data_020f3160,4,&gHeapContext);
            if(object)object=func_ov039_02200cd8(object,self,F(void *,self,0));F(void *,self,0x18)=object;
            if(F(void *,self,0x1c))func_ov069_022119bc(F(void *,self,0x1c));
            DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,0),16,0,60);
            F(s32,self,0x78)=1;func_0209eb24(temp,object);VecFx32Object_Assign((u8 *)self+0x34,temp);VecFx32Object_Destroy(temp);
            F(s32,self,0x38)-=0x80000;F(s32,self,0x3c)-=0x6e000;
            VecFx32Object_Assign((u8 *)self+0x24,(u8 *)self+0x34);F(s32,self,0x4c)=0;
        }else if(state==48){func_020a63d0(screen(self),2);F(s32,self,0x74)=49;}
    }
    mode=func_020a6808(screen(self));
    if(mode&&DisplayBrightness_GetCurrent(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1))==-16){
        if(mode==-1){F(s16,F(void *,screen(self),0x4a4),4)=3;func_020a6810(screen(self));func_ov007_021fb788(F(void *,self,0x20),F(void *,self,4));}
        else{func_ov007_021fbc80(F(void *,self,0x20));func_020a6810(screen(self));func_020a6548(screen(self));func_020a68fc(screen(self),mode==1?12:99,1);Sound_Play(gSoundContext,0,0x6f);}
    }
    if(F(s32,self,0x7c)&&++F(s32,self,0x7c)>30){Sound_FadeDirectSequence(gSoundContext,0x60,0x78,0);F(s32,self,0x7c)=0;}
    func_020a681c(screen(self));
}
/* Update the camera and each widget's rendered position; finish special transitions. */
void func_0209ed08(void *self)
{
    s32 temp[4],state=F(s32,self,0x74);
    if(!state){func_0209eb34(temp,self);VecFx32Object_Assign((u8 *)self+0x24,temp);VecFx32Object_Destroy(temp);}
    else jitter(self,(u8 *)self+0x24);
    Graphics3dPresentation_BeginFrame(RuntimePresentationManager_GetGraphics3dPresentation(gGamePhaseRuntime+0x2f7c),(u8 *)self+0x24);
    func_ov039_02207f14(F(void *,self,8),(u8 *)self+0x24);func_ov049_0220c0b8(F(void *,self,0xc),(u8 *)self+0x24);func_0209f270(F(void *,self,0x10),(u8 *)self+0x24);
    if(F(void *,self,0x14))func_ov039_0220076c(F(void *,self,0x14),(u8 *)self+0x24);
    if(F(void *,self,0x18))func_ov039_022039b8(F(void *,self,0x18),(u8 *)self+0x24);
    if(F(void *,self,0x1c))func_ov069_022124c4(F(void *,self,0x1c),(u8 *)self+0x24);
    state=F(s32,self,0x74);
    if(state==4||state==46){
        if(!func_020a6990((u8 *)self+0x50,0x3186,6))func_020a6aa8((u8 *)self+0x50,(u8 *)self+0x24,state==46);
        else{
            if(state==46){F(s32,self,0x74)=48;Sound_PlayDirectSequence(gSoundContext,0x58,0x7f);}
            else{F(s32,self,0x74)=7;Sound_PlayDirectSequence(gSoundContext,0x60,0x7f);Sound_FadeDirectSequence(gSoundContext,0x60,60,0);}
            func_020a6964((u8 *)self+0x50);
        }
    }
    func_ov007_021fbfdc(F(void *,self,0x20));
}
