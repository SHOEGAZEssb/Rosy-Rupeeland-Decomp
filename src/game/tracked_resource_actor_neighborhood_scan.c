#include "tingle/types.h"

/* Recovered neighborhood scan and record-driven contact behavior for tracked-resource actors. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *data_02105310;
extern s32 func_0200b04c(void *state);
extern void func_02004fe0(void *vector);
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02005058(void *vector);
extern void func_02005084(void *vector);
extern void *func_02007f0c(void *manager, s32 group);
extern void func_020328d0(void *vector, s32 angle);
extern void ActorDerivedType1_StartRecord(void *actor, s32 value);
extern s32 func_0204cfa4(s32 x, s32 y);
extern void func_02050560(void *actor, void *target, ...);
extern s32 func_020be334(s32 value);
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
 * Inputs are a tracked-resource actor and three unused callback arguments.
 * Unless global state data_02105310 disables processing, scan group 1 of the
 * actor manager at data_021052fc. Candidates must pass type, state-bit, height,
 * and record-radius checks. Nearby candidates can receive a normalized and
 * record-rotated direction vector, followed by one of five behaviors selected
 * by signed record byte 0x2C. Modes dispatch damage-like values, the recovered
 * interaction helper, or virtual collision callbacks; mode 4 can also set bit
 * 0x100000 on type-7 candidates. Returns nothing. It mutates candidate engine
 * state and temporary vector objects but does not directly access hardware.
 * The semantic meanings of record fields 0x0E, 0x10, 0x2A, 0x2C, and 0x2E are
 * not yet confirmed, so their address-derived offsets remain explicit.
 */
void func_020505f0(void *actor, u32 unused1, u32 unused2, u32 unused3)
{
    u8 direction[16];
    u8 scan_state[16];
    void *manager;
    void *candidate;
    void *record;
    s32 actor_x;
    s32 actor_y;
    s32 index;
    s32 dx;
    s32 dy;
    s32 distance;
    s32 radius;
    s32 value;
    u8 type;
    s8 mode;
    (void)unused1;
    (void)unused2;
    (void)unused3;

    if (func_0200b04c(&data_02105310) != 0)
        return;

    record = FIELD(void *, actor, 0x1fc);
    mode = FIELD(s8, record, 0x2c);
    actor_x = FIELD(s32, actor, 0x1c);
    actor_y = FIELD(s32, actor, 0x20);
    func_02004fe0(scan_state);

    for (index = 0;; ++index) {
        manager = func_02007f0c(data_021052fc, 1);
        if (index >= FIELD(s32, manager, 0x2e74))
            break;
        candidate = FIELD(void *, manager, index * 4);
        if (candidate == 0 || (FIELD(u32, candidate, 0xd0) & 0x100) != 0)
            continue;

        type = FIELD(u8, candidate, 0x4d);
        if (type != 2 && type != 7 && type != 1 && type != 9) {
            if (type != 3 ||
                (FIELD(u16, candidate, 0x4e) != 6 &&
                 virtual_function(candidate, 8)(candidate) == 0))
                continue;
        }
        if (func_020be334(FIELD(s32, candidate, 0x24) -
                          FIELD(s32, actor, 0x24)) > 0x20000)
            continue;

        radius = virtual_function(candidate, 0x9c)(candidate) +
                 FIELD(s16, record, 0x10);
        dx = FIELD(s32, candidate, 0x1c) - actor_x;
        dy = FIELD(s32, candidate, 0x20) - actor_y;
        distance = func_0204cfa4(dx, dy);
        if (distance >= radius * 0x1000)
            continue;

        if (distance > 0x1000 && virtual_function(candidate, 8)(candidate) == 0) {
            func_0200500c(direction, dx, dy, 0);
            func_02005084(direction);
            func_020328d0(direction, (s32)FIELD(s16, record, 0x2a) << 4);
            virtual_function(candidate, 0xb8)(candidate, direction,
                                               mode != 1 && mode != 3);
            func_02005058(direction);
        }

        switch (mode) {
        case 1:
            if (type == 1) {
                value = FIELD(s16, record, 0x2e);
                ActorDerivedType1_StartRecord(candidate, value == -1 ? 0x7b : value);
            }
            break;
        case 2:
            if (type == 1) {
                func_02050560(actor, candidate);
            } else if (type == 2) {
                if ((((FIELD(u32, candidate, 0x260) & 2) != 0 &&
                      virtual_function(candidate, 0xa8)(candidate) == 0)) ||
                    (FIELD(u32, candidate, 0x260) & 0x200000) != 0) {
                    virtual_function(candidate, 0x1c0)
                        (candidate, (s32)FIELD(s16, record, 0x0e));
                }
            } else if (virtual_function(candidate, 8)(candidate) != 0) {
                virtual_function(candidate, 0xc4)(candidate, actor, 0x10000);
            }
            break;
        case 3:
            if (type == 1)
                ActorDerivedType1_StartRecord(candidate, 0x80);
            break;
        case 4:
            if (type == 1) {
                func_02050560(actor, candidate);
            } else if (type == 7) {
                FIELD(u32, candidate, 0x268) |= 0x100000;
            } else if (type == 2) {
                virtual_function(candidate, 0x1c0)
                    (candidate, (s32)FIELD(s16, record, 0x0e));
            } else if (virtual_function(candidate, 8)(candidate) != 0) {
                virtual_function(candidate, 0xc4)(candidate, actor, 0x10000);
            }
            break;
        default:
            break;
        }
    }
    func_02005058(scan_state);
}
