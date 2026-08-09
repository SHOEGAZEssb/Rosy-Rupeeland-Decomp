#include "tingle/types.h"

/*
 * Overlay 42 active-record pool update. This recovered pass advances all 64
 * records, applies marker-specific collision tests, emits bursts on impacts,
 * and returns expired or out-of-bounds records to the free list.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_ov042_021fcf80(void *vector);
extern "C" void func_ov042_021fda0c(void *destination, const void *source);
extern "C" void func_ov042_021ff2f8(void *position, const void *velocity);
extern "C" void func_ov042_02203658(void *destination, const void *source);
extern "C" void func_ov042_02205148(void *state, s32 index);
extern "C" void func_ov042_021fda24(void *pool, s32 type,
                                      const void *position, s32 variant);
extern "C" s32 func_ov071_02211a10(void *collision, const void *position,
                                     s32 radius, s32 kind, s32 flags);
extern "C" s32 func_ov071_02210440(void *scene, const void *position,
                                     s32 radius, s32 kind);

/* Convert a record's fixed-point position to the coordinate triple expected by
 * overlay 71's collision queries. The exact third component is owned by the
 * already recovered helper and remains intentionally opaque here. */
static void query_position(s32 out[3], const void *record)
{
    func_ov042_02203658(out, record);
}

/*
 * Given the overlay state, copy the confirmed owner position into a temporary
 * work vector, then scan records 63 through zero. Active records increment
 * their +0x744 age. Markers 1, 11, and 12 integrate their +0x444 velocity,
 * expire outside the fixed playfield, test two collision domains, subtract
 * returned damage from age, and spawn variant -1 on a scene hit. Marker 10
 * follows the same motion/bounds rules with larger query radii and a distinct
 * collision kind. Sentinel marker 100 lives for 20 ticks and emits variants
 * 0..2 every fourth tick. Releasing a record mutates the pool free list; the
 * collision and burst helpers can change overlay 71 and rendering state. No
 * value is returned.
 */
extern "C" void func_ov042_0220549c(void *state)
{
    s32 ownerPosition[3];
    func_ov042_021fcf80(ownerPosition);
    void *owner = FIELD(void *, state, 0);
    func_ov042_021fda0c(ownerPosition,
        (u8 *)FIELD(void *, owner, 8) + 0x94);

    for (s32 index = 63; index >= 0; index--) {
        s8 marker = FIELD(s8, state, 0x44 + index);
        if (marker <= -1)
            continue;

        s16 *age = (s16 *)((u8 *)state + 0x744 + index * 2);
        (*age)++;
        void *record = (u8 *)state + 0x144 + index * 12;
        void *velocity = (u8 *)state + 0x444 + index * 12;

        if (marker == 1 || marker == 11 || marker == 12) {
            func_ov042_021ff2f8(record, velocity);
            s32 x = FIELD(s32, record, 4);
            s32 y = FIELD(s32, record, 8);
            if (x < -0xd2000 || x > 0xd2000 ||
                y < -0x110000 || y > 0x122000) {
                func_ov042_02205148(state, index);
                continue;
            }

            s32 position[3];
            query_position(position, record);
            s32 damage = func_ov071_02211a10(
                FIELD(void *, FIELD(void *, owner, 8), 0xe8), position,
                marker == 12 ? 0x18000 : 0x14000,
                marker == 12 ? 6 : 1, 0);
            if (damage > 0) {
                *age -= (s16)damage;
                if (*age <= 0)
                    func_ov042_02205148(state, index);
            }

            query_position(position, record);
            if (func_ov071_02210440(FIELD(void *, owner, 8), position,
                                    0x18000, 0) > 0) {
                func_ov042_021fda24(FIELD(void *, owner, 0x14), 1,
                                      record, -1);
                func_ov042_02205148(state, index);
            }
        } else if (marker == 10) {
            func_ov042_021ff2f8(record, velocity);
            s32 x = FIELD(s32, record, 4);
            s32 y = FIELD(s32, record, 8);
            if (x < -0xd2000 || x > 0xd2000 ||
                y < -0x110000 || y > 0x122000) {
                func_ov042_02205148(state, index);
                continue;
            }

            s32 position[3];
            query_position(position, record);
            if (func_ov071_02210440(FIELD(void *, owner, 8), position,
                                    0x26000, 0) > 0) {
                func_ov042_021fda24(FIELD(void *, owner, 0x14), 1,
                                      record, -1);
                func_ov042_02205148(state, index);
            }
            query_position(position, record);
            s32 damage = func_ov071_02211a10(
                FIELD(void *, FIELD(void *, owner, 8), 0xe8), position,
                0x26000, 2, 0);
            if (damage > 0) {
                *age -= (s16)damage;
                if (*age <= 0)
                    func_ov042_02205148(state, index);
            }
        } else if (marker == 100) {
            if (*age > 20) {
                func_ov042_02205148(state, index);
            } else if ((*age & 3) == 0) {
                func_ov042_021fda24(FIELD(void *, owner, 0x14), 1,
                                      record, (*age >> 3) & 3);
            }
        }
    }
}
