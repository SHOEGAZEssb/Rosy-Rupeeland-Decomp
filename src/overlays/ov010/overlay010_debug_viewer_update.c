#include "tingle/types.h"

/*
 * Overlay 10 3D animation/debug-viewer update. This recovered routine edits a
 * selected model record and camera/render parameters, draws diagnostics, and
 * submits the resulting 3D scene.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_ov010_021fea38[];
extern void func_ov010_021fd39c(void *); extern void func_ov010_021fd408(void *); extern void func_ov010_021fd45c(void *);
extern s32 func_ov010_021fd520(void *,s32,s32,s32,s32); extern s32 func_ov010_021fd564(void *,s32,s32,s32,s32); extern s32 func_ov010_021fd5a8(void *,s32,s32,s32,s32);
extern void func_ov010_021fce94(void *,s32,s32,s32); extern void GraphicsAnimationInstance_SetAnimation(void *,s32); extern void GraphicsAnimationInstance_SetFrame(void *,s32);
extern void func_020b0300(u16,s32,s32,s32,s32); extern void GraphicsAnimationInstanceManager_Update(void *);
#ifdef __cplusplus
}
#endif

/* Recreate the selected active resource after a file or record change. */
static void overlay010_recreate(void *state){func_ov010_021fd408(state);func_ov010_021fd45c(state);}

