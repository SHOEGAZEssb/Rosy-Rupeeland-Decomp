#include "tingle/types.h"

/* Overlay 26 scripted phase setup and address-encoded callback dispatch. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov026_022040ec[];
extern const s32 data_ov026_02204110[];
extern const s32 data_ov026_022046a8[];
extern const s32 data_ov026_022046d8[];
extern const s32 data_ov026_022046e0[];
extern const s32 data_ov026_022046f0[];
extern const s32 data_ov026_02204620[];
extern const s32 data_ov026_02204640[];
extern const s32 data_ov026_02204650[];
extern const s32 data_ov026_02204670[];
extern const s32 data_ov026_02204698[];
extern const s32 data_ov026_022046e8[];
extern const s32 data_ov026_02204710[];
extern const s32 data_ov026_02204628[];
extern const s32 data_ov026_02204678[];
extern const s32 data_ov026_022046b8[];
extern const s32 data_ov026_022046c8[];
extern const s32 data_ov026_022046d0[];
extern const s32 data_ov026_022045c0[];
extern const s32 data_ov026_022045d0[];
extern const s32 data_ov026_022045f0[];
extern const s32 data_ov026_02204658[];
extern const s32 data_ov026_022046a0[];
extern const s32 data_ov026_022045d8[];
extern const s32 data_ov026_02204600[];
extern const s32 data_ov026_02204610[];
extern const s32 data_ov026_02204618[];
extern const s32 data_ov026_02204690[];
extern const s32 data_ov026_022045a8[];
extern const s32 data_ov026_022045b8[];
extern const s32 data_ov026_022045c8[];
extern const s32 data_ov026_022045e8[];
extern const s32 data_ov026_02204648[];
extern const s32 data_ov026_02204728[];
extern const s32 data_ov026_02204758[];
extern const s32 data_ov026_02204760[];
extern const s32 data_ov026_02204768[];
extern const s32 data_ov026_02204770[];
extern const s32 data_ov026_02204778[];
extern const s32 data_ov026_022045e0[];
extern const s32 data_ov026_02204608[];
extern const s32 data_ov026_02204638[];
extern const s32 data_ov026_02204688[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov026_0220035c(void *, s32, s32, s32, s32);
extern void func_ov026_022013c0(void *, s32, s32);
extern void func_ov026_02201400(void *);
extern s32 func_020befec(s32, s32);
#ifdef __cplusplus
}
#endif

typedef s32 (*ScriptCallback)(void *);

/*
 * Invokes the address-encoded callback selected by +0x798/+0x794. An even
 * selector calls +0x794 directly; an odd selector treats scene+selector/2 as
 * an object and resolves a virtual entry at the +0x794 byte offset.
 */
static s32 invoke_script(void *scene)
{
    s32 selector = FIELD(s32, scene, 0x798);
    void *argument = (u8 *)scene + (selector >> 1);
    ScriptCallback callback;
    if (selector & 1) {
        void *table = FIELD(void *, argument, 0);
        callback = FIELD(ScriptCallback, table,
                         FIELD(s32, scene, 0x794));
    } else {
        callback = (ScriptCallback)FIELD(void *, scene, 0x794);
    }
    return callback(argument);
}

/* Advances phase +4 and clears its timer +8. */
static void advance_phase(void *scene)
{
    ++FIELD(s32, scene, 4);
    FIELD(s32, scene, 8) = 0;
}

/*
 * Phase 0 applies effect preset (8,-0x1666), selects script descriptor
 * 0x022040EC, and installs pair 0x022046A8 over the full +0x60..+0x64 range.
 * Phase 1 invokes the encoded script callback and returns its result; other
 * phases return zero.
 */
extern "C" s32 func_ov026_022016e8(void *scene)
{
    if (FIELD(s32, scene, 4) == 0) {
        func_ov026_022013c0(scene, 8, -0x1666);
        FIELD(const void *, scene, 0x368) = data_ov026_022040ec;
        func_ov026_0220035c(scene, data_ov026_022046a8[0],
                            data_ov026_022046a8[1],
                            FIELD(s32, scene, 0x60),
                            FIELD(s32, scene, 0x64));
        advance_phase(scene);
    }
    return FIELD(s32, scene, 4) == 1 ? invoke_script(scene) : 0;
}

/*
 * Identical scripted flow to 0x022016E8 but applies preset (0x400,-0x1666),
 * descriptor 0x02204110, and pair 0x022046D8. Returns the callback result in
 * phase 1 and zero otherwise.
 */
