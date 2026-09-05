#include "tingle/types.h"

/* Recovered modal transition: Q12 growth, timed sound and textured quads. */
#define F(t,p,o) (*(t *)((u8 *)(p)+(o)))
extern void *gSoundContext;
extern u8 *gGamePhaseRuntime;
extern s16 gFx32CosSinTable[];
extern s32 data_020c959c[];
#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Init(void *);
extern void VecFx32Object_InitCopy(void *,const void *);
extern void VecFx32Object_Assign(void *,const void *);
extern void VecFx32Object_Destroy(void *);
extern void Sound_Play(void *,s32,s32);
extern void SoundContext_PlayDefaultStream(void *,s32);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *);
extern void Graphics3dPresentation_BeginFrame(void *,const void *);
extern void GraphicsImmediateEffectRenderer_SetupProjection(void *);
extern void GraphicsImmediateEffectRenderer_DrawTexturedQuad(void *,const void *,const void *,u16,const s32 *,u32,const s32 *,u16,s32);
extern void func_0209c7e8(void *,s32);
extern void func_0209c87c(void *,const void *,const void *,u16,s32);
#ifdef __cplusplus
}
#endif

/* Reset both Q12 vectors and the frame counter without allocating resources. */
void func_020a6964(void *self)
{
    F(s32,self,4)=0x80000; F(s32,self,8)=0; F(s32,self,0xc)=0x1000;
    F(s32,self,0x14)=0; F(s32,self,0x18)=0; F(s32,self,0x1c)=0x1000; F(s32,self,0x20)=0;
}

/* Construct the two vectors in borrowed storage and reset the transition. */
void *func_020a6940(void *self)
{
    VecFx32Object_Init(self); VecFx32Object_Init((u8 *)self+0x10); func_020a6964(self); return self;
}

/* Advance one tick, starting supplied sounds at ticks zero and ten. Return
 * one only after the previous tick completed; scale growth begins at tick90. */
s32 func_020a6990(void *self,u32 sound,u32 stream)
{
    s32 tick=F(s32,self,0x20);
    if(tick<0) return 1;
    if(!tick && stream) SoundContext_PlayDefaultStream(gSoundContext,(u16)stream);
    if(sound && tick==10) Sound_Play(gSoundContext,(u16)sound>>7,sound&0x7f);
    if(tick<90) F(s32,self,0x20)++;
    else {
        s32 scale=F(s32,self,0x14)+0x3d;
        if(scale>0x1000 && tick<160) { F(s32,self,0x20)++; scale=0x1000; }
        F(s32,self,0x14)=scale;
        if(scale>0x2000) F(s32,self,0x20)=-1;
        F(s32,self,0x18)=scale;
        F(s32,self,8)=(s32)(((s64)gFx32CosSinTable[((u16)(scale<<2)>>4)*2]*0x80000+0x800)>>12)-0x20000;
    }
    return 0;
}

/* Draw the selected transition shape using the borrowed camera and the
 * shared immediate renderer. Bounds are pixels; positions/UVs are Q12. */
void func_020a6aa8(void *self,const void *camera,s32 kind)
{
    static const s32 bounds[8][4]={ {-56,-20,56,20},{-64,-32,63,32},{-44,-20,44,20},
        {-64,-32,63,32},{-64,-32,63,32},{-64,-32,63,32},{-64,-32,63,32},{-64,-32,63,32} };
    static const s32 uv[8][4]={ {0x10000,0x58000,0x80000,0x80000},{0,0,0x80000,0x40000},
        {0x50000,0xa8000,0xa8000,0xd0000},{0,0,0x80000,0x40000},
        {0,0,0x80000,0x40000},{0,0,0x80000,0x40000},{0,0,0x80000,0x40000},{0,0,0x80000,0x40000} };
    void *renderer=RuntimePresentationManager_GetGraphics3dPresentation(gGamePhaseRuntime+0x2f7c);
    s32 position[4],vertices[8],i;
    if(kind==3) { Graphics3dPresentation_BeginFrame(renderer,camera); VecFx32Object_Assign((u8 *)renderer+0x84,camera); GraphicsImmediateEffectRenderer_SetupProjection(renderer); }
    if(F(s32,self,0x20)<0) return;
    VecFx32Object_InitCopy(position,self);
    position[1]+=F(s32,camera,4); position[2]+=F(s32,camera,8);
    if((u32)(kind-5)<3) position[2]=F(s32,camera,8)+(s32)(((s64)0xab8*F(s32,self,8)+0x800)>>12);
    if((u32)(kind-4)<4) {
        for(i=0;i<4;i++) {
            s32 x=bounds[kind][(i==1||i==2)?2:0],y=bounds[kind][i>=2?3:1];
            vertices[i*2]=(x*F(s32,self,0x14)+position[1])>>12;
            vertices[i*2+1]=(y*F(s32,self,0x18)+position[2])>>12;
        }
        VecFx32Object_Assign((u8 *)renderer+0x84,camera);
        func_0209c7e8(renderer,data_020c959c[kind-4]+0x1b);
        func_0209c87c(renderer,vertices,uv[kind],0x7fff,0);
    } else GraphicsImmediateEffectRenderer_DrawTexturedQuad(renderer,position,(u8 *)self+0x10,0,bounds[kind],kind==1?0x1d:0,uv[kind],0x7fff,400);
    VecFx32Object_Destroy(position);
}
