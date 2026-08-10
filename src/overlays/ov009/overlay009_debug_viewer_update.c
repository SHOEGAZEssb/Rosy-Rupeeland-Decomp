#include "tingle/types.h"

/*
 * Overlay 9 animation/debug-viewer update. This recovered routine edits loaded
 * animation, object transform, playback, palette, and grid parameters from the
 * controller and draws the corresponding developer diagnostics.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e14;
extern const void *data_ov009_021feb80[];
extern s32 func_ov009_021fd414(void *, s32, s32, s32, s32);
extern s32 func_ov009_021fd458(void *, s32, s32, s32, s32);
extern void func_ov009_021fd294(void *state);
extern void func_ov009_021fd338(void *state);
extern void func_ov009_021fd360(void *state);
extern void func_ov009_021fce74(void *, s32, s32, s32);
extern void GraphicsSpriteState_ResetFrame(void *object);
extern void GraphicsSpriteState_SetAnimationIndex(void *object, s32 value);
extern void GraphicsSpriteState_SetFrameIndex(void *object, s32 value);
extern void func_02070958(void *member, s32 x, s32 y, s32 z);
extern void func_02070a78(void *member, s32 delta, s32 first, s32 last);
extern void func_02074dc8(void *manager, void *object);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *owner);
#ifdef __cplusplus
}
#endif

/* Propagate the three confirmed transform components to the active object. */
static void overlay009_apply_scale(void *state)
{
    void *object = FIELD(void *, state, 0x88);

    func_02070958(FIELD(void *, object, 0x18),
                  FIELD(s32, state, 0x120), FIELD(s32, state, 0x124),
                  FIELD(s32, state, 0x128));
    func_02074dc8(data_020f4e14, object);
}

/* Recreate the active object after changing the selected file, record, or kind. */
static void overlay009_recreate_object(void *state)
{
    func_ov009_021fd338(state);
    func_ov009_021fd360(state);
}

