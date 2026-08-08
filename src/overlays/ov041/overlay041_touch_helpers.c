#include "tingle/types.h"

/*
 * Overlay 41 tile lookup and touch-state helpers. These recovered routines
 * sample resource tile maps, copy touch coordinates, perform a fixed-point
 * radius test, and update accumulated interaction counters.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
s32 func_020befec(s32, s32);
s32 func_020adc40(s32);
extern const u8 data_ov041_02205870[];
extern const u8 data_ov041_02205890[];
}

/*
 * Return the low ten bits of the tile-map entry at fixed-point coordinates
 * (x,y). Mode selects one of two inferred row-order tables; owner is unchanged.
 */
extern "C" s32 func_ov041_021feb54(void *owner, s32 x, s32 y)
{
    const u8 *order = FIELD(s32, owner, 0x1f4) == 2
        ? data_ov041_02205870 : data_ov041_02205890;
    s32 row = y >> 3;
    s32 page = func_020befec(row, 12);
    void *resource = FIELD(void *, owner, 0xf8 + order[page] * 12);
    const u16 *map = (const u16 *)FIELD(void *, resource, 0x24);
    s32 localRow = func_020befec(row, 12);
    s32 column = ((x >> 3) & 0x1f) + ((x & 0xf00) << 2);
    return map[column + localRow * 32] & 0x3ff;
}

/*
 * Copy the two coordinate words at source+4/+8 into destination when the
 * records differ. The leading word is deliberately not copied.
 */
extern "C" void func_ov041_021fec04(void *destination, const void *source)
{
    if (destination != source) {
        FIELD(s32, destination, 4) = FIELD(s32, source, 4);
        FIELD(s32, destination, 8) = FIELD(s32, source, 8);
    }
}

/*
 * Snapshot source into owner+0x1B8, toggle the just-pressed flag at 0x1C8 from
 * the previous active state, and mark touch tracking active.
 */
extern "C" void func_ov041_021febd4(void *owner, const void *source)
{
    func_ov041_021fec04((u8 *)owner + 0x1b8, source);
    FIELD(s32, owner, 0x1c8) = FIELD(s32, owner, 0x1c4) == 0;
    FIELD(s32, owner, 0x1c4) = 1;
}

/*
 * Return whether point (x,y) is within radius of the tracked touch position.
 * Coordinates and squared distance use the overlay's 20.12 fixed-point scale;
 * inactive tracking returns false.
 */
extern "C" s32 func_ov041_021fec1c(void *owner, s32 x, s32 y, s32 radius)
{
    if (FIELD(s32, owner, 0x1c4) == 0)
        return 0;
    s32 dx = FIELD(s32, owner, 0x1bc) - x;
    s32 dy = FIELD(s32, owner, 0x1c0) - y;
    s32 distanceSquared = (s32)(((s64)dx * dx + 0x800) >> 12) +
                          (s32)(((s64)dy * dy + 0x800) >> 12);
    return func_020adc40(distanceSquared) <= radius;
}

/*
 * Add amount to the accumulated interaction value and increment one of two
 * event counters selected by nonzero category. No value is returned.
 */
extern "C" void func_ov041_021fec84(void *owner, s32 amount, s32 category)
{
    FIELD(s32, owner, 0x1dc) += amount;
    if (category == 0)
        ++FIELD(s32, owner, 0x1e8);
    else
        ++FIELD(s32, owner, 0x1e4);
}

/* Set the pending interaction-update flag at owner+0x1E0. */
extern "C" void func_ov041_021fecb0(void *owner)
{
    FIELD(s32, owner, 0x1e0) = 1;
}

/*
 * Decay the accumulated interaction value using three magnitude bands, clamp
 * it to zero, and mark the interaction state pending.
 */
extern "C" void func_ov041_021fecbc(void *owner)
{
    s32 value = FIELD(s32, owner, 0x1dc);
    if (value > 1000)
        value -= 400;
    else if (value > 100)
        value -= 100;
    else
        value -= 50;
    if (value < 0)
        value = 0;
    FIELD(s32, owner, 0x1dc) = value;
    FIELD(s32, owner, 0x1e0) = 1;
}