extern "C" s32 func_ov026_02201790(void *scene)
{
    if (FIELD(s32, scene, 4) == 0) {
        func_ov026_022013c0(scene, 0x400, -0x1666);
        FIELD(const void *, scene, 0x368) = data_ov026_02204110;
        func_ov026_0220035c(scene, data_ov026_022046d8[0],
                            data_ov026_022046d8[1],
                            FIELD(s32, scene, 0x60),
                            FIELD(s32, scene, 0x64));
        advance_phase(scene);
    }
    return FIELD(s32, scene, 4) == 1 ? invoke_script(scene) : 0;
}

/*
 * Splits the scene range at +0x60 plus half +0x5C. Phase 0 applies preset
 * (0xC00,-0x1666) and pair 0x022046F0 over the first half. When its callback
 * completes, phase 1 installs pair 0x022046E0 over the second half and advances;
 * phase 2 continues invoking the callback. Returns the callback result only in
 * phase 2; setup and transition paths return zero.
 */
extern "C" s32 func_ov026_02201838(void *scene)
{
    s32 midpoint = FIELD(s32, scene, 0x60) + FIELD(s32, scene, 0x5c) / 2;
    if (FIELD(s32, scene, 4) == 0) {
        func_ov026_022013c0(scene, 0xc00, -0x1666);
        func_ov026_0220035c(scene, data_ov026_022046f0[0],
                            data_ov026_022046f0[1],
                            FIELD(s32, scene, 0x60), midpoint);
        advance_phase(scene);
    }
    if (FIELD(s32, scene, 4) == 1) {
        if (invoke_script(scene) != 0) {
            func_ov026_0220035c(scene, data_ov026_022046e0[0],
                                data_ov026_022046e0[1], midpoint,
                                FIELD(s32, scene, 0x64));
            advance_phase(scene);
        }
        return 0;
    }
    return FIELD(s32, scene, 4) == 2 ? invoke_script(scene) : 0;
}

/*
 * Divides the scene range into thirds. Phase 0 applies preset
 * (0x3C00,-0x1666) and pair 0x02204620 to the first third. Successful callback
 * completion advances through pair 0x02204710 for the middle third and pair
 * 0x02204670 for the final third. Phase 3 returns the callback result; setup
 * and intermediate transitions return zero.
 */
extern "C" s32 func_ov026_02201954(void *scene)
{
    s32 start = FIELD(s32, scene, 0x60);
    s32 length = FIELD(s32, scene, 0x5c);
    s32 one_third = func_020befec(length, 3);
    s32 two_thirds = func_020befec(length * 2, 3);
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_ov026_022013c0(scene, 0x3c00, -0x1666);
        func_ov026_0220035c(scene, data_ov026_02204620[0],
                            data_ov026_02204620[1], start,
                            start + one_third);
        advance_phase(scene);
        /* fall through */
    case 1:
        if (invoke_script(scene) != 0) {
            func_ov026_0220035c(scene, data_ov026_02204710[0],
                                data_ov026_02204710[1],
                                start + one_third,
                                start + two_thirds);
            advance_phase(scene);
        }
        return 0;
    case 2:
        if (invoke_script(scene) != 0) {
            func_ov026_0220035c(scene, data_ov026_02204670[0],
                                data_ov026_02204670[1],
                                start + two_thirds,
                                FIELD(s32, scene, 0x64));
            advance_phase(scene);
        }
        return 0;
    case 3:
        return invoke_script(scene);
    default:
        return 0;
    }
}

/*
 * Divides the scene range into quarters. Phase 0 applies preset
 * (0x400,-0x5000) and pair 0x02204650. Callback completion advances through
 * pairs 0x02204698, 0x022046E8, and 0x02204640 for the remaining quarters.
 * Phase 4 returns the callback result; setup and transitions return zero.
 */
extern "C" s32 func_ov026_02201b04(void *scene)
{
    s32 start = FIELD(s32, scene, 0x60);
    s32 length = FIELD(s32, scene, 0x5c);
    s32 q1 = start + length / 4;
    s32 q2 = start + (length * 2) / 4;
    s32 q3 = start + (length * 3) / 4;
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_ov026_022013c0(scene, 0x400, -0x5000);
        func_ov026_0220035c(scene, data_ov026_02204650[0],
                            data_ov026_02204650[1], start, q1);
        advance_phase(scene);
        /* fall through */
    case 1:
        if (invoke_script(scene) != 0) {
            func_ov026_0220035c(scene, data_ov026_02204698[0],
                                data_ov026_02204698[1], q1, q2);
            advance_phase(scene);
        }
        return 0;
    case 2:
        if (invoke_script(scene) != 0) {
            func_ov026_0220035c(scene, data_ov026_022046e8[0],
                                data_ov026_022046e8[1], q2, q3);
            advance_phase(scene);
        }
        return 0;
    case 3:
        if (invoke_script(scene) != 0) {
            func_ov026_0220035c(scene, data_ov026_02204640[0],
                                data_ov026_02204640[1], q3,
                                FIELD(s32, scene, 0x64));
            advance_phase(scene);
        }
        return 0;
    case 4:
        return invoke_script(scene);
    default:
        return 0;
    }
}

