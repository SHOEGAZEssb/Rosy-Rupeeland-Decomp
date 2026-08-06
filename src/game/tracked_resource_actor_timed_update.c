#include "tingle/types.h"

/* Recovered state and cooldown update for a timed tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203292c(void *actor);
extern s32 func_02033f44(void *actor);
extern s32 func_020adae4(s32 value, s32 divisor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))
typedef s32 (*VirtualFunction)(void *, ...);

static VirtualFunction virtual_function(void *actor, u32 offset)
{
    return *(VirtualFunction *)((u8 *)FIELD(void *, actor, 0) + offset);
}

/*
 * Input is a timed actor. Calls virtual pre-update slot 0x18 and decrements the
 * positive cooldown at 0x200. In low state 0, increments timer 0x1F8, clears
 * presentation bit 4, and—when the low nibble at 0x4B is clear—compares field
 * 0x24 with 0x1DC and func_02033f44 to control flag 0x800000. Subtype 0x19 can
 * invoke slot 0xC4; otherwise reaching 0x1DC enters state 1 and divides fields
 * 0x8C/0x90 by the recovered factor 4. A nonzero nibble invokes slot 0xC8.
 * State 1 zeroes fields 0x3C/0x40 once field 0x24 reaches 0x1DC; state 2 calls
 * slot 0x54 with zero. Finally runs slots 0xD4/0xA4, func_0203292c, and slot
 * 0x20. Returns nothing; callbacks mutate engine state without direct hardware
 * access. State and motion field meanings remain partly inferred.
 */
void func_0205199c(void *actor)
{
    u16 state;
    s16 subtype;
    s16 cooldown;
    s32 reference;
    void *presentation;

    virtual_function(actor, 0x18)(actor);
    subtype = FIELD(s16, actor, 0x4e);
    cooldown = FIELD(s16, actor, 0x200);
    if (cooldown > 0)
        FIELD(s16, actor, 0x200) = cooldown - 1;
    state = FIELD(u16, actor, 0x1f0) & 0x7fff;
    if (state == 0) {
        ++FIELD(s16, actor, 0x1f8);
        presentation = FIELD(void *, actor, 0x54);
        FIELD(u16, presentation, 0x24) &= (u16)~4;
        if ((FIELD(u8, actor, 0x4b) & 0x0f) == 0) {
            if (FIELD(s32, actor, 0x1dc) < FIELD(s32, actor, 0x24)) {
                reference = func_02033f44(actor);
                if (FIELD(s32, actor, 0x24) - reference < 0x20001)
                    FIELD(u32, actor, 0x14) |= 0x800000;
                else
                    FIELD(u32, actor, 0x14) &= 0xff7fffff;
            } else if (subtype == 0x19) {
                virtual_function(actor, 0xc4)(actor, 0);
            } else {
                FIELD(s32, actor, 0x24) = FIELD(s32, actor, 0x1dc);
                FIELD(u16, actor, 0x1f0) =
                    (FIELD(u16, actor, 0x1f0) & 0x8000) | 1;
                FIELD(s16, actor, 0x1f8) = 0;
                FIELD(s32, actor, 0x8c) =
                    func_020adae4(FIELD(s32, actor, 0x8c), 4);
                FIELD(s32, actor, 0x90) =
                    func_020adae4(FIELD(s32, actor, 0x90), 4);
            }
        } else {
            virtual_function(actor, 0xc8)(actor);
        }
    } else if (state == 1) {
        if (FIELD(s32, actor, 0x24) <= FIELD(s32, actor, 0x1dc)) {
            FIELD(s32, actor, 0x40) = 0;
            FIELD(s32, actor, 0x3c) = 0;
        }
    } else if (state == 2) {
        virtual_function(actor, 0x54)(actor, 0);
    }
    virtual_function(actor, 0xd4)(actor);
    virtual_function(actor, 0xa4)(actor);
    func_0203292c(actor);
    virtual_function(actor, 0x20)(actor);
}
