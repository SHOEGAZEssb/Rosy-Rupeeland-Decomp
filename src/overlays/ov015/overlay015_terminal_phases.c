#include "tingle/types.h"

/* Overlay 15 terminal interaction phases, completion hook, and display-mask commit. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021052fc;
extern void *gGameWork;
extern const u32 data_ov015_021feba8[];
extern const u32 data_ov015_021febb0[];
extern const u32 data_ov015_021febb8[];
extern const u32 data_ov015_021febc0[];
extern const u32 data_ov015_021febc8[];
extern const u32 data_ov015_021febd8[];
extern const u32 data_ov015_021fec20[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *, s32);
extern void GameWork_SetFlag(void *, s32);
extern s32 GameWork_TestFlag(void *, s32);
extern void ActorDerivedType1_StartRecord(void *, s32);
extern s32 func_020628c8(void *);
extern s32 func_02062a10(void *);
extern void func_02062db0(void *);
extern void *func_02062e00(void *);
extern void func_02092260(void *, s32);
extern s32 func_02095dd4(void *, void *, s32);
extern void func_ov001_021fc39c(void *);
extern void *func_ov001_021fc7e4(void *);
extern void func_ov001_021fc7f4(void *);
extern void func_ov001_021fc88c(void *);
extern void func_ov001_021fc964(void *, s32, void *);
extern void func_ov015_021fce30(void *, u32, u32);
extern void func_ov015_021fd68c(void *);
extern void func_ov015_021fdad4(void *);
extern void func_ov015_021fde00(void *, s32, s32, void *);
extern void func_ov015_021fdeac(void *);
extern s32 func_ov015_021fe548(void *);
extern s32 func_ov015_021fe560(void *, u16);
#ifdef __cplusplus
}
#endif

/* Apply one of the overlay's confirmed two-word terminal transition records. */
static void overlay015_terminal_transition(void *state, const u32 *descriptor)
{
    func_ov015_021fce30(state, descriptor[0], descriptor[1]);
}

/* Advance the phase at +4 and clear its counter at +8. */
static void overlay015_terminal_step(void *state, s32 delta)
{
    FIELD(s32, state, 4) += delta;
    FIELD(s32, state, 8) = 0;
}

/* Poll the active transient object with the position at +0x30 and input bit 5. */
static s32 overlay015_poll_transient(void *state)
{
    return func_02095dd4(FIELD(void *, state, 0xf8), (u8 *)state + 0x30,
                         (FIELD(u32, state, 0x20) & 0x20) != 0 ? -1 : 0);
}

/*
 * Run the 13-slot choice-resolution phase. Only slots 0-4 and 10-12 are active:
 * they wait for the selected record, choose presentation 0x11 or 0x26 according
 * to the global count threshold, process accept/cancel results, and dispatch the
 * corresponding cleanup transition. Acceptance of presentation 0x11 plays
 * sound 0x4102 and commits the selected controller action. Record, transient,
 * audio, and transition state may change. Always update records and return zero.
 */
extern "C" s32 func_ov015_021fe588(void *state)
{
    void *controller = FIELD(void *, state, 0xdc);
    void *status = func_ov001_021fc7e4(controller);
    s32 result;

    switch (FIELD(s32, state, 4)) {
    case 0:
        if (func_ov015_021fe548((u8 *)state + 0xfc + FIELD(s32, state, 0xf0) * 0xac)) {
            overlay015_terminal_step(state, 1);
        }
        break;
    case 1: {
        void *item = FIELD(void *, status, 0xc);
        void *text = (void *)func_020628c8(item);
        if (func_ov015_021fe560(state, FIELD(u16, item, 0)) != 0) {
            func_ov015_021fde00(state, 0x26, 0, text);
            FIELD(s32, state, 4) = 10;
            FIELD(s32, state, 8) = 0;
        } else {
            func_ov015_021fde00(state, 0x11, 0, text);
            overlay015_terminal_step(state, 1);
        }
        break;
    }
    case 2:
        result = overlay015_poll_transient(state);
        if (result == 1) {
            func_02092260(state, 0x4102);
            func_ov001_021fc88c(controller);
            func_ov001_021fc7f4(controller);
            overlay015_terminal_step(state, 2);
        } else if (result == 2) {
            func_ov015_021fdeac(state);
            overlay015_terminal_step(state, 1);
        }
        break;
    case 3:
        func_ov015_021fdad4(state);
        overlay015_terminal_transition(state, data_ov015_021febb0);
        break;
    case 4:
        func_ov015_021fdeac(state);
        func_ov015_021fdad4(state);
        overlay015_terminal_transition(state, data_ov015_021febd8);
        break;
    case 10:
        result = overlay015_poll_transient(state);
        if (result == 1) {
            func_ov001_021fc7f4(controller);
            overlay015_terminal_step(state, 2);
        } else if (result == 2) {
            func_ov015_021fdeac(state);
            overlay015_terminal_step(state, 1);
        }
        break;
    case 11:
        func_ov015_021fdad4(state);
        overlay015_terminal_transition(state, data_ov015_021febc0);
        break;
    case 12:
        func_ov015_021fdeac(state);
        func_ov015_021fdad4(state);
        overlay015_terminal_transition(state, data_ov015_021febc8);
        break;
    }
    func_ov015_021fd68c(state);
    return 0;
}

