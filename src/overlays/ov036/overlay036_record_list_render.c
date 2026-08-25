#include "tingle/types.h"

/* Overlay 36 linked timed-record GX strip rendering and attribute packing. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG32(address) (*(volatile u32 *)(address))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 TitleInterpolatedValue_Evaluate(void *timer, s32 mode, s32 target, s32 parameter);
extern void func_ov036_021fd128(s32, s32, s32, s32, s32, s32);
extern void func_ov036_021fd660(s16 first, u16 second, u16 third);
extern void func_ov036_021fdef0(s32, s32, s32, s32,
                                s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/* Writes a low-16-bit X/Y pair to the packed GX vertex FIFO. */
static void write_xy(s32 x, s32 y)
{
    REG32(0x04000494) = (u16)x | ((u32)(u16)y << 16);
}

/*
 * Draws one quad between each consecutive pair of records when list count +8
 * is at least two. Fields +4/+8/+0x14 form one submitted point and fields
 * +0xC/+0x10/+0x14 the other; all are truncated to signed 16 bits. Each next
 * record's timer +0x18 supplies a value interpolated toward 31 for the common
 * GX attribute helper. List color +0x14 is written for every quad. It returns
 * nothing and directly changes Nintendo DS GX FIFO/MMIO state and timers.
 */
extern "C" void func_ov036_021fdd4c(void *list)
{
    if (FIELD(s32, list, 8) < 2)
        return;

    func_ov036_021fdef0(0, 0, 0, 0, 0, 0, 0, 0);

    void *previous = FIELD(void *, list, 0);
    s16 firstX = FIELD(s16, previous, 4);
    s16 firstY = FIELD(s16, previous, 8);
    s16 secondX = FIELD(s16, previous, 0xc);
    s16 secondY = FIELD(s16, previous, 0x10);
    s16 firstZ = FIELD(s16, previous, 0x14);
    void *record = FIELD(void *, previous, 0);

    while (record != 0) {
        s16 nextFirstX = FIELD(s16, record, 4);
        s16 nextFirstY = FIELD(s16, record, 8);
        s16 nextSecondX = FIELD(s16, record, 0xc);
        s16 nextSecondY = FIELD(s16, record, 0x10);
        s16 nextZ = FIELD(s16, record, 0x14);
        s32 timerValue = TitleInterpolatedValue_Evaluate((u8 *)record + 0x18, 1, 0x1f, 1);

        func_ov036_021fd128(0, 0, 3, 0x11, timerValue, 0);
        REG32(0x04000500) = 1;
        REG32(0x04000480) = FIELD(u16, list, 0x14);
        func_ov036_021fd660(firstX, firstY, firstZ);
        write_xy(secondX, secondY);
        func_ov036_021fd660(nextSecondX, nextSecondY, nextZ);
        write_xy(nextFirstX, nextFirstY);
        REG32(0x04000504) = 0;

        firstX = nextFirstX;
        firstY = nextFirstY;
        secondX = nextSecondX;
        secondY = nextSecondY;
        record = FIELD(void *, record, 0);
    }
}

/*
 * Packs eight caller-supplied bitfields into the GX polygon-attribute register
 * at 0x040004A8. Values are not masked before shifting, matching the original;
 * field positions are 26, 30, 20, 23, 16, 18, 29, with argument 7 shifted
 * right by three. It returns nothing and changes the GX polygon attributes.
 */
extern "C" void func_ov036_021fdef0(s32 value0, s32 value1,
                                      s32 value2, s32 value3,
                                      s32 value4, s32 value5,
                                      s32 value6, s32 value7)
{
    u32 packed = ((u32)value0 << 26) | ((u32)value7 >> 3) |
                 ((u32)value1 << 30) | ((u32)value2 << 20) |
                 ((u32)value3 << 23) | ((u32)value4 << 16) |
                 ((u32)value5 << 18) | ((u32)value6 << 29);
    REG32(0x040004a8) = packed;
}