/*
 * A sibling quarter-range controller using the same preset (0x400,-0x5000)
 * but pairs 0x02204638, 0x022045E0, 0x02204688, and 0x02204608. Phase 4
 * returns the encoded callback result; earlier phases return zero.
 */
extern "C" s32 func_ov026_02201d30(void *scene)
{
    s32 start = FIELD(s32, scene, 0x60);
    s32 length = FIELD(s32, scene, 0x5c);
    s32 q1 = start + length / 4;
    s32 q2 = start + (length * 2) / 4;
    s32 q3 = start + (length * 3) / 4;
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_ov026_022013c0(scene, 0x400, -0x5000);
        func_ov026_0220035c(scene, data_ov026_02204638[0],
                            data_ov026_02204638[1], start, q1);
        advance_phase(scene);
    case 1:
        if (invoke_script(scene) != 0) {
            func_ov026_0220035c(scene, data_ov026_022045e0[0],
                                data_ov026_022045e0[1], q1, q2);
            advance_phase(scene);
        }
        return 0;
    case 2:
        if (invoke_script(scene) != 0) {
            func_ov026_0220035c(scene, data_ov026_02204688[0],
                                data_ov026_02204688[1], q2, q3);
            advance_phase(scene);
        }
        return 0;
    case 3:
        if (invoke_script(scene) != 0) {
            func_ov026_0220035c(scene, data_ov026_02204608[0],
                                data_ov026_02204608[1], q3,
                                FIELD(s32, scene, 0x64));
            advance_phase(scene);
        }
        return 0;
    case 4:
        return invoke_script(scene);
    default:
        return 0;
    }
}

/*
 * Divides the range into fifths under preset (0x400,-0x5000), applying pairs
 * 0x02204678, 0x022046D0, 0x022046B8, 0x022046C8, and 0x02204628 in order.
 * Phase 5 returns the callback result; prior phases return zero.
 */
extern "C" s32 func_ov026_02201f5c(void *scene)
{
    static const s32 *const pairs[5] = {
        data_ov026_02204678, data_ov026_022046d0,
        data_ov026_022046b8, data_ov026_022046c8,
        data_ov026_02204628
    };
    s32 phase = FIELD(s32, scene, 4);
    s32 start = FIELD(s32, scene, 0x60);
    s32 length = FIELD(s32, scene, 0x5c);
    if (phase == 0) {
        func_ov026_022013c0(scene, 0x400, -0x5000);
        func_ov026_0220035c(scene, pairs[0][0], pairs[0][1], start,
                            start + func_020befec(length, 5));
        advance_phase(scene);
        phase = 1;
    }
    if (phase >= 1 && phase <= 4) {
        if (invoke_script(scene) != 0) {
            s32 lower = start + func_020befec(length * phase, 5);
            s32 upper = phase == 4 ? FIELD(s32, scene, 0x64) :
                        start + func_020befec(length * (phase + 1), 5);
            func_ov026_0220035c(scene, pairs[phase][0], pairs[phase][1],
                                lower, upper);
            advance_phase(scene);
        }
        return 0;
    }
    return phase == 5 ? invoke_script(scene) : 0;
}

/*
 * Alternate fifth-range script under preset (0x400,-0x5000), using pairs
 * 0x022045D0, 0x02204658, 0x022045F0, 0x022046A0, and 0x022045C0. Phase 5
 * returns the callback result; earlier phases return zero.
 */
extern "C" s32 func_ov026_02202220(void *scene)
{
    static const s32 *const pairs[5] = {
        data_ov026_022045d0, data_ov026_02204658,
        data_ov026_022045f0, data_ov026_022046a0,
        data_ov026_022045c0
    };
    s32 phase = FIELD(s32, scene, 4);
    s32 start = FIELD(s32, scene, 0x60);
    s32 length = FIELD(s32, scene, 0x5c);
    if (phase == 0) {
        func_ov026_022013c0(scene, 0x400, -0x5000);
        func_ov026_0220035c(scene, pairs[0][0], pairs[0][1], start,
                            start + func_020befec(length, 5));
        advance_phase(scene);
        phase = 1;
    }
    if (phase >= 1 && phase <= 4) {
        if (invoke_script(scene) != 0) {
            s32 lower = start + func_020befec(length * phase, 5);
            s32 upper = phase == 4 ? FIELD(s32, scene, 0x64) :
                        start + func_020befec(length * (phase + 1), 5);
            func_ov026_0220035c(scene, pairs[phase][0], pairs[phase][1],
                                lower, upper);
            advance_phase(scene);
        }
        return 0;
    }
    return phase == 5 ? invoke_script(scene) : 0;
}

