#include "tingle/types.h"

/* Overlay 12 transform submission to the Nintendo DS geometry engine. */

extern s16 gFx32CosSinTable[];
#ifdef __cplusplus
extern "C" {
#endif
extern void func_020b0880(s32, s32);
extern void func_020b0844(s32, s32);
extern void func_020b0808(s32, s32);
#ifdef __cplusplus
}
#endif

/* Submit translation, X/Y/Z rotations from the SDK sine/cosine table, then scale; returns void with direct geometry FIFO effects. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fcef4(void *object)
{
    volatile s32 *translation = (volatile s32 *)0x04000470;
    volatile s32 *scale = (volatile s32 *)0x0400046c;
    u32 angle;

    *translation = *(s32 *)((u8 *)object + 0x08);
    *translation = *(s32 *)((u8 *)object + 0x0c);
    *translation = *(s32 *)((u8 *)object + 0x10);

    /* Rotation fields use a 16-bit angle whose low four bits are fractional. */
    angle = (u16)*(u32 *)((u8 *)object + 0x20) >> 4;
    func_020b0880(gFx32CosSinTable[angle * 2], gFx32CosSinTable[angle * 2 + 1]);
    angle = (u16)*(u32 *)((u8 *)object + 0x24) >> 4;
    func_020b0844(gFx32CosSinTable[angle * 2], gFx32CosSinTable[angle * 2 + 1]);
    angle = (u16)*(u32 *)((u8 *)object + 0x28) >> 4;
    func_020b0808(gFx32CosSinTable[angle * 2], gFx32CosSinTable[angle * 2 + 1]);

    *scale = *(s32 *)((u8 *)object + 0x14);
    *scale = *(s32 *)((u8 *)object + 0x18);
    *scale = *(s32 *)((u8 *)object + 0x1c);
}
