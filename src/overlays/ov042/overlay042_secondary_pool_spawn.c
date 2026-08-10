#include "tingle/types.h"

/*
 * Overlay 42 secondary presentation-pool allocation. These recovered routines
 * pop linked child records from the signed head at +0x1648, bind caller state,
 * configure SDK resources, and reveal the selected child.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_020a1794(void *owner, void *source, void *destination);
extern "C" void func_0209a0d8(void *record, s32 resource0, s32 resource1,
                               s32 resource2, s32 ownerValue, s32 mode);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *resource, u8 mode);
extern "C" u32 genrand_int32(void);

/*
 * Apply the common confirmed allocation sequence for one +0x1648 free-list
 * slot. Store slotState at +0x14C8, clear +0x1468, bind source into child+0x2C,
 * configure three consecutive IDs with owner word zero and mode, disable the
 * resource, set child +0x44=-100, set or clear resource bit 1 as requested,
 * reveal the child, restore both scales to 0x100, and advance through +0x1588.
 */
static void activate_secondary_slot(void *pool, void *source, s32 slotState,
                                    s32 resource0, s32 mode, bool setBit1,
                                    s32 childValue, u8 resourceMode)
{
    s32 index = FIELD(s32, pool, 0x1648);
    FIELD(s32, pool, 0x14c8 + index * 4) = slotState;
    FIELD(u16, pool, 0x1468 + index * 2) = 0;
    void *owner = FIELD(void *, pool, 0x48);
    void *child = FIELD(void *, pool, 0xf28 + index * 4);
    func_020a1794(owner, source, (u8 *)child + 0x2c);
    func_0209a0d8(child, resource0, resource0 + 1, resource0 + 2,
                  FIELD(s32, owner, 0), mode);
    void *resource = FIELD(void *, child, 0xc);
    GraphicsSpriteState_SetAnimationIndex(resource, resourceMode);
    FIELD(s32, child, 0x44) = childValue;
    if (setBit1)
        FIELD(u16, resource, 0x24) |= 2;
    else
        FIELD(u16, resource, 0x24) &= (u16)~2;
    FIELD(u16, child, 0x42) &= (u16)~4;
    FIELD(u16, child, 0x3c) = 0x100;
    FIELD(u16, child, 0x3e) = 0x100;
    FIELD(s32, pool, 0x1648) = FIELD(s32, pool, 0x1588 + index * 4);
}

/*
 * If the +0x1648 head is nonnegative, allocate slot state zero with resource
 * IDs 0x222A..0x222C, configuration mode one, and resource bit 1 set. The
 * caller source is bound to the child transform; no value is returned.
 */
extern "C" void func_ov042_021fdf70(void *pool, void *source)
{
    if (FIELD(s32, pool, 0x1648) >= 0)
        activate_secondary_slot(pool, source, 0, 0x222a, 1, true, -100, 0);
}

/*
 * If a secondary slot is available, allocate slot state two with IDs
 * 0x222D..0x222F and mode one, clearing resource bit 1 before revealing the
 * child. A negative head is ignored and no value is returned.
 */
extern "C" void func_ov042_021fe098(void *pool, void *source)
{
    if (FIELD(s32, pool, 0x1648) >= 0)
        activate_secondary_slot(pool, source, 2, 0x222d, 1, false, -100, 0);
}

/*
 * Allocate slot state two using IDs 0x2224..0x2226 and configuration mode two.
 * Clear resource bit 1, reveal the child with +0x44=-100 and scale 0x100, and
 * advance +0x1648. A negative head is ignored; no value is returned.
 */
extern "C" void func_ov042_021fe1c4(void *pool, void *source)
{
    if (FIELD(s32, pool, 0x1648) >= 0)
        activate_secondary_slot(pool, source, 2, 0x2224, 2, false, -100, 0);
}

/*
 * Allocate slot state one using IDs 0x163C..0x163E and mode two. Set child
 * +0x44=-200 and resource bit 1, reveal it at scale 0x100, then advance the
 * secondary free-list head. A negative head has no effect; no value is returned.
 */
extern "C" void func_ov042_021fe2f0(void *pool, void *source)
{
    if (FIELD(s32, pool, 0x1648) >= 0)
        activate_secondary_slot(pool, source, 1, 0x163c, 2, true, -200, 0);
}

/*
 * Given pool and caller transform source, allocate state zero with IDs
 * 0x21EF..0x21F1, mode two, resource bit 1 set, and child +0x44=-100. A
 * negative +0x1648 head leaves all state unchanged; no value is returned.
 */
extern "C" void func_ov042_021fe41c(void *pool, void *source)
{
    if (FIELD(s32, pool, 0x1648) >= 0)
        activate_secondary_slot(pool, source, 0, 0x21ef, 2, true, -100, 0);
}

/*
 * Given pool and caller transform source, allocate state two with IDs
 * 0x1673..0x1675, mode one, resource bit 1 cleared, and child +0x44=-100. A
 * negative +0x1648 head leaves all state unchanged; no value is returned.
 */
extern "C" void func_ov042_021fe544(void *pool, void *source)
{
    if (FIELD(s32, pool, 0x1648) >= 0)
        activate_secondary_slot(pool, source, 2, 0x1673, 1, false, -100, 0);
}

/*
 * Given pool and source, allocate state two with IDs 0x2233..0x2235 and mode
 * two, selecting resource mode from the low two random bits. Clear resource
 * bit 1, reveal the child at scale 0x100 with +0x44=-100, and advance the head.
 * A negative +0x1648 head is ignored; no value is returned.
 */
extern "C" void func_ov042_021fe670(void *pool, void *source)
{
    if (FIELD(s32, pool, 0x1648) >= 0)
        activate_secondary_slot(pool, source, 2, 0x2233, 2, false, -100,
                                (u8)(genrand_int32() & 3));
}

/*
 * Given pool, transform source, and payload, allocate state three, store payload
 * at slot word +0x122C, configure IDs 0x2236..0x2238 in mode two, set resource
 * bit 1, reveal the child with +0x44=-100 and scale 0x100, and advance the head.
 * A negative secondary head leaves state unchanged; no value is returned.
 */
extern "C" void func_ov042_021fe7a4(void *pool, void *source, s32 payload)
{
    s32 index = FIELD(s32, pool, 0x1648);
    if (index < 0)
        return;
    FIELD(s32, pool, 0x122c + index * 12) = payload;
    activate_secondary_slot(pool, source, 3, 0x2236, 2, true, -100, 0);
}
