#include "tingle/types.h"

/* Overlay 10 active model/resource creation from the selected packed record. */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18; extern const char data_ov010_021fec8c[]; extern u8 gHeapContext[];
extern void GraphicsResourceSetVariant_Load(void *,void *,s32,s32,s32); extern void *GraphicsAnimationInstanceManager_CreateInstance(void *,void *);
extern void *Heap_Alloc(s32,const char *,s32,void *); extern void *Graphics3DResourceBinding_Init(void *,void *,void *,s32,s32);
#ifdef __cplusplus
}
#endif
/* Clear +0x144/+0x148 and select a 32-byte record through +0x14C, buffers +0x90, and indices +0x13C. If record +8 is nonzero, load its three IDs into +0x7C, create +0x8C through +0x88, and set byte +0x59 to 3. Otherwise allocate/configure an 0x18-byte object at +0x12C from the record's low halfword IDs and +0x78. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov010_021fd45c(void *state)
{
    s32 s=FIELD(s32,state,0x14c); u8 *r=(u8 *)FIELD(void *,state,0x90+s*4)+FIELD(s32,state,0x13c+s*4)*0x20; void *p;
    FIELD(s32,state,0x144)=0; FIELD(s32,state,0x148)=0;
    if(FIELD(s32,r,8)!=0){
        GraphicsResourceSetVariant_Load((u8 *)state+0x7c,data_020f4e18,FIELD(s32,r,0),FIELD(s32,r,4),FIELD(s32,r,8));
        p=GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *,state,0x88),(u8 *)state+0x7c); FIELD(void *,state,0x8c)=p; FIELD(u8,p,0x59)=3;
    }else{
        p=Heap_Alloc(0x18,data_ov010_021fec8c,4,gHeapContext);
        if(p)Graphics3DResourceBinding_Init(p,data_020f4e18,FIELD(void *,state,0x78),FIELD(u16,r,0),FIELD(u16,r,4));
        FIELD(void *,state,0x12c)=p;
    }
}