/*
 * Reset defaults on newly pressed bit 8. Repeated bit 0x100 turns the D-pad
 * into camera controls, clamping +0x158 to [-128,127] and +0x15C to [-96,95].
 * Otherwise held bit 0x200 cycles +0x17C across three debug/render pages and
 * up/down wrap menu row +0x150 across 11 entries. The entries select one of two
 * loaded files (+0x14C), its 32-byte record (+0x13C), animation +0x144,
 * subanimation +0x148, playback/toggle flags +0x174/+0x178, rotation halfword
 * +0x170, values +0x164/+0x168 in [-0x4000,0x4000], value +0x16C in
 * [-0x800,0x800], or clear-color component +0x154 in [0,31]. Selection changes
 * recreate the active resource; animation calls use GraphicsAnimationInstance_SetAnimation/GraphicsAnimationInstance_SetFrame.
 *
 * For active +0x8C, write camera values shifted by four to +0x20/+0x24, clear
 * +0x28, mirror playback into flag bit 1 while clearing completion bit 0 when
 * enabled, mirror +0x178 into bit 9, and copy rotation/value fields to
 * +0x4C/+0x34/+0x38/+0x52. Advance via GraphicsAnimationInstanceManager_Update and synchronize +0x148
 * from byte +0x55 when completion bit zero. The retail tail prints the model,
 * animation and renderer diagnostics, applies camera matrices, submits either
 * resource representation (+0x8C or +0x12C), restores GX state, and clears the
 * 3D clear-image register. Newly pressed bit 1 sets +0x6C to 0x10 and
 * transitions embedded +0x24 through descriptor entries +0x30/+0x34. Return 0.
 *
 * Offsets, bounds, calls, and register effects are confirmed. Names such as
 * camera/model/playback are inferred from debug strings and downstream APIs.
 * This portable reference expresses persistent controls; the exact fallback
 * retains expanded debug drawing, matrix submission, and GX register ordering.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov010_021fd638(void *state)
{
    u8 *input=FIELD(u8 *,state,0x50);u16 repeat=FIELD(u16,input,0),pressed=FIELD(u16,input,2),held=FIELD(u16,input,6);void *obj;
    if(pressed&8)func_ov010_021fd39c(state);
    if(repeat&0x100){
        if(repeat&0x20){if(--FIELD(s32,state,0x158)<-128)FIELD(s32,state,0x158)=-128;}else if(repeat&0x10){if(++FIELD(s32,state,0x158)>=128)FIELD(s32,state,0x158)=127;}
        if(repeat&0x80){if(--FIELD(s32,state,0x15c)<-96)FIELD(s32,state,0x15c)=-96;}else if(repeat&0x40){if(++FIELD(s32,state,0x15c)>=96)FIELD(s32,state,0x15c)=95;}
    }else{
        s32 row=FIELD(s32,state,0x150);
        if(held&0x200){s32 page=FIELD(s32,state,0x17c)+1;FIELD(s32,state,0x17c)=page>=3?0:page;}
        if(held&0x40)row=row==0?10:row-1;else if(held&0x80)row=row==10?0:row+1;FIELD(s32,state,0x150)=row;
        if(FIELD(s32,state,0x174)==0&&(pressed&1)&&(obj=FIELD(void *,state,0x8c))!=0){FIELD(u8,obj,0x55)=0;FIELD(s32,obj,0x30)=0;FIELD(u16,obj,0x50)&=(u16)~1;}
        switch(row){
        case 0:if(held&0x30){FIELD(s32,state,0x14c)=func_ov010_021fd5a8(state,FIELD(s32,state,0x14c),0,1,1);overlay010_recreate(state);}break;
        case 1:if(held&0x30){s32 s=FIELD(s32,state,0x14c);FIELD(s32,state,0x13c+s*4)=func_ov010_021fd5a8(state,FIELD(s32,state,0x13c+s*4),0,FIELD(s32,state,0x134+s*4)-1,1);overlay010_recreate(state);}break;
        case 2:if((obj=FIELD(void *,state,0x8c))&&held&0x30){void *m=FIELD(void *,FIELD(void *,state,0x84),0x20);FIELD(s32,state,0x144)=func_ov010_021fd5a8(state,FIELD(s32,state,0x144),0,FIELD(s32,m,4)-1,1);GraphicsAnimationInstance_SetAnimation(obj,(u8)FIELD(s32,state,0x144));}break;
        case 3:if((obj=FIELD(void *,state,0x8c))&&FIELD(s32,state,0x174)==0&&(held&0x30)){void *t=FIELD(void *,FIELD(void *,state,0x84),0x24);u8 *e=(u8 *)t+FIELD(s32,state,0x144)*8;FIELD(s32,state,0x148)=func_ov010_021fd5a8(state,FIELD(s32,state,0x148),0,FIELD(u16,e,2)-1,1);GraphicsAnimationInstance_SetFrame(obj,(u8)FIELD(s32,state,0x148));}break;
        case 4:if(held&0x30)FIELD(s32,state,0x174)^=1;break;
        case 5:if(held&0x30)FIELD(s32,state,0x178)^=1;break;
        case 6:if(obj=FIELD(void *,state,0x8c)){if(repeat&0x20)FIELD(s16,state,0x170)-=0x100;else if(repeat&0x10)FIELD(s16,state,0x170)+=0x100;}break;
        case 7:if(FIELD(void *,state,0x8c))FIELD(s32,state,0x164)=func_ov010_021fd520(state,FIELD(s32,state,0x164),-0x4000,0x4000,0x80);break;
        case 8:if(FIELD(void *,state,0x8c))FIELD(s32,state,0x168)=func_ov010_021fd520(state,FIELD(s32,state,0x168),-0x4000,0x4000,0x80);break;
        case 9:if(FIELD(void *,state,0x8c))FIELD(s32,state,0x16c)=func_ov010_021fd564(state,FIELD(s32,state,0x16c),-0x800,0x800,0x10);break;
        case 10:if(held&0x30){s32 v=func_ov010_021fd564(state,FIELD(s32,state,0x154),0,31,1);FIELD(s32,state,0x154)=v;func_020b0300((u16)(v|v<<5|v<<10),31,0x7fff,63,0);}break;
        }
    }
    obj=FIELD(void *,state,0x8c);
    if(obj){u16 flags=FIELD(u16,obj,0x50);FIELD(s32,obj,0x20)=FIELD(s32,state,0x158)<<4;FIELD(s32,obj,0x24)=FIELD(s32,state,0x15c)<<4;FIELD(s32,obj,0x28)=0;
        if(FIELD(s32,state,0x174))flags=(flags|2)&(u16)~1;else flags&=(u16)~2;if(FIELD(s32,state,0x178))flags|=0x200;else flags&=(u16)~0x200;FIELD(u16,obj,0x50)=flags;
        FIELD(s16,obj,0x4c)=FIELD(s16,state,0x170);FIELD(s32,obj,0x34)=(s16)FIELD(s32,state,0x164);FIELD(s32,obj,0x38)=(s16)FIELD(s32,state,0x168);FIELD(u16,obj,0x52)=(u16)FIELD(s32,state,0x16c);
    }
    GraphicsAnimationInstanceManager_Update(FIELD(void *,state,0x88));
    if(obj&&(FIELD(u16,obj,0x50)&1)==0)FIELD(s32,state,0x148)=FIELD(u8,obj,0x55);
    if(pressed&2){FIELD(s32,state,0x6c)=0x10;func_ov010_021fce94((u8 *)state+0x24,(s32)data_ov010_021fea38[12],(s32)data_ov010_021fea38[13]-0x48,0);}
    return 0;
}
