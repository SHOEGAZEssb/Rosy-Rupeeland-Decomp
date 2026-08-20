#include "tingle/types.h"

/* Recovered overlay 68 randomized multi-sprite scene subsystem. */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void Scene_Init(void *); extern "C" void Scene_Destroy(void *);
extern "C" void Heap_Free(void *); extern "C" void GX_DispOn(void);
extern "C" void DebugText_BeginFrame(void); extern "C" void func_02003e38(void *);
extern "C" void *func_02003e20(s32, const void *, s32, void *);
extern "C" void func_02071b94(void *, s32, s32, s32, void **, void **, void **);
extern "C" void func_02071bdc(void *, void *); extern "C" void func_02071c38(void *, void *);
extern "C" void func_02071c94(void *, void *);
extern "C" void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern "C" void GraphicsSpriteGroupOwner_DestroyGroup(void *, void *);
extern "C" void GraphicsSpriteGroup_Clear(void *);
extern "C" void *GraphicsSpriteGroup_CreateState(void *, void *, void *, void *, s32);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern "C" void GraphicsSpriteGroup_AdvanceAnimations(void *); extern "C" u32 genrand_int32(void);
extern "C" void *data_020f4e14; extern "C" void *data_020f4e18;
extern "C" u8 data_ov068_0221077c[]; extern "C" u8 data_ov068_02210740[];
extern "C" s16 data_ov068_022107c0[40]; extern "C" void *gHeapContext;
extern "C" u8 gSystemState[];
extern "C" void func_ov068_02210044(void *); extern "C" void *func_ov068_02210070(void *, s32);

static void **sprites(void *s) { return FIELD(void **, s, 0x28); }
static s16 *history(void *s, s32 i) { return (s16 *)((u8 *)s + 0x15e + i * 4); }
static s32 wrap40(s32 n) { s32 r = n % 40; return r < 0 ? r + 40 : r; }
static void set_position(void *p, s16 x, s16 y) { FIELD(s16,p,0x2c)=x; FIELD(s16,p,0x2e)=y; }

/* Construct the scene, load three resource triplets, and create all sprites. */
extern "C" void *func_ov068_0220fd20(void *s)
{
    Scene_Init(s); FIELD(void*,s,0)=data_ov068_0221077c; FIELD(void*,s,0x28)=0;
    FIELD(s32,s,0x2c)=0; FIELD(s32,s,0x54)=0; FIELD(s16,s,0x58)=0;
    FIELD(s16,s,0x5a)=0; FIELD(s16,s,0x5c)=0;
    func_02071b94(data_020f4e18,0x1000,0x1001,0x1002,(void**)((u8*)s+0x30),(void**)((u8*)s+0x3c),(void**)((u8*)s+0x48));
    func_02071b94(data_020f4e18,0x1000,0x1001,0x1002,(void**)((u8*)s+0x34),(void**)((u8*)s+0x40),(void**)((u8*)s+0x4c));
    func_02071b94(data_020f4e18,0x1000,0x1001,0x1002,(void**)((u8*)s+0x38),(void**)((u8*)s+0x44),(void**)((u8*)s+0x50));
    FIELD(void*,s,0x24)=GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    func_ov068_02210070((u8*)s+0x28,9); void **p=sprites(s);
    p[0]=GraphicsSpriteGroup_CreateState(FIELD(void*,s,0x24),FIELD(void*,s,0x30),FIELD(void*,s,0x3c),FIELD(void*,s,0x48),2);
    GraphicsSpriteState_SetAnimationIndex(p[0],8); FIELD(s16,p[0],0x28)=200;
    set_position(p[0],128,96); FIELD(u16,p[0],0x24)|=2;
    p[8]=GraphicsSpriteGroup_CreateState(FIELD(void*,s,0x24),FIELD(void*,s,0x38),FIELD(void*,s,0x44),FIELD(void*,s,0x50),2);
    GraphicsSpriteState_SetAnimationIndex(p[8],16); FIELD(s16,p[8],0x28)=202;
    set_position(p[8],192,160); FIELD(s16,p[8],0x32)=FIELD(s16,p[8],0x34)=0x200; FIELD(u16,p[8],0x24)|=2;
    for(s32 i=0;i<9;++i){history(s,i)[0]=0;history(s,i)[1]=0;}
    for(s32 i=1;i<8;++i){p[i]=GraphicsSpriteGroup_CreateState(FIELD(void*,s,0x24),FIELD(void*,s,0x34),FIELD(void*,s,0x40),FIELD(void*,s,0x4c),2);GraphicsSpriteState_SetAnimationIndex(p[i],0);set_position(p[i],FIELD(s16,p[0],0x2c),FIELD(s16,p[0],0x2e));FIELD(u16,p[i],0x24)|=2;}
    FIELD(s16,p[5],0x32)=FIELD(s16,p[5],0x34)=204; FIELD(s16,p[5],0x28)=201;
    FIELD(s16,p[6],0x32)=FIELD(s16,p[6],0x34)=128; FIELD(s16,p[6],0x28)=201;
    FIELD(s16,p[7],0x32)=FIELD(s16,p[7],0x34)=76; FIELD(s16,p[7],0x28)=201;
    GX_DispOn(); volatile u32 *display=(volatile u32*)0x04000000;
    *display=(*display&~0x1f00U)|0x1000; return s;
}

