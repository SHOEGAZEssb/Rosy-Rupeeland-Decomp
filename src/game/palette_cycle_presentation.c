#include "tingle/field_effect.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a palette-cycling presentation.  It owns a 256-color working
 * palette, a six-state color generator and a fade helper, prewarms the effect,
 * uploads palette changes, and completes on GameWork flag 0x408.
 */

typedef struct PaletteCyclePresentation {
    void **vtable; u32 dispatchState; s32 firstIndex08; s32 lastIndex0c;
    u16 palette10[0x100]; u8 field210[0x200]; u8 generator410[0x18];
    u8 fade428[0x1c]; s32 uploadEnabled444;
} PaletteCyclePresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gPaletteCyclePresentationVtable;
extern void *data_020f4e18;
extern void *gGameWork;

extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void MIi_CpuCopy16(const void *, void *, s32);
extern void func_02091d08(void *);
extern void func_02091d24(void *, s32, s32, s32, s32);
extern void func_02091dac(void *);
extern void func_02091b6c(void *);
extern void func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 func_02091bd0(void *, s32, s32, s32);
extern u32 genrand_int32(void);
extern void func_020b4554(void *, s32);
extern void func_020b13d4(void);
extern void func_020b1360(void *, s32, s32);
extern void func_020b1314(void);
extern void GameWork_ClearFlag(void *, s32);
extern s32 GameWork_TestFlag(void *, s32);
#ifdef __cplusplus
}
#endif

void PaletteCyclePresentation_AdvancePalette(PaletteCyclePresentation *self);

/*
 * Initialize base, generator and fade helpers; set palette range 1..120; load
 * resource IDs 0x904b/0x904c/0x904f and copy its 0x200-byte palette. Configure
 * generator mode 5, prewarm one update for each range step, clear flag 0x408,
 * enable FieldEffect dispatch-state bit 1, destroy the temporary resource set, and return self.
 */
PaletteCyclePresentation *PaletteCyclePresentation_Init(PaletteCyclePresentation *self)
{
    void *resources[3]; s32 i;
    FieldEffect_Init(self); self->vtable=(void **)gPaletteCyclePresentationVtable;
    func_02091d08(self->generator410); func_02091b6c(self->fade428);
    self->uploadEnabled444=0; self->firstIndex08=1; self->lastIndex0c=120;
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources,data_020f4e18,0x904b,0x904c,0x904f,0x904f);
    MIi_CpuCopy16(GraphicsBgResourceData_GetDecoded(resources[1]),self->palette10,0x200);
    func_02091d24(self->generator410,1,0,0,5);
    for(i=self->firstIndex08;i<self->lastIndex0c;i++) PaletteCyclePresentation_AdvancePalette(self);
    GameWork_ClearFlag(gGameWork,0x408); self->dispatchState|=2;
    GraphicsResourceSet_Destroy(resources); return self;
}

/* Disable uploads, tear down the FieldEffect base, and return self. */
PaletteCyclePresentation *PaletteCyclePresentation_Destroy(PaletteCyclePresentation *self)
{ self->uploadEnabled444=0; FieldEffect_DestroyBase(self); return self; }

/* Disable uploads, tear down the FieldEffect base, free self, and return its old address. */
PaletteCyclePresentation *PaletteCyclePresentation_DestroyAndFree(PaletteCyclePresentation *self)
{ self->uploadEnabled444=0; FieldEffect_DestroyBase(self); Heap_Free(self); return self; }

/*
 * Shift palette entries in the configured range one place upward. With 1/32
 * probability set recovered palette slot 18 to white. Advance the fade/helper
 * state when channel 2 finishes, then derive six RGB555 colors according to
 * generator state 0..5; retail writes each successive result to firstIndex, so
 * the sixth generated color remains observable.
 */
void PaletteCyclePresentation_AdvancePalette(PaletteCyclePresentation *self)
{
    s32 i, n;
    for(i=self->lastIndex0c;i>self->firstIndex08;i--)
        self->palette10[i]=self->palette10[i-1];
    if((genrand_int32()&0x1f)==0) self->palette10[18]=0x7fff;
    if(func_02091c7c(self->fade428,2)) {
        func_02091b98(self->fade428,16); func_02091dac(self->generator410);
    }
    for(n=0;n<6;n++) {
        s32 r=0,g=0,b=0,state=*(s32 *)self->generator410;
        switch(state) {
        case 0:r=31;b=func_02091bd0(self->fade428,1,31,0);break;
        case 1:r=31;g=func_02091bd0(self->fade428,1,0,16);break;
        case 2:r=31;g=func_02091bd0(self->fade428,1,16,31);break;
        case 3:r=func_02091bd0(self->fade428,1,31,0);g=31;break;
        case 4:g=func_02091bd0(self->fade428,1,31,16);b=func_02091bd0(self->fade428,1,0,31);break;
        case 5:r=func_02091bd0(self->fade428,1,0,31);g=func_02091bd0(self->fade428,1,16,0);b=31;break;
        }
        self->palette10[self->firstIndex08]=(u16)(r|(g<<5)|(b<<10));
    }
}

/* Enable uploads, advance/copy the palette, consume flag 0x408 and return one when set; otherwise return zero. */
s32 PaletteCyclePresentation_Update(PaletteCyclePresentation *self)
{
    self->uploadEnabled444=1; PaletteCyclePresentation_AdvancePalette(self);
    func_020b4554(self->palette10,0x200);
    if(!GameWork_TestFlag(gGameWork,0x408)) return 0;
    GameWork_ClearFlag(gGameWork,0x408); return 1;
}

/* When enabled, begin palette transfer, upload all 0x200 bytes to slot zero, and finish the hardware transfer. */
void PaletteCyclePresentation_UploadPalette(PaletteCyclePresentation *self)
{
    if(!self->uploadEnabled444) return;
    func_020b13d4(); func_020b1360(self->palette10,0,0x200); func_020b1314();
}
