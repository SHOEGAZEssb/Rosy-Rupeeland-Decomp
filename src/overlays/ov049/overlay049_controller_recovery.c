#include "tingle/types.h"

/*
 * Overlay 49 effect-controller lifecycle. The controller owns two arrays of
 * small polymorphic points plus effect counters, random state, and a pointer
 * to the scene/runtime owner. Exact assembly preserves array-constructor ABI
 * details and the large update state machine.
 */

/*
 * Construct caller-owned `controller`, build its two 50-point arrays, seed ten
 * five-point trails and their per-point angles/timers, and mark every record
 * inactive. Return `controller`. No allocation or hardware access occurs.
 */
extern "C" void __construct_array(void *, s32, s32, void *, void *);
extern "C" void func_ov049_0220c21c(void *);
extern "C" void func_ov049_0220c238(void *);
extern "C" void func_ov049_0220c23c(void *, const void *);

extern "C" void *func_ov049_0220c124(void *controller)
{
    u8 *state = (u8 *)controller;
    __construct_array(state + 4, 0x32, 0xc, (void *)func_ov049_0220c21c,
                      (void *)func_ov049_0220c238);
    __construct_array(state + 0x25c, 0x32, 0xc,
                      (void *)func_ov049_0220c21c,
                      (void *)func_ov049_0220c238);
    *(s32 *)state = 0;
    for (s32 record = 9; record >= 0; --record) {
        for (s32 point = 4; point >= 0; --point) {
            u8 *primary = state + 4 + record * 0x3c + point * 0xc;
            u8 *secondary = state + 0x25c + record * 0x3c + point * 0xc;
            *(s32 *)(primary + 4) = record * 0x1e000 + 0x200000;
            *(s32 *)(primary + 8) = 0x190000 - point * 0xc000;
            func_ov049_0220c23c(secondary, primary);
            *(s32 *)(state + 0x57c + record * 0x14 + point * 4) = 0;
            *(s32 *)(state + 0x4b4 + record * 0x14 + point * 4) = 0;
        }
        *(s16 *)(state + 0x644 + record * 2) = -1;
        *(s16 *)(state + 0x66c + record * 2) = 0;
    }
    return controller;
}

/*
 * Advance the controller's effect simulation and return its recovered status.
 * The routine updates both point arrays, dispatches particle initialization,
 * randomization, stepping, and rendering by mode/timer, applies repeated
 * fixed-point vector operations, emits SDK effects, and transitions terminal
 * state when its counters expire. Controller, owner, random, audio, and SDK
 * rendering state may change; no direct MMIO is used. State labels remain
 * offset-derived because their semantic names are not confirmed.
 */
extern "C" const s16 data_020c9670[];
extern "C" u16 func_020ae024(s32, s32);
extern "C" s32 func_020befec(s32, s32);