/* Release the helper allocation if present and preserve its identity. */
extern "C" void *func_ov068_02210024(void *h){if(FIELD(void*,h,0))func_ov068_02210044(h);return h;}
/* Release and clear a pointer-table helper. */
extern "C" void func_ov068_02210044(void *h){if(FIELD(void*,h,0)){func_02003e38(FIELD(void*,h,0));FIELD(void*,h,0)=0;}FIELD(s32,h,4)=0;}
/* Replace the helper storage with a count-entry four-byte-aligned table. */
extern "C" void *func_ov068_02210070(void *h,s32 count){if(FIELD(void*,h,0))func_ov068_02210044(h);FIELD(void*,h,0)=func_02003e20(count*4,data_ov068_02210740,4,gHeapContext);FIELD(s32,h,4)=count;return h;}

static void destroy_scene(void *s)
{
    FIELD(void*,s,0)=data_ov068_0221077c;
    for(s32 i=0;i<2;++i){func_02071bdc(data_020f4e18,FIELD(void*,s,0x30+i*4));func_02071c38(data_020f4e18,FIELD(void*,s,0x3c+i*4));func_02071c94(data_020f4e18,FIELD(void*,s,0x48+i*4));}
    GraphicsSpriteGroup_Clear(FIELD(void*,s,0x24)); GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14,FIELD(void*,s,0x24));
    func_ov068_02210024((u8*)s+0x28); Scene_Destroy(s);
}
/* Destroy owned state while retaining the scene allocation. */
extern "C" void *func_ov068_022100b0(void *s){destroy_scene(s);return s;}
/* Destroy owned state and release the scene allocation. */
extern "C" void *func_ov068_02210140(void *s){destroy_scene(s);Heap_Free(s);return s;}

/* Advance input, randomized offsets, position history, and sprite animation. */
extern "C" s32 func_ov068_022101d8(void *s)
{
    FIELD(s16,s,0x58)=0; u16 held=FIELD(u16,gSystemState,4);
    FIELD(s16,s,0x5c)=(held&0x40)?-1:((held&0x80)?1:0);
    FIELD(s16,s,0x5a)=(held&0x20)?-1:((held&0x10)?1:0);
    if(FIELD(u16,gSystemState,6)&2){if(s){void **v=FIELD(void**,s,0);((void(*)(void*))v[1])(s);}return 1;}
    s32 frame=FIELD(s32,s,0x54), phase=wrap40(frame);
    s32 selected=phase==0?1:phase==9?2:phase==19?3:phase==29?4:0;
    FIELD(s16,s,0x58)=(s16)selected; void **p=sprites(s);
    if(selected){history(s,selected)[0]=(s16)(24-genrand_int32()%48);history(s,selected)[1]=(s16)(24-genrand_int32()%48);GraphicsSpriteState_SetAnimationIndex(p[selected],8+genrand_int32()%3);if(genrand_int32()&1)FIELD(u16,p[selected],0x24)|=0x40;else FIELD(u16,p[selected],0x24)&=(u16)~0x40;FIELD(s16,p[selected],0x28)=(genrand_int32()&1)?199:201;}
    s16 *current=history(s,wrap40(frame));current[0]=FIELD(s16,p[0],0x2c);current[1]=FIELD(s16,p[0],0x2e);
    set_position(p[0],current[0]+FIELD(s16,s,0x5a),current[1]+FIELD(s16,s,0x5c));
    s16 *trail=history(s,wrap40(frame-5));for(s32 i=1;i<=4;++i){s16 *o=history(s,i);set_position(p[i],trail[0]+o[0],trail[1]+o[1]);}
    const s32 delays[3]={20,28,34};for(s32 i=0;i<3;++i){trail=history(s,wrap40(frame-delays[i]));set_position(p[i+5],trail[0],trail[1]);}
    static const s16 scales[40]={8,0x1b,0x3b,0x57,0x6f,0x87,0x9b,0xaf,0xbf,0xcf,0xdb,0xe7,0xef,0xf7,0xfb,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xfb,0xf7,0xef,0xe7,0xdb,0xcf,0xbf,0xaf,0x9b,0x87,0x6f,0x57,0x3b,0x1b,8};
    for(s32 i=0;i<40;++i)data_ov068_022107c0[i]=scales[i]; const s32 shift[4]={0,9,19,29};
    for(s32 i=0;i<4;++i){s16 scale=data_ov068_022107c0[wrap40(frame+shift[i])];FIELD(s16,p[i+1],0x32)=scale;FIELD(s16,p[i+1],0x34)=scale;}
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void*,s,0x24));DebugText_BeginFrame();FIELD(s32,s,0x54)=frame+1;return 0;
}
/* Constant-status transition callback. */
extern "C" s32 func_ov068_0221071c(void){return 0;}
