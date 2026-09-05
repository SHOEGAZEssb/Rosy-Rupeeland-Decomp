#include "tingle/types.h"

/* Recovered immediate modal geometry: interpolation, ribbon strips and quads.
 * Geometry commands use the existing NDS G3 boundary on host builds. */
#define F(t,p,o) (*(t *)((u8 *)(p)+(o)))
#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsImmediateEffectRenderer_SetupProjection(void *);
extern void Graphics3dPresentation_BindImmediateTexture(void *,s32,s32);
extern void G3Command_SubmitTexCoord(s32,s32);
extern void G3Command_SubmitVertex16(s32,s32,s32);
extern s32 func_020adc40(s32);
extern s32 func_020adc90(s32,s32);
#ifndef MATCHING
extern void TingleNativeG3_Push(void);
extern void TingleNativeG3_Pop(u32);
extern void TingleNativeG3_Translate(s32,s32,s32);
extern void TingleNativeG3_Begin(u32);
extern void TingleNativeG3_End(void);
extern void TingleNativeG3_Color(u32);
extern void TingleNativeG3_VertexXY(u32);
#endif
#ifdef __cplusplus
}
#endif

/* Multiply Q12 values with the retail rounding bias. */
static s32 multiply(s32 a,s32 b) { return (s32)(((s64)a*b+0x800)>>12); }
/* Project a wrapped Q12 coordinate to the signed 16-bit vertex grid. */
static s32 coordinate(s32 a) { return (s32)((u32)a<<4)>>16; }
/* Interpolate XY only; retain the output object's vtable and other fields. */
void func_0209b58c(void *self,const void *a,const void *b,s32 blend,void *out)
{
    s32 x=F(s32,a,4),y=F(s32,a,8); (void)self;
    F(s32,out,4)=x+multiply(F(s32,b,4)-x,blend);
    F(s32,out,8)=y+multiply(F(s32,b,8)-y,blend);
}
/* Interpolate XYZ only, permitting output to alias either input. */
void func_0209b5e8(void *self,const void *a,const void *b,s32 blend,void *out)
{
    s32 x=F(s32,a,4),y=F(s32,a,8),z=F(s32,a,0xc);
    s32 dx=F(s32,b,4)-x,dy=F(s32,b,8)-y,dz=F(s32,b,0xc)-z; (void)self;
    F(s32,out,4)=x+multiply(dx,blend); F(s32,out,8)=y+multiply(dy,blend); F(s32,out,0xc)=z+multiply(dz,blend);
}
/* Set orthographic projection and bind the requested ribbon texture. */
void func_0209b7ec(void *self,s32 resource)
{ GraphicsImmediateEffectRenderer_SetupProjection(self); Graphics3dPresentation_BindImmediateTexture(self,resource,0); }
/* Set the same projection and binding for a four-corner textured shape. */
void func_0209c7e8(void *self,s32 resource)
{ GraphicsImmediateEffectRenderer_SetupProjection(self); Graphics3dPresentation_BindImmediateTexture(self,resource,0); }

/* Push the current transform, translate the borrowed camera and begin drawing. */
static void begin(void *self,s32 z,u32 primitive)
{
    s32 x=-coordinate(F(s32,self,0x88)+0x80000),y=-coordinate(F(s32,self,0x8c)+0x60000);
    *(volatile u32 *)0x04000444=0;
    *(volatile s32 *)0x04000470=x; *(volatile s32 *)0x04000470=y; *(volatile s32 *)0x04000470=z;
    *(volatile u32 *)0x04000500=primitive;
#ifndef MATCHING
    TingleNativeG3_Push(); TingleNativeG3_Translate(x,y,z); TingleNativeG3_Begin(primitive);
#endif
}
/* Write color through both the observable register and host command boundary. */
static void color(u32 value)
{
    *(volatile u32 *)0x04000480=value;
#ifndef MATCHING
    TingleNativeG3_Color(value);
#endif
}
/* Submit one packed integer XY vertex, retaining the preceding depth. */
static void xy(s32 x,s32 y)
{
    u32 packed=(u16)x|((u32)(u16)y<<16);
    *(volatile u32 *)0x04000494=packed;
#ifndef MATCHING
    TingleNativeG3_VertexXY(packed);
#endif
}
/* Finish the primitive and restore the transform stack. */
static void end(void)
{
    *(volatile u32 *)0x04000504=0; *(volatile u32 *)0x04000448=1;
#ifndef MATCHING
    TingleNativeG3_End(); TingleNativeG3_Pop(1);
#endif
}
/* Submit a variable-width ribbon from 12-byte point records and Q12 widths.
 * UV pairs describe both sides at every point; count below three uses a quad. */
void func_0209b880(void *self,const void *points,const s32 *width,const s32 *uv,s32 count,u32 tint,u16 depth)
{
    s32 i;
    begin(self,-0x1000,count<3?1:2);
    for(i=0;i<count-1;i++) {
        const u8 *p=(const u8 *)points+i*12;
        s32 ax=F(s32,p,4),ay=F(s32,p,8),bx=F(s32,p,16),by=F(s32,p,20);
        s32 nx=by-ay,ny=-(bx-ax),length=func_020adc40(multiply(nx,nx)+multiply(ny,ny));
        s32 wx,wy,vx,vy;
        if(length>0) { nx=func_020adc90(nx,length); ny=func_020adc90(ny,length); }
        wx=multiply(nx,width[i]); wy=multiply(ny,width[i]); vx=multiply(nx,width[i+1]); vy=multiply(ny,width[i+1]);
        if(!i) {
            color(tint); G3Command_SubmitTexCoord(uv[2],uv[3]);
            G3Command_SubmitVertex16(coordinate(ax+wx),coordinate(ay+wy),(s16)depth);
        } else { G3Command_SubmitTexCoord(uv[i*4+2],uv[i*4+3]); xy(coordinate(ax+wx),coordinate(ay+wy)); }
        G3Command_SubmitTexCoord(uv[i*4],uv[i*4+1]); xy(coordinate(ax-wx),coordinate(ay-wy));
        if(count<3) {
            G3Command_SubmitTexCoord(uv[i*4+4],uv[i*4+5]); xy(coordinate(bx-vx),coordinate(by-vy));
            G3Command_SubmitTexCoord(uv[i*4+6],uv[i*4+7]); xy(coordinate(bx+vx),coordinate(by+vy));
        } else {
            G3Command_SubmitTexCoord(uv[i*4+6],uv[i*4+7]); xy(coordinate(bx+vx),coordinate(by+vy));
            G3Command_SubmitTexCoord(uv[i*4+4],uv[i*4+5]); xy(coordinate(bx-vx),coordinate(by-vy));
        }
    }
    end();
}
/* Draw four integer XY vertices with rectangular Q12 UV bounds and depth. */
void func_0209c87c(void *self,const s32 *vertices,const s32 *uv,u32 tint,s16 depth)
{
    begin(self,0,1); color(tint);
    G3Command_SubmitTexCoord(uv[0],uv[1]); G3Command_SubmitVertex16((s16)vertices[0],(s16)vertices[1],depth);
    G3Command_SubmitTexCoord(uv[2],uv[1]); xy(vertices[2],vertices[3]);
    G3Command_SubmitTexCoord(uv[2],uv[3]); xy(vertices[4],vertices[5]);
    G3Command_SubmitTexCoord(uv[0],uv[3]); xy(vertices[6],vertices[7]); end();
}
