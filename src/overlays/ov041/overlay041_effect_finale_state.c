#include "tingle/types.h"

/*
 * Overlay 41 finale sequencing. This recovered controller rotates and scales
 * the leading effect, reveals the 91-record pool in waves, performs a
 * master-brightness transition, and emits particles from seven spaced records.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
s32 func_ov041_02202aa4(void *);
void func_ov004_021fb868(void *, s32, s32, s32);
void Sound_Play(void *, s32, s32);
void GXx_SetMasterBrightness_(u32, s32);
void *func_02002d28(void *, s32);
void func_02002ac0(void *, s32, s32, s32);
extern void *gSoundContext;
extern u8 data_020f4dc8[];
}

/*
 * Advance the sparse states 0,1 and 10-13 at object+0x91C. Early states rotate
 * record zero and grow object+0x940. State 11 raises per-record values in a
 * trailing wave and plays sound 0x12D for each newly reached group boundary.
 * State 12 delays 30 frames, advances seven slot counters, fades both displays
 * to brightness 16 through GXx_SetMasterBrightness_, then configures two
 * presentation resources. State 13 emits types 1-4 through the overlay-004
 * particle boundary for each of seven records and advances to state 14.
 * The function returns no value; it changes display hardware, audio, and
 * external particle state. Particle type semantics remain inferred.
 */
extern "C" void func_ov041_022025b0(void *object)
{
    s32 state = FIELD(s32, object, 0x91c);
    if (state == 0) {
        u32 direction = (u32)(FIELD(s32, object, 0x4b8) - 0x96) & 0xffff;
        FIELD(s32, object, 0x4b8) = direction;
        if (direction < 0x6b6c)
            FIELD(s32, object, 0x91c)++;
        return;
    }
    if (state == 1) {
        if (FIELD(s32, object, 0x70) > -0x28000) {
            FIELD(s32, object, 0x4b8) =
                (u32)(FIELD(s32, object, 0x4b8) +
                      func_ov041_02202aa4(object) * 2) &
                0xffff;
            return;
        }
        FIELD(s32, object, 0x940) += 0xc8;
        if (FIELD(s32, object, 0x940) > 0x1000)
            FIELD(s32, object, 0x940) = 0x1000;
        FIELD(s32, object, 0x4b8) =
            (u32)(FIELD(s32, object, 0x4b8) + 0x140) & 0xffff;
        if (FIELD(s32, object, 0x4b8) > 0xc738)
            FIELD(s32, object, 0x91c) = 10;
        return;
    }
    if (state == 10) {
        if (++FIELD(s32, object, 0x930) > 40) {
            FIELD(s32, object, 0x91c)++;
            FIELD(s32, object, 0x930) = 0;
            FIELD(s32, object, 0x934) = 0;
        }
        return;
    }
    if (state == 11) {
        s32 first = 91 - FIELD(s32, object, 0x930);
        if (first < 0)
            first = 0;
        for (s32 index = 90; index >= first; --index) {
            if (index % 13 == 0 &&
                FIELD(s32, object, 0x790 + index * 4) == 0)
                Sound_Play(gSoundContext, 0x12d, 13);
            FIELD(s32, object, 0x790 + index * 4) += 0x258;
            if (FIELD(s32, object, 0x790 + index * 4) > 0xce4)
                FIELD(s32, object, 0x790 + index * 4) = 0xce4;
        }
        if (++FIELD(s32, object, 0x930) > 121) {
            FIELD(s32, object, 0x930) = 0;
            FIELD(s32, object, 0x91c)++;
        }
        return;
    }
    if (state == 12) {
        if (++FIELD(s32, object, 0x918) <= 30)
            return;
        s32 first = 6 - FIELD(s32, object, 0x930);
        if (first < 0)
            first = 0;
        for (s32 slot = 5; slot >= first; --slot) {
            FIELD(s32, object, 0x8fc + slot * 4)++;
            if (FIELD(s32, object, 0x8fc + slot * 4) > 40)
                FIELD(s32, object, 0x8fc + slot * 4) = 38;
        }
        s32 timer = ++FIELD(s32, object, 0x930);
        s32 brightness = (timer - 40) * 3;
        if (brightness > 16)
            brightness = 16;
        if (brightness > 0) {
            GXx_SetMasterBrightness_(0x0400006c, brightness);
            GXx_SetMasterBrightness_(0x0400106c, brightness);
        }
        if (brightness != 16)
            return;
        for (s32 slot = 6; slot >= 0; --slot)
            FIELD(s32, object, 0x8fc + slot * 4) = 0;
        void *firstResource = func_02002d28(data_020f4dc8, 0);
        func_02002ac0(firstResource, 16, 0, 24);
        void *secondResource = func_02002d28(data_020f4dc8, 1);
        func_02002ac0(secondResource, 16, 0, 24);
        FIELD(s32, object, 0x918) = 0;
        FIELD(s32, object, 0x930) = 0;
        FIELD(s32, object, 0x91c)++;
        return;
    }
    if (state != 13)
        return;

    s32 first = 91 - FIELD(s32, object, 0x930);
    if (first < 0)
        first = 0;
    for (s32 index = 90; index >= first; --index) {
        if (index % 13 != 0 ||
            FIELD(s32, object, 0x790 + index * 4) >= 0x1000)
            continue;
        s32 y = (FIELD(s32, object, 0x70 + index * 12) +
                 FIELD(s32, FIELD(void *, object, 0x48), 0x194)) >>
                12;
        s32 x = FIELD(s32, object, 0x6c + index * 12) >> 12;
        void *emitter = FIELD(void *, object, 0x958);
        func_ov004_021fb868(emitter, 4, x, y);
        s32 group = index / 13;
        if (group < 2)
            func_ov004_021fb868(emitter, 1, x - 0x40, y);
        else if (group < 4)
            func_ov004_021fb868(emitter, 2, x, y);
        else
            func_ov004_021fb868(emitter, 3, x, y);
        FIELD(s32, object, 0x790 + index * 4) = 0x1000;
        Sound_Play(gSoundContext, 0x12d, 0);
    }
    if (++FIELD(s32, object, 0x930) > 91) {
        FIELD(s32, object, 0x930) = 0;
        FIELD(s32, object, 0x91c)++;
    }
}