/*
 * Fifth-range variant that additionally applies the +0x168 preset at phase 0.
 * It uses pairs 0x02204600, 0x02204618, 0x02204610, 0x022045D8, and
 * 0x02204690. Phase 5 returns the callback result; earlier phases return zero.
 */
extern "C" s32 func_ov026_022024e4(void *scene)
{
    static const s32 *const pairs[5] = {
        data_ov026_02204600, data_ov026_02204618,
        data_ov026_02204610, data_ov026_022045d8,
        data_ov026_02204690
    };
    s32 phase = FIELD(s32, scene, 4);
    s32 start = FIELD(s32, scene, 0x60);
    s32 length = FIELD(s32, scene, 0x5c);
    if (phase == 0) {
        func_ov026_022013c0(scene, 0x400, -0x5000);
        func_ov026_02201400(scene);
        func_ov026_0220035c(scene, pairs[0][0], pairs[0][1], start,
                            start + func_020befec(length, 5));
        advance_phase(scene);
        phase = 1;
    }
    if (phase >= 1 && phase <= 4) {
        if (invoke_script(scene) != 0) {
            s32 lower = start + func_020befec(length * phase, 5);
            s32 upper = phase == 4 ? FIELD(s32, scene, 0x64) :
                        start + func_020befec(length * (phase + 1), 5);
            func_ov026_0220035c(scene, pairs[phase][0], pairs[phase][1],
                                lower, upper);
            advance_phase(scene);
        }
        return 0;
    }
    return phase == 5 ? invoke_script(scene) : 0;
}

/*
 * Divides the range into sixths after both effect presets, using pairs
 * 0x02204648, 0x022045E8, 0x022045B8, 0x02204728, 0x022045C8, and
 * 0x022045A8. Phase 6 returns the callback result; earlier phases return zero.
 */
extern "C" s32 func_ov026_022027b0(void *scene)
{
    static const s32 *const pairs[6] = {
        data_ov026_02204648, data_ov026_022045e8,
        data_ov026_022045b8, data_ov026_02204728,
        data_ov026_022045c8, data_ov026_022045a8
    };
    s32 phase = FIELD(s32, scene, 4);
    s32 start = FIELD(s32, scene, 0x60);
    s32 length = FIELD(s32, scene, 0x5c);
    if (phase == 0) {
        func_ov026_022013c0(scene, 0x400, -0x5000);
        func_ov026_02201400(scene);
        func_ov026_0220035c(scene, pairs[0][0], pairs[0][1], start,
                            start + func_020befec(length, 6));
        advance_phase(scene);
        phase = 1;
    }
    if (phase >= 1 && phase <= 5) {
        if (invoke_script(scene) != 0) {
            s32 lower = start + func_020befec(length * phase, 6);
            s32 upper = phase == 5 ? FIELD(s32, scene, 0x64) :
                        start + func_020befec(length * (phase + 1), 6);
            func_ov026_0220035c(scene, pairs[phase][0], pairs[phase][1],
                                lower, upper);
            advance_phase(scene);
        }
        return 0;
    }
    return phase == 6 ? invoke_script(scene) : 0;
}

/*
 * Runs five zero-range script presets in reverse-address order: 0x02204778,
 * 0x02204770, 0x02204768, 0x02204760, and 0x02204758. Each completed callback
 * advances to the next pair; phase 5 returns the callback result.
 */
extern "C" s32 func_ov026_02202b08(void *scene)
{
    static const s32 *const pairs[5] = {
        data_ov026_02204778, data_ov026_02204770,
        data_ov026_02204768, data_ov026_02204760,
        data_ov026_02204758
    };
    s32 phase = FIELD(s32, scene, 4);
    if (phase == 0) {
        func_ov026_0220035c(scene, pairs[0][0], pairs[0][1], 0, 0);
        advance_phase(scene);
        phase = 1;
    }
    if (phase >= 1 && phase <= 4) {
        if (invoke_script(scene) != 0) {
            func_ov026_0220035c(scene, pairs[phase][0], pairs[phase][1], 0, 0);
            advance_phase(scene);
        }
        return 0;
    }
    return phase == 5 ? invoke_script(scene) : 0;
}
