#include "tingle/types.h"

/* Overlay 10 3D-viewer defaults and initial clear-color setup. */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#ifdef __cplusplus
extern "C" {
#endif
extern void func_020b0300(u16, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif
/* Clear +0x158/+0x15C/+0x178/+0x17C and halfword +0x170; set +0x174=1, +0x164/+0x168=0x1000, +0x16C=0x100, and +0x154=8. Expand 8 to RGB555 and set the 3D clear color with alpha31, depth0x7FFF, polygon63, fog0. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov010_021fd39c(void *state)
{
    FIELD(s32,state,0x158)=0; FIELD(s32,state,0x15c)=0;
    FIELD(s32,state,0x174)=1; FIELD(s32,state,0x178)=0; FIELD(s32,state,0x17c)=0;
    FIELD(u16,state,0x170)=0; FIELD(s32,state,0x164)=0x1000;
    FIELD(s32,state,0x168)=0x1000; FIELD(s32,state,0x16c)=0x100;
    FIELD(s32,state,0x154)=8;
    func_020b0300((u16)(8 | (8<<5) | (8<<10)),31,0x7fff,63,0);
}
