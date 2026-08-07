#include "tingle/checked_fs.h"
#include "tingle/graphics_resources.h"
#include "tingle/types.h"

/* Overlay 11 sub-screen graphics/debug scene construction and five-file asset loading. */
#define FIELD(type,b,o) (*(type *)((u8 *)(b)+(o)))
#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_ov011_021fe578[]; extern const void *data_ov011_021fe5ac[]; extern const void *data_ov011_021fe3b0[];
extern const char *data_ov011_021fe3f0[5]; extern const char data_ov011_021fe610[]; extern void *data_020f4e14; extern void *gDebugFont; extern u8 gHeapContext[];
extern void Scene_Init(void *); extern void Scene_SetFlags03(void *); extern void func_02091e28(void *); extern void func_02092364(void *); extern void func_020923a4(void *); extern void func_020755bc(void *);
extern void *func_02002700(s32,const char *,s32,void *); extern void func_020b4554(void *,s32); extern void func_ov011_021fce00(u32); extern void func_ov011_021fce1c(u32,u32,u32,u32,u32); extern void func_ov011_021fce50(void *,s32,s32,s32); extern void func_ov011_021fd188(void *);
extern void GX_DispOn(void); extern void GXS_SetGraphicsMode(s32); extern void GX_SetBankForSubBG(s32); extern void func_020aea7c(s32); extern void func_02092618(void); extern void func_02092688(s32,s32,s32,s32); extern void func_02092850(u16);
#ifdef __cplusplus
}
#endif

/* Initialize scene/member descriptors, resource set +0x78 and debug member +0x98; clear +0x74/+0xCC/+0x108 and notify manager/debug-font owners. Load five paths into allocations +0x84..+0x94, store length/32 at +0xD4 and record indices at +0xE8, process only full reads, and close successful files. Clear +0xD0/+0x104, select display one, finalize +0x98, enable display, configure main mode1 and sub mode0x12 with BG0/bank settings, clear +0xFC/+0x100, invoke resource setup, clear palette control, set scene flags, initialize embedded +0x24 from descriptor entries +0x30/+0x34, and return state. File/graphics effects are delegated; direct I/O touches main/sub DISPCNT through SDK and register writes. */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov011_021fce78(void *state)
{
    FSFile file;s32 i;volatile u32 *main=(volatile u32 *)0x04000000,*sub=(volatile u32 *)0x04001000;
    Scene_Init(state);func_02091e28((u8 *)state+0x24);FIELD(const void *,state,0)=data_ov011_021fe578;FIELD(const void *,state,0x24)=data_ov011_021fe5ac;
    GraphicsResourceSet_Init((GraphicsResourceSet *)((u8 *)state+0x78));func_02092364((u8 *)state+0x98);FIELD(s32,state,0x74)=0;FIELD(s32,state,0x108)=0;FIELD(s32,state,0xcc)=0;func_020755bc(data_020f4e14);func_020755bc(gDebugFont);
    for(i=0;i<5;i++){s32 n;void *p;CheckedFS_InitFile(&file);if(!CheckedFS_OpenFile(&file,data_ov011_021fe3f0[i]))continue;n=CheckedFS_GetFileLength(&file);p=func_02002700(n,data_ov011_021fe610,4,gHeapContext);FIELD(void *,state,0x84+i*4)=p;FIELD(s32,state,0xd4+i*4)=n>>5;FIELD(s32,state,0xe8+i*4)=0;if(CheckedFS_ReadFile(&file,p,n)!=n)continue;func_020b4554(p,n);CheckedFS_CloseFile(&file);}
    FIELD(s32,state,0xd0)=0;FIELD(s32,state,0x104)=0;func_ov011_021fce00(1);func_020923a4((u8 *)state+0x98);GX_DispOn();*main=(*main&~0x1f00)|0x1000;*sub|=0x10000;*sub=(*sub&~0x1f00)|0x1200;GXS_SetGraphicsMode(0);GX_SetBankForSubBG(4);func_020aea7c(0x80);func_ov011_021fce1c(0,0,0x10,0,0);func_02092618();func_02092688(0,1,2,3);FIELD(s32,state,0xfc)=0;FIELD(s32,state,0x100)=0;func_ov011_021fd188(state);func_02092850(0);Scene_SetFlags03(state);func_ov011_021fce50((u8 *)state+0x24,(s32)data_ov011_021fe3b0[12],(s32)data_ov011_021fe3b0[13]-0x48,0);return state;
}
