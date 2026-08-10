#include "tingle/types.h"

/*
 * Overlay 42 primary-child resource reconfiguration. This recovered routine
 * switches the scene's four presentation children between several confirmed
 * resource layouts and applies their animation, scale, and visibility flags.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void func_0209a07c(void *child);
extern "C" void func_0209a0d8(void *child, s32 resource0, s32 resource1,
                                s32 resource2, s32 ownerValue, s32 mode);
extern "C" void func_0209a120(void *child, s32 resource0, s32 resource1,
                                s32 resource2, s32 ownerValue);
extern "C" void func_0209a2a4(void *child, s32 value);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *resource, u8 mode);

static s32 owner_value(void *object)
{
    return FIELD(s32, FIELD(void *, object, 0x48), 0);
}

static void set_resource_bit1(void *child)
{
    FIELD(u16, FIELD(void *, child, 0xc), 0x24) |= 2;
}

static void hide_child_and_resource(void *child)
{
    FIELD(u16, child, 0x42) |= 4;
    FIELD(u16, FIELD(void *, child, 0xc), 0x24) |= 4;
}

/*
 * Given object and mode, mode four first notifies all four children, assigns
 * resource triples 0x12FA, 0x1670, and 0x2227 to +0x4C/+0x54/+0x50 in mode
 * two, selects resource modes 9/0/0, sets resource bit 1, applies +0x44 values
 * 60 and -60 plus scale 0x100 where confirmed, then hides all children (and
 * the first three resources). Modes three, two, and one instead reconfigure
 * +0x50 with the confirmed 0x12EB or 0x12E3 resource layouts. All non-four
 * paths finish by selecting resource mode zero and setting bit 1 on +0x50.
 * Object-owned SDK resource state changes; no value is returned.
 */
extern "C" void func_ov042_02200658(void *object, s32 mode)
{
    void *child4c = FIELD(void *, object, 0x4c);
    void *child50 = FIELD(void *, object, 0x50);
    void *child54 = FIELD(void *, object, 0x54);
    void *child58 = FIELD(void *, object, 0x58);
    if (mode == 4) {
        func_0209a07c(child4c);
        func_0209a07c(child54);
        func_0209a07c(child50);
        func_0209a07c(child58);
        s32 owner = owner_value(object);
        func_0209a0d8(child4c, 0x12fa, 0x12fb, 0x12fc, owner, 2);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child4c, 0xc), 9);
        set_resource_bit1(child4c);
        func_0209a0d8(child54, 0x1670, 0x1671, 0x1672, owner, 2);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child54, 0xc), 0);
        set_resource_bit1(child54);
        func_0209a2a4(child54, 0);
        FIELD(s32, child54, 0x44) = 60;
        func_0209a0d8(child50, 0x2227, 0x2228, 0x2229, owner, 2);
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child50, 0xc), 0);
        set_resource_bit1(child50);
        FIELD(u16, child50, 0x3c) = 0x100;
        FIELD(u16, child50, 0x3e) = 0x100;
        FIELD(s32, child50, 0x44) = -60;
        func_0209a2a4(child50, 0);
        hide_child_and_resource(child4c);
        hide_child_and_resource(child54);
        hide_child_and_resource(child50);
        FIELD(u16, child58, 0x42) |= 4;
        return;
    }

    s32 owner = owner_value(object);
    if (mode == 3)
        func_0209a0d8(child50, 0x12eb, 0x12ec, 0x12ed, owner, 1);
    else if (mode == 2)
        func_0209a120(child50, 0x12e3, 0x12e7, 0x12e5, owner);
    else if (mode == 1)
        func_0209a120(child50, 0x12e3, 0x12e6, 0x12e5, owner);
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, child50, 0xc), 0);
    set_resource_bit1(child50);
}
