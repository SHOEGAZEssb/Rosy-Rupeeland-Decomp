#include "tingle/types.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/graphics_resources.h"
#include "tingle/display_brightness.h"

/* Recovered modal-screen controller: owns overlay 52, queues four messages,
 * and builds double-buffered sub-screen scroll/brightness scanlines. */
#define F(t,p,o) (*(t *)((u8 *)(p)+(o)))
extern u8 gDisplayBrightnessPair[];
extern void *data_020f4e18;
extern const char data_020f3310[];
extern const s8 data_020c9590[];
extern const s16 gFx32CosSinTable[];
#ifdef __cplusplus
extern "C" {
#endif
extern DisplayBrightness *DisplayBrightnessPair_GetScreen(void *, u32);
extern void *func_ov052_0220d618(void *, s32, s32);
extern s32 func_ov052_0220da54(void *);
extern void func_ov052_0220ddb4(void *);
extern void func_ov052_0220e14c(void *, s32, s32);
extern u32 genrand_int32(void);
extern void func_020b44e8(void);
extern u32 GraphicsCharacterResource_GetUploadSize(void *);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern u32 GraphicsPaletteResource_GetUploadSize(void *);
extern void GraphicsBgMapResource_UploadToSubBg(void *, s32, s32);
extern void func_020b18bc(const void *, u32, u32);
extern void func_020b1ff0(const void *, u32, u32);
extern void GXx_SetMasterBrightness_(void *, s32);
#ifdef __cplusplus
}
#endif

/* Allocate the overlay-owned message object, clear controller modes, return self. */
void *func_020a6320(void *self)
{
    void *object;
    OverlayManager_LoadOverlay(OverlayManager_GetGlobal(),0,0x34);
    object=Heap_Alloc(0x34,data_020f3310,4,&gHeapContext);
    if(object) object=func_ov052_0220d618(object,0,0);
    F(void *,self,0x4a4)=object;
    func_ov052_0220da54(object);
    F(s32,self,0x4b8)=0;
    F(s32,self,0)=F(s32,self,4)=F(s32,self,8)=0;
    return self;
}
/* Destroy the owned object through its deleting slot and release overlay slot 0. */
void *func_020a6390(void *self)
{
    void *object=F(void *,self,0x4a4);
    if(object){
        (*(void (**)(void *))(F(u8 *,object,0)+4))(object);
        F(void *,self,0x4a4)=0;
        OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(),0);
    }
    return self;
}
/* Fade sub-screen to black over ten ticks and retain the requested mode. */
void func_020a63d0(void *self,s32 mode)
{
    DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1),0,-16,10);
    F(s32,self,4)=mode;
}
/* Reset both 192-line buffers, load sub BG resources, and enable scanline output. */
void func_020a6404(void *self)
{
    GraphicsResourceSet resources;
    s32 i;
    for(i=191;i>=0;--i){
        F(s16,self,0x24+i*2)=F(s16,self,0x1a4+i*2)=0;
        F(s8,self,0x324+i)=F(s8,self,0x3e4+i)=0;
    }
    F(s32,self,0xc)=F(s32,self,0x10)=0;
    F(s32,self,0x14)=60; F(s32,self,0x18)=130;
    F(s32,self,0x1c)=F(s32,self,0x20)=0;
    *(volatile u16 *)0x0400100a=(*(volatile u16 *)0x0400100a&0x43)|0x3a00;
    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources,data_020f4e18,0x900e,0x900f,0x9010);
    func_020b44e8();
    func_020b18bc(F(void *,resources.resource0,0x24),0,GraphicsCharacterResource_GetUploadSize(resources.resource0));
    func_020b44e8();
    func_020b1ff0(GraphicsBgResourceData_GetDecoded(resources.resource1),0,GraphicsPaletteResource_GetUploadSize(resources.resource1));
    func_020b44e8();
    GraphicsBgMapResource_UploadToSubBg(resources.resource2,1,0);
    func_020b44e8();
    GraphicsResourceSet_ReleaseHandles(&resources);
    F(s32,self,8)=1;
    *(volatile u32 *)0x04001000=(*(volatile u32 *)0x04001000&~0x1f00u)|0x200;
    F(s32,self,0)=1;
    GraphicsResourceSet_Destroy(&resources);
}
/* Disable distortion, reset the overlay message, and fade sub-screen from black. */
void func_020a6548(void *self)
{
    GXx_SetMasterBrightness_((void *)0x0400106c,-16);
    F(s32,self,8)=2; F(s32,self,4)=0;
    func_ov052_0220ddb4(F(void *,self,0x4a4)); F(s32,self,0)=0;
    DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1),-16,0,10);
}
/* Fill the back buffer with two Q12 sine waves and the five-line brightness
 * pattern; integer divisions retain the retail signed remainders. */