/*
 * Run the four-stage +0xEC action path. It waits for the selected record, commits
 * the auxiliary object, sets flag 0x3AF on first use (or follows its repeat-use
 * transition), delays 31 frames, launches presentation 0x10, then sets flag
 * 0x3B0 and transitions once polling completes. Records, game flags, controller,
 * presentation, audio, and transition state may change. Always return zero.
 */
extern "C" s32 func_ov015_021fe828(void *state)
{
    switch (FIELD(s32, state, 4)) {
    case 0:
        if (func_ov015_021fe548((u8 *)state + 0xfc + FIELD(s32, state, 0xf0) * 0xac)) {
            func_02092260(state, 0x4104);
            overlay015_terminal_step(state, 1);
        }
        break;
    case 1:
        func_ov001_021fc964(FIELD(void *, state, 0xdc), 1, FIELD(void *, state, 0xec));
        func_ov015_021fdad4(state);
        if (GameWork_TestFlag(gGameWork, 0x3af) != 0) {
            overlay015_terminal_transition(state, data_ov015_021fec20);
        } else {
            GameWork_SetFlag(gGameWork, 0x3af);
            overlay015_terminal_step(state, 1);
        }
        break;
    case 2:
        if (++FIELD(s32, state, 8) > 30) {
            func_ov001_021fc39c(FIELD(void *, state, 0xdc));
            func_ov015_021fde00(state, 0x10, 1,
                                (void *)func_020628c8(FIELD(void *, state, 0xec)));
            overlay015_terminal_step(state, 1);
        }
        break;
    case 3:
        if (overlay015_poll_transient(state) >= 0) {
            GameWork_SetFlag(gGameWork, 0x3b0);
            overlay015_terminal_transition(state, data_ov015_021febb8);
        }
        break;
    }
    func_ov015_021fd68c(state);
    return 0;
}

/*
 * Run the delayed terminal commit phase. After the selected record completes,
 * clear controller +0x1FC, set +0x200 to fixed-point one, and wait 11 frames.
 * Type-2 objects set flag 0x3CC or 0x3CD from subtype +4; other objects copy a
 * derived value through the global manager and finalize themselves. Finally
 * clear flag 0x389 and transition. Gameplay flags, objects, records, and the
 * transition state may change; always return zero and perform no direct MMIO.
 */
extern "C" s32 func_ov015_021fe9b8(void *state)
{
    if (FIELD(s32, state, 4) == 0) {
        if (func_ov015_021fe548((u8 *)state + 0xfc + FIELD(s32, state, 0xf0) * 0xac)) {
            void *controller = FIELD(void *, state, 0xdc);
            FIELD(s32, controller, 0x1fc) = 0;
            FIELD(s32, controller, 0x200) = 0x1000;
            overlay015_terminal_step(state, 1);
        }
    } else if (FIELD(s32, state, 4) == 1 && ++FIELD(s32, state, 8) > 10) {
        void *status = func_ov001_021fc7e4(FIELD(void *, state, 0xdc));
        void *item = FIELD(void *, status, 0xc);
        void *metadata = func_02062e00(item);

        if (FIELD(u8, metadata, 2) == 2 &&
            (FIELD(u16, metadata, 4) == 1 || FIELD(u16, metadata, 4) == 2)) {
            GameWork_SetFlag(gGameWork, FIELD(u16, metadata, 4) == 1 ? 0x3cc : 0x3cd);
        } else {
            void *manager = FIELD(void *, (u8 *)FIELD(void *, data_021052fc, 0) + 0x2000, 0xea4);
            ActorDerivedType1_StartRecord(manager, func_02062a10(item));
            func_02062db0(item);
        }
        GameWork_ClearFlag(gGameWork, 0x389);
        overlay015_terminal_transition(state, data_ov015_021feba8);
    }
    func_ov015_021fd68c(state);
    return 0;
}

/*
 * Perform one final record update and return one. The state and its record
 * objects may change through the updater; there are no direct hardware effects.
 */
extern "C" s32 func_ov015_021feb20(void *state)
{
    func_ov015_021fd68c(state);
    return 1;
}

/*
 * When input/status bit 10 at +0x20 is set, commit the five-bit main display
 * mask from +0x48 into DISPCNT bits 8-12. If +0xEC is null, also commit +0x4C
 * to the sub display's DISPCNT. Return zero. These volatile writes directly
 * affect Nintendo DS display-engine layer enables; other bits are preserved.
 */
extern "C" s32 func_ov015_021feb30(void *state)
{
    if ((FIELD(u32, state, 0x20) & 0x400) != 0) {
        volatile u32 *mainDisplay = (volatile u32 *)0x04000000;
        *mainDisplay = (*mainDisplay & ~0x1f00u) | (FIELD(u32, state, 0x48) << 8);
        if (FIELD(void *, state, 0xec) == 0) {
            volatile u32 *subDisplay = (volatile u32 *)0x04001000;
            *subDisplay = (*subDisplay & ~0x1f00u) | (FIELD(u32, state, 0x4c) << 8);
        }
    }
    return 0;
}
