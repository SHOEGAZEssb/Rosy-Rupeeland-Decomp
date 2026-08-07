#include "tingle/types.h"

/* Overlay 12 four-slot draw-record configuration. */

#ifdef __cplusplus
extern "C" void func_020add34(void *, void *);
#else
extern void func_020add34(void *, void *);
#endif

/* For index 0..3, write the three record words, initialize it through func_020add34, and pack three 5-bit color inputs; invalid indices have no effect. */
#ifdef __cplusplus
extern "C"
#endif
void func_ov012_021fd0d4(void *state, s32 index, u32 word0, u32 word4,
                         u32 word8, u32 red, u32 green, u32 blue)
{
    u8 *record;

    if (index >= 0 && index < 4) {
        record = (u8 *)state + index * 0x10;
        *(u16 *)(record + 0x0e) = 1;
        *(u32 *)(record + 0x00) = word0;
        *(u32 *)(record + 0x04) = word4;
        *(u32 *)(record + 0x08) = word8;
        func_020add34(record, record);
    }

    /* The duplicated range check is confirmed in the original control flow. */
    if (index >= 0 && index < 4) {
        record = (u8 *)state + index * 0x10;
        *(u16 *)(record + 0x0e) = 1;
        *(u16 *)(record + 0x0c) = (u16)(red | (green << 5) | (blue << 10));
    }
}