/*
 * Read new/repeated/held controller halfwords through state +0x50. Button 8
 * restores func_ov009_021fd294 defaults. Repeated 0x200 cycles +0xEC through
 * three main DISPCNT modes (0x1800, 0x1400, 0x1000). While repeated 0x100 is
 * held, directional bits adjust +0xF0 in [0,255] and +0xF4 in [0,191].
 * Otherwise, primary page +0xE0 wraps across 15 rows and edits, respectively:
 * selected file +0xA4, selected 32-byte record +0xC0, animation +0xD8,
 * subanimation +0xDC, playback/two flag toggles +0x10C/+0x110/+0x114,
 * halfword +0x108, transform values +0xFC/+0x100/+0x104, object variant
 * +0xF8, palette component +0xE8, flag +0x118, or enters secondary page
 * +0x11C. File/record/variant edits release and recreate +0x88.
 *
 * Secondary page +0xE4 wraps across eight rows and edits transform components
 * +0x120/+0x124/+0x128, range endpoints +0x12C/+0x130, step +0x134, or motion
 * accumulator +0x138; the final row exits to the primary page. Object scale and
 * range edits are propagated through func_02070958/func_02070a78 and registered
 * with the manager. The routine then mirrors +0xF0/+0xF4 into owner +0x84,
 * applies playback/flag/rotation/scale fields to +0x88, optionally advances the
 * owner, synchronizes +0xDC from object byte +0x39, and draws the confirmed
 * debug text/grid/touch diagnostics. A newly pressed bit 1 transitions the
 * embedded +0x24 member using descriptor entries +0x20/+0x24. Return zero.
 *
 * The field changes, bounds, calls, palette write, and DISPCNT writes are
 * confirmed. Meanings such as animation, scale, and grid are inferred from the
 * debug strings and downstream use. This portable reference expresses all
 * persistent controls; the exact fallback retains the compiler-expanded debug
 * printing and grid rasterization sequence. Direct hardware writes target main
 * DISPCNT 0x04000000 and main palette entry zero at 0x05000000.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov009_021fd4e8(void *state)
{
    u8 *input = FIELD(u8 *, state, 0x50);
    u16 repeated = FIELD(u16, input, 0x00);
    u16 pressed = FIELD(u16, input, 0x02);
    u16 held = FIELD(u16, input, 0x06);
    volatile u32 *mainDispcnt = (volatile u32 *)0x04000000;
    void *object;

    if (pressed & 8) {
        func_ov009_021fd294(state);
    }
    if (held & 0x200) {
        s32 mode = FIELD(s32, state, 0xec) + 1;
        if (mode >= 3) mode = 0;
        FIELD(s32, state, 0xec) = mode;
    }
    {
        static const u32 displayModes[3] = {0x1800, 0x1400, 0x1000};
        *mainDispcnt = (*mainDispcnt & ~0x1f00) |
                       displayModes[FIELD(s32, state, 0xec)];
    }

    if (repeated & 0x100) {
        if (repeated & 0x20) {
            if (--FIELD(s32, state, 0xf0) < 0) FIELD(s32, state, 0xf0) = 0;
        } else if (repeated & 0x10) {
            if (++FIELD(s32, state, 0xf0) >= 0x100)
                FIELD(s32, state, 0xf0) = 0xff;
        }
        if (repeated & 0x40) {
            if (--FIELD(s32, state, 0xf4) < 0) FIELD(s32, state, 0xf4) = 0;
        } else if (repeated & 0x80) {
            if (++FIELD(s32, state, 0xf4) >= 0xc0)
                FIELD(s32, state, 0xf4) = 0xbf;
        }
    } else if (FIELD(s32, state, 0x11c) == 0) {
        s32 row = FIELD(s32, state, 0xe0);

        if (held & 0x40) row = row == 0 ? 14 : row - 1;
        else if (held & 0x80) row = row == 14 ? 0 : row + 1;
        FIELD(s32, state, 0xe0) = row;

        if (FIELD(s32, state, 0x10c) == 0 && (pressed & 1) &&
            FIELD(void *, state, 0x88) != 0) {
            GraphicsSpriteState_ResetFrame(FIELD(void *, state, 0x88));
        }

        switch (row) {
        case 0:
            if (held & 0x30) {
                FIELD(s32, state, 0xa4) = func_ov009_021fd458(
                    state, FIELD(s32, state, 0xa4), 0, 5, 1);
                overlay009_recreate_object(state);
            }
            break;
        case 1:
            if (held & 0x30) {
                s32 selection = FIELD(s32, state, 0xa4);
                s32 count = (repeated & 0x400) ? 10 : 1;
                while (count-- > 0) {
                    FIELD(s32, state, 0xc0 + selection * 4) =
                        func_ov009_021fd458(
                            state, FIELD(s32, state, 0xc0 + selection * 4),
                            0, FIELD(s32, state, 0xa8 + selection * 4) - 1, 1);
                }
                overlay009_recreate_object(state);
            }
            break;
        case 2:
            if (FIELD(void *, state, 0x88) && (held & 0x30)) {
                void *meta = FIELD(void *, FIELD(void *, state, 0x80), 0x20);
                FIELD(s32, state, 0xd8) = func_ov009_021fd458(
                    state, FIELD(s32, state, 0xd8), 0,
                    FIELD(s32, meta, 4) - 1, 1);
                GraphicsSpriteState_SetAnimationIndex(FIELD(void *, state, 0x88),
                              (u8)FIELD(s32, state, 0xd8));
            }
            break;
        case 3:
            if (FIELD(void *, state, 0x88) &&
                FIELD(s32, state, 0x10c) == 0 && (held & 0x30)) {
                void *table = FIELD(void *, FIELD(void *, state, 0x80), 0x24);
                u8 *entry = (u8 *)table + FIELD(s32, state, 0xd8) * 8;
                FIELD(s32, state, 0xdc) = func_ov009_021fd458(
                    state, FIELD(s32, state, 0xdc), 0,
                    FIELD(u16, entry, 2) - 1, 1);
                GraphicsSpriteState_SetFrameIndex(FIELD(void *, state, 0x88),
                              (u8)FIELD(s32, state, 0xdc));
            }
            break;
        case 4: if (held & 0x30) FIELD(s32, state, 0x10c) ^= 1; break;
        case 5: if (held & 0x30) FIELD(s32, state, 0x110) ^= 1; break;
        case 6: if (held & 0x30) FIELD(s32, state, 0x114) ^= 1; break;
        case 7:
            if (held & 0x20) FIELD(s16, state, 0x108) -= 0x100;
            else if (held & 0x10) FIELD(s16, state, 0x108) += 0x100;
            break;
        case 8:
            FIELD(s32, state, 0xfc) = func_ov009_021fd414(
                state, FIELD(s32, state, 0xfc), -0x200, 0x200, 0x10);
            break;
        case 9:
            FIELD(s32, state, 0x100) = func_ov009_021fd414(
                state, FIELD(s32, state, 0x100), -0x200, 0x200, 0x10);
            break;
        case 10:
            FIELD(s32, state, 0x104) = func_ov009_021fd414(
                state, FIELD(s32, state, 0x104), -0x800, 0x800, 0x10);
            break;
        case 11:
            if (held & 0x30) {
                FIELD(s32, state, 0xf8) =
                    FIELD(s32, state, 0xf8) == 1 ? 2 : 1;
                overlay009_recreate_object(state);
            }
            break;
        case 12:
            if (held & 0x30) {
                s32 value = func_ov009_021fd414(
                    state, FIELD(s32, state, 0xe8), 0, 31, 1);
                FIELD(s32, state, 0xe8) = value;
                *(volatile u16 *)0x05000000 =
                    (u16)(value | (value << 5) | (value << 10));
            }
            break;
        case 13: if (held & 0x30) FIELD(s32, state, 0x118) ^= 1; break;
        case 14:
            if (held & 0x31) {
                FIELD(s32, state, 0xe4) = 0;
                FIELD(s32, state, 0x11c) = 1;
            }
            break;
        }
    } else {
        s32 row = FIELD(s32, state, 0xe4);

        if (held & 0x40) row = row == 0 ? 7 : row - 1;
        else if (held & 0x80) row = row == 7 ? 0 : row + 1;
        FIELD(s32, state, 0xe4) = row;
        if (row <= 2 && FIELD(void *, state, 0x88) && (held & 0x30)) {
            s32 offset = 0x120 + row * 4;
            FIELD(s32, state, offset) = func_ov009_021fd414(
                state, FIELD(s32, state, offset), 0, 0x200, 0x10);
            overlay009_apply_scale(state);
        } else if (row == 3 && (held & 0x30)) {
            FIELD(s32, state, 0x12c) = func_ov009_021fd414(
                state, FIELD(s32, state, 0x12c), 0,
                FIELD(s32, state, 0x130), 1);
        } else if (row == 4 && FIELD(void *, state, 0x88) && (held & 0x30)) {
            void *meta = FIELD(void *, FIELD(void *,
                         FIELD(void *, state, 0x88), 0x18), 0x20);
            s32 last = FIELD(u16, meta, 4) * FIELD(u16, meta, 6) - 1;
            FIELD(s32, state, 0x130) = func_ov009_021fd414(
                state, FIELD(s32, state, 0x130),
                FIELD(s32, state, 0x12c), last, 1);
        } else if (row == 5 && (held & 0x30)) {
            FIELD(s32, state, 0x134) = func_ov009_021fd414(
                state, FIELD(s32, state, 0x134), 1, 16, 1);
        } else if (row == 6 && FIELD(void *, state, 0x88) && (held & 0x30)) {
            if (held & 0x10) FIELD(s32, state, 0x138) += FIELD(s32, state, 0x134);
            else if (held & 0x20) FIELD(s32, state, 0x138) -= FIELD(s32, state, 0x134);
            object = FIELD(void *, state, 0x88);
            func_02070a78(FIELD(void *, object, 0x18),
                          FIELD(s32, state, 0x138) / 16,
                          FIELD(s32, state, 0x12c),
                          FIELD(s32, state, 0x130));
            func_02074dc8(data_020f4e14, object);
        } else if (row == 7 && (held & 0x31)) {
            FIELD(s32, state, 0x11c) = 0;
        }
    }

    object = FIELD(void *, state, 0x88);
    if (object != 0) {
        u16 flags = FIELD(u16, object, 0x24);
        void *owner = FIELD(void *, state, 0x84);

        FIELD(s32, owner, 0x18) = FIELD(s32, state, 0xf0);
        FIELD(s32, owner, 0x1c) = FIELD(s32, state, 0xf4);
        if (FIELD(s32, state, 0x10c)) flags = (flags | 2) & (u16)~1;
        else flags &= (u16)~2;
        if (FIELD(s32, state, 0x110)) flags |= 0x40; else flags &= (u16)~0x40;
        if (FIELD(s32, state, 0x114)) flags |= 0x80; else flags &= (u16)~0x80;
        FIELD(u16, object, 0x24) = flags;
        FIELD(s16, object, 0x30) = FIELD(s16, state, 0x108);
        FIELD(u16, object, 0x32) =
            (u16)(FIELD(s32, state, 0xfc) ? FIELD(s32, state, 0xfc) : 8);
        FIELD(u16, object, 0x34) =
            (u16)(FIELD(s32, state, 0x100) ? FIELD(s32, state, 0x100) : 8);
        FIELD(u16, object, 0x36) = (u16)FIELD(s32, state, 0x104);
        if ((repeated & 0x800) == 0) GraphicsSpriteGroup_AdvanceAnimations(owner);
        if ((FIELD(u16, object, 0x24) & 1) == 0)
            FIELD(s32, state, 0xdc) = FIELD(u8, object, 0x39);
    }

    if (pressed & 2) {
        func_ov009_021fce74((u8 *)state + 0x24,
                             (s32)data_ov009_021feb80[8],
                             (s32)data_ov009_021feb80[9] - 0x48, 0);
    }
    return 0;
}
