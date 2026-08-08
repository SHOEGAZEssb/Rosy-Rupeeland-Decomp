#include "tingle/types.h"

/* Overlay 36 ramp-controller child activation and per-frame emission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern const u8 data_ov036_022051f0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_020948e4(void *field, s32 mode, s32 value);
extern void func_020948f8(void *field, s32 mode, s32 value);
extern void func_020956fc(void *object);
extern s32 func_020ae024(s32 x, s32 y);
extern void func_02095360(void *list);
extern void func_020773a8(void *manager);
extern s32 func_02091c7c(void *timer, s32 mode);
extern void func_ov036_02201580(void *controller, s32 duration);
extern void func_ov036_02201470(void *controller);
#ifdef __cplusplus
}
#endif

/* Implements signed division by 16 with truncation toward zero. */
static s32 divide_by_16(s32 value)
{
    return (value + ((u32)(value >> 3) >> 28)) >> 4;
}

/* Implements the recovered signed halving with truncation toward zero. */
static s32 halve(s32 value)
{
    return (value + ((u32)(value >> 1) >> 31)) >> 1;
}

/*
 * Activates the ten persistent children created by func_ov036_02201710.
 * Children +0x120/+0x124 are placed at child +0x11C's X/Z and Z=-0x20,
 * scale toward 0x4000 in mode 3 for 30 frames, and are restarted. Each of the
 * eight +0x128 children uses its 0x14-byte data_ov036_022051f0 record:
 * +4/+8 offset the anchor X/Z, +0xC supplies Y, and an atan-like SDK helper
 * applied to (+4,(+8+0x100))/16 selects a direction in data_020c9670. Half of
 * that direction becomes mode-4 X/Y targets; scale targets 0x19A in mode 2
 * over 60 frames. Returns nothing; transforms, timers, active flags, and
 * animation state change.
 */
extern "C" void func_ov036_022018a8(void *controller)
{
    void *anchor = FIELD(void *, controller, 0x11c);
    s32 anchorX = FIELD(s32, anchor, 0x10);
    s32 anchorZ = FIELD(s32, anchor, 0x20);

    for (s32 i = 0; i < 2; ++i) {
        void *child = FIELD(void *, controller, 0x120 + i * 4);
        func_02094bbc(child, anchorX, anchorZ, -0x20);
        func_020948e4((u8 *)child + 0x6c, 3, 0x4000);
        FIELD(s32, child, 0x7c) = 0x1e;
        FIELD(s32, child, 0x80) = 0;
        FIELD(s32, child, 0x88) = 1;
        func_020956fc(child);
    }

    for (s32 i = 0; i < 8; ++i) {
        const u8 *record = data_ov036_022051f0 + i * 0x14;
        s32 xOffset = *(const s32 *)(record + 4);
        s32 zOffset = *(const s32 *)(record + 8);
        u16 angle = (u16)func_020ae024(divide_by_16(xOffset),
                                       divide_by_16(zOffset + 0x100));
        u32 index = (angle >> 4) * 2;
        void *child = FIELD(void *, controller, 0x128 + i * 4);
        func_02094bbc(child, anchorX + xOffset, anchorZ + zOffset,
                      *(const s32 *)(record + 0xc));
        func_020948f8((u8 *)child + 0xc, 4,
                      halve(data_020c9670[index]));
        func_020948f8((u8 *)child + 0x1c, 4,
                      halve(data_020c9670[index + 1]));
        func_020948e4((u8 *)child + 0x6c, 2, 0x19a);
        FIELD(s32, child, 0x7c) = 0x3c;
        FIELD(s32, child, 0x80) = 0;
        FIELD(s32, child, 0x88) = 1;
        func_020956fc(child);
    }
}

/*
 * Runs both controller lists, advances manager +0x118, and samples timer
 * +0x168 in mode zero. It then emits four ramp primitives with durations
 * 0x18..0x1B and services the alternating periodic child emitter. Returns
 * nothing; list, manager, timer/RNG, heap, and emitted-child state may change.
 */
extern "C" void func_ov036_02201a78(void *controller)
{
    func_02095360((u8 *)controller + 0x148);
    func_02095360((u8 *)controller + 0x158);
    func_020773a8(FIELD(void *, controller, 0x118));
    (void)func_02091c7c((u8 *)controller + 0x168, 0);
    for (s32 i = 0; i < 4; ++i)
        func_ov036_02201580(controller, i + 0x18);
    func_ov036_02201470(controller);
}
