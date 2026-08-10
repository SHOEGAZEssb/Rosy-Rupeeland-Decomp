#include "tingle/types.h"

/* Overlay 15 conditional dual-screen background and graphics-resource initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
typedef struct Overlay015ResourceSet { u32 words[3]; } Overlay015ResourceSet;
extern void *data_020f4e14,*gDebugFont,*data_020f4e18;
#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);extern void func_020925a4(s32);extern void func_020925f8(void);extern void func_02092638(s32,s32,s32,s32);extern void func_020925dc(s32);extern void func_02092618(void);extern void func_02092688(s32,s32,s32,s32);
extern void GraphicsResourceSet_Init(Overlay015ResourceSet *);extern void GraphicsResourceSet_Load(Overlay015ResourceSet *,void *,s32,s32,s32);extern void GraphicsResourceSet_Apply(Overlay015ResourceSet *,s32,s32);extern void GraphicsResourceSet_Destroy(Overlay015ResourceSet *);
extern void func_02070f80(void *,s32);extern void func_020b44e8(void);extern void func_02072048(Overlay015ResourceSet *,s32,s32);extern void func_020706c4(void *,s32,s32);extern void func_02070bc4(void *,s32);extern void func_02070eac(void *,s32,s32);
#ifdef __cplusplus
}
#endif

/*
 * Clear the main graphics manager and, when +0xEC is zero, the debug manager;
 * program main display mask +0x48 and its BG registers unconditionally, and
 * configure sub display mask +0x4C/BG registers only when +0xEC is zero. Load
 * resource triples B003..B005, 8008..800A, 8008/8009/800E, and
 * 8008/8009/800D, apply the shared layers, conditionally apply the sub layers,
 * and destroy all temporary resource sets. Return void. MMIO writes and all
 * resource IDs are confirmed Nintendo DS graphics effects; +0xEC semantics are
 * inferred as a single-screen/sound mode from constructor use.
 */
extern "C" void func_ov015_021fd41c(void *state)
{
    Overlay015ResourceSet a,b,c;volatile u16 *power=(volatile u16 *)0x04000304,*mainBg=(volatile u16 *)0x0400000a,*subBg=(volatile u16 *)0x04001008;
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);if(FIELD(s32,state,0xec)==0)GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);*power&=(u16)~0x8000;FIELD(s32,state,0x48)=0x14;func_020925a4(0);mainBg[0]=(mainBg[0]&0x43)|0x3a00;mainBg[1]=(mainBg[1]&0x43)|0x1c00;func_020925f8();*(volatile u32 *)0x04000018=0x200000;func_02092638(0,1,2,3);
    if(FIELD(s32,state,0xec)==0){FIELD(s32,state,0x4c)=0x19;func_020925dc(0);subBg[0]=(subBg[0]&0x43)|0x3800;subBg[1]=(subBg[1]&0x43)|0x3a00;subBg[3]=(subBg[3]&0x43)|0x1e10;func_02092618();func_02092688(0,1,2,3);}
    GraphicsResourceSet_Init(&a);GraphicsResourceSet_Init(&b);GraphicsResourceSet_Init(&c);GraphicsResourceSet_Load(&a,data_020f4e18,0xb003,0xb004,0xb005);func_02070f80((void *)a.words[2],8);func_020b44e8();if(FIELD(s32,state,0xec)==0)GraphicsResourceSet_Apply(&a,3,0x100);
    GraphicsResourceSet_Load(&a,data_020f4e18,0x8008,0x8009,0x800a);GraphicsResourceSet_Load(&b,data_020f4e18,0x8008,0x8009,0x800e);GraphicsResourceSet_Load(&c,data_020f4e18,0x8008,0x8009,0x800d);func_020b44e8();func_02072048(&a,2,0);
    if(FIELD(s32,state,0xec)==0){func_020706c4((void *)a.words[0],0,0);func_02070bc4((void *)a.words[1],0);func_02070eac((void *)b.words[2],0,0);func_02070eac((void *)c.words[2],1,0);}GraphicsResourceSet_Destroy(&c);GraphicsResourceSet_Destroy(&b);GraphicsResourceSet_Destroy(&a);
}
