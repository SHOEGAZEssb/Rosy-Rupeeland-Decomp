#include "tingle/types.h"

/* Initialize extended type-two transform and motion vectors from two inputs. */
#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020050a4(void *destination, const void *source);
extern void func_0200b2c0(void *vector, s32 x, s32 y, s32 z);
#ifdef __cplusplus
}
#endif

/*
 * Copy position into vector +0x28, then copy that result through actor position
 * +0x18 to saved vector +0x22c. Zero vectors +0x38, +0x88, and +0x98. Copy
 * motion input words +0x04/+0x08 to +0x8c/+0x90 and +0x0c to +0x44, then
 * invoke virtual +0x114. Returns no value; actor transform, motion, and virtual
 * callback state change. Both input layouts remain address-derived.
 */
void ActorExtendedType2_InitializeTransformAndMotion(void *self, const void *position, const void *motion)
{
    u8 *a=(u8 *)self; const u8 *m=(const u8 *)motion;
    func_020050a4(a+0x28,position); func_020050a4(a+0x18,a+0x28); func_020050a4(a+0x22c,a+0x18);
    func_0200b2c0(a+0x38,0,0,0); func_0200b2c0(a+0x88,0,0,0); func_0200b2c0(a+0x98,0,0,0);
    *(u32 *)(a+0x8c)=*(const u32 *)(m+4); *(u32 *)(a+0x90)=*(const u32 *)(m+8); *(u32 *)(a+0x44)=*(const u32 *)(m+0xc);
    (*(void (**)(void *))(*(u8 **)a+0x114))(a);
}