static s32 controller_multiply_fx(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

static u8 *controller_record(u8 *state, s32 index)
{
    return state + index * 0x3c;
}

static s16 *controller_half(u8 *state, s32 offset, s32 index)
{
    return (s16 *)(state + offset + index * 2);
}

extern "C" void func_ov049_0220c8a0(void *controller, const void *position)
{
    u8 *state = (u8 *)controller;
    for (s32 recordIndex = 9; recordIndex >= 0; --recordIndex) {
        s16 *status = controller_half(state, 0x644, recordIndex);
        s16 *phase = controller_half(state, 0x66c, recordIndex);
        if (*status > 0) {
            if (++*phase > 4) {
                *phase = 0;
                if (++*status >= 5)
                    *status = -1;
            }
            continue;
        }
        if (*status != 0)
            continue;

        u8 *record = controller_record(state, recordIndex);
        if (*phase != 0) {
            u16 angle = (u16)(recordIndex * 0x7d0);
            for (s32 point = 3; point < 5; ++point) {
                u8 *current = record + point * 0xc;
                s32 tableIndex = (angle >> 4) * 2;
                *(s32 *)(current + 8) = *(s32 *)(current - 4) +
                    controller_multiply_fx(data_020c9670[tableIndex + 1],
                                           0xe000);
                *(s32 *)(current + 0xc) = *(s32 *)current +
                    controller_multiply_fx(data_020c9670[tableIndex], 0xe000);
                angle = (u16)(angle + 0x1f40);
            }
            angle = 0;
            for (s32 point = 1; point >= 0; --point) {
                u8 *current = record + point * 0xc;
                s32 tableIndex = (angle >> 4) * 2;
                *(s32 *)(current + 8) = *(s32 *)(current + 0x14) -
                    controller_multiply_fx(data_020c9670[tableIndex + 1],
                                           0xe000);
                *(s32 *)(current + 0xc) = *(s32 *)(current + 0x18) -
                    controller_multiply_fx(data_020c9670[tableIndex], 0xe000);
                angle = (u16)(angle + 0x1f40);
            }
            *(s32 *)(record + 0x24) += (*phase - 0x14) * 0x333;
            if (++*phase > 0x1e)
                *status = -1;
            continue;
        }

        u16 *turn = (u16 *)(state + 0x658 + recordIndex * 2);
        *turn = (u16)(*turn + 0x320);
        if (*turn > 0x8000)
            *turn = 0x8000;
        s16 *cooldown = controller_half(state, 0x680, recordIndex);
        if (*cooldown > 0 && --*cooldown == 0)
            *controller_half(state, 0x694, recordIndex) = 1;
        s16 *hold = controller_half(state, 0x694, recordIndex);
        if (*hold > 0) {
            ++*hold;
            continue;
        }

        s32 pushX = 0;
        s32 pushY = 0;
        for (s32 other = 9; other >= 0; --other) {
            if (other == recordIndex ||
                *controller_half(state, 0x644, other) != 0 ||
                *controller_half(state, 0x66c, other) != 0)
                continue;
            u8 *otherRecord = controller_record(state, other);
            s32 dx = *(s32 *)(record + 0x20) -
                     *(s32 *)(otherRecord + 0x20);
            s32 dy = *(s32 *)(record + 0x24) -
                     *(s32 *)(otherRecord + 0x24);
            if (dx > -0x14000 && dx < 0x14000 &&
                dy > -0x14000 && dy < 0x14000) {
                pushX = func_020befec(dx < 0 ? -0x1000 :
                                     (dx > 0 ? 0x1000 : 0), 3);
                pushY = func_020befec(dy < 0 ? -0x1000 :
                                     (dy > 0 ? 0x1000 : 0), 3);
            }
        }
        if (*turn >= 0x8000) {
            if (*(s32 *)(record + 8) < 0x176000) pushX = 0x666;
            if (*(s32 *)(record + 8) > 0x28a000) pushX = -0x666;
            if (*(s32 *)(record + 0xc) < 0x15e000) pushY = 0x666;
            if (*(s32 *)(record + 0xc) > 0x23a000) pushY = -0x666;
        }

        u8 *primary = state + 4 + recordIndex * 0x3c;
        u8 *secondary = state + 0x25c + recordIndex * 0x3c;
        for (s32 point = 0; point < 5; ++point) {
            s32 *timer = (s32 *)(state + 0x57c + recordIndex * 0x14 +
                                 point * 4);
            s32 *storedAngle = (s32 *)(state + 0x4b4 + recordIndex * 0x14 +
                                       point * 4);
            u8 *current = primary + point * 0xc;
            if (*timer == 0) {
                func_ov049_0220c23c(secondary + point * 0xc, current);
                if (point == 0 && *turn >= 0x8000) {
                    s32 targetX = *(const s32 *)((const u8 *)position + 4);
                    s32 targetY = *(const s32 *)((const u8 *)position + 8) -
                                  *(const s32 *)((const u8 *)position + 0xc) -
                                  0x10000;
                    if (pushX != 0) targetX = 0x200000;
                    if (pushY != 0) targetY = 0x1f4000;
                    s32 desired = func_020ae024(targetY - *(s32 *)(current + 8),
                                               targetX - *(s32 *)(current + 4));
                    s32 delta = desired - *storedAngle;
                    if (delta > 0x7fff) delta -= 0x10000;
                    if (delta < -0x8000) delta += 0x10000;
                    if (delta > 0x1388) delta = 0x1388;
                    if (delta < -0x1388) delta = -0x1388;
                    *storedAngle = (u16)(*storedAngle + delta);
                }
            }
            s32 limit = point == 0 ? 0xd : 0x10;
            if (*timer < limit) {
                u16 angle;
                if (point == 0) {
                    angle = (u16)*storedAngle;
                } else {
                    u8 *previous = secondary + (point - 1) * 0xc;
                    angle = func_020ae024(*(s32 *)(previous + 8) -
                                          *(s32 *)(current + 8),
                                          *(s32 *)(previous + 4) -
                                          *(s32 *)(current + 4));
                }
                s32 tableIndex = (angle >> 4) * 2;
                *(s32 *)(current + 4) +=
                    controller_multiply_fx(data_020c9670[tableIndex + 1],
                                           0xe66);
                *(s32 *)(current + 8) +=
                    controller_multiply_fx(data_020c9670[tableIndex], 0xe66);
            }
            *timer = point == 0 ? *timer + 1 :
                     *(s32 *)(timer - 1) + 3;
            *timer = (*timer + 0x1e) % 0x1e;
        }
        for (s32 point = 4; point >= 0; --point) {
            u8 *current = primary + point * 0xc;
            *(s32 *)(current + 4) += pushX;
            *(s32 *)(current + 8) += pushY;
        }
    }
}