void func_020a65a4(void *self)
{
    s32 i,buffer,first,second,line,start;
    s8 pattern[5];
    if(!F(s32,self,0))return;
    for(i=0;i<5;i++)pattern[i]=data_020c9590[i];
    first=(s32)(genrand_int32()&0xfff)*10;
    second=(s32)(genrand_int32()&0xfff)*5;
    buffer=F(s32,self,0x20);
    for(i=191;i>=0;i--){
        s32 a=gFx32CosSinTable[((i*0x5dc+F(s32,self,0xc))&0xffff)>>4<<1];
        s32 b=gFx32CosSinTable[((i*0x1414+F(s32,self,0x10))&0xffff)>>4<<1];
        F(s16,self,0x24+buffer*0x180+i*2)=(s16)((s32)(((s64)first*a+0x800)>>12)>>12);
        F(s16,self,0x24+buffer*0x180+i*2)+=(s16)((s32)(((s64)second*b+0x800)>>12)>>12);
        F(s8,self,0x324+buffer*192+i)=pattern[(i+F(s32,self,0x1c))%5];
    }
    start=((F(s32,self,0x14)>>1)%230)-32;
    for(i=0;i<32;i++)if(start+i>=0&&start+i<192)F(s8,self,0x324+buffer*192+start+i)-=3;
    line=F(s32,self,0x18);
    if(line<192){F(s8,self,0x324+buffer*192+line)=10;line++;}
    if(line<192)F(s8,self,0x324+buffer*192+line)=14;
    F(s32,self,0xc)-=300;F(s32,self,0x10)+=700;
    F(s32,self,0x14)++;F(s32,self,0x18)=(F(s32,self,0x18)+1)%250;F(s32,self,0x1c)++;
}
/* Return the requested controller mode without changing state. */
s32 func_020a6808(const void *self){return F(const s32,self,4);}
/* Clear the requested controller mode. */
void func_020a6810(void *self){F(s32,self,4)=0;}
/* Advance one queued message, its overlay, a one-shot fade, and scanline state. */
void func_020a681c(void *self)
{
    u32 entry=F(u32,self,0x4a8);s32 i;
    if(entry!=0xffffffffu&&(F(s16,F(void *,self,0x4a4),4)==1||(entry&0x100))){
        func_ov052_0220e14c(F(void *,self,0x4a4),(entry&0xff)+2,0);
        for(i=0;i<3;i++)F(u32,self,0x4a8+i*4)=F(u32,self,0x4ac+i*4);
        F(u32,self,0x4b4)=0xffffffffu;
    }
    if(func_ov052_0220da54(F(void *,self,0x4a4))==1&&!F(s32,self,0x4b8)){
        F(s32,self,0x4b8)=1;
        DisplayBrightness_StartTransition(DisplayBrightnessPair_GetScreen(gDisplayBrightnessPair,1),0,-16,64);
    }
    func_020a65a4(self);
}
/* Mark all four queue entries empty; the owned overlay remains live. */
void func_020a68dc(void *self){s32 i;for(i=3;i>=0;i--)F(s32,self,0x4a8+i*4)=-1;}
/* Append an index to the first free queue slot, optionally bypassing idle gating. */
void func_020a68fc(void *self,u32 entry,s32 immediate)
{
    s32 i;for(i=0;i<4;i++)if(F(s32,self,0x4a8+i*4)==-1){F(u32,self,0x4a8+i*4)=entry|(immediate?0x100:0);return;}
}
